#!/usr/bin/env python3
"""Apply the parent-approved Amado attachment to prepared SQL/map only; never touch SQLite."""
import hashlib,json,sqlite3
from pathlib import Path

ROOT=Path("/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图")
WT=Path("/Users/zyy/Documents/00剑桥颐华/法律cc/拉美文学地图/work/codex-worktrees/latin-american-literature-map-wcd10")
PKG=WT/"data/changesets/WCD-10/FINAL_REENTRY"
SQL=WT/"data/master/migrations/0057_wcd10_final_reentry.sql"
MAP=PKG/"INTEGRATION_MAP.json"
APPROVAL=PKG/"AMADO0172_TO_0591_CONTROLLED_APPEND.json"
BASE=ROOT/"project/internal/WCD_10_WORKSPACE/FINAL_REENTRY/INTEGRATOR_PREP/BASELINE/B21_AFTER_DATABASE.sqlite"
ORDINARY_SQL_SHA="bf464d408c41bcf23d6d1cb6ebfc68a9f49740a6b403ba948fdf5b65ef3c9e15"
ORDINARY_MAP_SHA="2e6363c6887a2f6c3742508265c221b0c04f7b5ae626314cf7488fd2dc9cb8be"
APPROVAL_SHA="79381528e62ecb5f2d9eeadf26a896452067fcc99c0460e0330e667c8b4c7430"
REL_ID="V1-REL-0772"
EVIDENCE_ID="V1-EV-1156"
CANDIDATE_ID="WCD10-FINAL-REENTRY-AMADO0172-0591"

def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
def sql_literal(value):
    if value is None: return "NULL"
    return "'" + str(value).replace("'", "''") + "'"

def main():
    assert sha(SQL)==ORDINARY_SQL_SHA, "ordinary SQL drift"
    assert sha(MAP)==ORDINARY_MAP_SHA, "ordinary mapping drift"
    assert sha(APPROVAL)==APPROVAL_SHA, "controlled append review drift"
    approval=json.loads(APPROVAL.read_text(encoding="utf-8"))
    relation=approval["candidate_relationship"]
    assert approval["task_id"]=="TASK-127"
    assert approval["baseline_database_sha256"]==sha(BASE)
    assert (relation["subject_id"],relation["relation_type"],relation["object_id"])==("V1-ENT-0172","CREATED","V1-ENT-0591")
    assert relation["source_id"]=="SRC-0652"
    with sqlite3.connect(BASE.resolve().as_uri()+"?mode=ro",uri=True) as c:
        target=c.execute("select entity_type,original_name from entities where entity_id=?",(relation["object_id"],)).fetchone()
        source=c.execute("select title,canonical_url from sources where source_id=?",(relation["source_id"],)).fetchone()
        existing=c.execute("select count(*) from relationships where subject_id=? and relation_type=? and object_id=?",(relation["subject_id"],relation["relation_type"],relation["object_id"])).fetchone()[0]
        rels=[r[0] for r in c.execute("select relationship_id from relationships")]
        evs=[r[0] for r in c.execute("select evidence_id from relationship_evidence")]
    assert target==("work","O mistério dos MMM"), target
    assert source==(relation["source_title"],relation["url"] if "url" in relation else approval["evidence_access"]["url"]), source
    assert existing==0
    assert REL_ID not in rels and EVIDENCE_ID not in evs
    assert max(int(x.removeprefix("V1-REL-")) for x in rels if x.startswith("V1-REL-"))==770
    assert max(int(x.removeprefix("V1-EV-")) for x in evs if x.startswith("V1-EV-"))==1154
    sql=SQL.read_text(encoding="utf-8")
    anchor="UPDATE metadata SET value='WCD-10-B05' WHERE key='last_change_set';"
    assert sql.count(anchor)==1
    assert sql.count('(SELECT COUNT(*) FROM "relationships") = 769')==1
    assert sql.count('(SELECT COUNT(*) FROM "relationship_sources") = 1194')==1
    assert sql.count('(SELECT COUNT(*) FROM "relationship_evidence") = 1165')==1
    desc=relation["description_zh"]
    block=(
        "-- Parent-approved controlled append only: Amado is one of ten chapter authors; no chapter or exclusive authorship inferred.\n"
        "INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES\n"
        "(" + ",".join(sql_literal(v) for v in (
            REL_ID,"WCD-10-FINAL_REENTRY",CANDIDATE_ID,relation["subject_id"],relation["relation_type"],relation["object_id"],desc,
            "high","accepted","Codex-parent-independent-review:PASS","1","NONE"
        )) + ");\n\n"
        "INSERT INTO relationship_sources (relationship_id,source_id) VALUES\n"
        "(" + sql_literal(REL_ID) + "," + sql_literal(relation["source_id"]) + ");\n\n"
        "INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES\n"
        "(" + ",".join(sql_literal(v) for v in (
            EVIDENCE_ID,REL_ID,CANDIDATE_ID,relation["source_id"],relation["source_title"],relation["locator"],desc,
            "high","eligible_evidence","WCD-10-FINAL_REENTRY"
        )) + ");\n\n"
    )
    sql=sql.replace(anchor,block+anchor)
    sql=sql.replace('(SELECT COUNT(*) FROM "relationships") = 769','(SELECT COUNT(*) FROM "relationships") = 770')
    sql=sql.replace('(SELECT COUNT(*) FROM "relationship_sources") = 1194','(SELECT COUNT(*) FROM "relationship_sources") = 1195')
    sql=sql.replace('(SELECT COUNT(*) FROM "relationship_evidence") = 1165','(SELECT COUNT(*) FROM "relationship_evidence") = 1166')
    SQL.write_text(sql,encoding="utf-8")

    mapping=json.loads(MAP.read_text(encoding="utf-8"))
    assert mapping["task_id"]=="TASK-127" and mapping["batch_id"]=="WCD-10-B05"
    assert CANDIDATE_ID not in mapping["id_map"]
    mapping["id_map"][CANDIDATE_ID]=REL_ID
    mapping["relationships"].append({"candidate_id":CANDIDATE_ID,"relationship_id":REL_ID,
        "subject_id":relation["subject_id"],"relation_type":relation["relation_type"],"object_id":relation["object_id"],
        "controlled_append_attachment":True})
    for table in ("relationships","relationship_sources","relationship_evidence"):
        mapping["counts"][table]+=1
    mapping["controlled_append_attachments"]=[{
        "attachment_file":"AMADO0172_TO_0591_CONTROLLED_APPEND.json","attachment_sha256":APPROVAL_SHA,
        "relationship_id":REL_ID,"evidence_id":EVIDENCE_ID,"source_join":{"relationship_id":REL_ID,"source_id":relation["source_id"]},
        "baseline_entity_type_preserved":"work","new_entities":0,"new_sources":0,"new_facts":0,"new_cards":0,
        "ordinary_fixed_author_validator_claims_attachment":False
    }]
    MAP.write_text(json.dumps(mapping,ensure_ascii=False,indent=2)+"\n",encoding="utf-8")
    result={"status":"CONTROLLED_APPEND_PREPARED_ONLY","ordinary_sql_sha256":ORDINARY_SQL_SHA,"ordinary_map_sha256":ORDINARY_MAP_SHA,
       "final_sql_sha256":sha(SQL),"final_map_sha256":sha(MAP),"attachment_sha256":sha(APPROVAL),
       "inserted_statement_counts":{"relationships":1,"relationship_sources":1,"relationship_evidence":1},
       "mapping_counts":mapping["counts"],"formal_relationship_id":REL_ID,"evidence_id":EVIDENCE_ID,
       "preserved_entity_type":"work","database_modified":False,"apply_or_qa":False}
    print(json.dumps(result,ensure_ascii=False,sort_keys=True))
    return 0
if __name__=="__main__": raise SystemExit(main())
