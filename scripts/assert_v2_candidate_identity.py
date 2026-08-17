#!/usr/bin/env python3
"""Assert checkout, event candidate, detached manifest, and artifact identity are one SHA."""

from __future__ import annotations

import argparse
import json
import re
import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--candidate-sha", required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--artifact-name", required=True)
    args = parser.parse_args()
    head = subprocess.run(["git", "rev-parse", "HEAD"], cwd=ROOT, check=True, capture_output=True, text=True).stdout.strip()
    manifest_sha = json.loads(args.manifest.read_text(encoding="utf-8")).get("candidate_commit_sha")
    artifact_match = re.fullmatch(r"v2-rc5-candidate-([0-9a-f]{40})", args.artifact_name)
    artifact_sha = artifact_match.group(1) if artifact_match else None
    identities = {head, args.candidate_sha, manifest_sha, artifact_sha}
    if None in identities or len(identities) != 1:
        raise ValueError(
            f"candidate identity mismatch: checkout={head}, event={args.candidate_sha}, "
            f"manifest={manifest_sha}, artifact={artifact_sha}"
        )
    print(json.dumps({"status": "PASS", "candidate_commit_sha": head}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
