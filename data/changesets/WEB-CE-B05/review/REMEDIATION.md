# WEB-CE-B05 Sol/Integrator Remediation Record

## Trigger

The fresh-context B05 reviewer returned `REVISE` after reopening the registered sources and the migration copy. The review identified four local source/映射问题; no schema or entity-identity reset was required.

## Remediation

1. **SRC-0176 accessibility and identity**
   - Replaced the inaccessible MEC text-download URL with the open official `Machado de Assis - Romance` category page.
   - Synchronized the JSON registry, SQL source row, canonical URL, title, and public-content scope.
   - Kept the source as a B-level, access-passed official catalogue page because it directly lists the three Machado novels and their years/forms.

2. **Machado genre evidence**
   - Added SRC-0176 to the Quincas Borba and Dom Casmurro candidate source lists and their cards.
   - Repointed the three `entity_layer` facts (V1-FCT-0484, 0487, 0490) to the direct MEC Romance catalogue while retaining ABL bibliographic support for titles/years.
   - Narrowed SRC-0166 public scope to title/year support rather than claiming it directly labels genre.

3. **Guimarães Rosa career fact**
   - Kept the minimal value `作家`.
   - Repointed V1-FCT-0497 primary origin/source to SRC-0170, whose ABL article directly calls Rosa an `escritor`; the profile source remains supplementary and no unsupported career detail was added.

4. **Graciliano Ramos CREATED evidence**
   - Added direct Prefeitura de São Paulo public-culture evidence to V1-REL-0146–0148.
   - Updated evidence counts to two and retained BNDigital as a supplementary source with its Wikipedia-attribution provenance visible to later auditors.
   - No evaluative literary language from the BNDigital page was promoted to Research data.

## Verification

- Fresh migration copy: temporary file outside the repository.
- `validate_master.py`: PASS; `PRAGMA integrity_check`: `ok`; `PRAGMA foreign_key_check`: empty.
- Focused checks confirm the MEC URL/title, Machado card/fact source mappings, Guimarães source, and two-source Graciliano relationships.
- Formal master migration `0008_web_ce_b05_luna_max.sql` has now been applied after the focused follow-up reviewer returned `PASS`.
