#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
用法：safe-push.sh --base <remote-ref> --remote <remote> --branch <branch> \
  --expected-name <name> --expected-email <email>

仅允许把当前 HEAD 以非强制方式推送到指定远端分支。脚本会在推送前：
  1. 更新远端引用并确认 base 是 HEAD 的祖先；
  2. 检查待推送提交的作者与提交者身份；
  3. 检查差异格式，并拒绝修改冻结的 project/PROJECT_CHARTER.md；
  4. 推送后复核远端分支确实指向本地 HEAD。
USAGE
}

base_ref=""
remote_name="origin"
target_branch=""
expected_name=""
expected_email=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --base)
      [[ $# -ge 2 ]] || { usage >&2; exit 2; }
      base_ref="$2"
      shift 2
      ;;
    --remote)
      [[ $# -ge 2 ]] || { usage >&2; exit 2; }
      remote_name="$2"
      shift 2
      ;;
    --branch)
      [[ $# -ge 2 ]] || { usage >&2; exit 2; }
      target_branch="$2"
      shift 2
      ;;
    --expected-name)
      [[ $# -ge 2 ]] || { usage >&2; exit 2; }
      expected_name="$2"
      shift 2
      ;;
    --expected-email)
      [[ $# -ge 2 ]] || { usage >&2; exit 2; }
      expected_email="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      usage >&2
      exit 2
      ;;
  esac
done

if [[ -z "$base_ref" || -z "$target_branch" || -z "$expected_name" || -z "$expected_email" ]]; then
  usage >&2
  exit 2
fi

if [[ "$target_branch" == *..* || "$target_branch" == /* || "$target_branch" == */ || "$target_branch" == *\\* ]]; then
  echo "拒绝：目标分支名不安全：$target_branch" >&2
  exit 2
fi

repo_root=$(git rev-parse --show-toplevel)
cd "$repo_root"

git fetch "$remote_name"
head_commit=$(git rev-parse --verify HEAD^{commit})
base_commit=$(git rev-parse --verify "$base_ref^{commit}")

if ! git merge-base --is-ancestor "$base_commit" "$head_commit"; then
  echo "拒绝：$base_ref 不是当前 HEAD 的祖先，远端可能已有未合并更新。" >&2
  exit 1
fi

if [[ "$base_commit" == "$head_commit" ]]; then
  echo "拒绝：没有待推送提交。" >&2
  exit 1
fi

commit_list=$(git rev-list --reverse "$base_commit..$head_commit")
while IFS= read -r commit_id; do
  [[ -n "$commit_id" ]] || continue
  author_name=$(git show -s --format=%an "$commit_id")
  author_email=$(git show -s --format=%ae "$commit_id")
  committer_name=$(git show -s --format=%cn "$commit_id")
  committer_email=$(git show -s --format=%ce "$commit_id")
  if [[ "$author_name" != "$expected_name" || "$author_email" != "$expected_email" || \
        "$committer_name" != "$expected_name" || "$committer_email" != "$expected_email" ]]; then
    echo "拒绝：提交 $commit_id 的作者或提交者身份不符合预期。" >&2
    exit 1
  fi
done <<< "$commit_list"

git diff --check "$base_commit..$head_commit"
changed_paths=$(git diff --name-only "$base_commit..$head_commit")
if grep -Fqx 'project/PROJECT_CHARTER.md' <<< "$changed_paths"; then
  if git cat-file -e "$base_commit:project/governance/PROJECT_CHARTER.md" 2>/dev/null && \
     ! git cat-file -e "$head_commit:project/governance/PROJECT_CHARTER.md" 2>/dev/null && \
     git cat-file -e "$head_commit:project/PROJECT_CHARTER.md" 2>/dev/null; then
    echo "允许：本次差异是用户授权的章程路径迁移；后续修改仍由新路径门禁阻断。"
  else
    echo "拒绝：待推送差异包含冻结文件 project/PROJECT_CHARTER.md。" >&2
    exit 1
  fi
elif grep -Fqx 'project/governance/PROJECT_CHARTER.md' <<< "$changed_paths"; then
  echo "拒绝：待推送差异包含旧章程路径，但没有迁移到 project/。" >&2
  exit 1
fi

git push "$remote_name" "HEAD:refs/heads/$target_branch"
remote_commit=$(git ls-remote "$remote_name" "refs/heads/$target_branch" | awk 'NR == 1 {print $1}')
if [[ "$remote_commit" != "$head_commit" ]]; then
  echo "拒绝：推送后远端分支未指向预期提交。" >&2
  exit 1
fi

echo "安全推送完成：$remote_name/$target_branch -> $head_commit"
