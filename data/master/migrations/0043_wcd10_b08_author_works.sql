-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: 422b0910de455409b2f8790b3da6ff4276a172d587256de6b34f62856c3ce4c7

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1549 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 947 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 443 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 508 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 506 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 1878 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1570 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 270 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 42 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 673 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 702 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 477 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 544 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B07' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0547' OR canonical_url='https://omeka.parlamento.gub.uy/omeka-s/s/biobibliografias/item/3423') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0548' OR canonical_url='https://bnm.educacion.gob.ar/las-sacrificadas-de-horacio-quiroga/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0549' OR canonical_url='https://www.researchgate.net/publication/338897562_Cien_anos_y_algunos_mas_La_publicacion_original_de_los_Cuentos_de_amor_de_locura_y_de_muerte_en_las_revistas_ilustradas_portenas_El_matadero_Revista_critica_de_literatura_argentina_ILA-UBA') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0550' OR canonical_url='https://latinoamerica.unam.mx/index.php/latino/article/download/57207/50950?inline=1') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0551' OR canonical_url='https://pmb.parlamento.gub.uy/pmb/opac_css/index.php?id=99504&lvl=notice_display') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0552' OR canonical_url='https://dialnet.unirioja.es/servlet/articulo?codigo=7275271') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0553' OR canonical_url='https://www.cervantesvirtual.com/obra-visor/poe-en-quiroga-0/html/84982bf9-af23-43b4-85d4-b8a70c27a42e_5.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0554' OR canonical_url='https://www.memoria.fahce.unlp.edu.ar/art_revistas/pr.2869/pr.2869.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0555' OR canonical_url='https://www.gub.uy/ministerio-educacion-cultura/sites/ministerio-educacion-cultura/files/documentos/publicaciones/Alejandro%20Ferrari%20-%20Estudio%20preliminar%20Cuentos%20de%20la%20Selva.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0556' OR canonical_url='https://letras-uruguay.espaciolatino.com/quiroga/cronologia.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0557' OR canonical_url='https://eprints.whiterose.ac.uk/id/eprint/142442/3/Final%20author%20copy.%20Lauren%20Rea%20Trajectories%20in%20Argentine%20Children%27s%20Literature.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0558' OR canonical_url='https://es.wikisource.org/wiki/Índice:La_Novela_Semanal_-_Año_II_-_Num._9_-_Un_peón.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0559' OR canonical_url='https://qualeaeditorial.wordpress.com/2014/04/18/el-crimen-del-otro-%E2%80%A2-horacio-quiroga/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0560' OR canonical_url='https://www.textos.info/horacio-quiroga/los-perseguidos/ebook') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0561' OR canonical_url='https://www.textos.info/horacio-quiroga/historia-de-un-amor-turbio/ebook') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0562' OR canonical_url='https://www.textos.info/horacio-quiroga/pasado-amor/ebook') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0563' OR canonical_url='https://www.textos.info/horacio-quiroga/anaconda-y-otros-cuentos') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0564' OR canonical_url='https://repositorio.bpm.parquedelconocimiento.com/handle/bpm/940') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0565' OR canonical_url='https://www.textos.info/horacio-quiroga/decalogo-del-perfecto-cuentista') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0566' OR canonical_url='https://www.textos.info/horacio-quiroga/el-manual-del-perfecto-cuentista') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0567' OR canonical_url='https://www.textos.info/horacio-quiroga/el-hijo/ebook') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0568' OR canonical_url='https://www.textos.info/horacio-quiroga/el-hombre-muerto/ebook') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0569' OR canonical_url='https://www.textos.info/horacio-quiroga/el-almohadon-de-pluma') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0570' OR canonical_url='https://www.textos.info/horacio-quiroga/a-la-deriva/ebook') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0571' OR canonical_url='https://www.textos.info/horacio-quiroga/una-estacion-de-amor/ebook') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0572' OR canonical_url='https://www.textos.info/horacio-quiroga/los-buques-suicidantes/ebook') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0573' OR canonical_url='https://www.textos.info/horacio-quiroga/el-alambre-de-pua') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0574' OR canonical_url='https://www.textos.info/horacio-quiroga/el-salvaje-y-otros-cuentos/ebook') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0575' OR canonical_url='https://www.revistas-filologicas.unam.mx/anEcdotica/index.php/anec/article/view/113') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0576' OR canonical_url='https://www.cervantesvirtual.com/obra-visor/las-sacrificadas-cuento-escenico-en-4-actos-989344/html/f0c24cc4-c737-4c3e-aeff-f88f3580df9f_2.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0577' OR canonical_url='https://www.textos.info/horacio-quiroga/sobre-el-arte-de-contar-historias/ebook') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0578' OR canonical_url='https://www.textos.info/horacio-quiroga/mas-alla-y-otros-cuentos') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0579' OR canonical_url='https://repositorio.bpm.parquedelconocimiento.com/handle/bpm/935') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0580' OR canonical_url='https://www.textos.info/horacio-quiroga/la-gallina-degollada/ebook') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0581' OR canonical_url='https://www.textos.info/horacio-quiroga/el-remate-del-imperio-romano') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0582' OR canonical_url='https://www.textos.info/horacio-quiroga/un-peon/ebook') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0583' OR canonical_url='https://machado.mec.gov.br/obra-completa-lista/item/38-ressurreicao') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0584' OR canonical_url='https://machado.mec.gov.br/obra-completa-lista/item/37-a-mao-e-a-luva') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0585' OR canonical_url='https://machado.mec.gov.br/obra-completa-lista/item/36-helena') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0586' OR canonical_url='https://www.e-publicacoes.uerj.br/matraga/article/view/27893') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0587' OR canonical_url='https://revistas.usp.br/humanidades/en/article/download/140546/135525/274343') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0588' OR canonical_url='https://digital.bbm.usp.br/handle/bbm/5307?locale=en') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0589' OR canonical_url='https://www.scielo.br/j/mael/a/WbjJbm7MPz5ZWT7wvhPzywv/?lang=pt') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0590' OR canonical_url='https://www.e-publicacoes.uerj.br/aproximando/article/view/89827') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0591' OR canonical_url='https://bndigital.bn.gov.br/dossies/gramaticas-e-dicionarios-do-portugues/linha-do-tempo/sobre-as-efemerides/1873-a-literatura-e-a-lingua-por-machado-de-assis/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0592' OR canonical_url='https://literaturabrasileira.ufsc.br/documentos?id=199102&locale=en') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0593' OR canonical_url='https://machado.mec.gov.br/obra-completa-lista/item/download/67_263391b2ba34ee6f7a1f7bf7b63039f2') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0594' OR canonical_url='https://pt.wikisource.org/wiki/Casa_Velha') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0595' OR canonical_url='https://machado.mec.gov.br/obra-completa-lista/item/download/66_390921fb4791464b4885563dc04a042c') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0596' OR canonical_url='https://machado.mec.gov.br/obra-completa-lista/item/download/65_2b8fb9ad43aa37653a58bc2bd56e33aa') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0597' OR canonical_url='https://machado.byu.edu/text/ressurreicao/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0598' OR canonical_url='https://machado.byu.edu/text/a-mao-e-a-luva/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0599' OR canonical_url='https://machado.byu.edu/text/helena/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0600' OR canonical_url='https://machado.byu.edu/text/iaia-garcia/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0601' OR canonical_url='https://machado.byu.edu/text/esau-e-jaco/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0602' OR canonical_url='https://machado.byu.edu/text/memorial-de-aires/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0603' OR canonical_url='https://machado.byu.edu/text/memorias-postumas-de-bras-cubas/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0604' OR canonical_url='https://machado.byu.edu/text/dom-casmurro/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0605' OR canonical_url='https://www.scielo.br/j/rblc/a/cF5yxM36X7Q83VKMPSc7TRx/?lang=pt') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0606' OR canonical_url='https://digital.bbm.usp.br/handle/bbm/4574?locale=en') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0607' OR canonical_url='https://periodicos.ufs.br/Travessias/article/view/17025') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0608' OR canonical_url='https://digital.bbm.usp.br/handle/bbm/8878') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0609' OR canonical_url='https://repositorio.ufmg.br/bitstreams/7fc2a1e0-6703-4490-9f45-33483c6d9b76/download') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0610' OR canonical_url='https://books.google.com/books/about/Contos_e_cr%C3%B4nicas.html?id=bBtEAAAAYAAJ') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0611' OR canonical_url='https://pt.wikisource.org/wiki/Critica_(Machado_de_Assis,_1910)') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0612' OR canonical_url='https://digital.bbm.usp.br/handle/bbm/4796') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0613' OR canonical_url='https://digital.bbm.usp.br/handle/bbm/5007') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0614' OR canonical_url='https://digital.bbm.usp.br/handle/bbm/4508?locale=en') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0615' OR canonical_url='https://machado.mec.gov.br/obra-completa-lista/item/download/72_5fc184858b6f41854692f4482de43255') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0616' OR canonical_url='https://machado.mec.gov.br/obra-completa-lista/item/download/70_067aec1ff3277c907e09597f10f92789') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0617' OR canonical_url='https://www.scielo.br/j/mael/a/C9MMwFJX3bgCgqSYQwkHPyj/?lang=pt') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0618' OR canonical_url='https://digital.bbm.usp.br/handle/bbm/4685') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0619' OR canonical_url='https://periodicos.ufes.br/machadiana/article/download/28173/24664/118535') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0620' OR canonical_url='https://digital.bbm.usp.br/handle/bbm/5285') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0621' OR canonical_url='https://digital.bbm.usp.br/handle/bbm/5229') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0622' OR canonical_url='https://digital.bbm.usp.br/handle/bbm/4774?locale=en') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0623' OR canonical_url='https://digital.bbm.usp.br/handle/bbm/4741') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0624' OR canonical_url='https://digital.bbm.usp.br/handle/bbm/4785') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0625' OR canonical_url='https://machado.byu.edu/text/o-alienista/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0626' OR canonical_url='https://machado.byu.edu/text/teoria-do-medalhao/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0627' OR canonical_url='https://machado.byu.edu/text/casa-velha/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0628' OR canonical_url='https://www.scielo.br/j/mael/a/8MjVKKfQQGVTBnvz3vMYkFk/?format=html&lang=pt') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0629' OR canonical_url='https://openlibrary.org/books/OL6230789M/Dia%CC%81logos_e_reflexo%CC%83es_de_um_relojoei%CC%81ro') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0630' OR canonical_url='https://periodicos.ufes.br/machadiana/article/download/33013/21793/98270') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0631' OR canonical_url='https://digital.bbm.usp.br/handle/bbm/4752') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0632' OR canonical_url='https://teses.usp.br/teses/disponiveis/8/8149/tde-24012014-111506/publico/2013_SandraMaraDaSilvaFranca.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0633' OR canonical_url='https://www.filologia.org.br/revista/39/11.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0634' OR canonical_url='https://login.academia.org.br/academicos/joao-guimaraes-rosa/biografia') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0635' OR canonical_url='https://sgpa.webhostusp.sti.usp.br/obra.php?cod=1164&s=grosa') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0636' OR canonical_url='https://acervodigital.secult.mg.gov.br/museu-casa-guimaraes-rosa-mcgr/185149-2/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0637' OR canonical_url='https://repositorio.ufmg.br/bitstreams/4a25b9d5-5545-486d-be90-e548fbda3c66/download') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0638' OR canonical_url='https://sgpa.webhostusp.sti.usp.br/obra.php?cod=1165&s=grosa') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0639' OR canonical_url='https://search.worldcat.org/es/title/corpo-de-baile-sete-novelas/oclc/4633331') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0640' OR canonical_url='https://literaturabrasileira.ufsc.br/index.php/documentos?id=142994') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0641' OR canonical_url='https://repositorio.uel.br/bitstreams/32f4300e-ced4-412b-ad78-debdbf5ce30c/download') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0642' OR canonical_url='https://sgpa2024.webhostusp.sti.usp.br/obra.php?cod=619&s=grosa') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0643' OR canonical_url='https://periodicos.pucminas.br/scripta/article/view/14108') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0644' OR canonical_url='https://www.revistajangada.ufv.br/Jangada/article/view/68') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0645' OR canonical_url='https://repositorio.ucp.pt/entities/publication/1624f83a-b125-4bef-a992-1006d9711c07') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0646' OR canonical_url='https://ojs.ufgd.edu.br/Raido/article/view/1357') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0647' OR canonical_url='https://periodicos.ufmg.br/index.php/emt/article/view/31898') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0648' OR canonical_url='https://periodicos.ufmg.br/index.php/o_eixo_ea_roda/article/view/27933') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0649' OR canonical_url='https://periodicos.ufmg.br/index.php/revele/article/view/11269') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0650' OR canonical_url='https://acervo.museudalinguaportuguesa.org.br/acervos/9054/primeiras-estorias') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0651' OR canonical_url='https://editoraunesp.com.br/catalogo/9788571393264,guimaraes-rosa') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0652' OR canonical_url='https://www.e-publicacoes.uerj.br/palimpsesto/article/download/65304/42073/235926') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0653' OR canonical_url='https://sistemas.uft.edu.br/periodicos/index.php/portodasletras/article/download/4519/13967/27152') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0654' OR canonical_url='https://www.pucsp.br/revistafronteiraz/numeros_anteriores/n3/download/pdf/grosa.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0655' OR canonical_url='https://www.academia.org.br/artigos/personagens-universais') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0656' OR canonical_url='https://www.todamateria.com.br/sagarana/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0657' OR canonical_url='https://obrasraras.fcp.pa.gov.br/publication/file/catalogos/catalogo-haroldo-maranhao/90/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0658' OR canonical_url='https://es.scribd.com/doc/260404476/Bibliografia-Sobre-GUimaraes') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0511' OR (entity_type='collection' AND original_name='Los arrecifes de coral')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0512' OR (entity_type='collection' AND original_name='El crimen del otro')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0513' OR (entity_type='work' AND original_name='Los perseguidos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0514' OR (entity_type='work' AND original_name='Historia de un amor turbio')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0515' OR (entity_type='collection' AND original_name='El salvaje')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0516' OR (entity_type='work' AND original_name='Las sacrificadas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0517' OR (entity_type='collection' AND original_name='Anaconda')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0518' OR (entity_type='collection' AND original_name='El desierto')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0519' OR (entity_type='collection' AND original_name='La gallina degollada y otros cuentos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0520' OR (entity_type='work' AND original_name='Pasado amor')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0521' OR (entity_type='work' AND original_name='Suelo natal')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0522' OR (entity_type='collection' AND original_name='Más allá')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0523' OR (entity_type='work' AND original_name='Decálogo del perfecto cuentista')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0524' OR (entity_type='work' AND original_name='El manual del perfecto cuentista')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0525' OR (entity_type='work' AND original_name='Los trucos del perfecto cuentista')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0526' OR (entity_type='work' AND original_name='El almohadón de plumas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0527' OR (entity_type='work' AND original_name='La gallina degollada')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0528' OR (entity_type='work' AND original_name='Una estación de amor')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0529' OR (entity_type='work' AND original_name='A la deriva')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0530' OR (entity_type='work' AND original_name='El hombre muerto')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0531' OR (entity_type='work' AND original_name='Miss Dorothy Phillips, mi esposa')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0532' OR (entity_type='work' AND original_name='El hijo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0533' OR (entity_type='work' AND original_name='Las fieras cómplices')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0534' OR (entity_type='work' AND original_name='El mono que asesinó')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0535' OR (entity_type='work' AND original_name='El hombre artificial')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0536' OR (entity_type='work' AND original_name='El devorador de hombres')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0537' OR (entity_type='work' AND original_name='El remate del imperio romano')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0538' OR (entity_type='work' AND original_name='Los buques suicidantes')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0539' OR (entity_type='work' AND original_name='La insolación')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0540' OR (entity_type='work' AND original_name='La miel silvestre')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0541' OR (entity_type='work' AND original_name='El alambre de púa')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0542' OR (entity_type='work' AND original_name='Un peón')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0543' OR (entity_type='collection' AND original_name='Cartas de un cazador')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0544' OR (entity_type='collection' AND original_name='De la vida de nuestros animales')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0545' OR (entity_type='work' AND original_name='Una carta de amor')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0546' OR (entity_type='work' AND original_name='Una cacería')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0547' OR (entity_type='work' AND original_name='Ressurreição')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0548' OR (entity_type='work' AND original_name='A mão e a luva')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0549' OR (entity_type='work' AND original_name='Helena')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0550' OR (entity_type='work' AND original_name='Iaiá Garcia')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0551' OR (entity_type='work' AND original_name='Casa velha')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0552' OR (entity_type='work' AND original_name='Esaú e Jacó')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0553' OR (entity_type='work' AND original_name='Memorial de Aires')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0554' OR (entity_type='collection' AND original_name='Contos fluminenses')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0555' OR (entity_type='collection' AND original_name='Histórias da meia-noite')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0556' OR (entity_type='collection' AND original_name='Papéis avulsos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0557' OR (entity_type='collection' AND original_name='Histórias sem data')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0558' OR (entity_type='collection' AND original_name='Várias histórias')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0559' OR (entity_type='collection' AND original_name='Páginas recolhidas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0560' OR (entity_type='collection' AND original_name='Relíquias de casa velha')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0561' OR (entity_type='collection' AND original_name='Crisálidas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0562' OR (entity_type='collection' AND original_name='Falenas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0563' OR (entity_type='collection' AND original_name='Americanas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0564' OR (entity_type='collection' AND original_name='Poesias completas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0565' OR (entity_type='collection' AND original_name='Teatro')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0566' OR (entity_type='work' AND original_name='Desencantos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0567' OR (entity_type='work' AND original_name='Quase ministro')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0568' OR (entity_type='work' AND original_name='Os deuses de casaca')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0569' OR (entity_type='work' AND original_name='Tu, só tu, puro amor')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0570' OR (entity_type='work' AND original_name='Notícia da atual literatura brasileira: Instinto de nacionalidade')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0571' OR (entity_type='work' AND original_name='Lição de Botânica')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0572' OR (entity_type='work' AND original_name='Não consultes médico')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0573' OR (entity_type='work' AND original_name='Contos esparsos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0574' OR (entity_type='work' AND original_name='Contos esquecidos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0575' OR (entity_type='work' AND original_name='Contos recolhidos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0576' OR (entity_type='work' AND original_name='Contos avulsos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0577' OR (entity_type='work' AND original_name='Contos sem data')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0578' OR (entity_type='work' AND original_name='Contos e crônicas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0579' OR (entity_type='work' AND original_name='Contos fantásticos de Machado de Assis')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0580' OR (entity_type='work' AND original_name='Crítica')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0581' OR (entity_type='work' AND original_name='Outras relíquias')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0582' OR (entity_type='work' AND original_name='Correspondência de Machado de Assis')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0583' OR (entity_type='work' AND original_name='Diálogos e reflexões de um relojoeiro')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0584' OR (entity_type='work' AND original_name='O Alienista')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0585' OR (entity_type='collection' AND original_name='Corpo de Baile')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0586' OR (entity_type='work' AND original_name='Com o vaqueiro Mariano')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0587' OR (entity_type='collection' AND original_name='Tutameia (Terceiras estórias)')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0588' OR (entity_type='collection' AND original_name='Estas estórias')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0589' OR (entity_type='collection' AND original_name='Ave, Palavra')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0590' OR (entity_type='collection' AND original_name='Magma')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0591' OR (entity_type='work' AND original_name='O mistério dos MMM')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0592' OR (entity_type='collection' AND original_name='Os sete pecados capitais')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0593' OR (entity_type='work' AND original_name='Campo Geral')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0594' OR (entity_type='work' AND original_name='Uma estória de amor')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0595' OR (entity_type='work' AND original_name='A estória de Lélio e Lina')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0596' OR (entity_type='work' AND original_name='O Recado do Morro')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0597' OR (entity_type='work' AND original_name='Lão-Dalalão (Dão-Lalalão)')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0598' OR (entity_type='work' AND original_name='Cara-de-Bronze')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0599' OR (entity_type='work' AND original_name='Buriti')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0600' OR (entity_type='work' AND original_name='O mistério de Highmore Hall')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0601' OR (entity_type='work' AND original_name='Chronos kai Anagke (Tempo e Destino)')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1577' OR (subject_id='V1-ENT-0511' AND fact_field='first_publication_year' AND value_text='1901')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1578' OR (subject_id='V1-ENT-0511' AND fact_field='genre_or_form' AND value_text='诗、散文与故事混合的作品集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1579' OR (subject_id='V1-ENT-0511' AND fact_field='one_sentence_summary' AND value_text='据MEC国家文学学院与议会书目，该书把诗歌、散文和故事并置；文本页可见其诗作目录，因此作为混合体裁的早期作品集描述，不把它缩成单一诗集。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1580' OR (subject_id='V1-ENT-0512' AND fact_field='first_publication_year' AND value_text='1904')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1581' OR (subject_id='V1-ENT-0512' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1582' OR (subject_id='V1-ENT-0512' AND fact_field='one_sentence_summary' AND value_text='据Quálea出版社的书介，该集收入多篇早期小说；标题篇重写坡《告密的心》的犯罪叙述，书介将全书置于怪异、疯狂及死亡主题的早期创作语境。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1583' OR (subject_id='V1-ENT-0513' AND fact_field='first_publication_year' AND value_text='1908')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1584' OR (subject_id='V1-ENT-0513' AND fact_field='genre_or_form' AND value_text='中篇小说（nouvelle；亦称长篇故事）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1585' OR (subject_id='V1-ENT-0513' AND fact_field='one_sentence_summary' AND value_text='据原文，一名小说家在卢戈内斯家中初见卢卡斯·迪亚斯·贝莱斯；迪亚斯讲述自己在伤寒后曾被害妄想困扰，卢戈内斯随后揭示“被追捕者”其实就是迪亚斯本人，叙述者也开始疑心自己是否已被他算计。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1586' OR (subject_id='V1-ENT-0514' AND fact_field='first_publication_year' AND value_text='1908')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1587' OR (subject_id='V1-ENT-0514' AND fact_field='genre_or_form' AND value_text='中篇小说（novela corta）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1588' OR (subject_id='V1-ENT-0514' AND fact_field='one_sentence_summary' AND value_text='据小说原文，青年Rohán与姐妹Mercedes、Eglé先后发生情感纠葛；故事以多年后返回故地的重逢展开，关系在旧情、嫉妒与欲望间反复转折。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1589' OR (subject_id='V1-ENT-0515' AND fact_field='first_publication_year' AND value_text='1920')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1590' OR (subject_id='V1-ENT-0515' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1591' OR (subject_id='V1-ENT-0515' AND fact_field='one_sentence_summary' AND value_text='米西奥内斯公共图书馆所藏扫描本目录标注为1926年，目录列有标题篇及《El sueño》《La realidad》等；作品出版年1920另据S001，不能由1926馆藏目录推定1920初版目录。后编数字选本的标题篇中，瓜伊拉一名建有气象站的当地居民向到访者讲述曾与肉食性“nothosaurio”相伴。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1592' OR (subject_id='V1-ENT-0516' AND fact_field='first_publication_year' AND value_text='1920')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1593' OR (subject_id='V1-ENT-0516' AND fact_field='genre_or_form' AND value_text='四幕戏剧（cuento escénico）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1594' OR (subject_id='V1-ENT-0516' AND fact_field='one_sentence_summary' AND value_text='Octavio Nébel是到家乡度假的医学生；四幕戏以他与十五岁的Lidia相恋为中心，人物表和开场对话还引出Lidia的寡母Julia。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1595' OR (subject_id='V1-ENT-0517' AND fact_field='first_publication_year' AND value_text='1921')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1596' OR (subject_id='V1-ENT-0517' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1597' OR (subject_id='V1-ENT-0517' AND fact_field='one_sentence_summary' AND value_text='据文本页的标题篇内容，水蚺在森林遭人类侵入后召集蛇类开会，讨论怎样应对人类威胁；1921年同名卷与后来增补选本须区分。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1598' OR (subject_id='V1-ENT-0518' AND fact_field='first_publication_year' AND value_text='1924')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1599' OR (subject_id='V1-ENT-0518' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1600' OR (subject_id='V1-ENT-0518' AND fact_field='one_sentence_summary' AND value_text='馆藏记录所载简介明确转引Lecturalia；该简介称标题篇写丧偶的Subercasaux独自照料两个孩子，脚伤感染后仍外出寻找帮工。原版扫描目录另列十一篇；这十一篇数来自目录，不把简介误作馆藏机构原创，也不据后编材料补写初版目录。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1601' OR (subject_id='V1-ENT-0519' AND fact_field='first_publication_year' AND value_text='1925')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1602' OR (subject_id='V1-ENT-0519' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1603' OR (subject_id='V1-ENT-0519' AND fact_field='one_sentence_summary' AND value_text='据馆藏书目，1925年选集以《La gallina degollada》为题；原篇写Mazzini与Berta四个儿子因病障而被遗弃，夫妻将期望寄托于幼女Bertita，四兄弟目睹厨房杀鸡后模仿暴力并杀死妹妹。该原篇情节不被推作其余选篇目录。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1604' OR (subject_id='V1-ENT-0520' AND fact_field='first_publication_year' AND value_text='1929')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1605' OR (subject_id='V1-ENT-0520' AND fact_field='genre_or_form' AND value_text='中篇小说（novela corta）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1606' OR (subject_id='V1-ENT-0520' AND fact_field='one_sentence_summary' AND value_text='据直接阅读的小说，Morán离开两年后回到米西奥内斯，重新与Iñíguez家来往并被已长成的Magdalena吸引；他在农业、丛林和情感关系中重返旧生活，结尾因无法承受命运安排而离开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1607' OR (subject_id='V1-ENT-0521' AND fact_field='first_publication_year' AND value_text='1931')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1608' OR (subject_id='V1-ENT-0521' AND fact_field='genre_or_form' AND value_text='学校读本（与Leonardo Glusberg合著）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1609' OR (subject_id='V1-ENT-0521' AND fact_field='one_sentence_summary' AND value_text='据Rea的研究，该校用读本含新写文本、《丛林故事》部分故事及动物短札；它依学校道德与教学规范编排，且由Quiroga与教师Leonardo Glusberg合作。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1610' OR (subject_id='V1-ENT-0522' AND fact_field='first_publication_year' AND value_text='1935')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1611' OR (subject_id='V1-ENT-0522' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1612' OR (subject_id='V1-ENT-0522' AND fact_field='one_sentence_summary' AND value_text='据MEC记录其1935年出版；Textos.info可读的后编11篇选本含《Más allá》《El vampiro》《El hijo》等，简介将这些不同故事概括为围绕死亡、丛林和人与自然关系的杂集。该目录不冒充1935初版目录。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1613' OR (subject_id='V1-ENT-0523' AND fact_field='first_publication_year' AND value_text='1927')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1614' OR (subject_id='V1-ENT-0523' AND fact_field='genre_or_form' AND value_text='创作论短文')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1615' OR (subject_id='V1-ENT-0523' AND fact_field='one_sentence_summary' AND value_text='据原文，这组十条建议要求作者先明确故事方向、重视首尾、精确选词、少用不必要的形容词，并把人物一路带到结局；这些条目构成创作论而非虚构故事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1616' OR (subject_id='V1-ENT-0524' AND fact_field='first_publication_year' AND value_text='1925')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1617' OR (subject_id='V1-ENT-0524' AND fact_field='genre_or_form' AND value_text='创作论短文')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1618' OR (subject_id='V1-ENT-0524' AND fact_field='one_sentence_summary' AND value_text='据《Sobre el Arte de Contar Historias》中的《El manual del perfecto cuentista》，Quiroga以结尾句、leitmotiv、故事开头、惯用语等例子讨论短篇技法；本篇止于该文L97，不把下一篇的地方色彩、民俗等论述并入。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1619' OR (subject_id='V1-ENT-0525' AND fact_field='first_publication_year' AND value_text='1925')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1620' OR (subject_id='V1-ENT-0525' AND fact_field='genre_or_form' AND value_text='创作论短文')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1621' OR (subject_id='V1-ENT-0525' AND fact_field='one_sentence_summary' AND value_text='据《Sobre el Arte de Contar Historias》中的《Los “trucs” del perfecto cuentista》（L98–142），作者讨论地方色彩与民俗，并举技术科学术语、词序及暗示人物结局的写法为故事技法；这些内容属于本篇，不归入前篇《El manual》。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1622' OR (subject_id='V1-ENT-0526' AND fact_field='first_publication_year' AND value_text='1907')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1623' OR (subject_id='V1-ENT-0526' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1624' OR (subject_id='V1-ENT-0526' AND fact_field='one_sentence_summary' AND value_text='据短篇原文，Alicia婚后逐渐衰弱，医生无法解释贫血；丈夫后来在枕头内发现吸血寄生物，结局以室内怪异事件解释病因。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1625' OR (subject_id='V1-ENT-0527' AND fact_field='first_publication_year' AND value_text='1909')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1626' OR (subject_id='V1-ENT-0527' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1627' OR (subject_id='V1-ENT-0527' AND fact_field='one_sentence_summary' AND value_text='据研究页面对原篇的分析，四个儿子目睹厨房杀鸡后将这一暴力动作转向妹妹；故事把家庭冲突、日光与血的意象并置。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1628' OR (subject_id='V1-ENT-0528' AND fact_field='first_publication_year' AND value_text='1912')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1629' OR (subject_id='V1-ENT-0528' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1630' OR (subject_id='V1-ENT-0528' AND fact_field='one_sentence_summary' AND value_text='据文本页，《Una estación de amor》追叙Nébel与Lidia的恋情，从年轻时的相遇、分离到多年后的重逢；初刊时题为《Un sueño de amor》。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1631' OR (subject_id='V1-ENT-0529' AND fact_field='first_publication_year' AND value_text='1912')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1632' OR (subject_id='V1-ENT-0529' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1633' OR (subject_id='V1-ENT-0529' AND fact_field='one_sentence_summary' AND value_text='据文本页，Paulino被毒蛇咬伤后划独木舟沿河求救，身体衰败与他对日常生活的回忆交错，叙事最终停在死亡逼近的一程河路上。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1634' OR (subject_id='V1-ENT-0530' AND fact_field='first_publication_year' AND value_text='1920')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1635' OR (subject_id='V1-ENT-0530' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1636' OR (subject_id='V1-ENT-0530' AND fact_field='one_sentence_summary' AND value_text='据故事原文，农人结束田间活计时意外倒下，清醒地观察自己的身体、周围景物和死亡进程；年表所记1920-06-27不自动证明报纸名称。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1637' OR (subject_id='V1-ENT-0531' AND fact_field='first_publication_year' AND value_text='1919')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1638' OR (subject_id='V1-ENT-0531' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1639' OR (subject_id='V1-ENT-0531' AND fact_field='one_sentence_summary' AND value_text='据Lefort逐段概述，叙述者Guillermo Grant迷恋影星Dorothy Phillips，以富有南美人的身份赴好莱坞接近她；日记式二十段叙事最后揭示求婚情节是一场梦。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1640' OR (subject_id='V1-ENT-0531' AND fact_field='research_note' AND value_text='Lefort把作品读作以二十段日记制造读者受骗感：Grant对影星的追求先被写得近似可实现，末尾才以梦境揭露取消现实承诺；她据此讨论真实/幻象边界。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1641' OR (subject_id='V1-ENT-0532' AND fact_field='first_publication_year' AND value_text='1928')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1642' OR (subject_id='V1-ENT-0532' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1643' OR (subject_id='V1-ENT-0532' AND fact_field='one_sentence_summary' AND value_text='据故事原文，十三岁的儿子出门打猎后没有按时回家，父亲在丛林寻找时反复看见幻影中的孩子并以为与他团聚；结尾揭示儿子当天上午十点已在跨越带刺铁丝时被猎枪事故致死，父亲仍独自回家。初刊署题《El padre》（1928），1935年改题《El hijo》收入《Más allá》。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1644' OR (subject_id='V1-ENT-0533' AND fact_field='first_publication_year' AND value_text='1908')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1645' OR (subject_id='V1-ENT-0533' AND fact_field='genre_or_form' AND value_text='以笔名S. Fragoso Lima发表的连载小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1646' OR (subject_id='V1-ENT-0533' AND fact_field='one_sentence_summary' AND value_text='据Pionetti的连载研究，这部五期小说以倒叙展开复仇，叙述丛林中的原住民、人和野兽如何结盟反抗贫困与外来者滥权。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1647' OR (subject_id='V1-ENT-0534' AND fact_field='first_publication_year' AND value_text='1909')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1648' OR (subject_id='V1-ENT-0534' AND fact_field='genre_or_form' AND value_text='以笔名S. Fragoso Lima发表的连载小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1649' OR (subject_id='V1-ENT-0534' AND fact_field='one_sentence_summary' AND value_text='据Pionetti的剧情概述，一位印度导师转生为猴，在布宜诺斯艾利斯向三千年前杀害自己的仇家后代复仇；文本借标题误导读者。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1650' OR (subject_id='V1-ENT-0535' AND fact_field='first_publication_year' AND value_text='1910')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1651' OR (subject_id='V1-ENT-0535' AND fact_field='genre_or_form' AND value_text='以笔名S. Fragoso Lima发表的连载小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1652' OR (subject_id='V1-ENT-0535' AND fact_field='one_sentence_summary' AND value_text='据Sarti论文摘要，三名科学家试图不借助女性创造名为Biógeno的人造人；实验在感官能力的完成上失败，并牵涉科学、医学知识与自毁。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1653' OR (subject_id='V1-ENT-0535' AND fact_field='research_note' AND value_text='Sarti将连载的叙事形式与电影蒙太奇联系，具体指出镜头式衔接、遮片和时间跳跃；她也把人造人实验放在科学/医学知识及自毁问题中分析。此释义限于论文摘要。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1654' OR (subject_id='V1-ENT-0536' AND fact_field='first_publication_year' AND value_text='1911')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1655' OR (subject_id='V1-ENT-0536' AND fact_field='genre_or_form' AND value_text='以笔名S. Fragoso Lima发表的连载小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1656' OR (subject_id='V1-ENT-0536' AND fact_field='one_sentence_summary' AND value_text='据Pionetti引述的开篇，孟加拉虎Raja以第一人称讲述向驯兽师Kimberley复仇；故事用猛兽自述承载驯服、囚禁与报复情节。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1657' OR (subject_id='V1-ENT-0537' AND fact_field='first_publication_year' AND value_text='1912')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1658' OR (subject_id='V1-ENT-0537' AND fact_field='genre_or_form' AND value_text='以笔名S. Fragoso Lima发表的连载小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1659' OR (subject_id='V1-ENT-0537' AND fact_field='one_sentence_summary' AND value_text='据数字文本可见片段，小说将故事置于Commodus死后的罗马：新帝Pertinax即位，Didio Juliano在奢华宴席中接待来客；Pionetti记录原作于1912年以“S. Fragoso Lima”署名在《Caras y Caretas》六期连载。数字摘录仅支持所见场景，不据此扩写全篇。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1660' OR (subject_id='V1-ENT-0538' AND fact_field='first_publication_year' AND value_text='1906')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1661' OR (subject_id='V1-ENT-0538' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1662' OR (subject_id='V1-ENT-0538' AND fact_field='one_sentence_summary' AND value_text='据故事文本，船只漂流到港时船体完好却不见船员；一名幸存者解释船员遭遇无法抗拒的集体死亡冲动。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1663' OR (subject_id='V1-ENT-0539' AND fact_field='first_publication_year' AND value_text='1908')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1664' OR (subject_id='V1-ENT-0539' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1665' OR (subject_id='V1-ENT-0539' AND fact_field='one_sentence_summary' AND value_text='据故事原文，农场狗察觉主人Míster Jones将在酷热中死去；Quereilhac把这种动物感知写作死亡预兆和“丛林故事”构造的一部分。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1666' OR (subject_id='V1-ENT-0539' AND fact_field='research_note' AND value_text='Quereilhac把《La insolación》列作“丛林故事”：狗群预感主人死亡，使死亡先以动物感知的预兆进入日常农场空间。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1667' OR (subject_id='V1-ENT-0540' AND fact_field='first_publication_year' AND value_text='1911')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1668' OR (subject_id='V1-ENT-0540' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1669' OR (subject_id='V1-ENT-0540' AND fact_field='one_sentence_summary' AND value_text='据故事原文及Quereilhac分析，Benincasa进入蚁群活动区域后被食肉蚁袭击；研究文章将袭击过程作为环境力量压倒人物的叙事例子。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1670' OR (subject_id='V1-ENT-0540' AND fact_field='research_note' AND value_text='Quereilhac用Benincasa被食肉蚁袭击的情节说明《La miel silvestre》如何把危险环境和死亡逼近写进“丛林故事”；仅概述该论文对本篇的分析。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1671' OR (subject_id='V1-ENT-0541' AND fact_field='first_publication_year' AND value_text='1912')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1672' OR (subject_id='V1-ENT-0541' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1673' OR (subject_id='V1-ENT-0541' AND fact_field='one_sentence_summary' AND value_text='据故事原文，两匹马触及带刺铁丝后试图越过围栏；此篇将牲畜对围挡的反应组织成冲突，1917年后收入故事集。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1674' OR (subject_id='V1-ENT-0542' AND fact_field='first_publication_year' AND value_text='1918')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1675' OR (subject_id='V1-ENT-0542' AND fact_field='genre_or_form' AND value_text='短篇小说（以单行小册子形式连载出版）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1676' OR (subject_id='V1-ENT-0542' AND fact_field='one_sentence_summary' AND value_text='据直接阅读的全文，巴西雇工Olivera以幽默而勤奋的方式在米西奥内斯打工，替主人开石井、在夜间与女佣Cirila相会；Cirila被毒蛇咬伤后，他协助救治，结尾主人发现他擅自用简易拖具拖运木桶，显出其不循常规的性格。首刊期号与年份另据目录。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1677' OR (subject_id='V1-ENT-0543' AND fact_field='first_publication_year' AND value_text='1922')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1678' OR (subject_id='V1-ENT-0543' AND fact_field='genre_or_form' AND value_text='Ferrari所述儿童故事连载系列，十篇；Dum-Dum向四个弟弟写信讲述冒险。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1679' OR (subject_id='V1-ENT-0543' AND fact_field='one_sentence_summary' AND value_text='据Ferrari研究导读，Dum-Dum以书信向四个弟弟讲述冒险；Ferrari将该连载系列记为十篇，1922年始于Mundo Argentino、1924年续见Billiken，后于逝后结集。Rea另以1978年选本为对象记述十二篇及父亲写给子女的叙述框架；两种版本/目录口径分列，不称彼此一致。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1680' OR (subject_id='V1-ENT-0543' AND fact_field='bibliographic_note' AND value_text='Rea所讨论的1978年逝后选本为十二篇，并将叙述框架表述为父亲写给子女；此处只记录该选本的版本口径。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1681' OR (subject_id='V1-ENT-0544' AND fact_field='first_publication_year' AND value_text='1922')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1682' OR (subject_id='V1-ENT-0544' AND fact_field='genre_or_form' AND value_text='描写米西奥内斯动植物的34篇短札连载系列')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1683' OR (subject_id='V1-ENT-0544' AND fact_field='one_sentence_summary' AND value_text='Ferrari将系列概述为1922–1925年刊于Mundo Argentino、Billiken与Caras y Caretas的34则“丛林短札”，并称1967年才以书名结集；Rea提到Quiroga于1924年和1925年为Caras y Caretas撰写、题为De la vida de nuestros animales的短札。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1684' OR (subject_id='V1-ENT-0545' AND fact_field='first_publication_year' AND value_text='1917')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1685' OR (subject_id='V1-ENT-0545' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1686' OR (subject_id='V1-ENT-0545' AND fact_field='one_sentence_summary' AND value_text='据Ferrari对原刊故事的分析，一名年轻人请小说家替自己写一封能打动女友的信；小说家拒绝代笔，认为年轻人真诚写下的话胜过熟练作者的技巧，并建议当面交谈解决争执。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1687' OR (subject_id='V1-ENT-0545' AND fact_field='research_note' AND value_text='Ferrari将此篇读作对作者身份和写作限度的反思：故事中的小说家认为，经验不足以支撑对纯粹爱情的想象；文章又把作者自述“另有远多于署名作品”的说法，联系到杂志中的笔名、编辑与插图者共同分配表达的情形。释义限于该文对本篇的直接讨论。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1688' OR (subject_id='V1-ENT-0546' AND fact_field='first_publication_year' AND value_text='1917')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1689' OR (subject_id='V1-ENT-0546' AND fact_field='genre_or_form' AND value_text='短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1690' OR (subject_id='V1-ENT-0546' AND fact_field='one_sentence_summary' AND value_text='Ferrari将此篇描述为一则残酷的狩猎故事，指出它回响了Quiroga早期连载小说《Las fieras cómplices》，并把真正的“文明”问题置于城市与丛林的冲突中；故事原刊同页另有温彻斯特广告。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1691' OR (subject_id='V1-ENT-0546' AND fact_field='research_note' AND value_text='Ferrari直接把《Una cacería》与《Las fieras cómplices》联系起来，认为两篇共同触及城市/丛林所代表的文明冲突；该文还指出，原刊故事页上的Winchester广告可能构成早期植入式广告，将虚构叙事与现实商业讯息并置。这里仅转述其明确提出的解释。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1692' OR (subject_id='V1-ENT-0547' AND fact_field='first_publication_year' AND value_text='1872')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1693' OR (subject_id='V1-ENT-0547' AND fact_field='genre_or_form' AND value_text='novel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1694' OR (subject_id='V1-ENT-0547' AND fact_field='one_sentence_summary' AND value_text='Machado首部长篇以青年医生Félix为中心，写他在富有的寡妇Lívia与内向的Raquel之间的情感纠葛。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1695' OR (subject_id='V1-ENT-0548' AND fact_field='first_publication_year' AND value_text='1874')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1696' OR (subject_id='V1-ENT-0548' AND fact_field='genre_or_form' AND value_text='novel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1697' OR (subject_id='V1-ENT-0548' AND fact_field='one_sentence_summary' AND value_text='女主人公Guiomar面对三名求婚者的追求、施压与胁迫；原作副题为“Um perfil de mulher”。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1698' OR (subject_id='V1-ENT-0549' AND fact_field='first_publication_year' AND value_text='1876')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1699' OR (subject_id='V1-ENT-0549' AND fact_field='genre_or_form' AND value_text='novel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1700' OR (subject_id='V1-ENT-0549' AND fact_field='one_sentence_summary' AND value_text='故事置于19世纪50年代，围绕Helena与Estácio之间受社会阶级及家庭关系阻隔的爱情展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1701' OR (subject_id='V1-ENT-0550' AND fact_field='first_publication_year' AND value_text='1878')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1702' OR (subject_id='V1-ENT-0550' AND fact_field='genre_or_form' AND value_text='novel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1703' OR (subject_id='V1-ENT-0550' AND fact_field='one_sentence_summary' AND value_text='小说交织Iaiá Garcia、Jorge与Estela的情感关系，以骄傲、迷恋、嫉妒、误解与羞愧等冲突展开，背景为巴拉圭战争。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1704' OR (subject_id='V1-ENT-0551' AND fact_field='first_publication_year' AND value_text='1885')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1705' OR (subject_id='V1-ENT-0551' AND fact_field='genre_or_form' AND value_text='novel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1706' OR (subject_id='V1-ENT-0551' AND fact_field='one_sentence_summary' AND value_text='一位老教士回忆自己到Casa Velha查阅旧档案，并观察Félix与Lalau在庄园家庭中的感情和家族关系；1944年Martins单行书版与早期《A Estação》连载层分开记录。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1707' OR (subject_id='V1-ENT-0551' AND fact_field='first_book_edition_year' AND value_text='1944')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1708' OR (subject_id='V1-ENT-0552' AND fact_field='first_publication_year' AND value_text='1904')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1709' OR (subject_id='V1-ENT-0552' AND fact_field='genre_or_form' AND value_text='novel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1710' OR (subject_id='V1-ENT-0552' AND fact_field='one_sentence_summary' AND value_text='双胞胎Pedro与Paulo外貌相同而性格相反，两人都倾心于Flora，后来又分属对立政党；退休外交官Counselor Ayres以第三人称叙述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1711' OR (subject_id='V1-ENT-0553' AND fact_field='first_publication_year' AND value_text='1908')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1712' OR (subject_id='V1-ENT-0553' AND fact_field='genre_or_form' AND value_text='novel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1713' OR (subject_id='V1-ENT-0553' AND fact_field='one_sentence_summary' AND value_text='小说由退休外交官Counselor Ayres的日记条目构成；他记录晚年生活、爱与孤独，并回望帝国时期和新共和国初期。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1714' OR (subject_id='V1-ENT-0554' AND fact_field='first_publication_year' AND value_text='1870')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1715' OR (subject_id='V1-ENT-0554' AND fact_field='genre_or_form' AND value_text='short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1716' OR (subject_id='V1-ENT-0554' AND fact_field='one_sentence_summary' AND value_text='1870年结集的七篇短篇此前曾发表于《Jornal das Famílias》，包括《Frei Simão》和《Linha reta e linha curva》。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1717' OR (subject_id='V1-ENT-0555' AND fact_field='first_publication_year' AND value_text='1873')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1718' OR (subject_id='V1-ENT-0555' AND fact_field='genre_or_form' AND value_text='short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1719' OR (subject_id='V1-ENT-0555' AND fact_field='one_sentence_summary' AND value_text='首版目录列出六篇：《A parasita azul》《As bodas de Luiz Duarte》《Ernesto de Tal》《Aurora sem dia》《O relógio de ouro》《Ponto de vista》；作者卷首说明称这些是其汇集的短篇叙事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1720' OR (subject_id='V1-ENT-0556' AND fact_field='first_publication_year' AND value_text='1882')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1721' OR (subject_id='V1-ENT-0556' AND fact_field='genre_or_form' AND value_text='short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1722' OR (subject_id='V1-ENT-0556' AND fact_field='one_sentence_summary' AND value_text='十二篇故事的合集，包括《O alienista》中Simão Bacamarte反复改定Casa Verde收治标准，以及对话体《Teoria do medalhão》中父亲教成年儿子经营声望；目录据首版馆藏记录。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1723' OR (subject_id='V1-ENT-0557' AND fact_field='first_publication_year' AND value_text='1884')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1724' OR (subject_id='V1-ENT-0557' AND fact_field='genre_or_form' AND value_text='short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1725' OR (subject_id='V1-ENT-0557' AND fact_field='one_sentence_summary' AND value_text='首版目录列出18篇短篇，包括《A igreja do diabo》《O lapso》《As academias de Sião》等；作者卷首说明这些故事并非专属于某一天或某个特定日子的故事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1726' OR (subject_id='V1-ENT-0558' AND fact_field='first_publication_year' AND value_text='1895')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1727' OR (subject_id='V1-ENT-0558' AND fact_field='genre_or_form' AND value_text='short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1728' OR (subject_id='V1-ENT-0558' AND fact_field='one_sentence_summary' AND value_text='十六篇此前刊于《Gazeta de Notícias》的短篇由作者选编成集；1895年10月中旬报刊已有到货消息或书评，馆藏首版标示1896年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1729' OR (subject_id='V1-ENT-0558' AND fact_field='first_book_edition_year' AND value_text='1896')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1730' OR (subject_id='V1-ENT-0558' AND fact_field='research_note' AND value_text='Daniele Maria Megid 分析 Várias histórias 的作者编选过程：所收16篇最初发表于1884–1891年，书籍以1896为首版年份，但里约报刊自1895年10月中旬已出现书评或到货消息；本文据此将1895标作最早可证流通线索，将1896保留为首版题年，具体首次售卖日仍未由原刊影印本核实。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1731' OR (subject_id='V1-ENT-0559' AND fact_field='first_publication_year' AND value_text='1899')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1732' OR (subject_id='V1-ENT-0559' AND fact_field='genre_or_form' AND value_text='collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1733' OR (subject_id='V1-ENT-0559' AND fact_field='one_sentence_summary' AND value_text='馆藏目录将11项列在“Contos”组（其中包括纪念或评论文字），另列剧作《Tu, só tu, puro amor》和六篇《Chronicas》；该书因此是混合文类选集。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1734' OR (subject_id='V1-ENT-0560' AND fact_field='first_publication_year' AND value_text='1906')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1735' OR (subject_id='V1-ENT-0560' AND fact_field='genre_or_form' AND value_text='collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1736' OR (subject_id='V1-ENT-0560' AND fact_field='one_sentence_summary' AND value_text='1906年出版的作者合集；当前直接核实的合集内剧作《Lição de Botânica》首次收入本书，整本目录构成仍待逐项核对。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1737' OR (subject_id='V1-ENT-0561' AND fact_field='first_publication_year' AND value_text='1864')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1738' OR (subject_id='V1-ENT-0561' AND fact_field='genre_or_form' AND value_text='poetry_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1739' OR (subject_id='V1-ENT-0561' AND fact_field='one_sentence_summary' AND value_text='1864年诗集的馆藏目录列29首作品；另有一篇直接研究该书的论文具体分析《Os arlequins》《Epitáfio do México》《Polônia》。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1740' OR (subject_id='V1-ENT-0562' AND fact_field='first_publication_year' AND value_text='1870')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1741' OR (subject_id='V1-ENT-0562' AND fact_field='genre_or_form' AND value_text='poetry_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1742' OR (subject_id='V1-ENT-0562' AND fact_field='one_sentence_summary' AND value_text='《Falenas》以诗歌为主，馆藏目录分列“Varia”和“Lyra Chineza”，并同时收有戏剧诗《Uma Ode de Anacreonte》及短篇《Pallida Elvira》。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1743' OR (subject_id='V1-ENT-0563' AND fact_field='first_publication_year' AND value_text='1875')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1744' OR (subject_id='V1-ENT-0563' AND fact_field='genre_or_form' AND value_text='poetry_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1745' OR (subject_id='V1-ENT-0563' AND fact_field='one_sentence_summary' AND value_text='1875年诗集目录列13首诗，包括题材涉及原住民的《Potira》《Niani》，叙述新基督徒爱情的《A Cristã Nova》，以及涉及奴隶制的《Sabina》；后两项内容说明按馆藏目录转引的评论限定。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1746' OR (subject_id='V1-ENT-0564' AND fact_field='first_publication_year' AND value_text='1901')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1747' OR (subject_id='V1-ENT-0564' AND fact_field='genre_or_form' AND value_text='collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1748' OR (subject_id='V1-ENT-0564' AND fact_field='one_sentence_summary' AND value_text='1901年诗歌汇编重收并修订《Crisálidas》《Falenas》《Americanas》中的部分诗作，另加入《Ocidentais》；它是独立的书本汇编层。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1749' OR (subject_id='V1-ENT-0565' AND fact_field='first_publication_year' AND value_text='1863')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1750' OR (subject_id='V1-ENT-0565' AND fact_field='genre_or_form' AND value_text='collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1751' OR (subject_id='V1-ENT-0565' AND fact_field='one_sentence_summary' AND value_text='1863年《Theatro》第一卷收录两部首演喜剧《O caminho da porta》和《O protocolo》，并附通信文字；原卷本身不等同于其中两部剧作或其演出。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1752' OR (subject_id='V1-ENT-0566' AND fact_field='first_publication_year' AND value_text='1861')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1753' OR (subject_id='V1-ENT-0566' AND fact_field='genre_or_form' AND value_text='play')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1754' OR (subject_id='V1-ENT-0566' AND fact_field='one_sentence_summary' AND value_text='《Desencantos》是一部以Clara、Luís de Melo和Pedro Alves为中心的“Fantasia Dramática”：数年后，Luís向Pedro的继女求婚并获其同意。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1755' OR (subject_id='V1-ENT-0567' AND fact_field='first_publication_year' AND value_text='1864')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1756' OR (subject_id='V1-ENT-0567' AND fact_field='genre_or_form' AND value_text='play')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1757' OR (subject_id='V1-ENT-0567' AND fact_field='one_sentence_summary' AND value_text='这部一幕喜剧写议员Martins等待入阁时，一群求恩者蜂拥上门；任命落空后，逐利的奉承者离去，暴露政治庇护关系。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1758' OR (subject_id='V1-ENT-0568' AND fact_field='first_publication_year' AND value_text='1866')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1759' OR (subject_id='V1-ENT-0568' AND fact_field='genre_or_form' AND value_text='play')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1760' OR (subject_id='V1-ENT-0568' AND fact_field='one_sentence_summary' AND value_text='这部喜剧让奥林匹斯诸神穿上现代礼服并讨论人间事务；作者序称其为由短对话构成的简约讽刺，正文以亚历山大诗行写成。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1761' OR (subject_id='V1-ENT-0569' AND fact_field='first_publication_year' AND value_text='1880')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1762' OR (subject_id='V1-ENT-0569' AND fact_field='genre_or_form' AND value_text='play')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1763' OR (subject_id='V1-ENT-0569' AND fact_field='one_sentence_summary' AND value_text='喜剧将Camões与D. Catarina de Ataíde的恋情搬上舞台；1880年发表于《Revista Brasileira》并于纪念庆典演出，1881年收入书本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1764' OR (subject_id='V1-ENT-0569' AND fact_field='first_book_edition_year' AND value_text='1881')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1765' OR (subject_id='V1-ENT-0570' AND fact_field='first_publication_year' AND value_text='1873')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1766' OR (subject_id='V1-ENT-0570' AND fact_field='genre_or_form' AND value_text='critical_essay')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1767' OR (subject_id='V1-ENT-0570' AND fact_field='one_sentence_summary' AND value_text='发表于《O Novo Mundo》的批评文章，分论小说、诗歌、戏剧与语言；BNDigital记刊期为1873年3月24日。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1768' OR (subject_id='V1-ENT-0571' AND fact_field='first_publication_year' AND value_text='1906')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1769' OR (subject_id='V1-ENT-0571' AND fact_field='genre_or_form' AND value_text='play')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1770' OR (subject_id='V1-ENT-0571' AND fact_field='one_sentence_summary' AND value_text='植物学家兼男爵Segismundo为维护侄子Henrique的科学独身，要求姨母阻断他与Cecília的恋情；D. Helena巧用男爵的植物学著作促成两人和解，也让男爵向自己求婚。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1771' OR (subject_id='V1-ENT-0572' AND fact_field='first_publication_year' AND value_text='1899')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1772' OR (subject_id='V1-ENT-0572' AND fact_field='genre_or_form' AND value_text='play')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1773' OR (subject_id='V1-ENT-0572' AND fact_field='one_sentence_summary' AND value_text='D. Leocádia认为修道院不能治愈Cavalcante的失恋，转而建议他赴中国传教；他与同样失恋的Carlota相互倾诉后相爱并决定结婚。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1774' OR (subject_id='V1-ENT-0573' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1775' OR (subject_id='V1-ENT-0573' AND fact_field='genre_or_form' AND value_text='short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1776' OR (subject_id='V1-ENT-0573' AND fact_field='one_sentence_summary' AND value_text='Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“O anjo Rafael”。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1777' OR (subject_id='V1-ENT-0574' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1778' OR (subject_id='V1-ENT-0574' AND fact_field='genre_or_form' AND value_text='short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1779' OR (subject_id='V1-ENT-0574' AND fact_field='one_sentence_summary' AND value_text='Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“Decadência de dois grandes homens”与“Um esqueleto”。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1780' OR (subject_id='V1-ENT-0575' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1781' OR (subject_id='V1-ENT-0575' AND fact_field='genre_or_form' AND value_text='short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1782' OR (subject_id='V1-ENT-0575' AND fact_field='one_sentence_summary' AND value_text='Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“O capitão Mendonça”。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1783' OR (subject_id='V1-ENT-0576' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1784' OR (subject_id='V1-ENT-0576' AND fact_field='genre_or_form' AND value_text='short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1785' OR (subject_id='V1-ENT-0576' AND fact_field='one_sentence_summary' AND value_text='Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“A vida eterna”与“Os óculos de Pedro Antão”。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1786' OR (subject_id='V1-ENT-0577' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1787' OR (subject_id='V1-ENT-0577' AND fact_field='genre_or_form' AND value_text='short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1788' OR (subject_id='V1-ENT-0577' AND fact_field='one_sentence_summary' AND value_text='Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“A mulher pálida”。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1789' OR (subject_id='V1-ENT-0578' AND fact_field='first_publication_year' AND value_text='1958')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1790' OR (subject_id='V1-ENT-0578' AND fact_field='genre_or_form' AND value_text='short_story_and_chronicle_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1791' OR (subject_id='V1-ENT-0578' AND fact_field='one_sentence_summary' AND value_text='目录示例列《O Teles e o Tobias》和《O carro nº 13》；Google Books 记录该卷由 Raimundo Magalhães Júnior 编，Civilização Brasileira 于1958年出版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1792' OR (subject_id='V1-ENT-0579' AND fact_field='first_publication_year' AND value_text='1973')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1793' OR (subject_id='V1-ENT-0579' AND fact_field='genre_or_form' AND value_text='short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1794' OR (subject_id='V1-ENT-0579' AND fact_field='one_sentence_summary' AND value_text='Raimundo Magalhães Júnior 1973年编选的十一篇故事，包括《A chinela turca》《A mulher pálida》《O anjo Rafael》与《O capitão Mendonça》；研究指出其中仅两篇曾由 Machado 自行选入生前单行本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1795' OR (subject_id='V1-ENT-0580' AND fact_field='first_publication_year' AND value_text='1910')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1796' OR (subject_id='V1-ENT-0580' AND fact_field='genre_or_form' AND value_text='critical_anthology')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1797' OR (subject_id='V1-ENT-0580' AND fact_field='one_sentence_summary' AND value_text='Mário de Alencar 编辑的1910年遗著选集；目录从《Instinto de nacionalidade》《Guilherme Malta》《Castro Alves》列至评论与序文，篇目性质为文学批评及序言。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1798' OR (subject_id='V1-ENT-0581' AND fact_field='first_publication_year' AND value_text='1910')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1799' OR (subject_id='V1-ENT-0581' AND fact_field='genre_or_form' AND value_text='mixed_prose_poetry_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1800' OR (subject_id='V1-ENT-0581' AND fact_field='one_sentence_summary' AND value_text='1910年Garnier卷的目录列八篇散文及六篇诗作（含《O Almada》《Réfus》）；卷首说明称收录故事、诗和散页，来自作者创作较成熟作品的时期。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1801' OR (subject_id='V1-ENT-0582' AND fact_field='first_publication_year' AND value_text='1932')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1802' OR (subject_id='V1-ENT-0582' AND fact_field='genre_or_form' AND value_text='correspondence_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1803' OR (subject_id='V1-ENT-0582' AND fact_field='one_sentence_summary' AND value_text='Fernando Nery 1932年编注的通信集，约232项，收入 Machado 致 Nabuco、Veríssimo、Mário de Alencar、Lúcio de Mendonça等人的信，也包括若干收信人的回复。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1804' OR (subject_id='V1-ENT-0583' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1805' OR (subject_id='V1-ENT-0583' AND fact_field='genre_or_form' AND value_text='chronicle_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1806' OR (subject_id='V1-ENT-0583' AND fact_field='one_sentence_summary' AND value_text='1956年卷的副题说明其从《Gazeta de notícias》辑录1886年的“A + B”及1888—1889年的“Bons dias”；学术研究称收全“A + B”与除一篇外的“Bons Dias”，为“A + B”首个书本版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1807' OR (subject_id='V1-ENT-0584' AND fact_field='first_publication_year' AND value_text='1881')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1808' OR (subject_id='V1-ENT-0584' AND fact_field='genre_or_form' AND value_text='short_story')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1809' OR (subject_id='V1-ENT-0584' AND fact_field='one_sentence_summary' AND value_text='医生Simão Bacamarte在Itaguaí建Casa Verde研究并分类“疯癫”；当收治人数达到全镇人口五分之四，他改换理性标准释放众人，最后又把自己收治。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1810' OR (subject_id='V1-ENT-0584' AND fact_field='first_book_edition_year' AND value_text='1882')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1811' OR (subject_id='V1-ENT-0584' AND fact_field='research_note' AND value_text='Sandra Mara da Silva Franca 的 USP 硕士论文比较《O Alienista》在《A Estação》与《Papéis Avulsos》中的版本，并依据叙事焦点与文体论证其为“conto”，而非“novela”；论文还指出1881–1882连载本到1882年Lombaerts书版之间存在作者修订。此处按其明确的类型判断记录，不抹去葡语批评史上的类型争议。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1812' OR (subject_id='V1-ENT-0585' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1813' OR (subject_id='V1-ENT-0585' AND fact_field='genre_or_form' AND value_text='novel_cycle')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1814' OR (subject_id='V1-ENT-0585' AND fact_field='one_sentence_summary' AND value_text='《Corpo de Baile》以七个分别命名的叙事构成循环性作品；Calzolari考察其印刷谱系：1956年初版为两卷，1960年第二版合为一卷，至第三版（1964/65）才拆成三册自主卷本。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1815' OR (subject_id='V1-ENT-0585' AND fact_field='research_note' AND value_text='Tereza Paula Alves Calzolari在《Tradição impressa de Corpo de Baile》中对照初版、第二版与第三版的题名、卷数和目录分类，并指出初版对内部篇目采用多种文类标注；本候选据此把1956合卷与后来的三册区分为不同版本层，不将七篇一概定作短篇小说。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1816' OR (subject_id='V1-ENT-0586' AND fact_field='first_publication_year' AND value_text='1947')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1817' OR (subject_id='V1-ENT-0586' AND fact_field='genre_or_form' AND value_text='reportagem / 文学旅行叙述（reportagem特征据Andrea Ramos Jubé Vianna 2019年题录摘要）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1818' OR (subject_id='V1-ENT-0586' AND fact_field='one_sentence_summary' AND value_text='USP书目记录将《Com o vaqueiro Mariano》相关报刊文本列为1947–48年分期刊载，并另记1952年独立小书及其后收入《Estas estórias》（S204 L22–46、L48–106；S212）。该页面对Andrea Ramos Jubé Vianna 2019年研究的摘要称文本具有reportagem特征（S204 L256–269）；原论文未读。S204 L282–294另列Guilherme Mazzafera e Silva Vilhena 2017年的不同研究，reportagem说法不归于该研究。ABL所记1952年行旅只用于行旅年代，不证明1947年首发（S203）。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1819' OR (subject_id='V1-ENT-0586' AND fact_field='bibliographic_note' AND value_text='USP机构书目记录《Com o vaqueiro Mariano》的1952年独立书版及1947–48年报刊分期（S204 L22–46、L48–106）。同一页面对Andrea Ramos Jubé Vianna 2019年研究的题录摘要称文本具有reportagem特征（S204 L256–269）；原论文未读。页面L282–294另列Guilherme Mazzafera e Silva Vilhena 2017年的另一研究，不将reportagem结论归给Vilhena。ABL记录作者1952年行旅（S203），不支持报刊首发年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1820' OR (subject_id='V1-ENT-0587' AND fact_field='first_publication_year' AND value_text='1967')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1821' OR (subject_id='V1-ENT-0587' AND fact_field='genre_or_form' AND value_text='short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1822' OR (subject_id='V1-ENT-0587' AND fact_field='one_sentence_summary' AND value_text='由40篇极短叙事和4篇前言构成；书名为Tutameia，Terceiras estórias是其副题/第二命名层，不是另一部作品，也不暗示存在同作者的“第二故事”书。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1823' OR (subject_id='V1-ENT-0587' AND fact_field='research_note' AND value_text='Maíra Pinheiro Tavares指出，Tutameia以双目录组织44篇文本：40篇归作“Contos”，另4篇标为“Prefácios”，其中三篇穿插在叙事之间；她据此讨论这些副文本和排列如何共同形成全书的节奏与谜样结构（S206，P16–17 L205–242）。她还将短篇的高度凝缩与语言的音乐性相连（摘要P9 L71–99）。此处仅归属该论文的文本结构/形式发现。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1824' OR (subject_id='V1-ENT-0588' AND fact_field='first_publication_year' AND value_text='1969')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1825' OR (subject_id='V1-ENT-0588' AND fact_field='genre_or_form' AND value_text='short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1826' OR (subject_id='V1-ENT-0588' AND fact_field='one_sentence_summary' AND value_text='S230书目将《Estas estórias》1969年初版列为九篇：A simples e exata estória do burrinho do comandante、Os chapéus transeuntes、Entremeio: com o vaqueiro Mariano、A estória do Homem do Pinguelo、Meu tio o Iauaretê、Bicho mau、Páramo、Retábulo de São Nunca、O dar das pedras brilhantes（L127）。USP目录也将“Entremeio”列作本集篇目（S212 L87–101），与1952年独立小书版分属不同出版层。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1827' OR (subject_id='V1-ENT-0589' AND fact_field='first_publication_year' AND value_text='1970')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1828' OR (subject_id='V1-ENT-0589' AND fact_field='genre_or_form' AND value_text='miscellany / mixed-genre collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1829' OR (subject_id='V1-ENT-0589' AND fact_field='one_sentence_summary' AND value_text='据Elvira Livonete Costa对该遗作杂集的研究，书中汇集诗、短篇叙事、日记、旅行札记等形式，并重组作者1947至1967年间的报刊文字。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1830' OR (subject_id='V1-ENT-0590' AND fact_field='first_publication_year' AND value_text='1997')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1831' OR (subject_id='V1-ENT-0590' AND fact_field='genre_or_form' AND value_text='poetry_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1832' OR (subject_id='V1-ENT-0590' AND fact_field='one_sentence_summary' AND value_text='一部诗集，曾获巴西文学院诗歌奖，按作者意愿长期未刊，直至1997年才身后出版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1833' OR (subject_id='V1-ENT-0591' AND fact_field='first_publication_year' AND value_text='1961')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1834' OR (subject_id='V1-ENT-0591' AND fact_field='genre_or_form' AND value_text='collaborative detective novel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1835' OR (subject_id='V1-ENT-0591' AND fact_field='research_note' AND value_text='Santos在2016年UEL硕士论文P44–45讨论另一部小说时，将《O mistério dos MMM》作为简短背景例子，列出1962年书本出版、十位作者及逐章接写；该论文研究对象并非本书（S211）。Leszczynski与Soares的2022年论文P4 L154–156将若昂·吉马朗埃斯·罗萨与若热·亚马多列为十位合作者中的两位（S224）。S224 P2 L95–96另称本书于1964年在《O Cruzeiro》连载、后来出版成书；此处只转述该论文说法，不将1964年作为事实首发年；该说法与W207-F05书目注释中所据1961年连载记录冲突。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1836' OR (subject_id='V1-ENT-0591' AND fact_field='one_sentence_summary' AND value_text='据Leszczynski与Soares的研究，故事从科帕卡巴纳一名富翁公寓内的谋杀案展开，现场三封由不同笔迹写成、署名均为“M”的信把调查引向三名女性；十位作者各接写一章，逐步续写谜案。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1837' OR (subject_id='V1-ENT-0591' AND fact_field='bibliographic_note' AND value_text='可核的最早发表时间为1961年：Covizzi与Verlangieri的学术书目L125–126将《O Mistério dos MMM》（Rosa第七章）记为1961年10–12月发表于《O Cruzeiro》，并另列Rio de Janeiro: Ed. O Cruzeiro, 1962（S230）。ABL作者书目列合作书本版为1962（S201 L30），帕拉州基金会馆藏目录著录“Rio de Janeiro: O Cruzeiro, 1962, 208 p.”（S229 L2–3）。S224 P2 L95–96称作品于1964年在《O Cruzeiro》连载、后来也出版成书；与已核1961年连载及1962年书版冲突，保留为来源中的相反年代说法。Santos的2016年UEL论文P44–45仅顺带列1962、十位作者和逐章接写，不是本书专论。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1838' OR (subject_id='V1-ENT-0592' AND fact_field='first_publication_year' AND value_text='1964')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1839' OR (subject_id='V1-ENT-0592' AND fact_field='genre_or_form' AND value_text='collective short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1840' OR (subject_id='V1-ENT-0592' AND fact_field='one_sentence_summary' AND value_text='七位作者的合作故事集；USP目录确认若昂·吉马朗埃斯·罗萨为合作者之一，并记载其篇目“Os chapéus transeuntes”位于本书第1–36页。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1841' OR (subject_id='V1-ENT-0593' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1842' OR (subject_id='V1-ENT-0593' AND fact_field='genre_or_form' AND value_text='narrative_text')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1843' OR (subject_id='V1-ENT-0593' AND fact_field='one_sentence_summary' AND value_text='Erich Soares Nogueira在《Campo geral》研究摘要中将Miguilim描述为一个近视男孩，凭身体感官经验和讲故事来理解周围世界，并以叙事应对童年的恐惧与死亡。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1844' OR (subject_id='V1-ENT-0593' AND fact_field='research_note' AND value_text='Erich Soares Nogueira在对《Campo geral》的研究摘要中把Miguilim描述为凭感官经验认识世界、并通过讲故事应对充满疑虑、恐惧和死亡的童年；这是该文的研究性概括，不是对所有篇章形式分类的判断。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1845' OR (subject_id='V1-ENT-0594' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1846' OR (subject_id='V1-ENT-0594' AND fact_field='genre_or_form' AND value_text='narrative_text')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1847' OR (subject_id='V1-ENT-0594' AND fact_field='one_sentence_summary' AND value_text='Franciane Conceição da Silva的研究摘要指出，Manuelzão外显的强悍和勇敢与其隐而未露的焦虑、不安形成张力。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1848' OR (subject_id='V1-ENT-0594' AND fact_field='research_note' AND value_text='Franciane Conceição da Silva以男性气质为问题切入《Uma estória de amor》，摘要指出Manuelzão强悍的外表掩藏焦虑与不安；此处将解释明确归属该研究。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1849' OR (subject_id='V1-ENT-0595' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1850' OR (subject_id='V1-ENT-0595' AND fact_field='genre_or_form' AND value_text='narrative_text')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1851' OR (subject_id='V1-ENT-0595' AND fact_field='one_sentence_summary' AND value_text='Danilo Almeida Patrício的研究摘要将Lélio写作一名从城市返回米纳斯吉拉斯荒原的牧牛人，其主要经历发生在Pinhém农庄。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1852' OR (subject_id='V1-ENT-0595' AND fact_field='research_note' AND value_text='Danilo Almeida Patrício以“Saudades de destino”为题讨论《A estória de Lélio e Lina》，摘要聚焦Lélio在Pinhém的经历以及人物和世界如何呈现“规则之外”的力量；此处只采用摘要明确列出的地点与研究角度。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1853' OR (subject_id='V1-ENT-0596' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1854' OR (subject_id='V1-ENT-0596' AND fact_field='genre_or_form' AND value_text='narrative_text')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1855' OR (subject_id='V1-ENT-0596' AND fact_field='one_sentence_summary' AND value_text='据Ana Paula Pinto对该篇的分析，Pedro Orósio随五人旅行队穿越sertão，逐段传递的山中预言揭露同伴谋害他的阴谋；他在最后关头获救，结局被作者阐释为惩罚与救赎。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1856' OR (subject_id='V1-ENT-0596' AND fact_field='research_note' AND value_text='Ana Paula Pinto在《O recado do Morro: profecia e redenção》中分析预言由七重传递、谋害计划以及Pedro Orósio最后关头获救之间的结构，并以“惩罚与救赎”解释结局。定位据论文全文P2 L81–89、P6–7 L245–260，不只据摘要。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1857' OR (subject_id='V1-ENT-0597' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1858' OR (subject_id='V1-ENT-0597' AND fact_field='genre_or_form' AND value_text='novella')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1859' OR (subject_id='V1-ENT-0597' AND fact_field='one_sentence_summary' AND value_text='Biagio D’Angelo把《Dão-Lalalão》称作一部中篇叙事，围绕Soropita与Doralda的肉身之爱展开，并把欲望解释为趋向圆满的动力。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1860' OR (subject_id='V1-ENT-0597' AND fact_field='research_note' AND value_text='Biagio D’Angelo在《Dão-Lalalão, a reescrita do desejo》中以欲望与重写为研究角度，讨论Soropita与Doralda的夫妻关系及肉身之爱；该文称其为“romance breve”，故候选采用中篇叙事这一较中性的文类值。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1861' OR (subject_id='V1-ENT-0598' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1862' OR (subject_id='V1-ENT-0598' AND fact_field='genre_or_form' AND value_text='narrative_text')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1863' OR (subject_id='V1-ENT-0598' AND fact_field='one_sentence_summary' AND value_text='Maria da Glória Sá Rosa对《Cara-de-Bronze》的摘要介绍一位误以为自己害死父亲的隐居庄园主；他在晚年派牧牛人Grivo远行探寻事物本质，并请他讲述见闻。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1864' OR (subject_id='V1-ENT-0598' AND fact_field='research_note' AND value_text='Maria da Glória Sá Rosa以“电影语言或神秘主义”为研究切入，摘要把主人公误解父亲死因、Grivo奉命远行以及带回讲述联系起来；候选只转述作者明确列出的情节和研究问题。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1865' OR (subject_id='V1-ENT-0599' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1866' OR (subject_id='V1-ENT-0599' AND fact_field='genre_or_form' AND value_text='narrative_text')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1867' OR (subject_id='V1-ENT-0599' AND fact_field='one_sentence_summary' AND value_text='Sarah Maria Forte Diogo的研究摘要指出，Lalinha抵达Buriti Bom后打破农庄封闭的父权秩序，并使其中的欲望与人物关系显露出来。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1868' OR (subject_id='V1-ENT-0599' AND fact_field='research_note' AND value_text='Sarah Maria Forte Diogo在《O mundo que perdeu suas paredes》中把Lalinha置于封闭农庄秩序、女性欲望与情色关系的讨论中心；此处的父权秩序解释归属于该研究，不扩张为未经来源支持的人物关系。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1869' OR (subject_id='V1-ENT-0600' AND fact_field='first_publication_year' AND value_text='1929')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1870' OR (subject_id='V1-ENT-0600' AND fact_field='genre_or_form' AND value_text='gothic/fantastic short story')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1871' OR (subject_id='V1-ENT-0600' AND fact_field='one_sentence_summary' AND value_text='医生Angus Dumbraid奉召前往苏格兰的Highmore庄园照料John Highmore，并卷入围绕旧宅、家族离散与诡异病况展开的哥特式谜团。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1872' OR (subject_id='V1-ENT-0600' AND fact_field='research_note' AND value_text='Luis Eduardo Wexell Machado的文章将本篇置于Rosa早期哥特/幻想小说语境，并分析其与Poe及Walpole传统的关系；本条仅归属该研究对本篇的直接分析。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1873' OR (subject_id='V1-ENT-0601' AND fact_field='first_publication_year' AND value_text='1930')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1874' OR (subject_id='V1-ENT-0601' AND fact_field='genre_or_form' AND value_text='fantastic short story')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1875' OR (subject_id='V1-ENT-0601' AND fact_field='one_sentence_summary' AND value_text='棋手Zviazline为筹婚资参加比赛，遭人下药后在幻游中见到时间与命运对弈；命运替他完成比赛，使他以全胜夺冠，随后与Efrozine结婚。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1876' OR (subject_id='V1-ENT-0601' AND fact_field='research_note' AND value_text='Luis Eduardo Wexell Machado在同一论文中把《Tempo e Destino》列为Rosa最早的幻想短篇之一，记其1930年6月22日发表于《O Cruzeiro》，并分析Zviazline的棋赛、麻醉后的超自然经历及命运替他完成比赛的结局。定位为P6 L213–216、P7–9 L217–310。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1877' OR (subject_id='V1-ENT-0207' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1878' OR (subject_id='V1-ENT-0207' AND fact_field='one_sentence_summary' AND value_text='Quereilhac说明初版由作者从1906–1914年报刊发表的故事中选出18篇，后续版本减为15篇；她将其读作题材多样、以生命和死亡相互牵连的短篇拼图。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1879' OR (subject_id='V1-ENT-0207' AND fact_field='research_note' AND value_text='Quereilhac指出，初版18篇、后续第二/三版减为15篇；该集以“爱情、疯狂、死亡”无逗号的并置形成多样故事的共同张力。此释义限于该论文对该书版本与整体结构的说明。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1880' OR (subject_id='V1-ENT-0208' AND fact_field='genre_or_form' AND value_text='儿童短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1881' OR (subject_id='V1-ENT-0208' AND fact_field='one_sentence_summary' AND value_text='Quereilhac把《丛林故事》概括为寓言、传说与史诗交叠的丛林世界；人与动物共享叙事属性，并共同面对死亡。此概述限于她对该书的论述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1882' OR (subject_id='V1-ENT-0208' AND fact_field='research_note' AND value_text='Quereilhac把《丛林故事》概括为寓言、传说与史诗交叠的丛林世界；人与动物共享叙事属性，并共同面对死亡。此概述限于她对该书的论述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1883' OR (subject_id='V1-ENT-0209' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1884' OR (subject_id='V1-ENT-0209' AND fact_field='one_sentence_summary' AND value_text='Quereilhac将该集的人物概括为被城市文明排出的“exhombres”，在自我与强大自然之间挣扎；此处保留为该研究对全书叙事世界的概述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1885' OR (subject_id='V1-ENT-0209' AND fact_field='research_note' AND value_text='Quereilhac将《Los desterrados》的叙事世界概括为被城市文明排出的“exhombres”，在自我与强大自然之间艰难挣扎；此处不把批评论断扩为地理关系。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1886' OR (subject_id='V1-ENT-0214' AND fact_field='first_periodical_publication_year' AND value_text='1880')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1887' OR (subject_id='V1-ENT-0214' AND fact_field='genre_or_form' AND value_text='novel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1888' OR (subject_id='V1-ENT-0214' AND fact_field='one_sentence_summary' AND value_text='该页面将小说概括为采用元文学和自我指涉手法，叙述语调兼具讽刺、戏仿与反讽。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1889' OR (subject_id='V1-ENT-0215' AND fact_field='first_periodical_publication_year' AND value_text='1886')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1890' OR (subject_id='V1-ENT-0215' AND fact_field='genre_or_form' AND value_text='novel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1891' OR (subject_id='V1-ENT-0215' AND fact_field='one_sentence_summary' AND value_text='鲁比昂继承钱财以及一只名为Quincas Borba的狗后迁居里约，在财富带来的社会交往中逐渐陷入妄想；报刊连载与1891年书版作为同一小说的不同阶段处理。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1892' OR (subject_id='V1-ENT-0216' AND fact_field='genre_or_form' AND value_text='novel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1893' OR (subject_id='V1-ENT-0216' AND fact_field='one_sentence_summary' AND value_text='本托·圣地亚哥回顾自己与卡皮图的关系，围绕嫉妒及对妻子是否不忠的怀疑展开叙述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1894' OR (subject_id='V1-ENT-0217' AND fact_field='genre_or_form' AND value_text='novel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1895' OR (subject_id='V1-ENT-0217' AND fact_field='one_sentence_summary' AND value_text='据ABL刊载的Ana Maria Machado文章，小说以与魔鬼的契约为轴，Riobaldo是主角，Diadorim则以战士身份及其后揭示的身份线索进入叙事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1896' OR (subject_id='V1-ENT-0218' AND fact_field='genre_or_form' AND value_text='short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1897' OR (subject_id='V1-ENT-0218' AND fact_field='one_sentence_summary' AND value_text='据Daniela Diana的介绍，《Sagarana》使用富含古语、通俗词和新造词的创新、音乐性语言；她称米纳斯吉拉斯是作品中最常出现的地区，也提到里约热内卢和戈亚斯。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1898' OR (subject_id='V1-ENT-0219' AND fact_field='genre_or_form' AND value_text='short_story_collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1899' OR (subject_id='V1-ENT-0219' AND fact_field='one_sentence_summary' AND value_text='据葡萄牙语博物馆馆藏简介，《Primeiras estórias》收录21篇短篇，以人的经验与sertão为背景，涉及生命、时间、爱情、死亡和存在之谜。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0480' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0511')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0481' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0512')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0482' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0513')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0483' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0514')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0484' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0515')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0485' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0516')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0486' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0517')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0487' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0518')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0488' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0519')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0489' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0520')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0490' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0521')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0491' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0522')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0492' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0523')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0493' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0524')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0494' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0525')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0495' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0526')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0496' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0527')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0497' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0528')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0498' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0529')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0499' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0530')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0500' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0531')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0501' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0532')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0502' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0533')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0503' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0534')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0504' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0535')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0505' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0536')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0506' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0537')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0507' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0538')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0508' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0539')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0509' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0540')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0510' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0541')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0511' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0542')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0512' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0543')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0513' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0544')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0514' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0545')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0515' OR (subject_id='V1-ENT-0200' AND relation_type='CREATED' AND object_id='V1-ENT-0546')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0516' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0547')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0517' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0548')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0518' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0549')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0519' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0550')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0520' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0551')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0521' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0552')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0522' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0553')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0523' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0554')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0524' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0555')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0525' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0556')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0526' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0557')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0527' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0558')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0528' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0559')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0529' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0560')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0530' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0561')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0531' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0562')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0532' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0563')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0533' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0564')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0534' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0565')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0535' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0566')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0536' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0567')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0537' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0568')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0538' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0569')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0539' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0570')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0540' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0571')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0541' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0572')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0542' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0573')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0543' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0574')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0544' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0575')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0545' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0576')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0546' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0577')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0547' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0578')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0548' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0579')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0549' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0580')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0550' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0581')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0551' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0582')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0552' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0583')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0553' OR (subject_id='V1-ENT-0211' AND relation_type='CREATED' AND object_id='V1-ENT-0584')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0554' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0585')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0555' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0586')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0556' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0587')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0557' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0588')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0558' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0589')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0559' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0590')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0560' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0591')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0561' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0592')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0562' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0593')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0563' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0594')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0564' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0595')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0565' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0596')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0566' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0597')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0567' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0598')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0568' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0599')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0569' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0600')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0570' OR (subject_id='V1-ENT-0212' AND relation_type='CREATED' AND object_id='V1-ENT-0601')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0547','WCD10-B08-S002','Biobibliografías: Horacio Quiroga','Biobibliografías: Horacio Quiroga','(页面未署名)','','','','','institutional_bibliography_web_page','','es','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://omeka.parlamento.gub.uy/omeka-s/s/biobibliografias/item/3423'),
('SRC-0548','WCD10-B08-S003','Las sacrificadas de Horacio Quiroga','Las sacrificadas de Horacio Quiroga','(页面未署名)','','','2022','','national_library_article','','es','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://bnm.educacion.gob.ar/las-sacrificadas-de-horacio-quiroga/'),
('SRC-0549','WCD10-B08-S004','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas','Soledad Quereilhac','','','2017','','scholarly_journal_article_fulltext','','es','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.researchgate.net/publication/338897562_Cien_anos_y_algunos_mas_La_publicacion_original_de_los_Cuentos_de_amor_de_locura_y_de_muerte_en_las_revistas_ilustradas_portenas_El_matadero_Revista_critica_de_literatura_argentina_ILA-UBA'),
('SRC-0550','WCD10-B08-S005','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.','Marinela Pionetti','','','2020','','scholarly_journal_article_fulltext','','es','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://latinoamerica.unam.mx/index.php/latino/article/download/57207/50950?inline=1'),
('SRC-0551','WCD10-B08-S006','Las fieras cómplices / S. Fragoso Lima','Las fieras cómplices / S. Fragoso Lima','Biblioteca del Poder Legislativo del Uruguay','','','','','library_catalog_record','','es','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://pmb.parlamento.gub.uy/pmb/opac_css/index.php?id=99504&lvl=notice_display'),
('SRC-0552','WCD10-B08-S007','El folletín como campo de experimentación narrativa: el recurso cinematográfico en El hombre artificial de Horacio Quiroga','El folletín como campo de experimentación narrativa: el recurso cinematográfico en El hombre artificial de Horacio Quiroga','Graciela C. Sarti','','','2010','','scholarly_journal_article_abstract','','es','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://dialnet.unirioja.es/servlet/articulo?codigo=7275271'),
('SRC-0553','WCD10-B08-S009','Poe en Quiroga (full text)','Poe en Quiroga (full text)','Margo Glantz','','Biblioteca Virtual Miguel de Cervantes','2006','','scholarly_article_reprint_fulltext','','es','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.cervantesvirtual.com/obra-visor/poe-en-quiroga-0/html/84982bf9-af23-43b4-85d4-b8a70c27a42e_5.html'),
('SRC-0554','WCD10-B08-S010','La estrategia de la duplicidad en "Miss Dorothy Phillips, mi esposa" de Horacio Quiroga','La estrategia de la duplicidad en "Miss Dorothy Phillips, mi esposa" de Horacio Quiroga','Myriam Lefort','','','2001','','scholarly_journal_article_pdf','','es','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.memoria.fahce.unlp.edu.ar/art_revistas/pr.2869/pr.2869.pdf'),
('SRC-0555','WCD10-B08-S011','Cuentos de la selva: Estudio preliminar','Cuentos de la selva: Estudio preliminar','Alejandro Ferrari','','','','','official_government_scholarly_edition_pdf','','es','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.gub.uy/ministerio-educacion-cultura/sites/ministerio-educacion-cultura/files/documentos/publicaciones/Alejandro%20Ferrari%20-%20Estudio%20preliminar%20Cuentos%20de%20la%20Selva.pdf'),
('SRC-0556','WCD10-B08-S014','Cronología de Horacio Quiroga','Cronología de Horacio Quiroga','Pablo Rocca','','','','','literary_chronology_web_page','','es','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://letras-uruguay.espaciolatino.com/quiroga/cronologia.htm'),
('SRC-0557','WCD10-B08-S015','Trajectories in Argentine children’s literature: Constancio C. Vigil and Horacio Quiroga','Trajectories in Argentine children’s literature: Constancio C. Vigil and Horacio Quiroga','Lauren Rea','','Edinburgh University Press','2019','','university_repository_accepted_manuscript','','es','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://eprints.whiterose.ac.uk/id/eprint/142442/3/Final%20author%20copy.%20Lauren%20Rea%20Trajectories%20in%20Argentine%20Children%27s%20Literature.pdf'),
('SRC-0558','WCD10-B08-S016','Índice: La Novela Semanal - Año II - Núm. 9 - Un peón.pdf','Índice: La Novela Semanal - Año II - Núm. 9 - Un peón.pdf','Horacio Quiroga','','','','','digitized_primary_issue_index','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://es.wikisource.org/wiki/Índice:La_Novela_Semanal_-_Año_II_-_Num._9_-_Un_peón.pdf'),
('SRC-0559','WCD10-B08-S017','El crimen del otro • Horacio Quiroga','El crimen del otro • Horacio Quiroga','Quálea Editorial','','Quálea Editorial','2014','','publisher_catalogue_page','','es','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://qualeaeditorial.wordpress.com/2014/04/18/el-crimen-del-otro-%E2%80%A2-horacio-quiroga/'),
('SRC-0560','WCD10-B08-S018','Los perseguidos','Los perseguidos','Horacio Quiroga (work author); digital page posted by Edu Robsy','','','2022','','digital_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/los-perseguidos/ebook'),
('SRC-0561','WCD10-B08-S019','Historia de un amor turbio','Historia de un amor turbio','Horacio Quiroga (work author); digital page posted by Edu Robsy','','','2017','','digital_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/historia-de-un-amor-turbio/ebook'),
('SRC-0562','WCD10-B08-S020','Pasado amor','Pasado amor','Horacio Quiroga (work author); digital page posted by Edu Robsy','','','2016','','digital_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/pasado-amor/ebook'),
('SRC-0563','WCD10-B08-S021','Anaconda y otros cuentos','Anaconda y otros cuentos','Horacio Quiroga','','','2017','','digital_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/anaconda-y-otros-cuentos'),
('SRC-0564','WCD10-B08-S022','El desierto','El desierto','Biblioteca Pública de las Misiones','','','','','library_repository_record','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://repositorio.bpm.parquedelconocimiento.com/handle/bpm/940'),
('SRC-0565','WCD10-B08-S023','Decálogo del perfecto cuentista','Decálogo del perfecto cuentista','Horacio Quiroga','','','2016','','digital_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/decalogo-del-perfecto-cuentista'),
('SRC-0566','WCD10-B08-S024','El manual del perfecto cuentista','El manual del perfecto cuentista','Horacio Quiroga (work author); digital page posted by Edu Robsy','','','2024','','digital_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/el-manual-del-perfecto-cuentista'),
('SRC-0567','WCD10-B08-S025','El hijo','El hijo','Horacio Quiroga (work author); digital page posted by Edu Robsy','','','2016','','digital_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/el-hijo/ebook'),
('SRC-0568','WCD10-B08-S026','El hombre muerto','El hombre muerto','Horacio Quiroga (work author); digital page posted by Edu Robsy','','','2016','','digital_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/el-hombre-muerto/ebook'),
('SRC-0569','WCD10-B08-S027','El almohadón de pluma','El almohadón de pluma','Horacio Quiroga','','','2016','','digital_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/el-almohadon-de-pluma'),
('SRC-0570','WCD10-B08-S028','A la deriva','A la deriva','Horacio Quiroga (work author); digital page posted by Edu Robsy','','','2016','','digital_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/a-la-deriva/ebook'),
('SRC-0571','WCD10-B08-S029','Una estación de amor','Una estación de amor','Horacio Quiroga (work author); digital page posted by Edu Robsy','','','2016','','digital_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/una-estacion-de-amor/ebook'),
('SRC-0572','WCD10-B08-S030','Los buques suicidantes','Los buques suicidantes','Horacio Quiroga','','','2016','','digital_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/los-buques-suicidantes/ebook'),
('SRC-0573','WCD10-B08-S031','El alambre de púa','El alambre de púa','Horacio Quiroga','','','2016','','digital_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/el-alambre-de-pua'),
('SRC-0574','WCD10-B08-S032','El salvaje y otros cuentos','El salvaje y otros cuentos','Horacio Quiroga','','','2017','','digital_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/el-salvaje-y-otros-cuentos/ebook'),
('SRC-0575','WCD10-B08-S036','Adendas a la bibliografía de Horacio Quiroga','Adendas a la bibliografía de Horacio Quiroga','Alejandro Ferrari','','','2021','','scholarly_journal_article_pdf','','es','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.revistas-filologicas.unam.mx/anEcdotica/index.php/anec/article/view/113'),
('SRC-0576','WCD10-B08-S037','Las sacrificadas: cuento escénico en 4 actos','Las sacrificadas: cuento escénico en 4 actos','Horacio Quiroga','','','','','primary_play_text','','es','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.cervantesvirtual.com/obra-visor/las-sacrificadas-cuento-escenico-en-4-actos-989344/html/f0c24cc4-c737-4c3e-aeff-f88f3580df9f_2.html'),
('SRC-0577','WCD10-B08-S038','Sobre el Arte de Contar Historias','Sobre el Arte de Contar Historias','Horacio Quiroga','','','2017','','digital_primary_text_collection','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/sobre-el-arte-de-contar-historias/ebook'),
('SRC-0578','WCD10-B08-S039','Libro gratis: Más Allá y Otros Cuentos','Libro gratis: Más Allá y Otros Cuentos','Textos.info (compiler not stated)','','','2017','','digital_annotated_collection_page','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/mas-alla-y-otros-cuentos'),
('SRC-0579','WCD10-B08-S040','El salvaje.','El salvaje.','Biblioteca Pública de las Misiones (digitalized item; collection author Horacio Quiroga)','','','','','institutional_repository_catalogue','','es','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://repositorio.bpm.parquedelconocimiento.com/handle/bpm/935'),
('SRC-0580','WCD10-B08-S041','La Gallina Degollada','La Gallina Degollada','Horacio Quiroga (work author); digital page posted by Edu Robsy','','','2016','','digital_primary_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/la-gallina-degollada/ebook'),
('SRC-0581','WCD10-B08-S042','Libro gratis: El Remate Del Imperio Romano','Libro gratis: El Remate Del Imperio Romano','Horacio Quiroga (work author); digital page posted by Brian','','','2026','','digital_primary_text_excerpt','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/el-remate-del-imperio-romano'),
('SRC-0582','WCD10-B08-S043','Un Peón','Un Peón','Horacio Quiroga (work author); digital page posted by Edu Robsy','','','2016','','digital_primary_text','','es','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.textos.info/horacio-quiroga/un-peon/ebook'),
('SRC-0583','WCD10-B08-S103','Ressurreição - 1872','Ressurreição - 1872','Ministério da Educação / Coleção Digital Machado de Assis','','Ministério da Educação','','','government_digital_corpus_work_page','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.mec.gov.br/obra-completa-lista/item/38-ressurreicao'),
('SRC-0584','WCD10-B08-S104','A Mão e a Luva - 1874','A Mão e a Luva - 1874','Ministério da Educação / Coleção Digital Machado de Assis','','Ministério da Educação','','','government_digital_corpus_work_page','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.mec.gov.br/obra-completa-lista/item/37-a-mao-e-a-luva'),
('SRC-0585','WCD10-B08-S105','Helena - 1876','Helena - 1876','Ministério da Educação / Coleção Digital Machado de Assis','','Ministério da Educação','','','government_digital_corpus_work_page','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.mec.gov.br/obra-completa-lista/item/36-helena'),
('SRC-0586','WCD10-B08-S106','História, sistema literário e sociedade na versão folhetinesca de Quincas Borba','História, sistema literário e sociedade na versão folhetinesca de Quincas Borba','Luiz Antonio Silva','','Matraga - Revista do Programa de Pós-Graduação em Letras da UERJ','2008','','scholarly_journal_article_web_page','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.e-publicacoes.uerj.br/matraga/article/view/27893'),
('SRC-0587','WCD10-B08-S107','A política imperial em Quincas Borba: um diálogo entre a história e a literatura','A política imperial em Quincas Borba: um diálogo entre a história e a literatura','Laila Correa e Silva','','Universidade de São Paulo','','','scholarly_journal_article_pdf','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://revistas.usp.br/humanidades/en/article/download/140546/135525/274343'),
('SRC-0588','WCD10-B08-S108','Várias histórias','Várias histórias','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','Biblioteca Brasiliana Guita e José Mindlin, Universidade de São Paulo','','','library_first_edition_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://digital.bbm.usp.br/handle/bbm/5307?locale=en'),
('SRC-0589','WCD10-B08-S109','De Botafogo à Tijuca: sobrevivência e autonomia feminina nas Várias histórias de Machado de Assis','De Botafogo à Tijuca: sobrevivência e autonomia feminina nas Várias histórias de Machado de Assis','Daniele Maria Megid','','SciELO / Machado Assis Linha','2018','','scholarly_journal_article_web_page','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.scielo.br/j/mael/a/WbjJbm7MPz5ZWT7wvhPzywv/?lang=pt'),
('SRC-0590','WCD10-B08-S110','Quincas Borba, o folhetim e o livro: uma análise comparada das versões do romance machadiano','Quincas Borba, o folhetim e o livro: uma análise comparada das versões do romance machadiano','Bruna Canellas de Freitas','','Revista Aproximando / Universidade do Estado do Rio de Janeiro','2018','','scholarly_journal_article_web_page','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.e-publicacoes.uerj.br/aproximando/article/view/89827'),
('SRC-0591','WCD10-B08-S111','1873 — A literatura e a língua por Machado de Assis','1873 — A literatura e a língua por Machado de Assis','Fundação Biblioteca Nacional / Biblioteca Nacional Digital','','Fundação Biblioteca Nacional','','','institutional_digital_exhibition_web_page','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://bndigital.bn.gov.br/dossies/gramaticas-e-dicionarios-do-portugues/linha-do-tempo/sobre-as-efemerides/1873-a-literatura-e-a-lingua-por-machado-de-assis/'),
('SRC-0592','WCD10-B08-S112','Notícia da atual literatura brasileira: Instinto de nacionalidade — Work Data','Notícia da atual literatura brasileira: Instinto de nacionalidade — Work Data','Biblioteca Digital de Literatura de Países Lusófonos / Universidade Federal de Santa Catarina','','Universidade Federal de Santa Catarina','','','university_digital_work_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://literaturabrasileira.ufsc.br/documentos?id=199102&locale=en'),
('SRC-0593','WCD10-B08-S113','Tu, só tu, puro amor','Tu, só tu, puro amor','Machado de Assis; digital transcription in Coleção Digital Machado de Assis','','Nova Aguilar; digitized by Ministério da Educação / Coleção Digital Machado de Assis','1994','','digitized_primary_text_in_1994_edition','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.mec.gov.br/obra-completa-lista/item/download/67_263391b2ba34ee6f7a1f7bf7b63039f2'),
('SRC-0594','WCD10-B08-S114','Casa Velha','Casa Velha','Wikisource contributors; text credited to Machado de Assis','','Wikisource / Wikimedia Foundation','','','community_maintained_primary_text_and_catalog_page','','pt','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://pt.wikisource.org/wiki/Casa_Velha'),
('SRC-0595','WCD10-B08-S115','Não consultes médico','Não consultes médico','Machado de Assis; digitized text in Coleção Digital Machado de Assis','','Nova Aguilar; digitized by Ministério da Educação / Coleção Digital Machado de Assis','1994','','digitized_primary_text_in_1994_edition','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.mec.gov.br/obra-completa-lista/item/download/66_390921fb4791464b4885563dc04a042c'),
('SRC-0596','WCD10-B08-S116','Lição de Botânica','Lição de Botânica','Machado de Assis; digitized text in Coleção Digital Machado de Assis','','Nova Aguilar; digitized by Ministério da Educação / Coleção Digital Machado de Assis','1994','','digitized_primary_text_in_1994_edition','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.mec.gov.br/obra-completa-lista/item/download/65_2b8fb9ad43aa37653a58bc2bd56e33aa'),
('SRC-0597','WCD10-B08-S117','Ressurreição — The Machado de Assis Digital Corpus Project','Ressurreição — The Machado de Assis Digital Corpus Project','The Machado de Assis Digital Corpus Project','','Brigham Young University','','','institutional_digital_corpus_page','','en/pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.byu.edu/text/ressurreicao/'),
('SRC-0598','WCD10-B08-S118','A Mão e a Luva — The Machado de Assis Digital Corpus Project','A Mão e a Luva — The Machado de Assis Digital Corpus Project','The Machado de Assis Digital Corpus Project','','Brigham Young University','','','institutional_digital_corpus_page','','en/pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.byu.edu/text/a-mao-e-a-luva/'),
('SRC-0599','WCD10-B08-S119','Helena — The Machado de Assis Digital Corpus Project','Helena — The Machado de Assis Digital Corpus Project','The Machado de Assis Digital Corpus Project','','Brigham Young University','','','institutional_digital_corpus_page','','en/pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.byu.edu/text/helena/'),
('SRC-0600','WCD10-B08-S120','Iaiá Garcia — The Machado de Assis Digital Corpus Project','Iaiá Garcia — The Machado de Assis Digital Corpus Project','The Machado de Assis Digital Corpus Project','','Brigham Young University','','','institutional_digital_corpus_page','','en/pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.byu.edu/text/iaia-garcia/'),
('SRC-0601','WCD10-B08-S121','Esaú e Jacó — The Machado de Assis Digital Corpus Project','Esaú e Jacó — The Machado de Assis Digital Corpus Project','The Machado de Assis Digital Corpus Project','','Brigham Young University','','','institutional_digital_corpus_page','','en/pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.byu.edu/text/esau-e-jaco/'),
('SRC-0602','WCD10-B08-S122','Memorial de Aires — The Machado de Assis Digital Corpus Project','Memorial de Aires — The Machado de Assis Digital Corpus Project','The Machado de Assis Digital Corpus Project','','Brigham Young University','','','institutional_digital_corpus_page','','en/pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.byu.edu/text/memorial-de-aires/'),
('SRC-0603','WCD10-B08-S123','Memórias Póstumas de Brás Cubas — The Machado de Assis Digital Corpus Project','Memórias Póstumas de Brás Cubas — The Machado de Assis Digital Corpus Project','The Machado de Assis Digital Corpus Project','','Brigham Young University','','','institutional_digital_corpus_work_description_and_text','','en/pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.byu.edu/text/memorias-postumas-de-bras-cubas/'),
('SRC-0604','WCD10-B08-S124','Dom Casmurro — The Machado de Assis Digital Corpus Project','Dom Casmurro — The Machado de Assis Digital Corpus Project','The Machado de Assis Digital Corpus Project','','Brigham Young University','','','institutional_digital_corpus_page','','en/pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.byu.edu/text/dom-casmurro/'),
('SRC-0605','WCD10-B08-S128','Machado de Assis: recortes avulsos','Machado de Assis: recortes avulsos','Germana Maria Araújo Sales','','SciELO / Revista Brasileira de Literatura Comparada','2024','','scholarly_journal_article_web_page','','pt/en','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.scielo.br/j/rblc/a/cF5yxM36X7Q83VKMPSc7TRx/?lang=pt'),
('SRC-0606','WCD10-B08-S131','Chrysalidas : poesias / [Crisálidas : poesias]','Chrysalidas : poesias / [Crisálidas : poesias]','Biblioteca Brasiliana Guita e José Mindlin, Universidade de São Paulo','','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','','institutional_library_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://digital.bbm.usp.br/handle/bbm/4574?locale=en'),
('SRC-0607','WCD10-B08-S132','As temáticas social e política no primeiro livro poético machadiano, Crisálidas','As temáticas social e política no primeiro livro poético machadiano, Crisálidas','Sandro Ponciano dos Santos','','Travessias Interativas','2021','','peer_reviewed_journal_article_page','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://periodicos.ufs.br/Travessias/article/view/17025'),
('SRC-0608','WCD10-B08-S133','Casa velha','Casa velha','Biblioteca Brasiliana Guita e José Mindlin, Universidade de São Paulo','','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','','institutional_library_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://digital.bbm.usp.br/handle/bbm/8878'),
('SRC-0609','WCD10-B08-S134','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis','Aline Sobreira de Oliveira','','Universidade Federal de Minas Gerais','2012','','institutional_masters_dissertation','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://repositorio.ufmg.br/bitstreams/7fc2a1e0-6703-4490-9f45-33483c6d9b76/download'),
('SRC-0610','WCD10-B08-S135','Contos e crônicas','Contos e crônicas','Google Books catalog record; editor listed as Raimundo Magalhães Júnior','','Editôra Civilização Brasileira (book imprint as cataloged)','','','digitized_book_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://books.google.com/books/about/Contos_e_cr%C3%B4nicas.html?id=bBtEAAAAYAAJ'),
('SRC-0611','WCD10-B08-S137','Critica (Machado de Assis, 1910)','Critica (Machado de Assis, 1910)','Wikisource text transcription; entry identifies Mário de Alencar as editor','','Wikisource','','','community_transcribed_text_page','','pt','C','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://pt.wikisource.org/wiki/Critica_(Machado_de_Assis,_1910)'),
('SRC-0612','WCD10-B08-S138','Outras Reliquias : (proza e verso)','Outras Reliquias : (proza e verso)','Biblioteca Brasiliana Guita e José Mindlin, Universidade de São Paulo','','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','','institutional_library_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://digital.bbm.usp.br/handle/bbm/4796'),
('SRC-0613','WCD10-B08-S139','Phalenas [Falenas]','Phalenas [Falenas]','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','','institutional_library_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://digital.bbm.usp.br/handle/bbm/5007'),
('SRC-0614','WCD10-B08-S140','Americanas','Americanas','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','','institutional_library_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://digital.bbm.usp.br/handle/bbm/4508?locale=en'),
('SRC-0615','WCD10-B08-S141','Desencantos','Desencantos','Machado de Assis Digital / Ministério da Educação','','Ministério da Educação','','','digitized_primary_text_pdf','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.mec.gov.br/obra-completa-lista/item/download/72_5fc184858b6f41854692f4482de43255'),
('SRC-0616','WCD10-B08-S142','Quase ministro','Quase ministro','Machado de Assis Digital / Ministério da Educação','','Ministério da Educação','','','digitized_primary_text_pdf','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.mec.gov.br/obra-completa-lista/item/download/70_067aec1ff3277c907e09597f10f92789'),
('SRC-0617','WCD10-B08-S143','Quase ministro: era uma vez um cavalo','Quase ministro: era uma vez um cavalo','Nilton de Paiva Pinto','','Machado de Assis em Linha / SciELO','2021','','peer_reviewed_journal_article','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.scielo.br/j/mael/a/C9MMwFJX3bgCgqSYQwkHPyj/?lang=pt'),
('SRC-0618','WCD10-B08-S144','Os deuses de casaca : comedia','Os deuses de casaca : comedia','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','','institutional_library_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://digital.bbm.usp.br/handle/bbm/4685'),
('SRC-0619','WCD10-B08-S145','Os deuses de casaca','Os deuses de casaca','José Américo Miranda (editor); Nilton de Paiva Pinto (reviser)','','Machadiana Eletrônica / Universidade Federal do Espírito Santo','2022','','critical_edition','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://periodicos.ufes.br/machadiana/article/download/28173/24664/118535'),
('SRC-0620','WCD10-B08-S146','Theatro (v.1) [Teatro]','Theatro (v.1) [Teatro]','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','','institutional_library_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://digital.bbm.usp.br/handle/bbm/5285'),
('SRC-0621','WCD10-B08-S147','Poesias completas','Poesias completas','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','','institutional_library_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://digital.bbm.usp.br/handle/bbm/5229'),
('SRC-0622','WCD10-B08-S148','Papeis avulsos [Papéis avulsos]','Papeis avulsos [Papéis avulsos]','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','','institutional_library_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://digital.bbm.usp.br/handle/bbm/4774?locale=en'),
('SRC-0623','WCD10-B08-S149','Historia sem data [Histórias sem data]','Historia sem data [Histórias sem data]','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','','institutional_library_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://digital.bbm.usp.br/handle/bbm/4741'),
('SRC-0624','WCD10-B08-S150','Paginas recolhidas [Páginas recolhidas]','Paginas recolhidas [Páginas recolhidas]','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','','institutional_library_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://digital.bbm.usp.br/handle/bbm/4785'),
('SRC-0625','WCD10-B08-S152','O alienista','O alienista','BYU Machado de Assis Digital Corpus Project','','BYU Machado de Assis Digital Corpus Project','','','digital_primary_text','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.byu.edu/text/o-alienista/'),
('SRC-0626','WCD10-B08-S153','Teoria do medalhão','Teoria do medalhão','BYU Machado de Assis Digital Corpus Project','','BYU Machado de Assis Digital Corpus Project','','','digital_primary_text','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.byu.edu/text/teoria-do-medalhao/'),
('SRC-0627','WCD10-B08-S154','Casa velha','Casa velha','BYU Machado de Assis Digital Corpus Project','','BYU Machado de Assis Digital Corpus Project','','','digital_primary_text','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://machado.byu.edu/text/casa-velha/'),
('SRC-0628','WCD10-B08-S155','Anotações sobre a correspondência de Machado de Assis','Anotações sobre a correspondência de Machado de Assis','Antonio Dimas','','Machado de Assis em Linha (journal page)','2017','','scholarly_journal_article','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.scielo.br/j/mael/a/8MjVKKfQQGVTBnvz3vMYkFk/?format=html&lang=pt'),
('SRC-0629','WCD10-B08-S156','Diálogos e reflexões de um relojoeiro','Diálogos e reflexões de um relojoeiro','Library of Congress MARC record via Open Library','','Open Library / Library of Congress MARC-derived catalog record','','','library_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://openlibrary.org/books/OL6230789M/Dia%CC%81logos_e_reflexo%CC%83es_de_um_relojoei%CC%81ro'),
('SRC-0630','WCD10-B08-S157','Edição da série de crônicas “A + B”','Edição da série de crônicas “A + B”','Gilson Santos','','Machadiana Eletrônica','2020','','scholarly_journal_article_pdf','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://periodicos.ufes.br/machadiana/article/download/33013/21793/98270'),
('SRC-0631','WCD10-B08-S158','Historias da meia noite','Historias da meia noite','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','Biblioteca Brasiliana Guita e José Mindlin / Universidade de São Paulo','','','institutional_first_edition_catalog_record','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://digital.bbm.usp.br/handle/bbm/4752'),
('SRC-0632','WCD10-B08-S159','Machado de Assis: uma edição crítica de O Alienista com ensaio introdutório: O Alienista, ou do Objeto Inapreensível','Machado de Assis: uma edição crítica de O Alienista com ensaio introdutório: O Alienista, ou do Objeto Inapreensível','Sandra Mara da Silva Franca','','Universidade de São Paulo','2013','','institutional_masters_dissertation_pdf','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://teses.usp.br/teses/disponiveis/8/8149/tde-24012014-111506/publico/2013_SandraMaraDaSilvaFranca.pdf'),
('SRC-0633','WCD10-B08-S202','Tradição impressa de Corpo de Baile','Tradição impressa de Corpo de Baile','Tereza Paula Alves Calzolari','','','','','research_pdf_or_thesis_pdf','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.filologia.org.br/revista/39/11.pdf'),
('SRC-0634','WCD10-B08-S203','João Guimarães Rosa | Biografia','João Guimarães Rosa | Biografia','Academia Brasileira de Letras','','Academia Brasileira de Letras','','','web_page','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://login.academia.org.br/academicos/joao-guimaraes-rosa/biografia'),
('SRC-0635','WCD10-B08-S204','Com o vaqueiro Mariano | Banco de Dados Bibliográfico João Guimarães Rosa','Com o vaqueiro Mariano | Banco de Dados Bibliográfico João Guimarães Rosa','Universidade de São Paulo','','Universidade de São Paulo','','','web_page','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://sgpa.webhostusp.sti.usp.br/obra.php?cod=1164&s=grosa'),
('SRC-0636','WCD10-B08-S205','Magma | Museu Casa Guimarães Rosa','Magma | Museu Casa Guimarães Rosa','Museus Estaduais de Minas Gerais – SECULT','','Museus Estaduais de Minas Gerais – SECULT','','','web_page','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://acervodigital.secult.mg.gov.br/museu-casa-guimaraes-rosa-mcgr/185149-2/'),
('SRC-0637','WCD10-B08-S206','O (en)canto da linguagem rendada: ritmo e sonoridade em Tutameia, de Guimarães Rosa','O (en)canto da linguagem rendada: ritmo e sonoridade em Tutameia, de Guimarães Rosa','Maíra Pinheiro Tavares','','Universidade Federal de Minas Gerais','2024','','research_pdf_or_thesis_pdf','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://repositorio.ufmg.br/bitstreams/4a25b9d5-5545-486d-be90-e548fbda3c66/download'),
('SRC-0638','WCD10-B08-S207','Os sete pecados capitais | Banco de Dados Bibliográfico João Guimarães Rosa','Os sete pecados capitais | Banco de Dados Bibliográfico João Guimarães Rosa','Universidade de São Paulo','','Universidade de São Paulo','','','web_page','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://sgpa.webhostusp.sti.usp.br/obra.php?cod=1165&s=grosa'),
('SRC-0639','WCD10-B08-S209','Corpo de baile, sete novelas | WorldCat','Corpo de baile, sete novelas | WorldCat','OCLC','','OCLC','','','web_page','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://search.worldcat.org/es/title/corpo-de-baile-sete-novelas/oclc/4633331'),
('SRC-0640','WCD10-B08-S210','Com o vaqueiro Mariano | Biblioteca Digital de Literatura de Países Lusófonos','Com o vaqueiro Mariano | Biblioteca Digital de Literatura de Países Lusófonos','Universidade Federal de Santa Catarina','','Universidade Federal de Santa Catarina','','','web_page','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://literaturabrasileira.ufsc.br/index.php/documentos?id=142994'),
('SRC-0641','WCD10-B08-S211','O filho da mãe, de Bernardo Carvalho, e a figuração do amor na escrita patrocinada da coleção Amores Expressos','O filho da mãe, de Bernardo Carvalho, e a figuração do amor na escrita patrocinada da coleção Amores Expressos','Vinícius Ferreira dos Santos','','Universidade Estadual de Londrina','2016','','research_pdf_or_thesis_pdf','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://repositorio.uel.br/bitstreams/32f4300e-ced4-412b-ad78-debdbf5ce30c/download'),
('SRC-0642','WCD10-B08-S212','Estas estórias | Banco de Dados Bibliográfico João Guimarães Rosa','Estas estórias | Banco de Dados Bibliográfico João Guimarães Rosa','Universidade de São Paulo','','Universidade de São Paulo','','','web_page','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://sgpa2024.webhostusp.sti.usp.br/obra.php?cod=619&s=grosa'),
('SRC-0643','WCD10-B08-S215','O Corpo e a palavra: uma leitura de "Campo geral" de J. Guimarães Rosa','O Corpo e a palavra: uma leitura de "Campo geral" de J. Guimarães Rosa','Erich Soares Nogueira','','Pontifícia Universidade Católica de Minas Gerais','2005','','web_page','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://periodicos.pucminas.br/scripta/article/view/14108'),
('SRC-0644','WCD10-B08-S216','A representação da masculinidade no conto "Uma estória de amor", de João Guimarães Rosa','A representação da masculinidade no conto "Uma estória de amor", de João Guimarães Rosa','Franciane Conceição da Silva','','Universidade Federal de Viçosa','2015','','web_page','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.revistajangada.ufv.br/Jangada/article/view/68'),
('SRC-0645','WCD10-B08-S217','O recado do Morro: profecia e redenção','O recado do Morro: profecia e redenção','Ana Paula Pinto','','','2020','','web_page','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://repositorio.ucp.pt/entities/publication/1624f83a-b125-4bef-a992-1006d9711c07'),
('SRC-0646','WCD10-B08-S218','“Cara de Bronze”: uma história em linguagem de cinema ou o místico em Guimarães Rosa','“Cara de Bronze”: uma história em linguagem de cinema ou o místico em Guimarães Rosa','Maria da Glória Sá Rosa','','Universidade Federal da Grande Dourados','2011','','web_page','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://ojs.ufgd.edu.br/Raido/article/view/1357'),
('SRC-0647','WCD10-B08-S219','“Saudades de destino”: forças e corpos fora de regra no "Corpo de baile", de Guimarães Rosa','“Saudades de destino”: forças e corpos fora de regra no "Corpo de baile", de Guimarães Rosa','Danilo Almeida Patrício','','Universidade Federal de Minas Gerais','2014','','web_page','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://periodicos.ufmg.br/index.php/emt/article/view/31898'),
('SRC-0648','WCD10-B08-S220','Dão-Lalalão, a reescrita do desejo','Dão-Lalalão, a reescrita do desejo','Biagio D’ Angelo','','Universidade Federal de Minas Gerais','2006','','web_page','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://periodicos.ufmg.br/index.php/o_eixo_ea_roda/article/view/27933'),
('SRC-0649','WCD10-B08-S221','O mundo que perdeu suas paredes: Lalinha e o belo poço parado em “Buriti” de João Guimarães Rosa','O mundo que perdeu suas paredes: Lalinha e o belo poço parado em “Buriti” de João Guimarães Rosa','Sarah Maria Forte Diogo','','Universidade Federal de Minas Gerais','2011','','web_page','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://periodicos.ufmg.br/index.php/revele/article/view/11269'),
('SRC-0650','WCD10-B08-S222','Primeiras estórias | Acervo Museu da Língua Portuguesa','Primeiras estórias | Acervo Museu da Língua Portuguesa','Centro de Referência do Museu da Língua Portuguesa','','Museu da Língua Portuguesa','','','web_page','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://acervo.museudalinguaportuguesa.org.br/acervos/9054/primeiras-estorias'),
('SRC-0651','WCD10-B08-S223','Guimarães Rosa: Magma e gênese da obra','Guimarães Rosa: Magma e gênese da obra','Fundação Editora UNESP','','Fundação Editora UNESP','','','web_page','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://editoraunesp.com.br/catalogo/9788571393264,guimaraes-rosa'),
('SRC-0652','WCD10-B08-S224','A escrita em conjunto na literatura policial brasileira: um olhar sobre os arquivos de João Condé','A escrita em conjunto na literatura policial brasileira: um olhar sobre os arquivos de João Condé','Taynara Leszczynski; Isabelle Maria Soares','','Universidade do Estado do Rio de Janeiro','2022','','research_pdf','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.e-publicacoes.uerj.br/palimpsesto/article/download/65304/42073/235926'),
('SRC-0653','WCD10-B08-S225','As Configurações da Linguagem Roseana em Ave, Palavra','As Configurações da Linguagem Roseana em Ave, Palavra','Elvira Livonete Costa','','','2018','','research_pdf','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://sistemas.uft.edu.br/periodicos/index.php/portodasletras/article/download/4519/13967/27152'),
('SRC-0654','WCD10-B08-S226','O fantástico em O Mistério de Highmore Hall e Tempo e Destino, os primeiros contos de Guimarães Rosa','O fantástico em O Mistério de Highmore Hall e Tempo e Destino, os primeiros contos de Guimarães Rosa','Luís Eduardo Wexell Machado','','Pontifícia Universidade Católica de São Paulo','2009','','research_pdf','','pt','A','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.pucsp.br/revistafronteiraz/numeros_anteriores/n3/download/pdf/grosa.pdf'),
('SRC-0655','WCD10-B08-S227','Personagens universais','Personagens universais','Ana Maria Machado','','Academia Brasileira de Letras','2006','','institutional_article','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.academia.org.br/artigos/personagens-universais'),
('SRC-0656','WCD10-B08-S228','Sagarana: resumo da obra de João Guimarães Rosa','Sagarana: resumo da obra de João Guimarães Rosa','Daniela Diana','','Toda Matéria','','','educational_literary_article','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://www.todamateria.com.br/sagarana/'),
('SRC-0657','WCD10-B08-S229','Catálogo Haroldo Maranhão, p. 90','Catálogo Haroldo Maranhão, p. 90','Fundação Cultural do Pará','','Fundação Cultural do Pará','','','web_page','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://obrasraras.fcp.pa.gov.br/publication/file/catalogos/catalogo-haroldo-maranhao/90/'),
('SRC-0658','WCD10-B08-S230','Pequena Bibliografia de João Guimarães Rosa','Pequena Bibliografia de João Guimarães Rosa','Lenira Marques Covizzi; Iná Valéria Rodrigues Verlangieri','','Universidade de São Paulo, Instituto de Estudos Brasileiros','1996','','research_article','','pt','B','access_pass','WCD-10-B08','Merged research candidate only; no Curation admission or public release.','remote_only','','https://es.scribd.com/doc/260404476/Bibliografia-Sobre-GUimaraes');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0511','collection','《珊瑚礁》','Los arrecifes de coral','candidate','1','WCD10-B08-W001','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0512','collection','《他者的罪行》','El crimen del otro','candidate','1','WCD10-B08-W002','基罗加早期重要故事集；书目身份/年份由官方书目确认，直接学术讨论仅限同名标题篇。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0513','work','《被追逐者》','Los perseguidos','candidate','1','WCD10-B08-W003','重要早期叙事作品；处理1905（机构书目列年）与1908（年表所记发表）时，明确采用已核发表层。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0514','work','《一段阴郁的爱情》','Historia de un amor turbio','candidate','1','WCD10-B08-W004','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0515','collection','《野蛮人》','El salvaje','candidate','1','WCD10-B08-W005','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0516','work','《牺牲者》','Las sacrificadas','candidate','1','WCD10-B08-W006','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0517','collection','《水蚺》','Anaconda','candidate','1','WCD10-B08-W007','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0518','collection','《荒漠》','El desierto','candidate','1','WCD10-B08-W008','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0519','collection','《被斩首的母鸡及其他故事》','La gallina degollada y otros cuentos','candidate','1','WCD10-B08-W009','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0520','work','《往日之爱》','Pasado amor','candidate','1','WCD10-B08-W010','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0521','work','《故土》','Suelo natal','candidate','1','WCD10-B08-W011','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0522','collection','《彼岸》','Más allá','candidate','1','WCD10-B08-W012','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0523','work','《完美短篇小说家的十诫》','Decálogo del perfecto cuentista','candidate','1','WCD10-B08-W013','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0524','work','《完美短篇小说家手册》','El manual del perfecto cuentista','candidate','1','WCD10-B08-W014','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0525','work','《完美短篇小说家的技巧》','Los trucos del perfecto cuentista','candidate','1','WCD10-B08-W015','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0526','work','《羽毛枕》','El almohadón de plumas','candidate','1','WCD10-B08-W016','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0527','work','《被斩首的母鸡》','La gallina degollada','candidate','1','WCD10-B08-W017','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0528','work','《一段恋情》','Una estación de amor','candidate','1','WCD10-B08-W018','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0529','work','《随波漂流》','A la deriva','candidate','1','WCD10-B08-W019','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0530','work','《死去的人》','El hombre muerto','candidate','1','WCD10-B08-W020','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0531','work','《多萝西·菲利普斯小姐，我的妻子》','Miss Dorothy Phillips, mi esposa','candidate','1','WCD10-B08-W021','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0532','work','《儿子》','El hijo','candidate','1','WCD10-B08-W022','将1928年《El padre》单篇初刊与1935年《Más allá》中的改题/结集层分开记录。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0533','work','《共谋的野兽》','Las fieras cómplices','candidate','1','WCD10-B08-W023','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0534','work','《杀人的猴子》','El mono que asesinó','candidate','1','WCD10-B08-W024','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0535','work','《人造人》','El hombre artificial','candidate','1','WCD10-B08-W025','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0536','work','《食人者》','El devorador de hombres','candidate','1','WCD10-B08-W026','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0537','work','《罗马帝国的拍卖》','El remate del imperio romano','candidate','1','WCD10-B08-W028','重要书目/单篇作品，经官方书目、原始连载记录或直接研究核对；不将版本/合集/单篇边界合并。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0538','work','《自杀的船只》','Los buques suicidantes','candidate','1','WCD10-B08-W029','Quereilhac的2017年学术论文明确列出该故事初刊及收集层级；作为具有独立发表史的代表性单篇纳入，不与后来的故事集重复。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0539','work','《中暑》','La insolación','candidate','1','WCD10-B08-W030','Quereilhac的2017年学术论文明确列出该故事初刊及收集层级；作为具有独立发表史的代表性单篇纳入，不与后来的故事集重复。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0540','work','《野蜜》','La miel silvestre','candidate','1','WCD10-B08-W031','Quereilhac的2017年学术论文明确列出该故事初刊及收集层级；作为具有独立发表史的代表性单篇纳入，不与后来的故事集重复。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0541','work','《铁丝网》','El alambre de púa','candidate','1','WCD10-B08-W032','Quereilhac的2017年学术论文明确列出该故事初刊及收集层级；作为具有独立发表史的代表性单篇纳入，不与后来的故事集重复。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0542','work','《一个雇工》','Un peón','candidate','1','WCD10-B08-W033','以原刊期号和作者目录直接确认首发、署名；情节来自实际阅读的研究导读。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0543','collection','《猎人的书信》','Cartas de un cazador','candidate','1','WCD10-B08-W034','Ferrari研究导读直接列题名、十篇、Dum-Dum叙述结构与连载年份；Rea独立核对1922/1924的分刊层。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0544','collection','《我们动物的生活》','De la vida de nuestros animales','candidate','1','WCD10-B08-W035','Ferrari明确给出34篇、三种刊名、1922–1925和逝后结集信息；Rea另提到1924与1925年刊于Caras y Caretas、题为De la vida de nuestros animales的短札，不将Rea扩读为篇数或精确月段。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0545','work','《一封情书》','Una carta de amor','candidate','1','WCD10-B08-W036','Ferrari在直接阅读的学术论文中将其确认为未见既有目录和叙事文集收录的短篇，并给出1917年原刊记录及具体情节；作为被研究者发现并建议补入完整作品目录的短篇纳入。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0546','work','《一次狩猎》','Una cacería','candidate','1','WCD10-B08-W037','Ferrari在直接阅读的学术论文中确认这篇短篇未见既有目录或叙事文集，给出《Mundo Argentino》原刊期号和日期，并具体分析其与《Las fieras cómplices》的关联及文明/丛林冲突，故纳入目录。; 中文为检索/展示工作译名，西班牙语原题为身份锚点；不声称存在正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0547','work','《复活》','Ressurreição','candidate','1','WCD10-B08-W101','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0548','work','《手与手套》','A mão e a luva','candidate','1','WCD10-B08-W102','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0549','work','《海伦娜》','Helena','candidate','1','WCD10-B08-W103','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0550','work','《雅雅·加西亚》','Iaiá Garcia','candidate','1','WCD10-B08-W104','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0551','work','《旧宅》','Casa velha','candidate','1','WCD10-B08-W105','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0552','work','《以扫与雅各》','Esaú e Jacó','candidate','1','WCD10-B08-W106','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0553','work','《艾尔斯纪事》','Memorial de Aires','candidate','1','WCD10-B08-W107','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0554','collection','《里约故事集》','Contos fluminenses','candidate','1','WCD10-B08-W108','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0555','collection','《午夜故事》','Histórias da meia-noite','candidate','1','WCD10-B08-W109','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0556','collection','《散篇》','Papéis avulsos','candidate','1','WCD10-B08-W110','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0557','collection','《无日期的故事》','Histórias sem data','candidate','1','WCD10-B08-W111','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0558','collection','《各种故事》','Várias histórias','candidate','1','WCD10-B08-W112','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0559','collection','《拾零集》','Páginas recolhidas','candidate','1','WCD10-B08-W113','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0560','collection','《旧宅遗珍》','Relíquias de casa velha','candidate','1','WCD10-B08-W114','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0561','collection','《蛹》','Crisálidas','candidate','1','WCD10-B08-W115','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0562','collection','《夜蛾》','Falenas','candidate','1','WCD10-B08-W116','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0563','collection','《美洲诗篇》','Americanas','candidate','1','WCD10-B08-W117','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0564','collection','《诗歌全集》','Poesias completas','candidate','1','WCD10-B08-W118','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0565','collection','《戏剧集》','Teatro','candidate','1','WCD10-B08-W119','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0566','work','《幻灭》','Desencantos','candidate','1','WCD10-B08-W120','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0567','work','《差点当上部长》','Quase ministro','candidate','1','WCD10-B08-W121','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0568','work','《穿礼服的众神》','Os deuses de casaca','candidate','1','WCD10-B08-W122','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0569','work','《唯有你，纯真的爱》','Tu, só tu, puro amor','candidate','1','WCD10-B08-W123','ABL官方书目/传记与核对过的机构或原作来源表明这是马查多独立作品或有明确编选身份的合辑。保留单篇、合辑、演出和书版层级；不扩展为章节、译本或改编对象。; 中文仅为可读性工作译名，原葡萄牙语题名作为身份锚点；不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0570','work','《巴西当代文学概述：民族性本能》','Notícia da atual literatura brasileira: Instinto de nacionalidade','candidate','1','WCD10-B08-W124','国家图书馆数字专题及 UFSC 文学数字图书馆直接标明该文为 Machado de Assis 作品，发表于 1873 年《O Novo Mundo》；以独立批评文章对象登记，不误作同名现代研究文章。; 中文为可读性工作译名；原葡萄牙语题名作为身份锚点，不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0571','work','《植物学课》','Lição de Botânica','candidate','1','WCD10-B08-W125','MEC数字化原作直接给出题名、单幕戏剧结构及1906年收入 Relíquias de Casa Velha；按独立戏剧文本登记，不与合集混同。; 原葡语题名为身份锚点；中文为工作译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0572','work','《不要请医生》','Não consultes médico','candidate','1','WCD10-B08-W126','MEC数字化原作直接给出题名、人物/场景结构和1899年初次收入 Páginas Recolhidas 的说明；按独立戏剧文本登记，不与合辑本身混同。; 原葡语题名为身份锚点；中文为工作译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0573','work','《散篇故事》','Contos esparsos','candidate','1','WCD10-B08-W127','后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0574','work','《遗忘的故事》','Contos esquecidos','candidate','1','WCD10-B08-W128','后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0575','work','《辑录故事》','Contos recolhidos','candidate','1','WCD10-B08-W129','后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0576','work','《零篇故事》','Contos avulsos','candidate','1','WCD10-B08-W130','后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0577','work','《无日期故事》','Contos sem data','candidate','1','WCD10-B08-W131','后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0578','work','《短篇与编年文》','Contos e crônicas','candidate','1','WCD10-B08-W132','后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0579','work','《马查多·德·阿西斯奇幻故事集》','Contos fantásticos de Machado de Assis','candidate','1','WCD10-B08-W133','后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0580','work','《批评文集》','Crítica','candidate','1','WCD10-B08-W134','后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0581','work','《其他遗珍》','Outras relíquias','candidate','1','WCD10-B08-W135','后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0582','work','《马查多·德·阿西斯书信集》','Correspondência de Machado de Assis','candidate','1','WCD10-B08-W136','后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0583','work','《钟表匠的对话与随想》','Diálogos e reflexões de um relojoeiro','candidate','1','WCD10-B08-W137','后世编者从 Machado de Assis 已发表或遗留的写作中选编该题名合集；候选表示其中归属于作者的文本，不将编者选编行为归给 Machado。题名、版本年、体裁与具体篇目均按直接打开的目录/学术研究限定。; 原葡萄牙语题名作为身份锚点；中文为可读性工作译名，不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0584','work','《精神病医师》','O Alienista','candidate','1','WCD10-B08-W138','该短篇在1881–1882年报刊连载，后收入《Papéis avulsos》；本候选单列代表性独立故事文本，不与1882年合集对象W110混为同一对象。USP论文的明确类型判断为conto，同时保留类型争议。; 原葡语题名为身份锚点；中文工作译名不主张已有正式中译本题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0585','collection','《舞之躯》','Corpo de Baile','candidate','1','WCD10-B08-W201','重大遗漏。该对象是1956年原始合卷/循环作品；后来的三个自主卷本及七篇内部叙事另行在谱系中区分。; 中文为工作显示译名；保留原文题名作为身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0586','work','《与牧牛人马里亚诺同行》','Com o vaqueiro Mariano','candidate','1','WCD10-B08-W202','ABL书目列为1952年作品；单独小书对象不同于1947报刊分篇，也不同于1969遗作集中的再收录。; 中文为工作显示译名；保留原文题名作为身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0587','collection','《简言》（《第三故事》）','Tutameia (Terceiras estórias)','candidate','1','WCD10-B08-W203','按ABL书目原样记录双重题名为一个对象；避免把Tutameia与Terceiras estórias拆成两个作品。; 中文为工作显示译名；保留原文题名作为身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0588','collection','《这些故事》','Estas estórias','candidate','1','WCD10-B08-W204','ABL列为1969年故事集，机构书目页给出首版与目录；与内含的Com o vaqueiro Mariano篇目区分，不将其重复并入集对象事实。; 中文为工作显示译名；保留原文题名作为身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0589','collection','《鸟啊，词语》','Ave, Palavra','candidate','1','WCD10-B08-W205','ABL列出1970年题名并以diversos标注文类；目前不另增其内部篇目或子类。; 中文为工作显示译名；保留原文题名作为身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0590','collection','《岩浆》','Magma','candidate','1','WCD10-B08-W206','作品创作/获奖时间不能替代首次公开出版年；采用博物馆实物登记的1997书版年份。; 中文为工作显示译名；保留原文题名作为身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0591','work','《MMM之谜》','O mistério dos MMM','candidate','1','WCD10-B08-W207','首发年份采用Covizzi与Verlangieri书目所载1961年10–12月《O Cruzeiro》连载；该书目另列1962年O Cruzeiro书本版，ABL及帕拉州基金会馆藏目录也支持1962书版。S224称1964年在《O Cruzeiro》连载、后来又出书；此说与1961年连载、1962年书版冲突，作为相反来源说法保留。; 中文为工作显示译名；保留原文题名作为身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0592','collection','《七宗罪》','Os sete pecados capitais','candidate','1','WCD10-B08-W208','ABL列为合作作品；USP题录确认七位作者、Rosa合作者身份和具体篇目。; 中文为工作显示译名；保留原文题名作为身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0593','work','《原野》','Campo Geral','candidate','1','WCD10-B08-W209','初版已作为《Corpo de Baile》内独立命名的叙事篇目；这是文本层候选，不是单行书的版次复制。; 中文为工作显示译名；保留原文题名作为身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0594','work','《一个爱情故事》','Uma estória de amor','candidate','1','WCD10-B08-W210','初版已作为《Corpo de Baile》内独立命名的叙事篇目；这是文本层候选，不是单行书的版次复制。; 中文为工作显示译名；保留原文题名作为身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0595','work','《莱利奥与莉娜的故事》','A estória de Lélio e Lina','candidate','1','WCD10-B08-W211','初版已作为《Corpo de Baile》内独立命名的叙事篇目；这是文本层候选，不是单行书的版次复制。; 中文为工作显示译名；保留原文题名作为身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0596','work','《山上传来的消息》','O Recado do Morro','candidate','1','WCD10-B08-W212','初版已作为《Corpo de Baile》内独立命名的叙事篇目；这是文本层候选，不是单行书的版次复制。; 中文为工作显示译名；保留原文题名作为身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0597','work','《拉奥-达拉朗》','Lão-Dalalão (Dão-Lalalão)','candidate','1','WCD10-B08-W213','初版已作为《Corpo de Baile》内独立命名的叙事篇目；这是文本层候选，不是单行书的版次复制。; 中文为工作显示译名；保留原文题名作为身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0598','work','《青铜面孔》','Cara-de-Bronze','candidate','1','WCD10-B08-W214','初版已作为《Corpo de Baile》内独立命名的叙事篇目；这是文本层候选，不是单行书的版次复制。; 中文为工作显示译名；保留原文题名作为身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0599','work','《布里蒂棕榈》','Buriti','candidate','1','WCD10-B08-W215','初版已作为《Corpo de Baile》内独立命名的叙事篇目；这是文本层候选，不是单行书的版次复制。; 中文为工作显示译名；保留原文题名作为身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0600','work','《Highmore Hall之谜》','O mistério de Highmore Hall','candidate','1','WCD10-B08-W216','重要的早期报刊短篇。ABL biography列其1929年O Cruzeiro发表；直接打开的学术论文给出具体刊期、情节和幻想/哥特体裁讨论。此处建文本对象，不另将2011选集或期刊当作Rosa单著作品。; 暂译工作显示名；保留原文题名，未主张正式中文译本。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0601','work','《时间与命运》','Chronos kai Anagke (Tempo e Destino)','candidate','1','WCD10-B08-W217','1930年在《O Cruzeiro》刊出的早期独立短篇。S226直接给出初刊日期及完整情节分析；按短篇文本对象登记，不与后出汇编或杂集重复。; 中文为工作显示译名；保留文中罗马字题名变体作身份锚点，不主张已有正式中译本。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0507','WCD10-B08-W001','WCD-10-B08','WCD10-B08-W001','V1-ENT-0511','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0508','WCD10-B08-W002','WCD-10-B08','WCD10-B08-W002','V1-ENT-0512','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0509','WCD10-B08-W003','WCD-10-B08','WCD10-B08-W003','V1-ENT-0513','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0510','WCD10-B08-W004','WCD-10-B08','WCD10-B08-W004','V1-ENT-0514','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0511','WCD10-B08-W005','WCD-10-B08','WCD10-B08-W005','V1-ENT-0515','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0512','WCD10-B08-W006','WCD-10-B08','WCD10-B08-W006','V1-ENT-0516','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0513','WCD10-B08-W007','WCD-10-B08','WCD10-B08-W007','V1-ENT-0517','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0514','WCD10-B08-W008','WCD-10-B08','WCD10-B08-W008','V1-ENT-0518','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0515','WCD10-B08-W009','WCD-10-B08','WCD10-B08-W009','V1-ENT-0519','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0516','WCD10-B08-W010','WCD-10-B08','WCD10-B08-W010','V1-ENT-0520','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0517','WCD10-B08-W011','WCD-10-B08','WCD10-B08-W011','V1-ENT-0521','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0518','WCD10-B08-W012','WCD-10-B08','WCD10-B08-W012','V1-ENT-0522','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0519','WCD10-B08-W013','WCD-10-B08','WCD10-B08-W013','V1-ENT-0523','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0520','WCD10-B08-W014','WCD-10-B08','WCD10-B08-W014','V1-ENT-0524','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0521','WCD10-B08-W015','WCD-10-B08','WCD10-B08-W015','V1-ENT-0525','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0522','WCD10-B08-W016','WCD-10-B08','WCD10-B08-W016','V1-ENT-0526','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0523','WCD10-B08-W017','WCD-10-B08','WCD10-B08-W017','V1-ENT-0527','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0524','WCD10-B08-W018','WCD-10-B08','WCD10-B08-W018','V1-ENT-0528','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0525','WCD10-B08-W019','WCD-10-B08','WCD10-B08-W019','V1-ENT-0529','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0526','WCD10-B08-W020','WCD-10-B08','WCD10-B08-W020','V1-ENT-0530','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0527','WCD10-B08-W021','WCD-10-B08','WCD10-B08-W021','V1-ENT-0531','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0528','WCD10-B08-W022','WCD-10-B08','WCD10-B08-W022','V1-ENT-0532','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0529','WCD10-B08-W023','WCD-10-B08','WCD10-B08-W023','V1-ENT-0533','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0530','WCD10-B08-W024','WCD-10-B08','WCD10-B08-W024','V1-ENT-0534','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0531','WCD10-B08-W025','WCD-10-B08','WCD10-B08-W025','V1-ENT-0535','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0532','WCD10-B08-W026','WCD-10-B08','WCD10-B08-W026','V1-ENT-0536','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0533','WCD10-B08-W028','WCD-10-B08','WCD10-B08-W028','V1-ENT-0537','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0534','WCD10-B08-W029','WCD-10-B08','WCD10-B08-W029','V1-ENT-0538','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0535','WCD10-B08-W030','WCD-10-B08','WCD10-B08-W030','V1-ENT-0539','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0536','WCD10-B08-W031','WCD-10-B08','WCD10-B08-W031','V1-ENT-0540','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0537','WCD10-B08-W032','WCD-10-B08','WCD10-B08-W032','V1-ENT-0541','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0538','WCD10-B08-W033','WCD-10-B08','WCD10-B08-W033','V1-ENT-0542','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0539','WCD10-B08-W034','WCD-10-B08','WCD10-B08-W034','V1-ENT-0543','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0540','WCD10-B08-W035','WCD-10-B08','WCD10-B08-W035','V1-ENT-0544','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0541','WCD10-B08-W036','WCD-10-B08','WCD10-B08-W036','V1-ENT-0545','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0542','WCD10-B08-W037','WCD-10-B08','WCD10-B08-W037','V1-ENT-0546','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0543','WCD10-B08-W101','WCD-10-B08','WCD10-B08-W101','V1-ENT-0547','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0544','WCD10-B08-W102','WCD-10-B08','WCD10-B08-W102','V1-ENT-0548','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0545','WCD10-B08-W103','WCD-10-B08','WCD10-B08-W103','V1-ENT-0549','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0546','WCD10-B08-W104','WCD-10-B08','WCD10-B08-W104','V1-ENT-0550','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0547','WCD10-B08-W105','WCD-10-B08','WCD10-B08-W105','V1-ENT-0551','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0548','WCD10-B08-W106','WCD-10-B08','WCD10-B08-W106','V1-ENT-0552','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0549','WCD10-B08-W107','WCD-10-B08','WCD10-B08-W107','V1-ENT-0553','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0550','WCD10-B08-W108','WCD-10-B08','WCD10-B08-W108','V1-ENT-0554','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0551','WCD10-B08-W109','WCD-10-B08','WCD10-B08-W109','V1-ENT-0555','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0552','WCD10-B08-W110','WCD-10-B08','WCD10-B08-W110','V1-ENT-0556','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0553','WCD10-B08-W111','WCD-10-B08','WCD10-B08-W111','V1-ENT-0557','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0554','WCD10-B08-W112','WCD-10-B08','WCD10-B08-W112','V1-ENT-0558','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0555','WCD10-B08-W113','WCD-10-B08','WCD10-B08-W113','V1-ENT-0559','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0556','WCD10-B08-W114','WCD-10-B08','WCD10-B08-W114','V1-ENT-0560','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0557','WCD10-B08-W115','WCD-10-B08','WCD10-B08-W115','V1-ENT-0561','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0558','WCD10-B08-W116','WCD-10-B08','WCD10-B08-W116','V1-ENT-0562','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0559','WCD10-B08-W117','WCD-10-B08','WCD10-B08-W117','V1-ENT-0563','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0560','WCD10-B08-W118','WCD-10-B08','WCD10-B08-W118','V1-ENT-0564','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0561','WCD10-B08-W119','WCD-10-B08','WCD10-B08-W119','V1-ENT-0565','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0562','WCD10-B08-W120','WCD-10-B08','WCD10-B08-W120','V1-ENT-0566','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0563','WCD10-B08-W121','WCD-10-B08','WCD10-B08-W121','V1-ENT-0567','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0564','WCD10-B08-W122','WCD-10-B08','WCD10-B08-W122','V1-ENT-0568','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0565','WCD10-B08-W123','WCD-10-B08','WCD10-B08-W123','V1-ENT-0569','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0566','WCD10-B08-W124','WCD-10-B08','WCD10-B08-W124','V1-ENT-0570','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0567','WCD10-B08-W125','WCD-10-B08','WCD10-B08-W125','V1-ENT-0571','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0568','WCD10-B08-W126','WCD-10-B08','WCD10-B08-W126','V1-ENT-0572','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0569','WCD10-B08-W127','WCD-10-B08','WCD10-B08-W127','V1-ENT-0573','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0570','WCD10-B08-W128','WCD-10-B08','WCD10-B08-W128','V1-ENT-0574','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0571','WCD10-B08-W129','WCD-10-B08','WCD10-B08-W129','V1-ENT-0575','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0572','WCD10-B08-W130','WCD-10-B08','WCD10-B08-W130','V1-ENT-0576','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0573','WCD10-B08-W131','WCD-10-B08','WCD10-B08-W131','V1-ENT-0577','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0574','WCD10-B08-W132','WCD-10-B08','WCD10-B08-W132','V1-ENT-0578','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0575','WCD10-B08-W133','WCD-10-B08','WCD10-B08-W133','V1-ENT-0579','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0576','WCD10-B08-W134','WCD-10-B08','WCD10-B08-W134','V1-ENT-0580','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0577','WCD10-B08-W135','WCD-10-B08','WCD10-B08-W135','V1-ENT-0581','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0578','WCD10-B08-W136','WCD-10-B08','WCD10-B08-W136','V1-ENT-0582','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0579','WCD10-B08-W137','WCD-10-B08','WCD10-B08-W137','V1-ENT-0583','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0580','WCD10-B08-W138','WCD-10-B08','WCD10-B08-W138','V1-ENT-0584','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0581','WCD10-B08-W201','WCD-10-B08','WCD10-B08-W201','V1-ENT-0585','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0582','WCD10-B08-W202','WCD-10-B08','WCD10-B08-W202','V1-ENT-0586','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0583','WCD10-B08-W203','WCD-10-B08','WCD10-B08-W203','V1-ENT-0587','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0584','WCD10-B08-W204','WCD-10-B08','WCD10-B08-W204','V1-ENT-0588','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0585','WCD10-B08-W205','WCD-10-B08','WCD10-B08-W205','V1-ENT-0589','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0586','WCD10-B08-W206','WCD-10-B08','WCD10-B08-W206','V1-ENT-0590','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0587','WCD10-B08-W207','WCD-10-B08','WCD10-B08-W207','V1-ENT-0591','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0588','WCD10-B08-W208','WCD-10-B08','WCD10-B08-W208','V1-ENT-0592','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0589','WCD10-B08-W209','WCD-10-B08','WCD10-B08-W209','V1-ENT-0593','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0590','WCD10-B08-W210','WCD-10-B08','WCD10-B08-W210','V1-ENT-0594','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0591','WCD10-B08-W211','WCD-10-B08','WCD10-B08-W211','V1-ENT-0595','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0592','WCD10-B08-W212','WCD-10-B08','WCD10-B08-W212','V1-ENT-0596','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0593','WCD10-B08-W213','WCD-10-B08','WCD10-B08-W213','V1-ENT-0597','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0594','WCD10-B08-W214','WCD-10-B08','WCD10-B08-W214','V1-ENT-0598','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0595','WCD10-B08-W215','WCD-10-B08','WCD10-B08-W215','V1-ENT-0599','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0596','WCD10-B08-W216','WCD-10-B08','WCD10-B08-W216','V1-ENT-0600','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0597','WCD10-B08-W217','WCD-10-B08','WCD10-B08-W217','V1-ENT-0601','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0444','WCD-10-B08:V1-ENT-0511','V1-ENT-0511','collection','《珊瑚礁》','奥拉西奥·基罗加','Los arrecifes de coral','乌拉圭','es','1901','诗、散文与故事混合的作品集','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《珊瑚礁》｜Los arrecifes de coral

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1901
- genre_or_form：诗、散文与故事混合的作品集
- one_sentence_summary：据MEC国家文学学院与议会书目，该书把诗歌、散文和故事并置；文本页可见其诗作目录，因此作为混合体裁的早期作品集描述，不把它缩成单一诗集。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0445','WCD-10-B08:V1-ENT-0512','V1-ENT-0512','collection','《他者的罪行》','奥拉西奥·基罗加','El crimen del otro','乌拉圭','es','1904','短篇小说集','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《他者的罪行》｜El crimen del otro

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1904
- genre_or_form：短篇小说集
- one_sentence_summary：据Quálea出版社的书介，该集收入多篇早期小说；标题篇重写坡《告密的心》的犯罪叙述，书介将全书置于怪异、疯狂及死亡主题的早期创作语境。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0446','WCD-10-B08:V1-ENT-0513','V1-ENT-0513','work','《被追逐者》','奥拉西奥·基罗加','Los perseguidos','乌拉圭','es','1908','中篇小说（nouvelle；亦称长篇故事）','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《被追逐者》｜Los perseguidos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1908
- genre_or_form：中篇小说（nouvelle；亦称长篇故事）
- one_sentence_summary：据原文，一名小说家在卢戈内斯家中初见卢卡斯·迪亚斯·贝莱斯；迪亚斯讲述自己在伤寒后曾被害妄想困扰，卢戈内斯随后揭示“被追捕者”其实就是迪亚斯本人，叙述者也开始疑心自己是否已被他算计。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0447','WCD-10-B08:V1-ENT-0514','V1-ENT-0514','work','《一段阴郁的爱情》','奥拉西奥·基罗加','Historia de un amor turbio','乌拉圭','es','1908','中篇小说（novela corta）','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《一段阴郁的爱情》｜Historia de un amor turbio

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1908
- genre_or_form：中篇小说（novela corta）
- one_sentence_summary：据小说原文，青年Rohán与姐妹Mercedes、Eglé先后发生情感纠葛；故事以多年后返回故地的重逢展开，关系在旧情、嫉妒与欲望间反复转折。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0448','WCD-10-B08:V1-ENT-0515','V1-ENT-0515','collection','《野蛮人》','奥拉西奥·基罗加','El salvaje','乌拉圭','es','1920','短篇小说集','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《野蛮人》｜El salvaje

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1920
- genre_or_form：短篇小说集
- one_sentence_summary：米西奥内斯公共图书馆所藏扫描本目录标注为1926年，目录列有标题篇及《El sueño》《La realidad》等；作品出版年1920另据S001，不能由1926馆藏目录推定1920初版目录。后编数字选本的标题篇中，瓜伊拉一名建有气象站的当地居民向到访者讲述曾与肉食性“nothosaurio”相伴。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0449','WCD-10-B08:V1-ENT-0516','V1-ENT-0516','work','《牺牲者》','奥拉西奥·基罗加','Las sacrificadas','乌拉圭','es','1920','四幕戏剧（cuento escénico）','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《牺牲者》｜Las sacrificadas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1920
- genre_or_form：四幕戏剧（cuento escénico）
- one_sentence_summary：Octavio Nébel是到家乡度假的医学生；四幕戏以他与十五岁的Lidia相恋为中心，人物表和开场对话还引出Lidia的寡母Julia。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0450','WCD-10-B08:V1-ENT-0517','V1-ENT-0517','collection','《水蚺》','奥拉西奥·基罗加','Anaconda','乌拉圭','es','1921','短篇小说集','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《水蚺》｜Anaconda

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1921
- genre_or_form：短篇小说集
- one_sentence_summary：据文本页的标题篇内容，水蚺在森林遭人类侵入后召集蛇类开会，讨论怎样应对人类威胁；1921年同名卷与后来增补选本须区分。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0451','WCD-10-B08:V1-ENT-0518','V1-ENT-0518','collection','《荒漠》','奥拉西奥·基罗加','El desierto','乌拉圭','es','1924','短篇小说集','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《荒漠》｜El desierto

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1924
- genre_or_form：短篇小说集
- one_sentence_summary：馆藏记录所载简介明确转引Lecturalia；该简介称标题篇写丧偶的Subercasaux独自照料两个孩子，脚伤感染后仍外出寻找帮工。原版扫描目录另列十一篇；这十一篇数来自目录，不把简介误作馆藏机构原创，也不据后编材料补写初版目录。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0452','WCD-10-B08:V1-ENT-0519','V1-ENT-0519','collection','《被斩首的母鸡及其他故事》','奥拉西奥·基罗加','La gallina degollada y otros cuentos','乌拉圭','es','1925','短篇小说集','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《被斩首的母鸡及其他故事》｜La gallina degollada y otros cuentos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1925
- genre_or_form：短篇小说集
- one_sentence_summary：据馆藏书目，1925年选集以《La gallina degollada》为题；原篇写Mazzini与Berta四个儿子因病障而被遗弃，夫妻将期望寄托于幼女Bertita，四兄弟目睹厨房杀鸡后模仿暴力并杀死妹妹。该原篇情节不被推作其余选篇目录。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0453','WCD-10-B08:V1-ENT-0520','V1-ENT-0520','work','《往日之爱》','奥拉西奥·基罗加','Pasado amor','乌拉圭','es','1929','中篇小说（novela corta）','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《往日之爱》｜Pasado amor

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1929
- genre_or_form：中篇小说（novela corta）
- one_sentence_summary：据直接阅读的小说，Morán离开两年后回到米西奥内斯，重新与Iñíguez家来往并被已长成的Magdalena吸引；他在农业、丛林和情感关系中重返旧生活，结尾因无法承受命运安排而离开。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0454','WCD-10-B08:V1-ENT-0521','V1-ENT-0521','work','《故土》','奥拉西奥·基罗加','Suelo natal','乌拉圭','es','1931','学校读本（与Leonardo Glusberg合著）','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《故土》｜Suelo natal

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1931
- genre_or_form：学校读本（与Leonardo Glusberg合著）
- one_sentence_summary：据Rea的研究，该校用读本含新写文本、《丛林故事》部分故事及动物短札；它依学校道德与教学规范编排，且由Quiroga与教师Leonardo Glusberg合作。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0455','WCD-10-B08:V1-ENT-0522','V1-ENT-0522','collection','《彼岸》','奥拉西奥·基罗加','Más allá','乌拉圭','es','1935','短篇小说集','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《彼岸》｜Más allá

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1935
- genre_or_form：短篇小说集
- one_sentence_summary：据MEC记录其1935年出版；Textos.info可读的后编11篇选本含《Más allá》《El vampiro》《El hijo》等，简介将这些不同故事概括为围绕死亡、丛林和人与自然关系的杂集。该目录不冒充1935初版目录。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0456','WCD-10-B08:V1-ENT-0523','V1-ENT-0523','work','《完美短篇小说家的十诫》','奥拉西奥·基罗加','Decálogo del perfecto cuentista','乌拉圭','es','1927','创作论短文','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《完美短篇小说家的十诫》｜Decálogo del perfecto cuentista

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1927
- genre_or_form：创作论短文
- one_sentence_summary：据原文，这组十条建议要求作者先明确故事方向、重视首尾、精确选词、少用不必要的形容词，并把人物一路带到结局；这些条目构成创作论而非虚构故事。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0457','WCD-10-B08:V1-ENT-0524','V1-ENT-0524','work','《完美短篇小说家手册》','奥拉西奥·基罗加','El manual del perfecto cuentista','乌拉圭','es','1925','创作论短文','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《完美短篇小说家手册》｜El manual del perfecto cuentista

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1925
- genre_or_form：创作论短文
- one_sentence_summary：据《Sobre el Arte de Contar Historias》中的《El manual del perfecto cuentista》，Quiroga以结尾句、leitmotiv、故事开头、惯用语等例子讨论短篇技法；本篇止于该文L97，不把下一篇的地方色彩、民俗等论述并入。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0458','WCD-10-B08:V1-ENT-0525','V1-ENT-0525','work','《完美短篇小说家的技巧》','奥拉西奥·基罗加','Los trucos del perfecto cuentista','乌拉圭','es','1925','创作论短文','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《完美短篇小说家的技巧》｜Los trucos del perfecto cuentista

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1925
- genre_or_form：创作论短文
- one_sentence_summary：据《Sobre el Arte de Contar Historias》中的《Los “trucs” del perfecto cuentista》（L98–142），作者讨论地方色彩与民俗，并举技术科学术语、词序及暗示人物结局的写法为故事技法；这些内容属于本篇，不归入前篇《El manual》。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0459','WCD-10-B08:V1-ENT-0526','V1-ENT-0526','work','《羽毛枕》','奥拉西奥·基罗加','El almohadón de plumas','乌拉圭','es','1907','短篇小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《羽毛枕》｜El almohadón de plumas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1907
- genre_or_form：短篇小说
- one_sentence_summary：据短篇原文，Alicia婚后逐渐衰弱，医生无法解释贫血；丈夫后来在枕头内发现吸血寄生物，结局以室内怪异事件解释病因。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0460','WCD-10-B08:V1-ENT-0527','V1-ENT-0527','work','《被斩首的母鸡》','奥拉西奥·基罗加','La gallina degollada','乌拉圭','es','1909','短篇小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《被斩首的母鸡》｜La gallina degollada

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1909
- genre_or_form：短篇小说
- one_sentence_summary：据研究页面对原篇的分析，四个儿子目睹厨房杀鸡后将这一暴力动作转向妹妹；故事把家庭冲突、日光与血的意象并置。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0461','WCD-10-B08:V1-ENT-0528','V1-ENT-0528','work','《一段恋情》','奥拉西奥·基罗加','Una estación de amor','乌拉圭','es','1912','短篇小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《一段恋情》｜Una estación de amor

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1912
- genre_or_form：短篇小说
- one_sentence_summary：据文本页，《Una estación de amor》追叙Nébel与Lidia的恋情，从年轻时的相遇、分离到多年后的重逢；初刊时题为《Un sueño de amor》。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0462','WCD-10-B08:V1-ENT-0529','V1-ENT-0529','work','《随波漂流》','奥拉西奥·基罗加','A la deriva','乌拉圭','es','1912','短篇小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《随波漂流》｜A la deriva

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1912
- genre_or_form：短篇小说
- one_sentence_summary：据文本页，Paulino被毒蛇咬伤后划独木舟沿河求救，身体衰败与他对日常生活的回忆交错，叙事最终停在死亡逼近的一程河路上。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0463','WCD-10-B08:V1-ENT-0530','V1-ENT-0530','work','《死去的人》','奥拉西奥·基罗加','El hombre muerto','乌拉圭','es','1920','短篇小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《死去的人》｜El hombre muerto

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1920
- genre_or_form：短篇小说
- one_sentence_summary：据故事原文，农人结束田间活计时意外倒下，清醒地观察自己的身体、周围景物和死亡进程；年表所记1920-06-27不自动证明报纸名称。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0464','WCD-10-B08:V1-ENT-0531','V1-ENT-0531','work','《多萝西·菲利普斯小姐，我的妻子》','奥拉西奥·基罗加','Miss Dorothy Phillips, mi esposa','乌拉圭','es','1919','短篇小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《多萝西·菲利普斯小姐，我的妻子》｜Miss Dorothy Phillips, mi esposa

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1919
- genre_or_form：短篇小说
- one_sentence_summary：据Lefort逐段概述，叙述者Guillermo Grant迷恋影星Dorothy Phillips，以富有南美人的身份赴好莱坞接近她；日记式二十段叙事最后揭示求婚情节是一场梦。

#### 署名研究说明（research_note_only）

- Lefort把作品读作以二十段日记制造读者受骗感：Grant对影星的追求先被写得近似可实现，末尾才以梦境揭露取消现实承诺；她据此讨论真实/幻象边界。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0465','WCD-10-B08:V1-ENT-0532','V1-ENT-0532','work','《儿子》','奥拉西奥·基罗加','El hijo','乌拉圭','es','1928','短篇小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《儿子》｜El hijo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1928
- genre_or_form：短篇小说
- one_sentence_summary：据故事原文，十三岁的儿子出门打猎后没有按时回家，父亲在丛林寻找时反复看见幻影中的孩子并以为与他团聚；结尾揭示儿子当天上午十点已在跨越带刺铁丝时被猎枪事故致死，父亲仍独自回家。初刊署题《El padre》（1928），1935年改题《El hijo》收入《Más allá》。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0466','WCD-10-B08:V1-ENT-0533','V1-ENT-0533','work','《共谋的野兽》','奥拉西奥·基罗加','Las fieras cómplices','乌拉圭','es','1908','以笔名S. Fragoso Lima发表的连载小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《共谋的野兽》｜Las fieras cómplices

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1908
- genre_or_form：以笔名S. Fragoso Lima发表的连载小说
- one_sentence_summary：据Pionetti的连载研究，这部五期小说以倒叙展开复仇，叙述丛林中的原住民、人和野兽如何结盟反抗贫困与外来者滥权。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0467','WCD-10-B08:V1-ENT-0534','V1-ENT-0534','work','《杀人的猴子》','奥拉西奥·基罗加','El mono que asesinó','乌拉圭','es','1909','以笔名S. Fragoso Lima发表的连载小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《杀人的猴子》｜El mono que asesinó

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1909
- genre_or_form：以笔名S. Fragoso Lima发表的连载小说
- one_sentence_summary：据Pionetti的剧情概述，一位印度导师转生为猴，在布宜诺斯艾利斯向三千年前杀害自己的仇家后代复仇；文本借标题误导读者。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0468','WCD-10-B08:V1-ENT-0535','V1-ENT-0535','work','《人造人》','奥拉西奥·基罗加','El hombre artificial','乌拉圭','es','1910','以笔名S. Fragoso Lima发表的连载小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《人造人》｜El hombre artificial

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1910
- genre_or_form：以笔名S. Fragoso Lima发表的连载小说
- one_sentence_summary：据Sarti论文摘要，三名科学家试图不借助女性创造名为Biógeno的人造人；实验在感官能力的完成上失败，并牵涉科学、医学知识与自毁。

#### 署名研究说明（research_note_only）

- Sarti将连载的叙事形式与电影蒙太奇联系，具体指出镜头式衔接、遮片和时间跳跃；她也把人造人实验放在科学/医学知识及自毁问题中分析。此释义限于论文摘要。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0469','WCD-10-B08:V1-ENT-0536','V1-ENT-0536','work','《食人者》','奥拉西奥·基罗加','El devorador de hombres','乌拉圭','es','1911','以笔名S. Fragoso Lima发表的连载小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《食人者》｜El devorador de hombres

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1911
- genre_or_form：以笔名S. Fragoso Lima发表的连载小说
- one_sentence_summary：据Pionetti引述的开篇，孟加拉虎Raja以第一人称讲述向驯兽师Kimberley复仇；故事用猛兽自述承载驯服、囚禁与报复情节。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0470','WCD-10-B08:V1-ENT-0537','V1-ENT-0537','work','《罗马帝国的拍卖》','奥拉西奥·基罗加','El remate del imperio romano','乌拉圭','es','1912','以笔名S. Fragoso Lima发表的连载小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《罗马帝国的拍卖》｜El remate del imperio romano

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1912
- genre_or_form：以笔名S. Fragoso Lima发表的连载小说
- one_sentence_summary：据数字文本可见片段，小说将故事置于Commodus死后的罗马：新帝Pertinax即位，Didio Juliano在奢华宴席中接待来客；Pionetti记录原作于1912年以“S. Fragoso Lima”署名在《Caras y Caretas》六期连载。数字摘录仅支持所见场景，不据此扩写全篇。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0471','WCD-10-B08:V1-ENT-0538','V1-ENT-0538','work','《自杀的船只》','奥拉西奥·基罗加','Los buques suicidantes','乌拉圭','es','1906','短篇小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《自杀的船只》｜Los buques suicidantes

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1906
- genre_or_form：短篇小说
- one_sentence_summary：据故事文本，船只漂流到港时船体完好却不见船员；一名幸存者解释船员遭遇无法抗拒的集体死亡冲动。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0472','WCD-10-B08:V1-ENT-0539','V1-ENT-0539','work','《中暑》','奥拉西奥·基罗加','La insolación','乌拉圭','es','1908','短篇小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《中暑》｜La insolación

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1908
- genre_or_form：短篇小说
- one_sentence_summary：据故事原文，农场狗察觉主人Míster Jones将在酷热中死去；Quereilhac把这种动物感知写作死亡预兆和“丛林故事”构造的一部分。

#### 署名研究说明（research_note_only）

- Quereilhac把《La insolación》列作“丛林故事”：狗群预感主人死亡，使死亡先以动物感知的预兆进入日常农场空间。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0473','WCD-10-B08:V1-ENT-0540','V1-ENT-0540','work','《野蜜》','奥拉西奥·基罗加','La miel silvestre','乌拉圭','es','1911','短篇小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《野蜜》｜La miel silvestre

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1911
- genre_or_form：短篇小说
- one_sentence_summary：据故事原文及Quereilhac分析，Benincasa进入蚁群活动区域后被食肉蚁袭击；研究文章将袭击过程作为环境力量压倒人物的叙事例子。

#### 署名研究说明（research_note_only）

- Quereilhac用Benincasa被食肉蚁袭击的情节说明《La miel silvestre》如何把危险环境和死亡逼近写进“丛林故事”；仅概述该论文对本篇的分析。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0474','WCD-10-B08:V1-ENT-0541','V1-ENT-0541','work','《铁丝网》','奥拉西奥·基罗加','El alambre de púa','乌拉圭','es','1912','短篇小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《铁丝网》｜El alambre de púa

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1912
- genre_or_form：短篇小说
- one_sentence_summary：据故事原文，两匹马触及带刺铁丝后试图越过围栏；此篇将牲畜对围挡的反应组织成冲突，1917年后收入故事集。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0475','WCD-10-B08:V1-ENT-0542','V1-ENT-0542','work','《一个雇工》','奥拉西奥·基罗加','Un peón','乌拉圭','es','1918','短篇小说（以单行小册子形式连载出版）','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《一个雇工》｜Un peón

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1918
- genre_or_form：短篇小说（以单行小册子形式连载出版）
- one_sentence_summary：据直接阅读的全文，巴西雇工Olivera以幽默而勤奋的方式在米西奥内斯打工，替主人开石井、在夜间与女佣Cirila相会；Cirila被毒蛇咬伤后，他协助救治，结尾主人发现他擅自用简易拖具拖运木桶，显出其不循常规的性格。首刊期号与年份另据目录。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0476','WCD-10-B08:V1-ENT-0543','V1-ENT-0543','collection','《猎人的书信》','奥拉西奥·基罗加','Cartas de un cazador','乌拉圭','es','1922','Ferrari所述儿童故事连载系列，十篇；Dum-Dum向四个弟弟写信讲述冒险。','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《猎人的书信》｜Cartas de un cazador

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1922
- genre_or_form：Ferrari所述儿童故事连载系列，十篇；Dum-Dum向四个弟弟写信讲述冒险。
- one_sentence_summary：据Ferrari研究导读，Dum-Dum以书信向四个弟弟讲述冒险；Ferrari将该连载系列记为十篇，1922年始于Mundo Argentino、1924年续见Billiken，后于逝后结集。Rea另以1978年选本为对象记述十二篇及父亲写给子女的叙述框架；两种版本/目录口径分列，不称彼此一致。
- bibliographic_note：Rea所讨论的1978年逝后选本为十二篇，并将叙述框架表述为父亲写给子女；此处只记录该选本的版本口径。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0477','WCD-10-B08:V1-ENT-0544','V1-ENT-0544','collection','《我们动物的生活》','奥拉西奥·基罗加','De la vida de nuestros animales','乌拉圭','es','1922','描写米西奥内斯动植物的34篇短札连载系列','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《我们动物的生活》｜De la vida de nuestros animales

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1922
- genre_or_form：描写米西奥内斯动植物的34篇短札连载系列
- one_sentence_summary：Ferrari将系列概述为1922–1925年刊于Mundo Argentino、Billiken与Caras y Caretas的34则“丛林短札”，并称1967年才以书名结集；Rea提到Quiroga于1924年和1925年为Caras y Caretas撰写、题为De la vida de nuestros animales的短札。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0478','WCD-10-B08:V1-ENT-0545','V1-ENT-0545','work','《一封情书》','奥拉西奥·基罗加','Una carta de amor','乌拉圭','es','1917','短篇小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《一封情书》｜Una carta de amor

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1917
- genre_or_form：短篇小说
- one_sentence_summary：据Ferrari对原刊故事的分析，一名年轻人请小说家替自己写一封能打动女友的信；小说家拒绝代笔，认为年轻人真诚写下的话胜过熟练作者的技巧，并建议当面交谈解决争执。

#### 署名研究说明（research_note_only）

- Ferrari将此篇读作对作者身份和写作限度的反思：故事中的小说家认为，经验不足以支撑对纯粹爱情的想象；文章又把作者自述“另有远多于署名作品”的说法，联系到杂志中的笔名、编辑与插图者共同分配表达的情形。释义限于该文对本篇的直接讨论。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0479','WCD-10-B08:V1-ENT-0546','V1-ENT-0546','work','《一次狩猎》','奥拉西奥·基罗加','Una cacería','乌拉圭','es','1917','短篇小说','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《一次狩猎》｜Una cacería

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1917
- genre_or_form：短篇小说
- one_sentence_summary：Ferrari将此篇描述为一则残酷的狩猎故事，指出它回响了Quiroga早期连载小说《Las fieras cómplices》，并把真正的“文明”问题置于城市与丛林的冲突中；故事原刊同页另有温彻斯特广告。

#### 署名研究说明（research_note_only）

- Ferrari直接把《Una cacería》与《Las fieras cómplices》联系起来，认为两篇共同触及城市/丛林所代表的文明冲突；该文还指出，原刊故事页上的Winchester广告可能构成早期植入式广告，将虚构叙事与现实商业讯息并置。这里仅转述其明确提出的解释。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0480','WCD-10-B08:V1-ENT-0547','V1-ENT-0547','work','《复活》','马查多·德·阿西斯','Ressurreição','巴西','pt','1872','novel','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《复活》｜Ressurreição

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1872
- genre_or_form：novel
- one_sentence_summary：Machado首部长篇以青年医生Félix为中心，写他在富有的寡妇Lívia与内向的Raquel之间的情感纠葛。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0481','WCD-10-B08:V1-ENT-0548','V1-ENT-0548','work','《手与手套》','马查多·德·阿西斯','A mão e a luva','巴西','pt','1874','novel','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《手与手套》｜A mão e a luva

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1874
- genre_or_form：novel
- one_sentence_summary：女主人公Guiomar面对三名求婚者的追求、施压与胁迫；原作副题为“Um perfil de mulher”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0482','WCD-10-B08:V1-ENT-0549','V1-ENT-0549','work','《海伦娜》','马查多·德·阿西斯','Helena','巴西','pt','1876','novel','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《海伦娜》｜Helena

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1876
- genre_or_form：novel
- one_sentence_summary：故事置于19世纪50年代，围绕Helena与Estácio之间受社会阶级及家庭关系阻隔的爱情展开。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0483','WCD-10-B08:V1-ENT-0550','V1-ENT-0550','work','《雅雅·加西亚》','马查多·德·阿西斯','Iaiá Garcia','巴西','pt','1878','novel','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《雅雅·加西亚》｜Iaiá Garcia

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1878
- genre_or_form：novel
- one_sentence_summary：小说交织Iaiá Garcia、Jorge与Estela的情感关系，以骄傲、迷恋、嫉妒、误解与羞愧等冲突展开，背景为巴拉圭战争。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0484','WCD-10-B08:V1-ENT-0551','V1-ENT-0551','work','《旧宅》','马查多·德·阿西斯','Casa velha','巴西','pt','1885','novel','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《旧宅》｜Casa velha

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1885
- genre_or_form：novel
- one_sentence_summary：一位老教士回忆自己到Casa Velha查阅旧档案，并观察Félix与Lalau在庄园家庭中的感情和家族关系；1944年Martins单行书版与早期《A Estação》连载层分开记录。
- first_book_edition_year：1944

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0485','WCD-10-B08:V1-ENT-0552','V1-ENT-0552','work','《以扫与雅各》','马查多·德·阿西斯','Esaú e Jacó','巴西','pt','1904','novel','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《以扫与雅各》｜Esaú e Jacó

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1904
- genre_or_form：novel
- one_sentence_summary：双胞胎Pedro与Paulo外貌相同而性格相反，两人都倾心于Flora，后来又分属对立政党；退休外交官Counselor Ayres以第三人称叙述。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0486','WCD-10-B08:V1-ENT-0553','V1-ENT-0553','work','《艾尔斯纪事》','马查多·德·阿西斯','Memorial de Aires','巴西','pt','1908','novel','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《艾尔斯纪事》｜Memorial de Aires

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1908
- genre_or_form：novel
- one_sentence_summary：小说由退休外交官Counselor Ayres的日记条目构成；他记录晚年生活、爱与孤独，并回望帝国时期和新共和国初期。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0487','WCD-10-B08:V1-ENT-0554','V1-ENT-0554','collection','《里约故事集》','马查多·德·阿西斯','Contos fluminenses','巴西','pt','1870','short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《里约故事集》｜Contos fluminenses

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1870
- genre_or_form：short_story_collection
- one_sentence_summary：1870年结集的七篇短篇此前曾发表于《Jornal das Famílias》，包括《Frei Simão》和《Linha reta e linha curva》。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0488','WCD-10-B08:V1-ENT-0555','V1-ENT-0555','collection','《午夜故事》','马查多·德·阿西斯','Histórias da meia-noite','巴西','pt','1873','short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《午夜故事》｜Histórias da meia-noite

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1873
- genre_or_form：short_story_collection
- one_sentence_summary：首版目录列出六篇：《A parasita azul》《As bodas de Luiz Duarte》《Ernesto de Tal》《Aurora sem dia》《O relógio de ouro》《Ponto de vista》；作者卷首说明称这些是其汇集的短篇叙事。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0489','WCD-10-B08:V1-ENT-0556','V1-ENT-0556','collection','《散篇》','马查多·德·阿西斯','Papéis avulsos','巴西','pt','1882','short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《散篇》｜Papéis avulsos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1882
- genre_or_form：short_story_collection
- one_sentence_summary：十二篇故事的合集，包括《O alienista》中Simão Bacamarte反复改定Casa Verde收治标准，以及对话体《Teoria do medalhão》中父亲教成年儿子经营声望；目录据首版馆藏记录。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0490','WCD-10-B08:V1-ENT-0557','V1-ENT-0557','collection','《无日期的故事》','马查多·德·阿西斯','Histórias sem data','巴西','pt','1884','short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《无日期的故事》｜Histórias sem data

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1884
- genre_or_form：short_story_collection
- one_sentence_summary：首版目录列出18篇短篇，包括《A igreja do diabo》《O lapso》《As academias de Sião》等；作者卷首说明这些故事并非专属于某一天或某个特定日子的故事。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0491','WCD-10-B08:V1-ENT-0558','V1-ENT-0558','collection','《各种故事》','马查多·德·阿西斯','Várias histórias','巴西','pt','1895','short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《各种故事》｜Várias histórias

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1895
- genre_or_form：short_story_collection
- one_sentence_summary：十六篇此前刊于《Gazeta de Notícias》的短篇由作者选编成集；1895年10月中旬报刊已有到货消息或书评，馆藏首版标示1896年。
- first_book_edition_year：1896

#### 署名研究说明（research_note_only）

- Daniele Maria Megid 分析 Várias histórias 的作者编选过程：所收16篇最初发表于1884–1891年，书籍以1896为首版年份，但里约报刊自1895年10月中旬已出现书评或到货消息；本文据此将1895标作最早可证流通线索，将1896保留为首版题年，具体首次售卖日仍未由原刊影印本核实。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0492','WCD-10-B08:V1-ENT-0559','V1-ENT-0559','collection','《拾零集》','马查多·德·阿西斯','Páginas recolhidas','巴西','pt','1899','collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《拾零集》｜Páginas recolhidas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1899
- genre_or_form：collection
- one_sentence_summary：馆藏目录将11项列在“Contos”组（其中包括纪念或评论文字），另列剧作《Tu, só tu, puro amor》和六篇《Chronicas》；该书因此是混合文类选集。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0493','WCD-10-B08:V1-ENT-0560','V1-ENT-0560','collection','《旧宅遗珍》','马查多·德·阿西斯','Relíquias de casa velha','巴西','pt','1906','collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《旧宅遗珍》｜Relíquias de casa velha

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1906
- genre_or_form：collection
- one_sentence_summary：1906年出版的作者合集；当前直接核实的合集内剧作《Lição de Botânica》首次收入本书，整本目录构成仍待逐项核对。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0494','WCD-10-B08:V1-ENT-0561','V1-ENT-0561','collection','《蛹》','马查多·德·阿西斯','Crisálidas','巴西','pt','1864','poetry_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《蛹》｜Crisálidas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1864
- genre_or_form：poetry_collection
- one_sentence_summary：1864年诗集的馆藏目录列29首作品；另有一篇直接研究该书的论文具体分析《Os arlequins》《Epitáfio do México》《Polônia》。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0495','WCD-10-B08:V1-ENT-0562','V1-ENT-0562','collection','《夜蛾》','马查多·德·阿西斯','Falenas','巴西','pt','1870','poetry_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《夜蛾》｜Falenas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1870
- genre_or_form：poetry_collection
- one_sentence_summary：《Falenas》以诗歌为主，馆藏目录分列“Varia”和“Lyra Chineza”，并同时收有戏剧诗《Uma Ode de Anacreonte》及短篇《Pallida Elvira》。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0496','WCD-10-B08:V1-ENT-0563','V1-ENT-0563','collection','《美洲诗篇》','马查多·德·阿西斯','Americanas','巴西','pt','1875','poetry_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《美洲诗篇》｜Americanas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1875
- genre_or_form：poetry_collection
- one_sentence_summary：1875年诗集目录列13首诗，包括题材涉及原住民的《Potira》《Niani》，叙述新基督徒爱情的《A Cristã Nova》，以及涉及奴隶制的《Sabina》；后两项内容说明按馆藏目录转引的评论限定。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0497','WCD-10-B08:V1-ENT-0564','V1-ENT-0564','collection','《诗歌全集》','马查多·德·阿西斯','Poesias completas','巴西','pt','1901','collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《诗歌全集》｜Poesias completas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1901
- genre_or_form：collection
- one_sentence_summary：1901年诗歌汇编重收并修订《Crisálidas》《Falenas》《Americanas》中的部分诗作，另加入《Ocidentais》；它是独立的书本汇编层。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0498','WCD-10-B08:V1-ENT-0565','V1-ENT-0565','collection','《戏剧集》','马查多·德·阿西斯','Teatro','巴西','pt','1863','collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《戏剧集》｜Teatro

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1863
- genre_or_form：collection
- one_sentence_summary：1863年《Theatro》第一卷收录两部首演喜剧《O caminho da porta》和《O protocolo》，并附通信文字；原卷本身不等同于其中两部剧作或其演出。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0499','WCD-10-B08:V1-ENT-0566','V1-ENT-0566','work','《幻灭》','马查多·德·阿西斯','Desencantos','巴西','pt','1861','play','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《幻灭》｜Desencantos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1861
- genre_or_form：play
- one_sentence_summary：《Desencantos》是一部以Clara、Luís de Melo和Pedro Alves为中心的“Fantasia Dramática”：数年后，Luís向Pedro的继女求婚并获其同意。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0500','WCD-10-B08:V1-ENT-0567','V1-ENT-0567','work','《差点当上部长》','马查多·德·阿西斯','Quase ministro','巴西','pt','1864','play','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《差点当上部长》｜Quase ministro

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1864
- genre_or_form：play
- one_sentence_summary：这部一幕喜剧写议员Martins等待入阁时，一群求恩者蜂拥上门；任命落空后，逐利的奉承者离去，暴露政治庇护关系。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0501','WCD-10-B08:V1-ENT-0568','V1-ENT-0568','work','《穿礼服的众神》','马查多·德·阿西斯','Os deuses de casaca','巴西','pt','1866','play','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《穿礼服的众神》｜Os deuses de casaca

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1866
- genre_or_form：play
- one_sentence_summary：这部喜剧让奥林匹斯诸神穿上现代礼服并讨论人间事务；作者序称其为由短对话构成的简约讽刺，正文以亚历山大诗行写成。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0502','WCD-10-B08:V1-ENT-0569','V1-ENT-0569','work','《唯有你，纯真的爱》','马查多·德·阿西斯','Tu, só tu, puro amor','巴西','pt','1880','play','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《唯有你，纯真的爱》｜Tu, só tu, puro amor

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1880
- genre_or_form：play
- one_sentence_summary：喜剧将Camões与D. Catarina de Ataíde的恋情搬上舞台；1880年发表于《Revista Brasileira》并于纪念庆典演出，1881年收入书本。
- first_book_edition_year：1881

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0503','WCD-10-B08:V1-ENT-0570','V1-ENT-0570','work','《巴西当代文学概述：民族性本能》','马查多·德·阿西斯','Notícia da atual literatura brasileira: Instinto de nacionalidade','巴西','pt','1873','critical_essay','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《巴西当代文学概述：民族性本能》｜Notícia da atual literatura brasileira: Instinto de nacionalidade

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1873
- genre_or_form：critical_essay
- one_sentence_summary：发表于《O Novo Mundo》的批评文章，分论小说、诗歌、戏剧与语言；BNDigital记刊期为1873年3月24日。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0504','WCD-10-B08:V1-ENT-0571','V1-ENT-0571','work','《植物学课》','马查多·德·阿西斯','Lição de Botânica','巴西','pt','1906','play','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《植物学课》｜Lição de Botânica

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1906
- genre_or_form：play
- one_sentence_summary：植物学家兼男爵Segismundo为维护侄子Henrique的科学独身，要求姨母阻断他与Cecília的恋情；D. Helena巧用男爵的植物学著作促成两人和解，也让男爵向自己求婚。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0505','WCD-10-B08:V1-ENT-0572','V1-ENT-0572','work','《不要请医生》','马查多·德·阿西斯','Não consultes médico','巴西','pt','1899','play','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《不要请医生》｜Não consultes médico

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1899
- genre_or_form：play
- one_sentence_summary：D. Leocádia认为修道院不能治愈Cavalcante的失恋，转而建议他赴中国传教；他与同样失恋的Carlota相互倾诉后相爱并决定结婚。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0506','WCD-10-B08:V1-ENT-0573','V1-ENT-0573','work','《散篇故事》','马查多·德·阿西斯','Contos esparsos','巴西','pt','1956','short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《散篇故事》｜Contos esparsos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“O anjo Rafael”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0507','WCD-10-B08:V1-ENT-0574','V1-ENT-0574','work','《遗忘的故事》','马查多·德·阿西斯','Contos esquecidos','巴西','pt','1956','short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《遗忘的故事》｜Contos esquecidos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“Decadência de dois grandes homens”与“Um esqueleto”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0508','WCD-10-B08:V1-ENT-0575','V1-ENT-0575','work','《辑录故事》','马查多·德·阿西斯','Contos recolhidos','巴西','pt','1956','short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《辑录故事》｜Contos recolhidos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“O capitão Mendonça”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0509','WCD-10-B08:V1-ENT-0576','V1-ENT-0576','work','《零篇故事》','马查多·德·阿西斯','Contos avulsos','巴西','pt','1956','short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《零篇故事》｜Contos avulsos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“A vida eterna”与“Os óculos de Pedro Antão”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0510','WCD-10-B08:V1-ENT-0577','V1-ENT-0577','work','《无日期故事》','马查多·德·阿西斯','Contos sem data','巴西','pt','1956','short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《无日期故事》｜Contos sem data

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“A mulher pálida”。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0511','WCD-10-B08:V1-ENT-0578','V1-ENT-0578','work','《短篇与编年文》','马查多·德·阿西斯','Contos e crônicas','巴西','pt','1958','short_story_and_chronicle_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《短篇与编年文》｜Contos e crônicas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1958
- genre_or_form：short_story_and_chronicle_collection
- one_sentence_summary：目录示例列《O Teles e o Tobias》和《O carro nº 13》；Google Books 记录该卷由 Raimundo Magalhães Júnior 编，Civilização Brasileira 于1958年出版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0512','WCD-10-B08:V1-ENT-0579','V1-ENT-0579','work','《马查多·德·阿西斯奇幻故事集》','马查多·德·阿西斯','Contos fantásticos de Machado de Assis','巴西','pt','1973','short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《马查多·德·阿西斯奇幻故事集》｜Contos fantásticos de Machado de Assis

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1973
- genre_or_form：short_story_collection
- one_sentence_summary：Raimundo Magalhães Júnior 1973年编选的十一篇故事，包括《A chinela turca》《A mulher pálida》《O anjo Rafael》与《O capitão Mendonça》；研究指出其中仅两篇曾由 Machado 自行选入生前单行本。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0513','WCD-10-B08:V1-ENT-0580','V1-ENT-0580','work','《批评文集》','马查多·德·阿西斯','Crítica','巴西','pt','1910','critical_anthology','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《批评文集》｜Crítica

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1910
- genre_or_form：critical_anthology
- one_sentence_summary：Mário de Alencar 编辑的1910年遗著选集；目录从《Instinto de nacionalidade》《Guilherme Malta》《Castro Alves》列至评论与序文，篇目性质为文学批评及序言。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0514','WCD-10-B08:V1-ENT-0581','V1-ENT-0581','work','《其他遗珍》','马查多·德·阿西斯','Outras relíquias','巴西','pt','1910','mixed_prose_poetry_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《其他遗珍》｜Outras relíquias

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1910
- genre_or_form：mixed_prose_poetry_collection
- one_sentence_summary：1910年Garnier卷的目录列八篇散文及六篇诗作（含《O Almada》《Réfus》）；卷首说明称收录故事、诗和散页，来自作者创作较成熟作品的时期。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0515','WCD-10-B08:V1-ENT-0582','V1-ENT-0582','work','《马查多·德·阿西斯书信集》','马查多·德·阿西斯','Correspondência de Machado de Assis','巴西','pt','1932','correspondence_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《马查多·德·阿西斯书信集》｜Correspondência de Machado de Assis

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1932
- genre_or_form：correspondence_collection
- one_sentence_summary：Fernando Nery 1932年编注的通信集，约232项，收入 Machado 致 Nabuco、Veríssimo、Mário de Alencar、Lúcio de Mendonça等人的信，也包括若干收信人的回复。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0516','WCD-10-B08:V1-ENT-0583','V1-ENT-0583','work','《钟表匠的对话与随想》','马查多·德·阿西斯','Diálogos e reflexões de um relojoeiro','巴西','pt','1956','chronicle_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《钟表匠的对话与随想》｜Diálogos e reflexões de um relojoeiro

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：chronicle_collection
- one_sentence_summary：1956年卷的副题说明其从《Gazeta de notícias》辑录1886年的“A + B”及1888—1889年的“Bons dias”；学术研究称收全“A + B”与除一篇外的“Bons Dias”，为“A + B”首个书本版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0517','WCD-10-B08:V1-ENT-0584','V1-ENT-0584','work','《精神病医师》','马查多·德·阿西斯','O Alienista','巴西','pt','1881','short_story','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《精神病医师》｜O Alienista

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1881
- genre_or_form：short_story
- one_sentence_summary：医生Simão Bacamarte在Itaguaí建Casa Verde研究并分类“疯癫”；当收治人数达到全镇人口五分之四，他改换理性标准释放众人，最后又把自己收治。
- first_book_edition_year：1882

#### 署名研究说明（research_note_only）

- Sandra Mara da Silva Franca 的 USP 硕士论文比较《O Alienista》在《A Estação》与《Papéis Avulsos》中的版本，并依据叙事焦点与文体论证其为“conto”，而非“novela”；论文还指出1881–1882连载本到1882年Lombaerts书版之间存在作者修订。此处按其明确的类型判断记录，不抹去葡语批评史上的类型争议。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0518','WCD-10-B08:V1-ENT-0585','V1-ENT-0585','collection','《舞之躯》','若昂·吉马朗埃斯·罗萨','Corpo de Baile','巴西','pt','1956','novel_cycle','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《舞之躯》｜Corpo de Baile

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：novel_cycle
- one_sentence_summary：《Corpo de Baile》以七个分别命名的叙事构成循环性作品；Calzolari考察其印刷谱系：1956年初版为两卷，1960年第二版合为一卷，至第三版（1964/65）才拆成三册自主卷本。

#### 署名研究说明（research_note_only）

- Tereza Paula Alves Calzolari在《Tradição impressa de Corpo de Baile》中对照初版、第二版与第三版的题名、卷数和目录分类，并指出初版对内部篇目采用多种文类标注；本候选据此把1956合卷与后来的三册区分为不同版本层，不将七篇一概定作短篇小说。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0519','WCD-10-B08:V1-ENT-0586','V1-ENT-0586','work','《与牧牛人马里亚诺同行》','若昂·吉马朗埃斯·罗萨','Com o vaqueiro Mariano','巴西','pt','1947','reportagem / 文学旅行叙述（reportagem特征据Andrea Ramos Jubé Vianna 2019年题录摘要）','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《与牧牛人马里亚诺同行》｜Com o vaqueiro Mariano

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1947
- genre_or_form：reportagem / 文学旅行叙述（reportagem特征据Andrea Ramos Jubé Vianna 2019年题录摘要）
- one_sentence_summary：USP书目记录将《Com o vaqueiro Mariano》相关报刊文本列为1947–48年分期刊载，并另记1952年独立小书及其后收入《Estas estórias》（S204 L22–46、L48–106；S212）。该页面对Andrea Ramos Jubé Vianna 2019年研究的摘要称文本具有reportagem特征（S204 L256–269）；原论文未读。S204 L282–294另列Guilherme Mazzafera e Silva Vilhena 2017年的不同研究，reportagem说法不归于该研究。ABL所记1952年行旅只用于行旅年代，不证明1947年首发（S203）。
- bibliographic_note：USP机构书目记录《Com o vaqueiro Mariano》的1952年独立书版及1947–48年报刊分期（S204 L22–46、L48–106）。同一页面对Andrea Ramos Jubé Vianna 2019年研究的题录摘要称文本具有reportagem特征（S204 L256–269）；原论文未读。页面L282–294另列Guilherme Mazzafera e Silva Vilhena 2017年的另一研究，不将reportagem结论归给Vilhena。ABL记录作者1952年行旅（S203），不支持报刊首发年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0520','WCD-10-B08:V1-ENT-0587','V1-ENT-0587','collection','《简言》（《第三故事》）','若昂·吉马朗埃斯·罗萨','Tutameia (Terceiras estórias)','巴西','pt','1967','short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《简言》（《第三故事》）｜Tutameia (Terceiras estórias)

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1967
- genre_or_form：short_story_collection
- one_sentence_summary：由40篇极短叙事和4篇前言构成；书名为Tutameia，Terceiras estórias是其副题/第二命名层，不是另一部作品，也不暗示存在同作者的“第二故事”书。

#### 署名研究说明（research_note_only）

- Maíra Pinheiro Tavares指出，Tutameia以双目录组织44篇文本：40篇归作“Contos”，另4篇标为“Prefácios”，其中三篇穿插在叙事之间；她据此讨论这些副文本和排列如何共同形成全书的节奏与谜样结构（S206，P16–17 L205–242）。她还将短篇的高度凝缩与语言的音乐性相连（摘要P9 L71–99）。此处仅归属该论文的文本结构/形式发现。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0521','WCD-10-B08:V1-ENT-0588','V1-ENT-0588','collection','《这些故事》','若昂·吉马朗埃斯·罗萨','Estas estórias','巴西','pt','1969','short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《这些故事》｜Estas estórias

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1969
- genre_or_form：short_story_collection
- one_sentence_summary：S230书目将《Estas estórias》1969年初版列为九篇：A simples e exata estória do burrinho do comandante、Os chapéus transeuntes、Entremeio: com o vaqueiro Mariano、A estória do Homem do Pinguelo、Meu tio o Iauaretê、Bicho mau、Páramo、Retábulo de São Nunca、O dar das pedras brilhantes（L127）。USP目录也将“Entremeio”列作本集篇目（S212 L87–101），与1952年独立小书版分属不同出版层。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0522','WCD-10-B08:V1-ENT-0589','V1-ENT-0589','collection','《鸟啊，词语》','若昂·吉马朗埃斯·罗萨','Ave, Palavra','巴西','pt','1970','miscellany / mixed-genre collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《鸟啊，词语》｜Ave, Palavra

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1970
- genre_or_form：miscellany / mixed-genre collection
- one_sentence_summary：据Elvira Livonete Costa对该遗作杂集的研究，书中汇集诗、短篇叙事、日记、旅行札记等形式，并重组作者1947至1967年间的报刊文字。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0523','WCD-10-B08:V1-ENT-0590','V1-ENT-0590','collection','《岩浆》','若昂·吉马朗埃斯·罗萨','Magma','巴西','pt','1997','poetry_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《岩浆》｜Magma

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1997
- genre_or_form：poetry_collection
- one_sentence_summary：一部诗集，曾获巴西文学院诗歌奖，按作者意愿长期未刊，直至1997年才身后出版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0524','WCD-10-B08:V1-ENT-0591','V1-ENT-0591','work','《MMM之谜》','若昂·吉马朗埃斯·罗萨','O mistério dos MMM','巴西','pt','1961','collaborative detective novel','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《MMM之谜》｜O mistério dos MMM

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1961
- genre_or_form：collaborative detective novel
- one_sentence_summary：据Leszczynski与Soares的研究，故事从科帕卡巴纳一名富翁公寓内的谋杀案展开，现场三封由不同笔迹写成、署名均为“M”的信把调查引向三名女性；十位作者各接写一章，逐步续写谜案。
- bibliographic_note：可核的最早发表时间为1961年：Covizzi与Verlangieri的学术书目L125–126将《O Mistério dos MMM》（Rosa第七章）记为1961年10–12月发表于《O Cruzeiro》，并另列Rio de Janeiro: Ed. O Cruzeiro, 1962（S230）。ABL作者书目列合作书本版为1962（S201 L30），帕拉州基金会馆藏目录著录“Rio de Janeiro: O Cruzeiro, 1962, 208 p.”（S229 L2–3）。S224 P2 L95–96称作品于1964年在《O Cruzeiro》连载、后来也出版成书；与已核1961年连载及1962年书版冲突，保留为来源中的相反年代说法。Santos的2016年UEL论文P44–45仅顺带列1962、十位作者和逐章接写，不是本书专论。

#### 署名研究说明（research_note_only）

- Santos在2016年UEL硕士论文P44–45讨论另一部小说时，将《O mistério dos MMM》作为简短背景例子，列出1962年书本出版、十位作者及逐章接写；该论文研究对象并非本书（S211）。Leszczynski与Soares的2022年论文P4 L154–156将若昂·吉马朗埃斯·罗萨与若热·亚马多列为十位合作者中的两位（S224）。S224 P2 L95–96另称本书于1964年在《O Cruzeiro》连载、后来出版成书；此处只转述该论文说法，不将1964年作为事实首发年；该说法与W207-F05书目注释中所据1961年连载记录冲突。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0525','WCD-10-B08:V1-ENT-0592','V1-ENT-0592','collection','《七宗罪》','若昂·吉马朗埃斯·罗萨','Os sete pecados capitais','巴西','pt','1964','collective short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《七宗罪》｜Os sete pecados capitais

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1964
- genre_or_form：collective short_story_collection
- one_sentence_summary：七位作者的合作故事集；USP目录确认若昂·吉马朗埃斯·罗萨为合作者之一，并记载其篇目“Os chapéus transeuntes”位于本书第1–36页。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0526','WCD-10-B08:V1-ENT-0593','V1-ENT-0593','work','《原野》','若昂·吉马朗埃斯·罗萨','Campo Geral','巴西','pt','1956','narrative_text','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《原野》｜Campo Geral

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：narrative_text
- one_sentence_summary：Erich Soares Nogueira在《Campo geral》研究摘要中将Miguilim描述为一个近视男孩，凭身体感官经验和讲故事来理解周围世界，并以叙事应对童年的恐惧与死亡。

#### 署名研究说明（research_note_only）

- Erich Soares Nogueira在对《Campo geral》的研究摘要中把Miguilim描述为凭感官经验认识世界、并通过讲故事应对充满疑虑、恐惧和死亡的童年；这是该文的研究性概括，不是对所有篇章形式分类的判断。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0527','WCD-10-B08:V1-ENT-0594','V1-ENT-0594','work','《一个爱情故事》','若昂·吉马朗埃斯·罗萨','Uma estória de amor','巴西','pt','1956','narrative_text','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《一个爱情故事》｜Uma estória de amor

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：narrative_text
- one_sentence_summary：Franciane Conceição da Silva的研究摘要指出，Manuelzão外显的强悍和勇敢与其隐而未露的焦虑、不安形成张力。

#### 署名研究说明（research_note_only）

- Franciane Conceição da Silva以男性气质为问题切入《Uma estória de amor》，摘要指出Manuelzão强悍的外表掩藏焦虑与不安；此处将解释明确归属该研究。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0528','WCD-10-B08:V1-ENT-0595','V1-ENT-0595','work','《莱利奥与莉娜的故事》','若昂·吉马朗埃斯·罗萨','A estória de Lélio e Lina','巴西','pt','1956','narrative_text','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《莱利奥与莉娜的故事》｜A estória de Lélio e Lina

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：narrative_text
- one_sentence_summary：Danilo Almeida Patrício的研究摘要将Lélio写作一名从城市返回米纳斯吉拉斯荒原的牧牛人，其主要经历发生在Pinhém农庄。

#### 署名研究说明（research_note_only）

- Danilo Almeida Patrício以“Saudades de destino”为题讨论《A estória de Lélio e Lina》，摘要聚焦Lélio在Pinhém的经历以及人物和世界如何呈现“规则之外”的力量；此处只采用摘要明确列出的地点与研究角度。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0529','WCD-10-B08:V1-ENT-0596','V1-ENT-0596','work','《山上传来的消息》','若昂·吉马朗埃斯·罗萨','O Recado do Morro','巴西','pt','1956','narrative_text','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《山上传来的消息》｜O Recado do Morro

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：narrative_text
- one_sentence_summary：据Ana Paula Pinto对该篇的分析，Pedro Orósio随五人旅行队穿越sertão，逐段传递的山中预言揭露同伴谋害他的阴谋；他在最后关头获救，结局被作者阐释为惩罚与救赎。

#### 署名研究说明（research_note_only）

- Ana Paula Pinto在《O recado do Morro: profecia e redenção》中分析预言由七重传递、谋害计划以及Pedro Orósio最后关头获救之间的结构，并以“惩罚与救赎”解释结局。定位据论文全文P2 L81–89、P6–7 L245–260，不只据摘要。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0530','WCD-10-B08:V1-ENT-0597','V1-ENT-0597','work','《拉奥-达拉朗》','若昂·吉马朗埃斯·罗萨','Lão-Dalalão (Dão-Lalalão)','巴西','pt','1956','novella','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《拉奥-达拉朗》｜Lão-Dalalão (Dão-Lalalão)

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：novella
- one_sentence_summary：Biagio D’Angelo把《Dão-Lalalão》称作一部中篇叙事，围绕Soropita与Doralda的肉身之爱展开，并把欲望解释为趋向圆满的动力。

#### 署名研究说明（research_note_only）

- Biagio D’Angelo在《Dão-Lalalão, a reescrita do desejo》中以欲望与重写为研究角度，讨论Soropita与Doralda的夫妻关系及肉身之爱；该文称其为“romance breve”，故候选采用中篇叙事这一较中性的文类值。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0531','WCD-10-B08:V1-ENT-0598','V1-ENT-0598','work','《青铜面孔》','若昂·吉马朗埃斯·罗萨','Cara-de-Bronze','巴西','pt','1956','narrative_text','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《青铜面孔》｜Cara-de-Bronze

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：narrative_text
- one_sentence_summary：Maria da Glória Sá Rosa对《Cara-de-Bronze》的摘要介绍一位误以为自己害死父亲的隐居庄园主；他在晚年派牧牛人Grivo远行探寻事物本质，并请他讲述见闻。

#### 署名研究说明（research_note_only）

- Maria da Glória Sá Rosa以“电影语言或神秘主义”为研究切入，摘要把主人公误解父亲死因、Grivo奉命远行以及带回讲述联系起来；候选只转述作者明确列出的情节和研究问题。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0532','WCD-10-B08:V1-ENT-0599','V1-ENT-0599','work','《布里蒂棕榈》','若昂·吉马朗埃斯·罗萨','Buriti','巴西','pt','1956','narrative_text','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《布里蒂棕榈》｜Buriti

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：narrative_text
- one_sentence_summary：Sarah Maria Forte Diogo的研究摘要指出，Lalinha抵达Buriti Bom后打破农庄封闭的父权秩序，并使其中的欲望与人物关系显露出来。

#### 署名研究说明（research_note_only）

- Sarah Maria Forte Diogo在《O mundo que perdeu suas paredes》中把Lalinha置于封闭农庄秩序、女性欲望与情色关系的讨论中心；此处的父权秩序解释归属于该研究，不扩张为未经来源支持的人物关系。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0533','WCD-10-B08:V1-ENT-0600','V1-ENT-0600','work','《Highmore Hall之谜》','若昂·吉马朗埃斯·罗萨','O mistério de Highmore Hall','巴西','pt','1929','gothic/fantastic short story','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Highmore Hall之谜》｜O mistério de Highmore Hall

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1929
- genre_or_form：gothic/fantastic short story
- one_sentence_summary：医生Angus Dumbraid奉召前往苏格兰的Highmore庄园照料John Highmore，并卷入围绕旧宅、家族离散与诡异病况展开的哥特式谜团。

#### 署名研究说明（research_note_only）

- Luis Eduardo Wexell Machado的文章将本篇置于Rosa早期哥特/幻想小说语境，并分析其与Poe及Walpole传统的关系；本条仅归属该研究对本篇的直接分析。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0534','WCD-10-B08:V1-ENT-0601','V1-ENT-0601','work','《时间与命运》','若昂·吉马朗埃斯·罗萨','Chronos kai Anagke (Tempo e Destino)','巴西','pt','1930','fantastic short story','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《时间与命运》｜Chronos kai Anagke (Tempo e Destino)

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1930
- genre_or_form：fantastic short story
- one_sentence_summary：棋手Zviazline为筹婚资参加比赛，遭人下药后在幻游中见到时间与命运对弈；命运替他完成比赛，使他以全胜夺冠，随后与Efrozine结婚。

#### 署名研究说明（research_note_only）

- Luis Eduardo Wexell Machado在同一论文中把《Tempo e Destino》列为Rosa最早的幻想短篇之一，记其1930年6月22日发表于《O Cruzeiro》，并分析Zviazline的棋赛、麻醉后的超自然经历及命运替他完成比赛的结局。定位为P6 L213–216、P7–9 L217–310。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0535','WCD-10-B08:V1-ENT-0207','V1-ENT-0207','collection','《爱情、疯狂和死亡的故事》','奥拉西奥·基罗加','Cuentos de amor de locura y de muerte','乌拉圭','es','','短篇小说集','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《爱情、疯狂和死亡的故事》｜Cuentos de amor de locura y de muerte

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- one_sentence_summary：Quereilhac说明初版由作者从1906–1914年报刊发表的故事中选出18篇，后续版本减为15篇；她将其读作题材多样、以生命和死亡相互牵连的短篇拼图。

#### 署名研究说明（research_note_only）

- Quereilhac指出，初版18篇、后续第二/三版减为15篇；该集以“爱情、疯狂、死亡”无逗号的并置形成多样故事的共同张力。此释义限于该论文对该书版本与整体结构的说明。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0536','WCD-10-B08:V1-ENT-0208','V1-ENT-0208','collection','《丛林故事》','奥拉西奥·基罗加','Cuentos de la selva','乌拉圭','es','','儿童短篇小说集','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《丛林故事》｜Cuentos de la selva

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：儿童短篇小说集
- one_sentence_summary：Quereilhac把《丛林故事》概括为寓言、传说与史诗交叠的丛林世界；人与动物共享叙事属性，并共同面对死亡。此概述限于她对该书的论述。

#### 署名研究说明（research_note_only）

- Quereilhac把《丛林故事》概括为寓言、传说与史诗交叠的丛林世界；人与动物共享叙事属性，并共同面对死亡。此概述限于她对该书的论述。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0537','WCD-10-B08:V1-ENT-0209','V1-ENT-0209','collection','《流放者》','奥拉西奥·基罗加','Los desterrados','乌拉圭','es','','短篇小说集','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《流放者》｜Los desterrados

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：短篇小说集
- one_sentence_summary：Quereilhac将该集的人物概括为被城市文明排出的“exhombres”，在自我与强大自然之间挣扎；此处保留为该研究对全书叙事世界的概述。

#### 署名研究说明（research_note_only）

- Quereilhac将《Los desterrados》的叙事世界概括为被城市文明排出的“exhombres”，在自我与强大自然之间艰难挣扎；此处不把批评论断扩为地理关系。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0538','WCD-10-B08:V1-ENT-0214','V1-ENT-0214','work','《布拉斯·库巴斯死后的回忆》','马查多·德·阿西斯','Memórias Póstumas de Brás Cubas','巴西','pt','','novel','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《布拉斯·库巴斯死后的回忆》｜Memórias Póstumas de Brás Cubas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_periodical_publication_year：1880
- genre_or_form：novel
- one_sentence_summary：该页面将小说概括为采用元文学和自我指涉手法，叙述语调兼具讽刺、戏仿与反讽。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0539','WCD-10-B08:V1-ENT-0215','V1-ENT-0215','work','《金卡斯·博尔巴》','马查多·德·阿西斯','Quincas Borba','巴西','pt','','novel','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《金卡斯·博尔巴》｜Quincas Borba

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_periodical_publication_year：1886
- genre_or_form：novel
- one_sentence_summary：鲁比昂继承钱财以及一只名为Quincas Borba的狗后迁居里约，在财富带来的社会交往中逐渐陷入妄想；报刊连载与1891年书版作为同一小说的不同阶段处理。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0540','WCD-10-B08:V1-ENT-0216','V1-ENT-0216','work','《堂卡斯穆罗》','马查多·德·阿西斯','Dom Casmurro','巴西','pt','','novel','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《堂卡斯穆罗》｜Dom Casmurro

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：novel
- one_sentence_summary：本托·圣地亚哥回顾自己与卡皮图的关系，围绕嫉妒及对妻子是否不忠的怀疑展开叙述。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0541','WCD-10-B08:V1-ENT-0217','V1-ENT-0217','work','《广阔腹地：条条小径》','若昂·吉马朗埃斯·罗萨','Grande Sertão: Veredas','巴西','pt','','novel','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《广阔腹地：条条小径》｜Grande Sertão: Veredas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：novel
- one_sentence_summary：据ABL刊载的Ana Maria Machado文章，小说以与魔鬼的契约为轴，Riobaldo是主角，Diadorim则以战士身份及其后揭示的身份线索进入叙事。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0542','WCD-10-B08:V1-ENT-0218','V1-ENT-0218','collection','《萨加拉纳》','若昂·吉马朗埃斯·罗萨','Sagarana','巴西','pt','','short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《萨加拉纳》｜Sagarana

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：short_story_collection
- one_sentence_summary：据Daniela Diana的介绍，《Sagarana》使用富含古语、通俗词和新造词的创新、音乐性语言；她称米纳斯吉拉斯是作品中最常出现的地区，也提到里约热内卢和戈亚斯。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0543','WCD-10-B08:V1-ENT-0219','V1-ENT-0219','collection','《第一故事》','若昂·吉马朗埃斯·罗萨','Primeiras Estórias','巴西','pt','','short_story_collection','WCD-10-B08','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《第一故事》｜Primeiras Estórias

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：short_story_collection
- one_sentence_summary：据葡萄牙语博物馆馆藏简介，《Primeiras estórias》收录21篇短篇，以人的经验与sertão为背景，涉及生命、时间、爱情、死亡和存在之谜。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-1577','WCD10-B08-W001-F01','V1-CARD-0444','V1-ENT-0511','first_publication_year','1901','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1578','WCD10-B08-W001-F02','V1-CARD-0444','V1-ENT-0511','genre_or_form','诗、散文与故事混合的作品集','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1579','WCD10-B08-W001-F03','V1-CARD-0444','V1-ENT-0511','one_sentence_summary','据MEC国家文学学院与议会书目，该书把诗歌、散文和故事并置；文本页可见其诗作目录，因此作为混合体裁的早期作品集描述，不把它缩成单一诗集。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1580','WCD10-B08-W002-F01','V1-CARD-0445','V1-ENT-0512','first_publication_year','1904','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1581','WCD10-B08-W002-F02','V1-CARD-0445','V1-ENT-0512','genre_or_form','短篇小说集','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1582','WCD10-B08-W002-F03','V1-CARD-0445','V1-ENT-0512','one_sentence_summary','据Quálea出版社的书介，该集收入多篇早期小说；标题篇重写坡《告密的心》的犯罪叙述，书介将全书置于怪异、疯狂及死亡主题的早期创作语境。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1583','WCD10-B08-W003-F01','V1-CARD-0446','V1-ENT-0513','first_publication_year','1908','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1584','WCD10-B08-W003-F02','V1-CARD-0446','V1-ENT-0513','genre_or_form','中篇小说（nouvelle；亦称长篇故事）','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1585','WCD10-B08-W003-F03','V1-CARD-0446','V1-ENT-0513','one_sentence_summary','据原文，一名小说家在卢戈内斯家中初见卢卡斯·迪亚斯·贝莱斯；迪亚斯讲述自己在伤寒后曾被害妄想困扰，卢戈内斯随后揭示“被追捕者”其实就是迪亚斯本人，叙述者也开始疑心自己是否已被他算计。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1586','WCD10-B08-W004-F01','V1-CARD-0447','V1-ENT-0514','first_publication_year','1908','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1587','WCD10-B08-W004-F02','V1-CARD-0447','V1-ENT-0514','genre_or_form','中篇小说（novela corta）','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1588','WCD10-B08-W004-F03','V1-CARD-0447','V1-ENT-0514','one_sentence_summary','据小说原文，青年Rohán与姐妹Mercedes、Eglé先后发生情感纠葛；故事以多年后返回故地的重逢展开，关系在旧情、嫉妒与欲望间反复转折。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1589','WCD10-B08-W005-F01','V1-CARD-0448','V1-ENT-0515','first_publication_year','1920','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1590','WCD10-B08-W005-F02','V1-CARD-0448','V1-ENT-0515','genre_or_form','短篇小说集','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1591','WCD10-B08-W005-F03','V1-CARD-0448','V1-ENT-0515','one_sentence_summary','米西奥内斯公共图书馆所藏扫描本目录标注为1926年，目录列有标题篇及《El sueño》《La realidad》等；作品出版年1920另据S001，不能由1926馆藏目录推定1920初版目录。后编数字选本的标题篇中，瓜伊拉一名建有气象站的当地居民向到访者讲述曾与肉食性“nothosaurio”相伴。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1592','WCD10-B08-W006-F01','V1-CARD-0449','V1-ENT-0516','first_publication_year','1920','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1593','WCD10-B08-W006-F02','V1-CARD-0449','V1-ENT-0516','genre_or_form','四幕戏剧（cuento escénico）','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1594','WCD10-B08-W006-F03','V1-CARD-0449','V1-ENT-0516','one_sentence_summary','Octavio Nébel是到家乡度假的医学生；四幕戏以他与十五岁的Lidia相恋为中心，人物表和开场对话还引出Lidia的寡母Julia。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1595','WCD10-B08-W007-F01','V1-CARD-0450','V1-ENT-0517','first_publication_year','1921','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1596','WCD10-B08-W007-F02','V1-CARD-0450','V1-ENT-0517','genre_or_form','短篇小说集','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1597','WCD10-B08-W007-F03','V1-CARD-0450','V1-ENT-0517','one_sentence_summary','据文本页的标题篇内容，水蚺在森林遭人类侵入后召集蛇类开会，讨论怎样应对人类威胁；1921年同名卷与后来增补选本须区分。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1598','WCD10-B08-W008-F01','V1-CARD-0451','V1-ENT-0518','first_publication_year','1924','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1599','WCD10-B08-W008-F02','V1-CARD-0451','V1-ENT-0518','genre_or_form','短篇小说集','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1600','WCD10-B08-W008-F03','V1-CARD-0451','V1-ENT-0518','one_sentence_summary','馆藏记录所载简介明确转引Lecturalia；该简介称标题篇写丧偶的Subercasaux独自照料两个孩子，脚伤感染后仍外出寻找帮工。原版扫描目录另列十一篇；这十一篇数来自目录，不把简介误作馆藏机构原创，也不据后编材料补写初版目录。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1601','WCD10-B08-W009-F01','V1-CARD-0452','V1-ENT-0519','first_publication_year','1925','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1602','WCD10-B08-W009-F02','V1-CARD-0452','V1-ENT-0519','genre_or_form','短篇小说集','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1603','WCD10-B08-W009-F03','V1-CARD-0452','V1-ENT-0519','one_sentence_summary','据馆藏书目，1925年选集以《La gallina degollada》为题；原篇写Mazzini与Berta四个儿子因病障而被遗弃，夫妻将期望寄托于幼女Bertita，四兄弟目睹厨房杀鸡后模仿暴力并杀死妹妹。该原篇情节不被推作其余选篇目录。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1604','WCD10-B08-W010-F01','V1-CARD-0453','V1-ENT-0520','first_publication_year','1929','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1605','WCD10-B08-W010-F02','V1-CARD-0453','V1-ENT-0520','genre_or_form','中篇小说（novela corta）','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1606','WCD10-B08-W010-F03','V1-CARD-0453','V1-ENT-0520','one_sentence_summary','据直接阅读的小说，Morán离开两年后回到米西奥内斯，重新与Iñíguez家来往并被已长成的Magdalena吸引；他在农业、丛林和情感关系中重返旧生活，结尾因无法承受命运安排而离开。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1607','WCD10-B08-W011-F01','V1-CARD-0454','V1-ENT-0521','first_publication_year','1931','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1608','WCD10-B08-W011-F02','V1-CARD-0454','V1-ENT-0521','genre_or_form','学校读本（与Leonardo Glusberg合著）','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1609','WCD10-B08-W011-F03','V1-CARD-0454','V1-ENT-0521','one_sentence_summary','据Rea的研究，该校用读本含新写文本、《丛林故事》部分故事及动物短札；它依学校道德与教学规范编排，且由Quiroga与教师Leonardo Glusberg合作。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1610','WCD10-B08-W012-F01','V1-CARD-0455','V1-ENT-0522','first_publication_year','1935','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1611','WCD10-B08-W012-F02','V1-CARD-0455','V1-ENT-0522','genre_or_form','短篇小说集','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1612','WCD10-B08-W012-F03','V1-CARD-0455','V1-ENT-0522','one_sentence_summary','据MEC记录其1935年出版；Textos.info可读的后编11篇选本含《Más allá》《El vampiro》《El hijo》等，简介将这些不同故事概括为围绕死亡、丛林和人与自然关系的杂集。该目录不冒充1935初版目录。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1613','WCD10-B08-W013-F01','V1-CARD-0456','V1-ENT-0523','first_publication_year','1927','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1614','WCD10-B08-W013-F02','V1-CARD-0456','V1-ENT-0523','genre_or_form','创作论短文','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1615','WCD10-B08-W013-F03','V1-CARD-0456','V1-ENT-0523','one_sentence_summary','据原文，这组十条建议要求作者先明确故事方向、重视首尾、精确选词、少用不必要的形容词，并把人物一路带到结局；这些条目构成创作论而非虚构故事。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1616','WCD10-B08-W014-F01','V1-CARD-0457','V1-ENT-0524','first_publication_year','1925','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1617','WCD10-B08-W014-F02','V1-CARD-0457','V1-ENT-0524','genre_or_form','创作论短文','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1618','WCD10-B08-W014-F03','V1-CARD-0457','V1-ENT-0524','one_sentence_summary','据《Sobre el Arte de Contar Historias》中的《El manual del perfecto cuentista》，Quiroga以结尾句、leitmotiv、故事开头、惯用语等例子讨论短篇技法；本篇止于该文L97，不把下一篇的地方色彩、民俗等论述并入。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1619','WCD10-B08-W015-F01','V1-CARD-0458','V1-ENT-0525','first_publication_year','1925','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1620','WCD10-B08-W015-F02','V1-CARD-0458','V1-ENT-0525','genre_or_form','创作论短文','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1621','WCD10-B08-W015-F03','V1-CARD-0458','V1-ENT-0525','one_sentence_summary','据《Sobre el Arte de Contar Historias》中的《Los “trucs” del perfecto cuentista》（L98–142），作者讨论地方色彩与民俗，并举技术科学术语、词序及暗示人物结局的写法为故事技法；这些内容属于本篇，不归入前篇《El manual》。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1622','WCD10-B08-W016-F01','V1-CARD-0459','V1-ENT-0526','first_publication_year','1907','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1623','WCD10-B08-W016-F02','V1-CARD-0459','V1-ENT-0526','genre_or_form','短篇小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1624','WCD10-B08-W016-F03','V1-CARD-0459','V1-ENT-0526','one_sentence_summary','据短篇原文，Alicia婚后逐渐衰弱，医生无法解释贫血；丈夫后来在枕头内发现吸血寄生物，结局以室内怪异事件解释病因。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1625','WCD10-B08-W017-F01','V1-CARD-0460','V1-ENT-0527','first_publication_year','1909','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1626','WCD10-B08-W017-F02','V1-CARD-0460','V1-ENT-0527','genre_or_form','短篇小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1627','WCD10-B08-W017-F03','V1-CARD-0460','V1-ENT-0527','one_sentence_summary','据研究页面对原篇的分析，四个儿子目睹厨房杀鸡后将这一暴力动作转向妹妹；故事把家庭冲突、日光与血的意象并置。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1628','WCD10-B08-W018-F01','V1-CARD-0461','V1-ENT-0528','first_publication_year','1912','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1629','WCD10-B08-W018-F02','V1-CARD-0461','V1-ENT-0528','genre_or_form','短篇小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1630','WCD10-B08-W018-F03','V1-CARD-0461','V1-ENT-0528','one_sentence_summary','据文本页，《Una estación de amor》追叙Nébel与Lidia的恋情，从年轻时的相遇、分离到多年后的重逢；初刊时题为《Un sueño de amor》。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1631','WCD10-B08-W019-F01','V1-CARD-0462','V1-ENT-0529','first_publication_year','1912','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1632','WCD10-B08-W019-F02','V1-CARD-0462','V1-ENT-0529','genre_or_form','短篇小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1633','WCD10-B08-W019-F03','V1-CARD-0462','V1-ENT-0529','one_sentence_summary','据文本页，Paulino被毒蛇咬伤后划独木舟沿河求救，身体衰败与他对日常生活的回忆交错，叙事最终停在死亡逼近的一程河路上。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1634','WCD10-B08-W020-F01','V1-CARD-0463','V1-ENT-0530','first_publication_year','1920','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1635','WCD10-B08-W020-F02','V1-CARD-0463','V1-ENT-0530','genre_or_form','短篇小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1636','WCD10-B08-W020-F03','V1-CARD-0463','V1-ENT-0530','one_sentence_summary','据故事原文，农人结束田间活计时意外倒下，清醒地观察自己的身体、周围景物和死亡进程；年表所记1920-06-27不自动证明报纸名称。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1637','WCD10-B08-W021-F01','V1-CARD-0464','V1-ENT-0531','first_publication_year','1919','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1638','WCD10-B08-W021-F02','V1-CARD-0464','V1-ENT-0531','genre_or_form','短篇小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1639','WCD10-B08-W021-F03','V1-CARD-0464','V1-ENT-0531','one_sentence_summary','据Lefort逐段概述，叙述者Guillermo Grant迷恋影星Dorothy Phillips，以富有南美人的身份赴好莱坞接近她；日记式二十段叙事最后揭示求婚情节是一场梦。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1640','WCD10-B08-W021-F04','V1-CARD-0464','V1-ENT-0531','research_note','Lefort把作品读作以二十段日记制造读者受骗感：Grant对影星的追求先被写得近似可实现，末尾才以梦境揭露取消现实承诺；她据此讨论真实/幻象边界。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1641','WCD10-B08-W022-F01','V1-CARD-0465','V1-ENT-0532','first_publication_year','1928','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1642','WCD10-B08-W022-F02','V1-CARD-0465','V1-ENT-0532','genre_or_form','短篇小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1643','WCD10-B08-W022-F03','V1-CARD-0465','V1-ENT-0532','one_sentence_summary','据故事原文，十三岁的儿子出门打猎后没有按时回家，父亲在丛林寻找时反复看见幻影中的孩子并以为与他团聚；结尾揭示儿子当天上午十点已在跨越带刺铁丝时被猎枪事故致死，父亲仍独自回家。初刊署题《El padre》（1928），1935年改题《El hijo》收入《Más allá》。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1644','WCD10-B08-W023-F01','V1-CARD-0466','V1-ENT-0533','first_publication_year','1908','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1645','WCD10-B08-W023-F02','V1-CARD-0466','V1-ENT-0533','genre_or_form','以笔名S. Fragoso Lima发表的连载小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1646','WCD10-B08-W023-F03','V1-CARD-0466','V1-ENT-0533','one_sentence_summary','据Pionetti的连载研究，这部五期小说以倒叙展开复仇，叙述丛林中的原住民、人和野兽如何结盟反抗贫困与外来者滥权。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1647','WCD10-B08-W024-F01','V1-CARD-0467','V1-ENT-0534','first_publication_year','1909','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1648','WCD10-B08-W024-F02','V1-CARD-0467','V1-ENT-0534','genre_or_form','以笔名S. Fragoso Lima发表的连载小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1649','WCD10-B08-W024-F03','V1-CARD-0467','V1-ENT-0534','one_sentence_summary','据Pionetti的剧情概述，一位印度导师转生为猴，在布宜诺斯艾利斯向三千年前杀害自己的仇家后代复仇；文本借标题误导读者。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1650','WCD10-B08-W025-F01','V1-CARD-0468','V1-ENT-0535','first_publication_year','1910','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1651','WCD10-B08-W025-F02','V1-CARD-0468','V1-ENT-0535','genre_or_form','以笔名S. Fragoso Lima发表的连载小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1652','WCD10-B08-W025-F03','V1-CARD-0468','V1-ENT-0535','one_sentence_summary','据Sarti论文摘要，三名科学家试图不借助女性创造名为Biógeno的人造人；实验在感官能力的完成上失败，并牵涉科学、医学知识与自毁。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1653','WCD10-B08-W025-F04','V1-CARD-0468','V1-ENT-0535','research_note','Sarti将连载的叙事形式与电影蒙太奇联系，具体指出镜头式衔接、遮片和时间跳跃；她也把人造人实验放在科学/医学知识及自毁问题中分析。此释义限于论文摘要。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1654','WCD10-B08-W026-F01','V1-CARD-0469','V1-ENT-0536','first_publication_year','1911','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1655','WCD10-B08-W026-F02','V1-CARD-0469','V1-ENT-0536','genre_or_form','以笔名S. Fragoso Lima发表的连载小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1656','WCD10-B08-W026-F03','V1-CARD-0469','V1-ENT-0536','one_sentence_summary','据Pionetti引述的开篇，孟加拉虎Raja以第一人称讲述向驯兽师Kimberley复仇；故事用猛兽自述承载驯服、囚禁与报复情节。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1657','WCD10-B08-W028-F01','V1-CARD-0470','V1-ENT-0537','first_publication_year','1912','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1658','WCD10-B08-W028-F02','V1-CARD-0470','V1-ENT-0537','genre_or_form','以笔名S. Fragoso Lima发表的连载小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1659','WCD10-B08-W028-F03','V1-CARD-0470','V1-ENT-0537','one_sentence_summary','据数字文本可见片段，小说将故事置于Commodus死后的罗马：新帝Pertinax即位，Didio Juliano在奢华宴席中接待来客；Pionetti记录原作于1912年以“S. Fragoso Lima”署名在《Caras y Caretas》六期连载。数字摘录仅支持所见场景，不据此扩写全篇。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1660','WCD10-B08-W029-F01','V1-CARD-0471','V1-ENT-0538','first_publication_year','1906','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1661','WCD10-B08-W029-F02','V1-CARD-0471','V1-ENT-0538','genre_or_form','短篇小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1662','WCD10-B08-W029-F03','V1-CARD-0471','V1-ENT-0538','one_sentence_summary','据故事文本，船只漂流到港时船体完好却不见船员；一名幸存者解释船员遭遇无法抗拒的集体死亡冲动。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1663','WCD10-B08-W030-F01','V1-CARD-0472','V1-ENT-0539','first_publication_year','1908','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1664','WCD10-B08-W030-F02','V1-CARD-0472','V1-ENT-0539','genre_or_form','短篇小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1665','WCD10-B08-W030-F03','V1-CARD-0472','V1-ENT-0539','one_sentence_summary','据故事原文，农场狗察觉主人Míster Jones将在酷热中死去；Quereilhac把这种动物感知写作死亡预兆和“丛林故事”构造的一部分。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1666','WCD10-B08-W030-F04','V1-CARD-0472','V1-ENT-0539','research_note','Quereilhac把《La insolación》列作“丛林故事”：狗群预感主人死亡，使死亡先以动物感知的预兆进入日常农场空间。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1667','WCD10-B08-W031-F01','V1-CARD-0473','V1-ENT-0540','first_publication_year','1911','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1668','WCD10-B08-W031-F02','V1-CARD-0473','V1-ENT-0540','genre_or_form','短篇小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1669','WCD10-B08-W031-F03','V1-CARD-0473','V1-ENT-0540','one_sentence_summary','据故事原文及Quereilhac分析，Benincasa进入蚁群活动区域后被食肉蚁袭击；研究文章将袭击过程作为环境力量压倒人物的叙事例子。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1670','WCD10-B08-W031-F04','V1-CARD-0473','V1-ENT-0540','research_note','Quereilhac用Benincasa被食肉蚁袭击的情节说明《La miel silvestre》如何把危险环境和死亡逼近写进“丛林故事”；仅概述该论文对本篇的分析。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1671','WCD10-B08-W032-F01','V1-CARD-0474','V1-ENT-0541','first_publication_year','1912','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1672','WCD10-B08-W032-F02','V1-CARD-0474','V1-ENT-0541','genre_or_form','短篇小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1673','WCD10-B08-W032-F03','V1-CARD-0474','V1-ENT-0541','one_sentence_summary','据故事原文，两匹马触及带刺铁丝后试图越过围栏；此篇将牲畜对围挡的反应组织成冲突，1917年后收入故事集。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1674','WCD10-B08-W033-F01','V1-CARD-0475','V1-ENT-0542','first_publication_year','1918','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1675','WCD10-B08-W033-F02','V1-CARD-0475','V1-ENT-0542','genre_or_form','短篇小说（以单行小册子形式连载出版）','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1676','WCD10-B08-W033-F03','V1-CARD-0475','V1-ENT-0542','one_sentence_summary','据直接阅读的全文，巴西雇工Olivera以幽默而勤奋的方式在米西奥内斯打工，替主人开石井、在夜间与女佣Cirila相会；Cirila被毒蛇咬伤后，他协助救治，结尾主人发现他擅自用简易拖具拖运木桶，显出其不循常规的性格。首刊期号与年份另据目录。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1677','WCD10-B08-W034-F01','V1-CARD-0476','V1-ENT-0543','first_publication_year','1922','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1678','WCD10-B08-W034-F02','V1-CARD-0476','V1-ENT-0543','genre_or_form','Ferrari所述儿童故事连载系列，十篇；Dum-Dum向四个弟弟写信讲述冒险。','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1679','WCD10-B08-W034-F03','V1-CARD-0476','V1-ENT-0543','one_sentence_summary','据Ferrari研究导读，Dum-Dum以书信向四个弟弟讲述冒险；Ferrari将该连载系列记为十篇，1922年始于Mundo Argentino、1924年续见Billiken，后于逝后结集。Rea另以1978年选本为对象记述十二篇及父亲写给子女的叙述框架；两种版本/目录口径分列，不称彼此一致。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1680','WCD10-B08-W034-F04','V1-CARD-0476','V1-ENT-0543','bibliographic_note','Rea所讨论的1978年逝后选本为十二篇，并将叙述框架表述为父亲写给子女；此处只记录该选本的版本口径。','bibliographic_note','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1681','WCD10-B08-W035-F01','V1-CARD-0477','V1-ENT-0544','first_publication_year','1922','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1682','WCD10-B08-W035-F02','V1-CARD-0477','V1-ENT-0544','genre_or_form','描写米西奥内斯动植物的34篇短札连载系列','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1683','WCD10-B08-W035-F03','V1-CARD-0477','V1-ENT-0544','one_sentence_summary','Ferrari将系列概述为1922–1925年刊于Mundo Argentino、Billiken与Caras y Caretas的34则“丛林短札”，并称1967年才以书名结集；Rea提到Quiroga于1924年和1925年为Caras y Caretas撰写、题为De la vida de nuestros animales的短札。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1684','WCD10-B08-W036-F01','V1-CARD-0478','V1-ENT-0545','first_publication_year','1917','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1685','WCD10-B08-W036-F02','V1-CARD-0478','V1-ENT-0545','genre_or_form','短篇小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1686','WCD10-B08-W036-F03','V1-CARD-0478','V1-ENT-0545','one_sentence_summary','据Ferrari对原刊故事的分析，一名年轻人请小说家替自己写一封能打动女友的信；小说家拒绝代笔，认为年轻人真诚写下的话胜过熟练作者的技巧，并建议当面交谈解决争执。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1687','WCD10-B08-W036-F04','V1-CARD-0478','V1-ENT-0545','research_note','Ferrari将此篇读作对作者身份和写作限度的反思：故事中的小说家认为，经验不足以支撑对纯粹爱情的想象；文章又把作者自述“另有远多于署名作品”的说法，联系到杂志中的笔名、编辑与插图者共同分配表达的情形。释义限于该文对本篇的直接讨论。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1688','WCD10-B08-W037-F01','V1-CARD-0479','V1-ENT-0546','first_publication_year','1917','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1689','WCD10-B08-W037-F02','V1-CARD-0479','V1-ENT-0546','genre_or_form','短篇小说','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1690','WCD10-B08-W037-F03','V1-CARD-0479','V1-ENT-0546','one_sentence_summary','Ferrari将此篇描述为一则残酷的狩猎故事，指出它回响了Quiroga早期连载小说《Las fieras cómplices》，并把真正的“文明”问题置于城市与丛林的冲突中；故事原刊同页另有温彻斯特广告。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1691','WCD10-B08-W037-F04','V1-CARD-0479','V1-ENT-0546','research_note','Ferrari直接把《Una cacería》与《Las fieras cómplices》联系起来，认为两篇共同触及城市/丛林所代表的文明冲突；该文还指出，原刊故事页上的Winchester广告可能构成早期植入式广告，将虚构叙事与现实商业讯息并置。这里仅转述其明确提出的解释。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1692','WCD10-B08-W101-F01','V1-CARD-0480','V1-ENT-0547','first_publication_year','1872','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1693','WCD10-B08-W101-F02','V1-CARD-0480','V1-ENT-0547','genre_or_form','novel','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1694','WCD10-B08-W101-F03','V1-CARD-0480','V1-ENT-0547','one_sentence_summary','Machado首部长篇以青年医生Félix为中心，写他在富有的寡妇Lívia与内向的Raquel之间的情感纠葛。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1695','WCD10-B08-W102-F01','V1-CARD-0481','V1-ENT-0548','first_publication_year','1874','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1696','WCD10-B08-W102-F02','V1-CARD-0481','V1-ENT-0548','genre_or_form','novel','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1697','WCD10-B08-W102-F03','V1-CARD-0481','V1-ENT-0548','one_sentence_summary','女主人公Guiomar面对三名求婚者的追求、施压与胁迫；原作副题为“Um perfil de mulher”。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1698','WCD10-B08-W103-F01','V1-CARD-0482','V1-ENT-0549','first_publication_year','1876','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1699','WCD10-B08-W103-F02','V1-CARD-0482','V1-ENT-0549','genre_or_form','novel','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1700','WCD10-B08-W103-F03','V1-CARD-0482','V1-ENT-0549','one_sentence_summary','故事置于19世纪50年代，围绕Helena与Estácio之间受社会阶级及家庭关系阻隔的爱情展开。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1701','WCD10-B08-W104-F01','V1-CARD-0483','V1-ENT-0550','first_publication_year','1878','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1702','WCD10-B08-W104-F02','V1-CARD-0483','V1-ENT-0550','genre_or_form','novel','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1703','WCD10-B08-W104-F03','V1-CARD-0483','V1-ENT-0550','one_sentence_summary','小说交织Iaiá Garcia、Jorge与Estela的情感关系，以骄傲、迷恋、嫉妒、误解与羞愧等冲突展开，背景为巴拉圭战争。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1704','WCD10-B08-W105-F01','V1-CARD-0484','V1-ENT-0551','first_publication_year','1885','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1705','WCD10-B08-W105-F02','V1-CARD-0484','V1-ENT-0551','genre_or_form','novel','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1706','WCD10-B08-W105-F03','V1-CARD-0484','V1-ENT-0551','one_sentence_summary','一位老教士回忆自己到Casa Velha查阅旧档案，并观察Félix与Lalau在庄园家庭中的感情和家族关系；1944年Martins单行书版与早期《A Estação》连载层分开记录。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1707','WCD10-B08-W105-F04','V1-CARD-0484','V1-ENT-0551','first_book_edition_year','1944','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1708','WCD10-B08-W106-F01','V1-CARD-0485','V1-ENT-0552','first_publication_year','1904','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1709','WCD10-B08-W106-F02','V1-CARD-0485','V1-ENT-0552','genre_or_form','novel','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1710','WCD10-B08-W106-F03','V1-CARD-0485','V1-ENT-0552','one_sentence_summary','双胞胎Pedro与Paulo外貌相同而性格相反，两人都倾心于Flora，后来又分属对立政党；退休外交官Counselor Ayres以第三人称叙述。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1711','WCD10-B08-W107-F01','V1-CARD-0486','V1-ENT-0553','first_publication_year','1908','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1712','WCD10-B08-W107-F02','V1-CARD-0486','V1-ENT-0553','genre_or_form','novel','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1713','WCD10-B08-W107-F03','V1-CARD-0486','V1-ENT-0553','one_sentence_summary','小说由退休外交官Counselor Ayres的日记条目构成；他记录晚年生活、爱与孤独，并回望帝国时期和新共和国初期。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1714','WCD10-B08-W108-F01','V1-CARD-0487','V1-ENT-0554','first_publication_year','1870','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1715','WCD10-B08-W108-F02','V1-CARD-0487','V1-ENT-0554','genre_or_form','short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1716','WCD10-B08-W108-F03','V1-CARD-0487','V1-ENT-0554','one_sentence_summary','1870年结集的七篇短篇此前曾发表于《Jornal das Famílias》，包括《Frei Simão》和《Linha reta e linha curva》。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1717','WCD10-B08-W109-F01','V1-CARD-0488','V1-ENT-0555','first_publication_year','1873','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1718','WCD10-B08-W109-F02','V1-CARD-0488','V1-ENT-0555','genre_or_form','short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1719','WCD10-B08-W109-F03','V1-CARD-0488','V1-ENT-0555','one_sentence_summary','首版目录列出六篇：《A parasita azul》《As bodas de Luiz Duarte》《Ernesto de Tal》《Aurora sem dia》《O relógio de ouro》《Ponto de vista》；作者卷首说明称这些是其汇集的短篇叙事。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1720','WCD10-B08-W110-F01','V1-CARD-0489','V1-ENT-0556','first_publication_year','1882','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1721','WCD10-B08-W110-F02','V1-CARD-0489','V1-ENT-0556','genre_or_form','short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1722','WCD10-B08-W110-F03','V1-CARD-0489','V1-ENT-0556','one_sentence_summary','十二篇故事的合集，包括《O alienista》中Simão Bacamarte反复改定Casa Verde收治标准，以及对话体《Teoria do medalhão》中父亲教成年儿子经营声望；目录据首版馆藏记录。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1723','WCD10-B08-W111-F01','V1-CARD-0490','V1-ENT-0557','first_publication_year','1884','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1724','WCD10-B08-W111-F02','V1-CARD-0490','V1-ENT-0557','genre_or_form','short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1725','WCD10-B08-W111-F03','V1-CARD-0490','V1-ENT-0557','one_sentence_summary','首版目录列出18篇短篇，包括《A igreja do diabo》《O lapso》《As academias de Sião》等；作者卷首说明这些故事并非专属于某一天或某个特定日子的故事。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1726','WCD10-B08-W112-F01','V1-CARD-0491','V1-ENT-0558','first_publication_year','1895','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1727','WCD10-B08-W112-F02','V1-CARD-0491','V1-ENT-0558','genre_or_form','short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1728','WCD10-B08-W112-F03','V1-CARD-0491','V1-ENT-0558','one_sentence_summary','十六篇此前刊于《Gazeta de Notícias》的短篇由作者选编成集；1895年10月中旬报刊已有到货消息或书评，馆藏首版标示1896年。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1729','WCD10-B08-W112-F04','V1-CARD-0491','V1-ENT-0558','first_book_edition_year','1896','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1730','WCD10-B08-W112-F05','V1-CARD-0491','V1-ENT-0558','research_note','Daniele Maria Megid 分析 Várias histórias 的作者编选过程：所收16篇最初发表于1884–1891年，书籍以1896为首版年份，但里约报刊自1895年10月中旬已出现书评或到货消息；本文据此将1895标作最早可证流通线索，将1896保留为首版题年，具体首次售卖日仍未由原刊影印本核实。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1731','WCD10-B08-W113-F01','V1-CARD-0492','V1-ENT-0559','first_publication_year','1899','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1732','WCD10-B08-W113-F02','V1-CARD-0492','V1-ENT-0559','genre_or_form','collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1733','WCD10-B08-W113-F03','V1-CARD-0492','V1-ENT-0559','one_sentence_summary','馆藏目录将11项列在“Contos”组（其中包括纪念或评论文字），另列剧作《Tu, só tu, puro amor》和六篇《Chronicas》；该书因此是混合文类选集。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1734','WCD10-B08-W114-F01','V1-CARD-0493','V1-ENT-0560','first_publication_year','1906','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1735','WCD10-B08-W114-F02','V1-CARD-0493','V1-ENT-0560','genre_or_form','collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1736','WCD10-B08-W114-F03','V1-CARD-0493','V1-ENT-0560','one_sentence_summary','1906年出版的作者合集；当前直接核实的合集内剧作《Lição de Botânica》首次收入本书，整本目录构成仍待逐项核对。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1737','WCD10-B08-W115-F01','V1-CARD-0494','V1-ENT-0561','first_publication_year','1864','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1738','WCD10-B08-W115-F02','V1-CARD-0494','V1-ENT-0561','genre_or_form','poetry_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1739','WCD10-B08-W115-F03','V1-CARD-0494','V1-ENT-0561','one_sentence_summary','1864年诗集的馆藏目录列29首作品；另有一篇直接研究该书的论文具体分析《Os arlequins》《Epitáfio do México》《Polônia》。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1740','WCD10-B08-W116-F01','V1-CARD-0495','V1-ENT-0562','first_publication_year','1870','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1741','WCD10-B08-W116-F02','V1-CARD-0495','V1-ENT-0562','genre_or_form','poetry_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1742','WCD10-B08-W116-F03','V1-CARD-0495','V1-ENT-0562','one_sentence_summary','《Falenas》以诗歌为主，馆藏目录分列“Varia”和“Lyra Chineza”，并同时收有戏剧诗《Uma Ode de Anacreonte》及短篇《Pallida Elvira》。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1743','WCD10-B08-W117-F01','V1-CARD-0496','V1-ENT-0563','first_publication_year','1875','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1744','WCD10-B08-W117-F02','V1-CARD-0496','V1-ENT-0563','genre_or_form','poetry_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1745','WCD10-B08-W117-F03','V1-CARD-0496','V1-ENT-0563','one_sentence_summary','1875年诗集目录列13首诗，包括题材涉及原住民的《Potira》《Niani》，叙述新基督徒爱情的《A Cristã Nova》，以及涉及奴隶制的《Sabina》；后两项内容说明按馆藏目录转引的评论限定。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1746','WCD10-B08-W118-F01','V1-CARD-0497','V1-ENT-0564','first_publication_year','1901','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1747','WCD10-B08-W118-F02','V1-CARD-0497','V1-ENT-0564','genre_or_form','collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1748','WCD10-B08-W118-F03','V1-CARD-0497','V1-ENT-0564','one_sentence_summary','1901年诗歌汇编重收并修订《Crisálidas》《Falenas》《Americanas》中的部分诗作，另加入《Ocidentais》；它是独立的书本汇编层。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1749','WCD10-B08-W119-F01','V1-CARD-0498','V1-ENT-0565','first_publication_year','1863','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1750','WCD10-B08-W119-F02','V1-CARD-0498','V1-ENT-0565','genre_or_form','collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1751','WCD10-B08-W119-F03','V1-CARD-0498','V1-ENT-0565','one_sentence_summary','1863年《Theatro》第一卷收录两部首演喜剧《O caminho da porta》和《O protocolo》，并附通信文字；原卷本身不等同于其中两部剧作或其演出。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1752','WCD10-B08-W120-F01','V1-CARD-0499','V1-ENT-0566','first_publication_year','1861','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1753','WCD10-B08-W120-F02','V1-CARD-0499','V1-ENT-0566','genre_or_form','play','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1754','WCD10-B08-W120-F03','V1-CARD-0499','V1-ENT-0566','one_sentence_summary','《Desencantos》是一部以Clara、Luís de Melo和Pedro Alves为中心的“Fantasia Dramática”：数年后，Luís向Pedro的继女求婚并获其同意。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1755','WCD10-B08-W121-F01','V1-CARD-0500','V1-ENT-0567','first_publication_year','1864','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1756','WCD10-B08-W121-F02','V1-CARD-0500','V1-ENT-0567','genre_or_form','play','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1757','WCD10-B08-W121-F03','V1-CARD-0500','V1-ENT-0567','one_sentence_summary','这部一幕喜剧写议员Martins等待入阁时，一群求恩者蜂拥上门；任命落空后，逐利的奉承者离去，暴露政治庇护关系。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1758','WCD10-B08-W122-F01','V1-CARD-0501','V1-ENT-0568','first_publication_year','1866','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1759','WCD10-B08-W122-F02','V1-CARD-0501','V1-ENT-0568','genre_or_form','play','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1760','WCD10-B08-W122-F03','V1-CARD-0501','V1-ENT-0568','one_sentence_summary','这部喜剧让奥林匹斯诸神穿上现代礼服并讨论人间事务；作者序称其为由短对话构成的简约讽刺，正文以亚历山大诗行写成。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1761','WCD10-B08-W123-F01','V1-CARD-0502','V1-ENT-0569','first_publication_year','1880','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1762','WCD10-B08-W123-F02','V1-CARD-0502','V1-ENT-0569','genre_or_form','play','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1763','WCD10-B08-W123-F03','V1-CARD-0502','V1-ENT-0569','one_sentence_summary','喜剧将Camões与D. Catarina de Ataíde的恋情搬上舞台；1880年发表于《Revista Brasileira》并于纪念庆典演出，1881年收入书本。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1764','WCD10-B08-W123-F04','V1-CARD-0502','V1-ENT-0569','first_book_edition_year','1881','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1765','WCD10-B08-W124-F01','V1-CARD-0503','V1-ENT-0570','first_publication_year','1873','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1766','WCD10-B08-W124-F02','V1-CARD-0503','V1-ENT-0570','genre_or_form','critical_essay','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1767','WCD10-B08-W124-F03','V1-CARD-0503','V1-ENT-0570','one_sentence_summary','发表于《O Novo Mundo》的批评文章，分论小说、诗歌、戏剧与语言；BNDigital记刊期为1873年3月24日。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1768','WCD10-B08-W125-F01','V1-CARD-0504','V1-ENT-0571','first_publication_year','1906','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1769','WCD10-B08-W125-F02','V1-CARD-0504','V1-ENT-0571','genre_or_form','play','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1770','WCD10-B08-W125-F03','V1-CARD-0504','V1-ENT-0571','one_sentence_summary','植物学家兼男爵Segismundo为维护侄子Henrique的科学独身，要求姨母阻断他与Cecília的恋情；D. Helena巧用男爵的植物学著作促成两人和解，也让男爵向自己求婚。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1771','WCD10-B08-W126-F01','V1-CARD-0505','V1-ENT-0572','first_publication_year','1899','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1772','WCD10-B08-W126-F02','V1-CARD-0505','V1-ENT-0572','genre_or_form','play','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1773','WCD10-B08-W126-F03','V1-CARD-0505','V1-ENT-0572','one_sentence_summary','D. Leocádia认为修道院不能治愈Cavalcante的失恋，转而建议他赴中国传教；他与同样失恋的Carlota相互倾诉后相爱并决定结婚。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1774','WCD10-B08-W127-F01','V1-CARD-0506','V1-ENT-0573','first_publication_year','1956','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1775','WCD10-B08-W127-F02','V1-CARD-0506','V1-ENT-0573','genre_or_form','short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1776','WCD10-B08-W127-F03','V1-CARD-0506','V1-ENT-0573','one_sentence_summary','Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“O anjo Rafael”。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1777','WCD10-B08-W128-F01','V1-CARD-0507','V1-ENT-0574','first_publication_year','1956','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1778','WCD10-B08-W128-F02','V1-CARD-0507','V1-ENT-0574','genre_or_form','short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1779','WCD10-B08-W128-F03','V1-CARD-0507','V1-ENT-0574','one_sentence_summary','Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“Decadência de dois grandes homens”与“Um esqueleto”。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1780','WCD10-B08-W129-F01','V1-CARD-0508','V1-ENT-0575','first_publication_year','1956','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1781','WCD10-B08-W129-F02','V1-CARD-0508','V1-ENT-0575','genre_or_form','short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1782','WCD10-B08-W129-F03','V1-CARD-0508','V1-ENT-0575','one_sentence_summary','Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“O capitão Mendonça”。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1783','WCD10-B08-W130-F01','V1-CARD-0509','V1-ENT-0576','first_publication_year','1956','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1784','WCD10-B08-W130-F02','V1-CARD-0509','V1-ENT-0576','genre_or_form','short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1785','WCD10-B08-W130-F03','V1-CARD-0509','V1-ENT-0576','one_sentence_summary','Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“A vida eterna”与“Os óculos de Pedro Antão”。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1786','WCD10-B08-W131-F01','V1-CARD-0510','V1-ENT-0577','first_publication_year','1956','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1787','WCD10-B08-W131-F02','V1-CARD-0510','V1-ENT-0577','genre_or_form','short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1788','WCD10-B08-W131-F03','V1-CARD-0510','V1-ENT-0577','one_sentence_summary','Raimundo Magalhães Júnior 1956年编选的短篇集，目录列有“A mulher pálida”。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1789','WCD10-B08-W132-F01','V1-CARD-0511','V1-ENT-0578','first_publication_year','1958','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1790','WCD10-B08-W132-F02','V1-CARD-0511','V1-ENT-0578','genre_or_form','short_story_and_chronicle_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1791','WCD10-B08-W132-F03','V1-CARD-0511','V1-ENT-0578','one_sentence_summary','目录示例列《O Teles e o Tobias》和《O carro nº 13》；Google Books 记录该卷由 Raimundo Magalhães Júnior 编，Civilização Brasileira 于1958年出版。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1792','WCD10-B08-W133-F01','V1-CARD-0512','V1-ENT-0579','first_publication_year','1973','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1793','WCD10-B08-W133-F02','V1-CARD-0512','V1-ENT-0579','genre_or_form','short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1794','WCD10-B08-W133-F03','V1-CARD-0512','V1-ENT-0579','one_sentence_summary','Raimundo Magalhães Júnior 1973年编选的十一篇故事，包括《A chinela turca》《A mulher pálida》《O anjo Rafael》与《O capitão Mendonça》；研究指出其中仅两篇曾由 Machado 自行选入生前单行本。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1795','WCD10-B08-W134-F01','V1-CARD-0513','V1-ENT-0580','first_publication_year','1910','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1796','WCD10-B08-W134-F02','V1-CARD-0513','V1-ENT-0580','genre_or_form','critical_anthology','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1797','WCD10-B08-W134-F03','V1-CARD-0513','V1-ENT-0580','one_sentence_summary','Mário de Alencar 编辑的1910年遗著选集；目录从《Instinto de nacionalidade》《Guilherme Malta》《Castro Alves》列至评论与序文，篇目性质为文学批评及序言。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1798','WCD10-B08-W135-F01','V1-CARD-0514','V1-ENT-0581','first_publication_year','1910','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1799','WCD10-B08-W135-F02','V1-CARD-0514','V1-ENT-0581','genre_or_form','mixed_prose_poetry_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1800','WCD10-B08-W135-F03','V1-CARD-0514','V1-ENT-0581','one_sentence_summary','1910年Garnier卷的目录列八篇散文及六篇诗作（含《O Almada》《Réfus》）；卷首说明称收录故事、诗和散页，来自作者创作较成熟作品的时期。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1801','WCD10-B08-W136-F01','V1-CARD-0515','V1-ENT-0582','first_publication_year','1932','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1802','WCD10-B08-W136-F02','V1-CARD-0515','V1-ENT-0582','genre_or_form','correspondence_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1803','WCD10-B08-W136-F03','V1-CARD-0515','V1-ENT-0582','one_sentence_summary','Fernando Nery 1932年编注的通信集，约232项，收入 Machado 致 Nabuco、Veríssimo、Mário de Alencar、Lúcio de Mendonça等人的信，也包括若干收信人的回复。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1804','WCD10-B08-W137-F01','V1-CARD-0516','V1-ENT-0583','first_publication_year','1956','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1805','WCD10-B08-W137-F02','V1-CARD-0516','V1-ENT-0583','genre_or_form','chronicle_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1806','WCD10-B08-W137-F03','V1-CARD-0516','V1-ENT-0583','one_sentence_summary','1956年卷的副题说明其从《Gazeta de notícias》辑录1886年的“A + B”及1888—1889年的“Bons dias”；学术研究称收全“A + B”与除一篇外的“Bons Dias”，为“A + B”首个书本版。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1807','WCD10-B08-W138-F01','V1-CARD-0517','V1-ENT-0584','first_publication_year','1881','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1808','WCD10-B08-W138-F02','V1-CARD-0517','V1-ENT-0584','genre_or_form','short_story','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1809','WCD10-B08-W138-F03','V1-CARD-0517','V1-ENT-0584','one_sentence_summary','医生Simão Bacamarte在Itaguaí建Casa Verde研究并分类“疯癫”；当收治人数达到全镇人口五分之四，他改换理性标准释放众人，最后又把自己收治。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1810','WCD10-B08-W138-F04','V1-CARD-0517','V1-ENT-0584','first_book_edition_year','1882','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1811','WCD10-B08-W138-F05','V1-CARD-0517','V1-ENT-0584','research_note','Sandra Mara da Silva Franca 的 USP 硕士论文比较《O Alienista》在《A Estação》与《Papéis Avulsos》中的版本，并依据叙事焦点与文体论证其为“conto”，而非“novela”；论文还指出1881–1882连载本到1882年Lombaerts书版之间存在作者修订。此处按其明确的类型判断记录，不抹去葡语批评史上的类型争议。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1812','WCD10-B08-W201-F01','V1-CARD-0518','V1-ENT-0585','first_publication_year','1956','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1813','WCD10-B08-W201-F02','V1-CARD-0518','V1-ENT-0585','genre_or_form','novel_cycle','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1814','WCD10-B08-W201-F03','V1-CARD-0518','V1-ENT-0585','one_sentence_summary','《Corpo de Baile》以七个分别命名的叙事构成循环性作品；Calzolari考察其印刷谱系：1956年初版为两卷，1960年第二版合为一卷，至第三版（1964/65）才拆成三册自主卷本。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1815','WCD10-B08-W201-F04','V1-CARD-0518','V1-ENT-0585','research_note','Tereza Paula Alves Calzolari在《Tradição impressa de Corpo de Baile》中对照初版、第二版与第三版的题名、卷数和目录分类，并指出初版对内部篇目采用多种文类标注；本候选据此把1956合卷与后来的三册区分为不同版本层，不将七篇一概定作短篇小说。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1816','WCD10-B08-W202-F01','V1-CARD-0519','V1-ENT-0586','first_publication_year','1947','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1817','WCD10-B08-W202-F02','V1-CARD-0519','V1-ENT-0586','genre_or_form','reportagem / 文学旅行叙述（reportagem特征据Andrea Ramos Jubé Vianna 2019年题录摘要）','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1818','WCD10-B08-W202-F03','V1-CARD-0519','V1-ENT-0586','one_sentence_summary','USP书目记录将《Com o vaqueiro Mariano》相关报刊文本列为1947–48年分期刊载，并另记1952年独立小书及其后收入《Estas estórias》（S204 L22–46、L48–106；S212）。该页面对Andrea Ramos Jubé Vianna 2019年研究的摘要称文本具有reportagem特征（S204 L256–269）；原论文未读。S204 L282–294另列Guilherme Mazzafera e Silva Vilhena 2017年的不同研究，reportagem说法不归于该研究。ABL所记1952年行旅只用于行旅年代，不证明1947年首发（S203）。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1819','WCD10-B08-W202-F04','V1-CARD-0519','V1-ENT-0586','bibliographic_note','USP机构书目记录《Com o vaqueiro Mariano》的1952年独立书版及1947–48年报刊分期（S204 L22–46、L48–106）。同一页面对Andrea Ramos Jubé Vianna 2019年研究的题录摘要称文本具有reportagem特征（S204 L256–269）；原论文未读。页面L282–294另列Guilherme Mazzafera e Silva Vilhena 2017年的另一研究，不将reportagem结论归给Vilhena。ABL记录作者1952年行旅（S203），不支持报刊首发年。','bibliographic_note','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1820','WCD10-B08-W203-F01','V1-CARD-0520','V1-ENT-0587','first_publication_year','1967','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1821','WCD10-B08-W203-F02','V1-CARD-0520','V1-ENT-0587','genre_or_form','short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1822','WCD10-B08-W203-F03','V1-CARD-0520','V1-ENT-0587','one_sentence_summary','由40篇极短叙事和4篇前言构成；书名为Tutameia，Terceiras estórias是其副题/第二命名层，不是另一部作品，也不暗示存在同作者的“第二故事”书。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1823','WCD10-B08-W203-F04','V1-CARD-0520','V1-ENT-0587','research_note','Maíra Pinheiro Tavares指出，Tutameia以双目录组织44篇文本：40篇归作“Contos”，另4篇标为“Prefácios”，其中三篇穿插在叙事之间；她据此讨论这些副文本和排列如何共同形成全书的节奏与谜样结构（S206，P16–17 L205–242）。她还将短篇的高度凝缩与语言的音乐性相连（摘要P9 L71–99）。此处仅归属该论文的文本结构/形式发现。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1824','WCD10-B08-W204-F01','V1-CARD-0521','V1-ENT-0588','first_publication_year','1969','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1825','WCD10-B08-W204-F02','V1-CARD-0521','V1-ENT-0588','genre_or_form','short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1826','WCD10-B08-W204-F03','V1-CARD-0521','V1-ENT-0588','one_sentence_summary','S230书目将《Estas estórias》1969年初版列为九篇：A simples e exata estória do burrinho do comandante、Os chapéus transeuntes、Entremeio: com o vaqueiro Mariano、A estória do Homem do Pinguelo、Meu tio o Iauaretê、Bicho mau、Páramo、Retábulo de São Nunca、O dar das pedras brilhantes（L127）。USP目录也将“Entremeio”列作本集篇目（S212 L87–101），与1952年独立小书版分属不同出版层。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1827','WCD10-B08-W205-F01','V1-CARD-0522','V1-ENT-0589','first_publication_year','1970','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1828','WCD10-B08-W205-F02','V1-CARD-0522','V1-ENT-0589','genre_or_form','miscellany / mixed-genre collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1829','WCD10-B08-W205-F03','V1-CARD-0522','V1-ENT-0589','one_sentence_summary','据Elvira Livonete Costa对该遗作杂集的研究，书中汇集诗、短篇叙事、日记、旅行札记等形式，并重组作者1947至1967年间的报刊文字。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1830','WCD10-B08-W206-F01','V1-CARD-0523','V1-ENT-0590','first_publication_year','1997','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1831','WCD10-B08-W206-F02','V1-CARD-0523','V1-ENT-0590','genre_or_form','poetry_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1832','WCD10-B08-W206-F03','V1-CARD-0523','V1-ENT-0590','one_sentence_summary','一部诗集，曾获巴西文学院诗歌奖，按作者意愿长期未刊，直至1997年才身后出版。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1833','WCD10-B08-W207-F01','V1-CARD-0524','V1-ENT-0591','first_publication_year','1961','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1834','WCD10-B08-W207-F02','V1-CARD-0524','V1-ENT-0591','genre_or_form','collaborative detective novel','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1835','WCD10-B08-W207-F03','V1-CARD-0524','V1-ENT-0591','research_note','Santos在2016年UEL硕士论文P44–45讨论另一部小说时，将《O mistério dos MMM》作为简短背景例子，列出1962年书本出版、十位作者及逐章接写；该论文研究对象并非本书（S211）。Leszczynski与Soares的2022年论文P4 L154–156将若昂·吉马朗埃斯·罗萨与若热·亚马多列为十位合作者中的两位（S224）。S224 P2 L95–96另称本书于1964年在《O Cruzeiro》连载、后来出版成书；此处只转述该论文说法，不将1964年作为事实首发年；该说法与W207-F05书目注释中所据1961年连载记录冲突。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1836','WCD10-B08-W207-F04','V1-CARD-0524','V1-ENT-0591','one_sentence_summary','据Leszczynski与Soares的研究，故事从科帕卡巴纳一名富翁公寓内的谋杀案展开，现场三封由不同笔迹写成、署名均为“M”的信把调查引向三名女性；十位作者各接写一章，逐步续写谜案。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1837','WCD10-B08-W207-F05','V1-CARD-0524','V1-ENT-0591','bibliographic_note','可核的最早发表时间为1961年：Covizzi与Verlangieri的学术书目L125–126将《O Mistério dos MMM》（Rosa第七章）记为1961年10–12月发表于《O Cruzeiro》，并另列Rio de Janeiro: Ed. O Cruzeiro, 1962（S230）。ABL作者书目列合作书本版为1962（S201 L30），帕拉州基金会馆藏目录著录“Rio de Janeiro: O Cruzeiro, 1962, 208 p.”（S229 L2–3）。S224 P2 L95–96称作品于1964年在《O Cruzeiro》连载、后来也出版成书；与已核1961年连载及1962年书版冲突，保留为来源中的相反年代说法。Santos的2016年UEL论文P44–45仅顺带列1962、十位作者和逐章接写，不是本书专论。','bibliographic_note','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1838','WCD10-B08-W208-F01','V1-CARD-0525','V1-ENT-0592','first_publication_year','1964','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1839','WCD10-B08-W208-F02','V1-CARD-0525','V1-ENT-0592','genre_or_form','collective short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1840','WCD10-B08-W208-F03','V1-CARD-0525','V1-ENT-0592','one_sentence_summary','七位作者的合作故事集；USP目录确认若昂·吉马朗埃斯·罗萨为合作者之一，并记载其篇目“Os chapéus transeuntes”位于本书第1–36页。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1841','WCD10-B08-W209-F01','V1-CARD-0526','V1-ENT-0593','first_publication_year','1956','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1842','WCD10-B08-W209-F02','V1-CARD-0526','V1-ENT-0593','genre_or_form','narrative_text','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1843','WCD10-B08-W209-F03','V1-CARD-0526','V1-ENT-0593','one_sentence_summary','Erich Soares Nogueira在《Campo geral》研究摘要中将Miguilim描述为一个近视男孩，凭身体感官经验和讲故事来理解周围世界，并以叙事应对童年的恐惧与死亡。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1844','WCD10-B08-W209-F04','V1-CARD-0526','V1-ENT-0593','research_note','Erich Soares Nogueira在对《Campo geral》的研究摘要中把Miguilim描述为凭感官经验认识世界、并通过讲故事应对充满疑虑、恐惧和死亡的童年；这是该文的研究性概括，不是对所有篇章形式分类的判断。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1845','WCD10-B08-W210-F01','V1-CARD-0527','V1-ENT-0594','first_publication_year','1956','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1846','WCD10-B08-W210-F02','V1-CARD-0527','V1-ENT-0594','genre_or_form','narrative_text','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1847','WCD10-B08-W210-F03','V1-CARD-0527','V1-ENT-0594','one_sentence_summary','Franciane Conceição da Silva的研究摘要指出，Manuelzão外显的强悍和勇敢与其隐而未露的焦虑、不安形成张力。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1848','WCD10-B08-W210-F04','V1-CARD-0527','V1-ENT-0594','research_note','Franciane Conceição da Silva以男性气质为问题切入《Uma estória de amor》，摘要指出Manuelzão强悍的外表掩藏焦虑与不安；此处将解释明确归属该研究。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1849','WCD10-B08-W211-F01','V1-CARD-0528','V1-ENT-0595','first_publication_year','1956','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1850','WCD10-B08-W211-F02','V1-CARD-0528','V1-ENT-0595','genre_or_form','narrative_text','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1851','WCD10-B08-W211-F03','V1-CARD-0528','V1-ENT-0595','one_sentence_summary','Danilo Almeida Patrício的研究摘要将Lélio写作一名从城市返回米纳斯吉拉斯荒原的牧牛人，其主要经历发生在Pinhém农庄。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1852','WCD10-B08-W211-F04','V1-CARD-0528','V1-ENT-0595','research_note','Danilo Almeida Patrício以“Saudades de destino”为题讨论《A estória de Lélio e Lina》，摘要聚焦Lélio在Pinhém的经历以及人物和世界如何呈现“规则之外”的力量；此处只采用摘要明确列出的地点与研究角度。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1853','WCD10-B08-W212-F01','V1-CARD-0529','V1-ENT-0596','first_publication_year','1956','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1854','WCD10-B08-W212-F02','V1-CARD-0529','V1-ENT-0596','genre_or_form','narrative_text','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1855','WCD10-B08-W212-F03','V1-CARD-0529','V1-ENT-0596','one_sentence_summary','据Ana Paula Pinto对该篇的分析，Pedro Orósio随五人旅行队穿越sertão，逐段传递的山中预言揭露同伴谋害他的阴谋；他在最后关头获救，结局被作者阐释为惩罚与救赎。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1856','WCD10-B08-W212-F04','V1-CARD-0529','V1-ENT-0596','research_note','Ana Paula Pinto在《O recado do Morro: profecia e redenção》中分析预言由七重传递、谋害计划以及Pedro Orósio最后关头获救之间的结构，并以“惩罚与救赎”解释结局。定位据论文全文P2 L81–89、P6–7 L245–260，不只据摘要。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1857','WCD10-B08-W213-F01','V1-CARD-0530','V1-ENT-0597','first_publication_year','1956','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1858','WCD10-B08-W213-F02','V1-CARD-0530','V1-ENT-0597','genre_or_form','novella','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1859','WCD10-B08-W213-F03','V1-CARD-0530','V1-ENT-0597','one_sentence_summary','Biagio D’Angelo把《Dão-Lalalão》称作一部中篇叙事，围绕Soropita与Doralda的肉身之爱展开，并把欲望解释为趋向圆满的动力。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1860','WCD10-B08-W213-F04','V1-CARD-0530','V1-ENT-0597','research_note','Biagio D’Angelo在《Dão-Lalalão, a reescrita do desejo》中以欲望与重写为研究角度，讨论Soropita与Doralda的夫妻关系及肉身之爱；该文称其为“romance breve”，故候选采用中篇叙事这一较中性的文类值。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1861','WCD10-B08-W214-F01','V1-CARD-0531','V1-ENT-0598','first_publication_year','1956','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1862','WCD10-B08-W214-F02','V1-CARD-0531','V1-ENT-0598','genre_or_form','narrative_text','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1863','WCD10-B08-W214-F03','V1-CARD-0531','V1-ENT-0598','one_sentence_summary','Maria da Glória Sá Rosa对《Cara-de-Bronze》的摘要介绍一位误以为自己害死父亲的隐居庄园主；他在晚年派牧牛人Grivo远行探寻事物本质，并请他讲述见闻。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1864','WCD10-B08-W214-F04','V1-CARD-0531','V1-ENT-0598','research_note','Maria da Glória Sá Rosa以“电影语言或神秘主义”为研究切入，摘要把主人公误解父亲死因、Grivo奉命远行以及带回讲述联系起来；候选只转述作者明确列出的情节和研究问题。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1865','WCD10-B08-W215-F01','V1-CARD-0532','V1-ENT-0599','first_publication_year','1956','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1866','WCD10-B08-W215-F02','V1-CARD-0532','V1-ENT-0599','genre_or_form','narrative_text','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1867','WCD10-B08-W215-F03','V1-CARD-0532','V1-ENT-0599','one_sentence_summary','Sarah Maria Forte Diogo的研究摘要指出，Lalinha抵达Buriti Bom后打破农庄封闭的父权秩序，并使其中的欲望与人物关系显露出来。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1868','WCD10-B08-W215-F04','V1-CARD-0532','V1-ENT-0599','research_note','Sarah Maria Forte Diogo在《O mundo que perdeu suas paredes》中把Lalinha置于封闭农庄秩序、女性欲望与情色关系的讨论中心；此处的父权秩序解释归属于该研究，不扩张为未经来源支持的人物关系。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1869','WCD10-B08-W216-F01','V1-CARD-0533','V1-ENT-0600','first_publication_year','1929','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1870','WCD10-B08-W216-F02','V1-CARD-0533','V1-ENT-0600','genre_or_form','gothic/fantastic short story','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1871','WCD10-B08-W216-F03','V1-CARD-0533','V1-ENT-0600','one_sentence_summary','医生Angus Dumbraid奉召前往苏格兰的Highmore庄园照料John Highmore，并卷入围绕旧宅、家族离散与诡异病况展开的哥特式谜团。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1872','WCD10-B08-W216-F04','V1-CARD-0533','V1-ENT-0600','research_note','Luis Eduardo Wexell Machado的文章将本篇置于Rosa早期哥特/幻想小说语境，并分析其与Poe及Walpole传统的关系；本条仅归属该研究对本篇的直接分析。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1873','WCD10-B08-W217-F01','V1-CARD-0534','V1-ENT-0601','first_publication_year','1930','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1874','WCD10-B08-W217-F02','V1-CARD-0534','V1-ENT-0601','genre_or_form','fantastic short story','bibliographic','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1875','WCD10-B08-W217-F03','V1-CARD-0534','V1-ENT-0601','one_sentence_summary','棋手Zviazline为筹婚资参加比赛，遭人下药后在幻游中见到时间与命运对弈；命运替他完成比赛，使他以全胜夺冠，随后与Efrozine结婚。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1876','WCD10-B08-W217-F04','V1-CARD-0534','V1-ENT-0601','research_note','Luis Eduardo Wexell Machado在同一论文中把《Tempo e Destino》列为Rosa最早的幻想短篇之一，记其1930年6月22日发表于《O Cruzeiro》，并分析Zviazline的棋赛、麻醉后的超自然经历及命运替他完成比赛的结局。定位为P6 L213–216、P7–9 L217–310。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1877','WCD10-B08-F001','V1-CARD-0535','V1-ENT-0207','genre_or_form','短篇小说集','bibliographic','WCD-10-B08','high','batch_retained_candidate','仅补基线缺失字段；保留该作品所有旧facts/cards/CREATED关系及其sources/evidence/source_objects，不改写既有值。'),
('V1-FCT-1878','WCD10-B08-F002','V1-CARD-0535','V1-ENT-0207','one_sentence_summary','Quereilhac说明初版由作者从1906–1914年报刊发表的故事中选出18篇，后续版本减为15篇；她将其读作题材多样、以生命和死亡相互牵连的短篇拼图。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','仅补基线缺失字段；保留该作品所有旧facts/cards/CREATED关系及其sources/evidence/source_objects，不改写既有值。'),
('V1-FCT-1879','WCD10-B08-F007','V1-CARD-0535','V1-ENT-0207','research_note','Quereilhac指出，初版18篇、后续第二/三版减为15篇；该集以“爱情、疯狂、死亡”无逗号的并置形成多样故事的共同张力。此释义限于该论文对该书版本与整体结构的说明。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Quereilhac 2017直接讨论该基线合集整体及其版本/叙事构造；仅以有页码定位的论述为限，不改写既有facts/cards/relations。'),
('V1-FCT-1880','WCD10-B08-F003','V1-CARD-0536','V1-ENT-0208','genre_or_form','儿童短篇小说集','bibliographic','WCD-10-B08','high','batch_retained_candidate','仅补基线缺失字段；保留该作品所有旧facts/cards/CREATED关系及其sources/evidence/source_objects，不改写既有值。'),
('V1-FCT-1881','WCD10-B08-F004','V1-CARD-0536','V1-ENT-0208','one_sentence_summary','Quereilhac把《丛林故事》概括为寓言、传说与史诗交叠的丛林世界；人与动物共享叙事属性，并共同面对死亡。此概述限于她对该书的论述。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','仅补基线缺失字段；保留该作品所有旧facts/cards/CREATED关系及其sources/evidence/source_objects，不改写既有值。'),
('V1-FCT-1882','WCD10-B08-F008','V1-CARD-0536','V1-ENT-0208','research_note','Quereilhac把《丛林故事》概括为寓言、传说与史诗交叠的丛林世界；人与动物共享叙事属性，并共同面对死亡。此概述限于她对该书的论述。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Quereilhac 2017直接讨论该基线合集整体及其版本/叙事构造；仅以有页码定位的论述为限，不改写既有facts/cards/relations。'),
('V1-FCT-1883','WCD10-B08-F005','V1-CARD-0537','V1-ENT-0209','genre_or_form','短篇小说集','bibliographic','WCD-10-B08','high','batch_retained_candidate','仅补基线缺失字段；保留该作品所有旧facts/cards/CREATED关系及其sources/evidence/source_objects，不改写既有值。'),
('V1-FCT-1884','WCD10-B08-F006','V1-CARD-0537','V1-ENT-0209','one_sentence_summary','Quereilhac将该集的人物概括为被城市文明排出的“exhombres”，在自我与强大自然之间挣扎；此处保留为该研究对全书叙事世界的概述。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','仅补基线缺失字段；保留该作品所有旧facts/cards/CREATED关系及其sources/evidence/source_objects，不改写既有值。'),
('V1-FCT-1885','WCD10-B08-F009','V1-CARD-0537','V1-ENT-0209','research_note','Quereilhac将《Los desterrados》的叙事世界概括为被城市文明排出的“exhombres”，在自我与强大自然之间艰难挣扎；此处不把批评论断扩为地理关系。','scholarly_paraphrase','WCD-10-B08','high','research_note_only','Quereilhac 2017直接讨论该基线合集整体及其版本/叙事构造；仅以有页码定位的论述为限，不改写既有facts/cards/relations。'),
('V1-FCT-1886','WCD10-B08-F101','V1-CARD-0538','V1-ENT-0214','first_periodical_publication_year','1880','bibliographic','WCD-10-B08','high','batch_retained_candidate','Supplemental serial-first year only. Preserve existing V1-FCT-0485 first_publication_year=1881 exactly as the book edition year; ABL biography lines 15 states Revista Brasileira serialization ran 15 March–15 December 1880.'),
('V1-FCT-1887','WCD10-B08-F103','V1-CARD-0538','V1-ENT-0214','genre_or_form','novel','bibliographic','WCD-10-B08','high','batch_retained_candidate','Fresh supplemental object-level fact; old facts/cards/provenance preserved.'),
('V1-FCT-1888','WCD10-B08-F104','V1-CARD-0538','V1-ENT-0214','one_sentence_summary','该页面将小说概括为采用元文学和自我指涉手法，叙述语调兼具讽刺、戏仿与反讽。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Fresh supplemental object-level fact; old facts/cards/provenance preserved.'),
('V1-FCT-1889','WCD10-B08-F102','V1-CARD-0539','V1-ENT-0215','first_periodical_publication_year','1886','bibliographic','WCD-10-B08','high','batch_retained_candidate','Supplemental first serial year only. Preserve existing V1-FCT-0488 first_publication_year=1891 exactly as the official bibliography''s book/year record. Direct studies date A Estação serialization 1886–1891 and separately state 1891 Garnier book edition.'),
('V1-FCT-1890','WCD10-B08-F105','V1-CARD-0539','V1-ENT-0215','genre_or_form','novel','bibliographic','WCD-10-B08','high','batch_retained_candidate','Fresh supplemental object-level fact; old facts/cards/provenance preserved.'),
('V1-FCT-1891','WCD10-B08-F106','V1-CARD-0539','V1-ENT-0215','one_sentence_summary','鲁比昂继承钱财以及一只名为Quincas Borba的狗后迁居里约，在财富带来的社会交往中逐渐陷入妄想；报刊连载与1891年书版作为同一小说的不同阶段处理。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Fresh supplemental object-level fact; old facts/cards/provenance preserved.'),
('V1-FCT-1892','WCD10-B08-F107','V1-CARD-0540','V1-ENT-0216','genre_or_form','novel','bibliographic','WCD-10-B08','high','batch_retained_candidate','Fresh supplemental object-level fact; old facts/cards/provenance preserved.'),
('V1-FCT-1893','WCD10-B08-F108','V1-CARD-0540','V1-ENT-0216','one_sentence_summary','本托·圣地亚哥回顾自己与卡皮图的关系，围绕嫉妒及对妻子是否不忠的怀疑展开叙述。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Fresh supplemental object-level fact; old facts/cards/provenance preserved.'),
('V1-FCT-1894','WCD10-B08-F201','V1-CARD-0541','V1-ENT-0217','genre_or_form','novel','bibliographic','WCD-10-B08','high','batch_retained_candidate','ABL书目S203 L15将Grande sertão: veredas列为romance；Ana Maria Machado的ABL短文S227 L12–13另支持与魔鬼的契约及Riobaldo主角。体裁不再由短文推断。'),
('V1-FCT-1895','WCD10-B08-F202','V1-CARD-0541','V1-ENT-0217','one_sentence_summary','据ABL刊载的Ana Maria Machado文章，小说以与魔鬼的契约为轴，Riobaldo是主角，Diadorim则以战士身份及其后揭示的身份线索进入叙事。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','ABL页面L12–13明确提及与魔鬼的契约、主角Riobaldo及Diadorim/Deodorina身份线索；本描述仅限这些内容。'),
('V1-FCT-1896','WCD10-B08-F203','V1-CARD-0542','V1-ENT-0218','genre_or_form','short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','ABL书目S203 L19以romance标注Grande sertão，L21–25并列contos；Toda Matéria署名介绍S228 L51–63称Sagarana为contos并列九篇。'),
('V1-FCT-1897','WCD10-B08-F204','V1-CARD-0542','V1-ENT-0218','one_sentence_summary','据Daniela Diana的介绍，《Sagarana》使用富含古语、通俗词和新造词的创新、音乐性语言；她称米纳斯吉拉斯是作品中最常出现的地区，也提到里约热内卢和戈亚斯。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','Toda Matéria署名介绍S228 L158–167直接说明语言特征并列举出现的地区；不沿用该页未经具体篇章支撑的社会冲突、神话或民间智慧概括。'),
('V1-FCT-1898','WCD10-B08-F205','V1-CARD-0543','V1-ENT-0219','genre_or_form','short_story_collection','bibliographic','WCD-10-B08','high','batch_retained_candidate','博物馆馆藏页面将《Primeiras estórias》归为巴西短篇小说，并称收录21篇。'),
('V1-FCT-1899','WCD10-B08-F206','V1-CARD-0543','V1-ENT-0219','one_sentence_summary','据葡萄牙语博物馆馆藏简介，《Primeiras estórias》收录21篇短篇，以人的经验与sertão为背景，涉及生命、时间、爱情、死亡和存在之谜。','institutional_paraphrase','WCD-10-B08','high','batch_retained_candidate','博物馆页面L53–62列“Contos Brasileiros”并称21篇，简介直接概述题材。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-1577','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1577','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1578','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1578','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1579','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1579','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1580','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1580','SRC-0553','Poe en Quiroga (full text)'),
('V1-FCT-1581','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1581','SRC-0553','Poe en Quiroga (full text)'),
('V1-FCT-1582','SRC-0559','El crimen del otro • Horacio Quiroga'),
('V1-FCT-1582','SRC-0553','Poe en Quiroga (full text)'),
('V1-FCT-1583','SRC-0556','Cronología de Horacio Quiroga'),
('V1-FCT-1583','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1584','SRC-0556','Cronología de Horacio Quiroga'),
('V1-FCT-1584','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1585','SRC-0560','Los perseguidos'),
('V1-FCT-1586','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1586','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1587','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1587','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1588','SRC-0561','Historia de un amor turbio'),
('V1-FCT-1589','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1590','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1590','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1591','SRC-0579','El salvaje.'),
('V1-FCT-1591','SRC-0574','El salvaje y otros cuentos'),
('V1-FCT-1591','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1592','SRC-0548','Las sacrificadas de Horacio Quiroga'),
('V1-FCT-1592','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1593','SRC-0548','Las sacrificadas de Horacio Quiroga'),
('V1-FCT-1593','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1594','SRC-0576','Las sacrificadas: cuento escénico en 4 actos'),
('V1-FCT-1594','SRC-0548','Las sacrificadas de Horacio Quiroga'),
('V1-FCT-1595','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1595','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1596','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1596','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1597','SRC-0563','Anaconda y otros cuentos'),
('V1-FCT-1597','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1598','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1598','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1599','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1599','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1600','SRC-0564','El desierto'),
('V1-FCT-1601','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1602','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1603','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1603','SRC-0580','La Gallina Degollada'),
('V1-FCT-1604','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1604','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1605','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1605','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1606','SRC-0562','Pasado amor'),
('V1-FCT-1607','SRC-0556','Cronología de Horacio Quiroga'),
('V1-FCT-1608','SRC-0556','Cronología de Horacio Quiroga'),
('V1-FCT-1609','SRC-0557','Trajectories in Argentine children’s literature: Constancio C. Vigil and Horacio Quiroga'),
('V1-FCT-1609','SRC-0556','Cronología de Horacio Quiroga'),
('V1-FCT-1610','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1610','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1611','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1611','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1612','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1612','SRC-0578','Libro gratis: Más Allá y Otros Cuentos'),
('V1-FCT-1613','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1613','SRC-0548','Las sacrificadas de Horacio Quiroga'),
('V1-FCT-1614','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1614','SRC-0548','Las sacrificadas de Horacio Quiroga'),
('V1-FCT-1615','SRC-0577','Sobre el Arte de Contar Historias'),
('V1-FCT-1616','SRC-0556','Cronología de Horacio Quiroga'),
('V1-FCT-1617','SRC-0577','Sobre el Arte de Contar Historias'),
('V1-FCT-1618','SRC-0577','Sobre el Arte de Contar Historias'),
('V1-FCT-1619','SRC-0556','Cronología de Horacio Quiroga'),
('V1-FCT-1620','SRC-0577','Sobre el Arte de Contar Historias'),
('V1-FCT-1621','SRC-0577','Sobre el Arte de Contar Historias'),
('V1-FCT-1622','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1622','SRC-0553','Poe en Quiroga (full text)'),
('V1-FCT-1623','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1623','SRC-0553','Poe en Quiroga (full text)'),
('V1-FCT-1624','SRC-0569','El almohadón de pluma'),
('V1-FCT-1624','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1625','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1625','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1626','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1626','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1627','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1628','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1629','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1630','SRC-0571','Una estación de amor'),
('V1-FCT-1630','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1631','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1631','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1632','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1632','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1633','SRC-0570','A la deriva'),
('V1-FCT-1633','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1634','SRC-0556','Cronología de Horacio Quiroga'),
('V1-FCT-1635','SRC-0556','Cronología de Horacio Quiroga'),
('V1-FCT-1635','SRC-0547','Biobibliografías: Horacio Quiroga'),
('V1-FCT-1636','SRC-0568','El hombre muerto'),
('V1-FCT-1636','SRC-0556','Cronología de Horacio Quiroga'),
('V1-FCT-1637','SRC-0554','La estrategia de la duplicidad en "Miss Dorothy Phillips, mi esposa" de Horacio Quiroga'),
('V1-FCT-1638','SRC-0554','La estrategia de la duplicidad en "Miss Dorothy Phillips, mi esposa" de Horacio Quiroga'),
('V1-FCT-1639','SRC-0554','La estrategia de la duplicidad en "Miss Dorothy Phillips, mi esposa" de Horacio Quiroga'),
('V1-FCT-1640','SRC-0554','La estrategia de la duplicidad en "Miss Dorothy Phillips, mi esposa" de Horacio Quiroga'),
('V1-FCT-1641','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1642','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1643','SRC-0567','El hijo'),
('V1-FCT-1643','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1644','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.'),
('V1-FCT-1645','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.'),
('V1-FCT-1646','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.'),
('V1-FCT-1646','SRC-0551','Las fieras cómplices / S. Fragoso Lima'),
('V1-FCT-1647','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.'),
('V1-FCT-1648','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.'),
('V1-FCT-1649','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.'),
('V1-FCT-1650','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.'),
('V1-FCT-1650','SRC-0552','El folletín como campo de experimentación narrativa: el recurso cinematográfico en El hombre artificial de Horacio Quiroga'),
('V1-FCT-1651','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.'),
('V1-FCT-1651','SRC-0552','El folletín como campo de experimentación narrativa: el recurso cinematográfico en El hombre artificial de Horacio Quiroga'),
('V1-FCT-1652','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.'),
('V1-FCT-1652','SRC-0552','El folletín como campo de experimentación narrativa: el recurso cinematográfico en El hombre artificial de Horacio Quiroga'),
('V1-FCT-1653','SRC-0552','El folletín como campo de experimentación narrativa: el recurso cinematográfico en El hombre artificial de Horacio Quiroga'),
('V1-FCT-1654','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.'),
('V1-FCT-1655','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.'),
('V1-FCT-1656','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.'),
('V1-FCT-1657','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.'),
('V1-FCT-1658','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.'),
('V1-FCT-1659','SRC-0581','Libro gratis: El Remate Del Imperio Romano'),
('V1-FCT-1659','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.'),
('V1-FCT-1660','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1661','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1662','SRC-0572','Los buques suicidantes'),
('V1-FCT-1662','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1663','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1664','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1665','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1666','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1667','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1668','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1669','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1670','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1671','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1672','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1673','SRC-0573','El alambre de púa'),
('V1-FCT-1673','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1674','SRC-0556','Cronología de Horacio Quiroga'),
('V1-FCT-1674','SRC-0558','Índice: La Novela Semanal - Año II - Núm. 9 - Un peón.pdf'),
('V1-FCT-1675','SRC-0556','Cronología de Horacio Quiroga'),
('V1-FCT-1675','SRC-0558','Índice: La Novela Semanal - Año II - Núm. 9 - Un peón.pdf'),
('V1-FCT-1676','SRC-0582','Un Peón'),
('V1-FCT-1676','SRC-0558','Índice: La Novela Semanal - Año II - Núm. 9 - Un peón.pdf'),
('V1-FCT-1677','SRC-0555','Cuentos de la selva: Estudio preliminar'),
('V1-FCT-1677','SRC-0557','Trajectories in Argentine children’s literature: Constancio C. Vigil and Horacio Quiroga'),
('V1-FCT-1678','SRC-0555','Cuentos de la selva: Estudio preliminar'),
('V1-FCT-1679','SRC-0555','Cuentos de la selva: Estudio preliminar'),
('V1-FCT-1679','SRC-0557','Trajectories in Argentine children’s literature: Constancio C. Vigil and Horacio Quiroga'),
('V1-FCT-1680','SRC-0557','Trajectories in Argentine children’s literature: Constancio C. Vigil and Horacio Quiroga'),
('V1-FCT-1681','SRC-0555','Cuentos de la selva: Estudio preliminar'),
('V1-FCT-1682','SRC-0555','Cuentos de la selva: Estudio preliminar'),
('V1-FCT-1683','SRC-0555','Cuentos de la selva: Estudio preliminar'),
('V1-FCT-1683','SRC-0557','Trajectories in Argentine children’s literature: Constancio C. Vigil and Horacio Quiroga'),
('V1-FCT-1684','SRC-0575','Adendas a la bibliografía de Horacio Quiroga'),
('V1-FCT-1685','SRC-0575','Adendas a la bibliografía de Horacio Quiroga'),
('V1-FCT-1686','SRC-0575','Adendas a la bibliografía de Horacio Quiroga'),
('V1-FCT-1687','SRC-0575','Adendas a la bibliografía de Horacio Quiroga'),
('V1-FCT-1688','SRC-0575','Adendas a la bibliografía de Horacio Quiroga'),
('V1-FCT-1689','SRC-0575','Adendas a la bibliografía de Horacio Quiroga'),
('V1-FCT-1690','SRC-0575','Adendas a la bibliografía de Horacio Quiroga'),
('V1-FCT-1691','SRC-0575','Adendas a la bibliografía de Horacio Quiroga'),
('V1-FCT-1692','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1693','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1693','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1693','SRC-0583','Ressurreição - 1872'),
('V1-FCT-1694','SRC-0597','Ressurreição — The Machado de Assis Digital Corpus Project'),
('V1-FCT-1695','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1696','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1696','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1696','SRC-0584','A Mão e a Luva - 1874'),
('V1-FCT-1697','SRC-0598','A Mão e a Luva — The Machado de Assis Digital Corpus Project'),
('V1-FCT-1698','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1699','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1699','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1699','SRC-0585','Helena - 1876'),
('V1-FCT-1700','SRC-0599','Helena — The Machado de Assis Digital Corpus Project'),
('V1-FCT-1701','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1702','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1702','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1703','SRC-0600','Iaiá Garcia — The Machado de Assis Digital Corpus Project'),
('V1-FCT-1704','SRC-0594','Casa Velha'),
('V1-FCT-1705','SRC-0594','Casa Velha'),
('V1-FCT-1706','SRC-0594','Casa Velha'),
('V1-FCT-1706','SRC-0608','Casa velha'),
('V1-FCT-1706','SRC-0627','Casa velha'),
('V1-FCT-1707','SRC-0608','Casa velha'),
('V1-FCT-1708','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1709','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1709','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1710','SRC-0601','Esaú e Jacó — The Machado de Assis Digital Corpus Project'),
('V1-FCT-1711','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1712','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1712','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1713','SRC-0602','Memorial de Aires — The Machado de Assis Digital Corpus Project'),
('V1-FCT-1714','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1715','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1715','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1716','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1716','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1716','SRC-0605','Machado de Assis: recortes avulsos'),
('V1-FCT-1717','SRC-0631','Historias da meia noite'),
('V1-FCT-1718','SRC-0631','Historias da meia noite'),
('V1-FCT-1719','SRC-0631','Historias da meia noite'),
('V1-FCT-1720','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1721','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1721','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1722','SRC-0622','Papeis avulsos [Papéis avulsos]'),
('V1-FCT-1722','SRC-0625','O alienista'),
('V1-FCT-1722','SRC-0626','Teoria do medalhão'),
('V1-FCT-1723','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1724','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1724','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1725','SRC-0623','Historia sem data [Histórias sem data]'),
('V1-FCT-1726','SRC-0589','De Botafogo à Tijuca: sobrevivência e autonomia feminina nas Várias histórias de Machado de Assis'),
('V1-FCT-1727','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1727','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1727','SRC-0588','Várias histórias'),
('V1-FCT-1727','SRC-0589','De Botafogo à Tijuca: sobrevivência e autonomia feminina nas Várias histórias de Machado de Assis'),
('V1-FCT-1728','SRC-0588','Várias histórias'),
('V1-FCT-1728','SRC-0589','De Botafogo à Tijuca: sobrevivência e autonomia feminina nas Várias histórias de Machado de Assis'),
('V1-FCT-1729','SRC-0588','Várias histórias'),
('V1-FCT-1730','SRC-0589','De Botafogo à Tijuca: sobrevivência e autonomia feminina nas Várias histórias de Machado de Assis'),
('V1-FCT-1731','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1732','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1732','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1733','SRC-0624','Paginas recolhidas [Páginas recolhidas]'),
('V1-FCT-1734','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1735','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1735','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1736','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1736','SRC-0596','Lição de Botânica'),
('V1-FCT-1737','SRC-0606','Chrysalidas : poesias / [Crisálidas : poesias]'),
('V1-FCT-1738','SRC-0606','Chrysalidas : poesias / [Crisálidas : poesias]'),
('V1-FCT-1738','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1739','SRC-0606','Chrysalidas : poesias / [Crisálidas : poesias]'),
('V1-FCT-1739','SRC-0607','As temáticas social e política no primeiro livro poético machadiano, Crisálidas'),
('V1-FCT-1740','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1741','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1741','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1742','SRC-0613','Phalenas [Falenas]'),
('V1-FCT-1743','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1744','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1744','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1745','SRC-0614','Americanas'),
('V1-FCT-1746','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1747','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1747','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1748','SRC-0621','Poesias completas'),
('V1-FCT-1749','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1750','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1750','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1751','SRC-0620','Theatro (v.1) [Teatro]'),
('V1-FCT-1752','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1753','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1753','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1754','SRC-0615','Desencantos'),
('V1-FCT-1755','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1756','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1756','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1757','SRC-0616','Quase ministro'),
('V1-FCT-1757','SRC-0617','Quase ministro: era uma vez um cavalo'),
('V1-FCT-1758','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1759','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1759','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1760','SRC-0618','Os deuses de casaca : comedia'),
('V1-FCT-1760','SRC-0619','Os deuses de casaca'),
('V1-FCT-1761','SRC-0593','Tu, só tu, puro amor'),
('V1-FCT-1762','SRC-0593','Tu, só tu, puro amor'),
('V1-FCT-1763','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1763','SRC-0593','Tu, só tu, puro amor'),
('V1-FCT-1764','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1765','SRC-0591','1873 — A literatura e a língua por Machado de Assis'),
('V1-FCT-1765','SRC-0592','Notícia da atual literatura brasileira: Instinto de nacionalidade — Work Data'),
('V1-FCT-1766','SRC-0592','Notícia da atual literatura brasileira: Instinto de nacionalidade — Work Data'),
('V1-FCT-1767','SRC-0591','1873 — A literatura e a língua por Machado de Assis'),
('V1-FCT-1767','SRC-0592','Notícia da atual literatura brasileira: Instinto de nacionalidade — Work Data'),
('V1-FCT-1768','SRC-0596','Lição de Botânica'),
('V1-FCT-1769','SRC-0596','Lição de Botânica'),
('V1-FCT-1770','SRC-0596','Lição de Botânica'),
('V1-FCT-1771','SRC-0595','Não consultes médico'),
('V1-FCT-1772','SRC-0595','Não consultes médico'),
('V1-FCT-1773','SRC-0595','Não consultes médico'),
('V1-FCT-1774','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1775','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1776','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1777','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1778','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1779','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1780','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1781','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1782','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1783','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1784','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1785','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1786','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1787','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1788','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1789','SRC-0610','Contos e crônicas'),
('V1-FCT-1790','SRC-0610','Contos e crônicas'),
('V1-FCT-1791','SRC-0610','Contos e crônicas'),
('V1-FCT-1792','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1793','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1794','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis'),
('V1-FCT-1795','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1795','SRC-0611','Critica (Machado de Assis, 1910)'),
('V1-FCT-1796','SRC-0611','Critica (Machado de Assis, 1910)'),
('V1-FCT-1797','SRC-0611','Critica (Machado de Assis, 1910)'),
('V1-FCT-1798','SRC-0166','Machado de Assis – Bibliografia'),
('V1-FCT-1798','SRC-0612','Outras Reliquias : (proza e verso)'),
('V1-FCT-1799','SRC-0612','Outras Reliquias : (proza e verso)'),
('V1-FCT-1800','SRC-0612','Outras Reliquias : (proza e verso)'),
('V1-FCT-1801','SRC-0628','Anotações sobre a correspondência de Machado de Assis'),
('V1-FCT-1802','SRC-0628','Anotações sobre a correspondência de Machado de Assis'),
('V1-FCT-1803','SRC-0628','Anotações sobre a correspondência de Machado de Assis'),
('V1-FCT-1804','SRC-0629','Diálogos e reflexões de um relojoeiro'),
('V1-FCT-1804','SRC-0630','Edição da série de crônicas “A + B”'),
('V1-FCT-1805','SRC-0629','Diálogos e reflexões de um relojoeiro'),
('V1-FCT-1806','SRC-0629','Diálogos e reflexões de um relojoeiro'),
('V1-FCT-1806','SRC-0630','Edição da série de crônicas “A + B”'),
('V1-FCT-1807','SRC-0605','Machado de Assis: recortes avulsos'),
('V1-FCT-1807','SRC-0632','Machado de Assis: uma edição crítica de O Alienista com ensaio introdutório: O Alienista, ou do Objeto Inapreensível'),
('V1-FCT-1808','SRC-0632','Machado de Assis: uma edição crítica de O Alienista com ensaio introdutório: O Alienista, ou do Objeto Inapreensível'),
('V1-FCT-1809','SRC-0625','O alienista'),
('V1-FCT-1810','SRC-0622','Papeis avulsos [Papéis avulsos]'),
('V1-FCT-1810','SRC-0632','Machado de Assis: uma edição crítica de O Alienista com ensaio introdutório: O Alienista, ou do Objeto Inapreensível'),
('V1-FCT-1811','SRC-0632','Machado de Assis: uma edição crítica de O Alienista com ensaio introdutório: O Alienista, ou do Objeto Inapreensível'),
('V1-FCT-1812','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1813','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1814','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1815','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1816','SRC-0635','Com o vaqueiro Mariano | Banco de Dados Bibliográfico João Guimarães Rosa'),
('V1-FCT-1817','SRC-0635','Com o vaqueiro Mariano | Banco de Dados Bibliográfico João Guimarães Rosa'),
('V1-FCT-1818','SRC-0635','Com o vaqueiro Mariano | Banco de Dados Bibliográfico João Guimarães Rosa'),
('V1-FCT-1818','SRC-0642','Estas estórias | Banco de Dados Bibliográfico João Guimarães Rosa'),
('V1-FCT-1818','SRC-0634','João Guimarães Rosa | Biografia'),
('V1-FCT-1819','SRC-0635','Com o vaqueiro Mariano | Banco de Dados Bibliográfico João Guimarães Rosa'),
('V1-FCT-1819','SRC-0634','João Guimarães Rosa | Biografia'),
('V1-FCT-1820','SRC-0637','O (en)canto da linguagem rendada: ritmo e sonoridade em Tutameia, de Guimarães Rosa'),
('V1-FCT-1821','SRC-0637','O (en)canto da linguagem rendada: ritmo e sonoridade em Tutameia, de Guimarães Rosa'),
('V1-FCT-1822','SRC-0637','O (en)canto da linguagem rendada: ritmo e sonoridade em Tutameia, de Guimarães Rosa'),
('V1-FCT-1823','SRC-0637','O (en)canto da linguagem rendada: ritmo e sonoridade em Tutameia, de Guimarães Rosa'),
('V1-FCT-1824','SRC-0642','Estas estórias | Banco de Dados Bibliográfico João Guimarães Rosa'),
('V1-FCT-1825','SRC-0634','João Guimarães Rosa | Biografia'),
('V1-FCT-1826','SRC-0658','Pequena Bibliografia de João Guimarães Rosa'),
('V1-FCT-1826','SRC-0642','Estas estórias | Banco de Dados Bibliográfico João Guimarães Rosa'),
('V1-FCT-1827','SRC-0169','João Guimarães Rosa – Bibliografia'),
('V1-FCT-1828','SRC-0169','João Guimarães Rosa – Bibliografia'),
('V1-FCT-1828','SRC-0653','As Configurações da Linguagem Roseana em Ave, Palavra'),
('V1-FCT-1829','SRC-0653','As Configurações da Linguagem Roseana em Ave, Palavra'),
('V1-FCT-1830','SRC-0636','Magma | Museu Casa Guimarães Rosa'),
('V1-FCT-1830','SRC-0651','Guimarães Rosa: Magma e gênese da obra'),
('V1-FCT-1831','SRC-0651','Guimarães Rosa: Magma e gênese da obra'),
('V1-FCT-1832','SRC-0634','João Guimarães Rosa | Biografia'),
('V1-FCT-1832','SRC-0651','Guimarães Rosa: Magma e gênese da obra'),
('V1-FCT-1833','SRC-0658','Pequena Bibliografia de João Guimarães Rosa'),
('V1-FCT-1834','SRC-0652','A escrita em conjunto na literatura policial brasileira: um olhar sobre os arquivos de João Condé'),
('V1-FCT-1835','SRC-0641','O filho da mãe, de Bernardo Carvalho, e a figuração do amor na escrita patrocinada da coleção Amores Expressos'),
('V1-FCT-1835','SRC-0652','A escrita em conjunto na literatura policial brasileira: um olhar sobre os arquivos de João Condé'),
('V1-FCT-1836','SRC-0652','A escrita em conjunto na literatura policial brasileira: um olhar sobre os arquivos de João Condé'),
('V1-FCT-1837','SRC-0658','Pequena Bibliografia de João Guimarães Rosa'),
('V1-FCT-1837','SRC-0169','João Guimarães Rosa – Bibliografia'),
('V1-FCT-1837','SRC-0657','Catálogo Haroldo Maranhão, p. 90'),
('V1-FCT-1837','SRC-0652','A escrita em conjunto na literatura policial brasileira: um olhar sobre os arquivos de João Condé'),
('V1-FCT-1837','SRC-0641','O filho da mãe, de Bernardo Carvalho, e a figuração do amor na escrita patrocinada da coleção Amores Expressos'),
('V1-FCT-1838','SRC-0638','Os sete pecados capitais | Banco de Dados Bibliográfico João Guimarães Rosa'),
('V1-FCT-1839','SRC-0638','Os sete pecados capitais | Banco de Dados Bibliográfico João Guimarães Rosa'),
('V1-FCT-1840','SRC-0638','Os sete pecados capitais | Banco de Dados Bibliográfico João Guimarães Rosa'),
('V1-FCT-1841','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1842','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1843','SRC-0643','O Corpo e a palavra: uma leitura de "Campo geral" de J. Guimarães Rosa'),
('V1-FCT-1844','SRC-0643','O Corpo e a palavra: uma leitura de "Campo geral" de J. Guimarães Rosa'),
('V1-FCT-1845','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1846','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1847','SRC-0644','A representação da masculinidade no conto "Uma estória de amor", de João Guimarães Rosa'),
('V1-FCT-1848','SRC-0644','A representação da masculinidade no conto "Uma estória de amor", de João Guimarães Rosa'),
('V1-FCT-1849','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1850','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1851','SRC-0647','“Saudades de destino”: forças e corpos fora de regra no "Corpo de baile", de Guimarães Rosa'),
('V1-FCT-1852','SRC-0647','“Saudades de destino”: forças e corpos fora de regra no "Corpo de baile", de Guimarães Rosa'),
('V1-FCT-1853','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1854','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1855','SRC-0645','O recado do Morro: profecia e redenção'),
('V1-FCT-1856','SRC-0645','O recado do Morro: profecia e redenção'),
('V1-FCT-1857','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1858','SRC-0648','Dão-Lalalão, a reescrita do desejo'),
('V1-FCT-1859','SRC-0648','Dão-Lalalão, a reescrita do desejo'),
('V1-FCT-1860','SRC-0648','Dão-Lalalão, a reescrita do desejo'),
('V1-FCT-1861','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1862','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1863','SRC-0646','“Cara de Bronze”: uma história em linguagem de cinema ou o místico em Guimarães Rosa'),
('V1-FCT-1864','SRC-0646','“Cara de Bronze”: uma história em linguagem de cinema ou o místico em Guimarães Rosa'),
('V1-FCT-1865','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1866','SRC-0633','Tradição impressa de Corpo de Baile'),
('V1-FCT-1867','SRC-0649','O mundo que perdeu suas paredes: Lalinha e o belo poço parado em “Buriti” de João Guimarães Rosa'),
('V1-FCT-1868','SRC-0649','O mundo que perdeu suas paredes: Lalinha e o belo poço parado em “Buriti” de João Guimarães Rosa'),
('V1-FCT-1869','SRC-0654','O fantástico em O Mistério de Highmore Hall e Tempo e Destino, os primeiros contos de Guimarães Rosa'),
('V1-FCT-1870','SRC-0654','O fantástico em O Mistério de Highmore Hall e Tempo e Destino, os primeiros contos de Guimarães Rosa'),
('V1-FCT-1871','SRC-0654','O fantástico em O Mistério de Highmore Hall e Tempo e Destino, os primeiros contos de Guimarães Rosa'),
('V1-FCT-1872','SRC-0654','O fantástico em O Mistério de Highmore Hall e Tempo e Destino, os primeiros contos de Guimarães Rosa'),
('V1-FCT-1873','SRC-0654','O fantástico em O Mistério de Highmore Hall e Tempo e Destino, os primeiros contos de Guimarães Rosa'),
('V1-FCT-1874','SRC-0654','O fantástico em O Mistério de Highmore Hall e Tempo e Destino, os primeiros contos de Guimarães Rosa'),
('V1-FCT-1875','SRC-0654','O fantástico em O Mistério de Highmore Hall e Tempo e Destino, os primeiros contos de Guimarães Rosa'),
('V1-FCT-1876','SRC-0654','O fantástico em O Mistério de Highmore Hall e Tempo e Destino, os primeiros contos de Guimarães Rosa'),
('V1-FCT-1877','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1878','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1879','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1880','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1881','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1882','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1883','SRC-0162','Horacio Quiroga – Academia Nacional de Letras'),
('V1-FCT-1884','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1885','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas'),
('V1-FCT-1886','SRC-0165','Machado de Assis – Biografia'),
('V1-FCT-1887','SRC-0603','Memórias Póstumas de Brás Cubas — The Machado de Assis Digital Corpus Project'),
('V1-FCT-1888','SRC-0603','Memórias Póstumas de Brás Cubas — The Machado de Assis Digital Corpus Project'),
('V1-FCT-1889','SRC-0586','História, sistema literário e sociedade na versão folhetinesca de Quincas Borba'),
('V1-FCT-1889','SRC-0587','A política imperial em Quincas Borba: um diálogo entre a história e a literatura'),
('V1-FCT-1889','SRC-0590','Quincas Borba, o folhetim e o livro: uma análise comparada das versões do romance machadiano'),
('V1-FCT-1890','SRC-0587','A política imperial em Quincas Borba: um diálogo entre a história e a literatura'),
('V1-FCT-1890','SRC-0590','Quincas Borba, o folhetim e o livro: uma análise comparada das versões do romance machadiano'),
('V1-FCT-1891','SRC-0587','A política imperial em Quincas Borba: um diálogo entre a história e a literatura'),
('V1-FCT-1891','SRC-0590','Quincas Borba, o folhetim e o livro: uma análise comparada das versões do romance machadiano'),
('V1-FCT-1892','SRC-0604','Dom Casmurro — The Machado de Assis Digital Corpus Project'),
('V1-FCT-1893','SRC-0604','Dom Casmurro — The Machado de Assis Digital Corpus Project'),
('V1-FCT-1894','SRC-0634','João Guimarães Rosa | Biografia'),
('V1-FCT-1894','SRC-0655','Personagens universais'),
('V1-FCT-1895','SRC-0655','Personagens universais'),
('V1-FCT-1896','SRC-0634','João Guimarães Rosa | Biografia'),
('V1-FCT-1896','SRC-0656','Sagarana: resumo da obra de João Guimarães Rosa'),
('V1-FCT-1897','SRC-0656','Sagarana: resumo da obra de João Guimarães Rosa'),
('V1-FCT-1898','SRC-0650','Primeiras estórias | Acervo Museu da Língua Portuguesa'),
('V1-FCT-1899','SRC-0650','Primeiras estórias | Acervo Museu da Língua Portuguesa');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0444','V1-FCT-1577','batch_retained_candidate'),
('V1-CARD-0444','V1-FCT-1578','batch_retained_candidate'),
('V1-CARD-0444','V1-FCT-1579','batch_retained_candidate'),
('V1-CARD-0445','V1-FCT-1580','batch_retained_candidate'),
('V1-CARD-0445','V1-FCT-1581','batch_retained_candidate'),
('V1-CARD-0445','V1-FCT-1582','batch_retained_candidate'),
('V1-CARD-0446','V1-FCT-1583','batch_retained_candidate'),
('V1-CARD-0446','V1-FCT-1584','batch_retained_candidate'),
('V1-CARD-0446','V1-FCT-1585','batch_retained_candidate'),
('V1-CARD-0447','V1-FCT-1586','batch_retained_candidate'),
('V1-CARD-0447','V1-FCT-1587','batch_retained_candidate'),
('V1-CARD-0447','V1-FCT-1588','batch_retained_candidate'),
('V1-CARD-0448','V1-FCT-1589','batch_retained_candidate'),
('V1-CARD-0448','V1-FCT-1590','batch_retained_candidate'),
('V1-CARD-0448','V1-FCT-1591','batch_retained_candidate'),
('V1-CARD-0449','V1-FCT-1592','batch_retained_candidate'),
('V1-CARD-0449','V1-FCT-1593','batch_retained_candidate'),
('V1-CARD-0449','V1-FCT-1594','batch_retained_candidate'),
('V1-CARD-0450','V1-FCT-1595','batch_retained_candidate'),
('V1-CARD-0450','V1-FCT-1596','batch_retained_candidate'),
('V1-CARD-0450','V1-FCT-1597','batch_retained_candidate'),
('V1-CARD-0451','V1-FCT-1598','batch_retained_candidate'),
('V1-CARD-0451','V1-FCT-1599','batch_retained_candidate'),
('V1-CARD-0451','V1-FCT-1600','batch_retained_candidate'),
('V1-CARD-0452','V1-FCT-1601','batch_retained_candidate'),
('V1-CARD-0452','V1-FCT-1602','batch_retained_candidate'),
('V1-CARD-0452','V1-FCT-1603','batch_retained_candidate'),
('V1-CARD-0453','V1-FCT-1604','batch_retained_candidate'),
('V1-CARD-0453','V1-FCT-1605','batch_retained_candidate'),
('V1-CARD-0453','V1-FCT-1606','batch_retained_candidate'),
('V1-CARD-0454','V1-FCT-1607','batch_retained_candidate'),
('V1-CARD-0454','V1-FCT-1608','batch_retained_candidate'),
('V1-CARD-0454','V1-FCT-1609','batch_retained_candidate'),
('V1-CARD-0455','V1-FCT-1610','batch_retained_candidate'),
('V1-CARD-0455','V1-FCT-1611','batch_retained_candidate'),
('V1-CARD-0455','V1-FCT-1612','batch_retained_candidate'),
('V1-CARD-0456','V1-FCT-1613','batch_retained_candidate'),
('V1-CARD-0456','V1-FCT-1614','batch_retained_candidate'),
('V1-CARD-0456','V1-FCT-1615','batch_retained_candidate'),
('V1-CARD-0457','V1-FCT-1616','batch_retained_candidate'),
('V1-CARD-0457','V1-FCT-1617','batch_retained_candidate'),
('V1-CARD-0457','V1-FCT-1618','batch_retained_candidate'),
('V1-CARD-0458','V1-FCT-1619','batch_retained_candidate'),
('V1-CARD-0458','V1-FCT-1620','batch_retained_candidate'),
('V1-CARD-0458','V1-FCT-1621','batch_retained_candidate'),
('V1-CARD-0459','V1-FCT-1622','batch_retained_candidate'),
('V1-CARD-0459','V1-FCT-1623','batch_retained_candidate'),
('V1-CARD-0459','V1-FCT-1624','batch_retained_candidate'),
('V1-CARD-0460','V1-FCT-1625','batch_retained_candidate'),
('V1-CARD-0460','V1-FCT-1626','batch_retained_candidate'),
('V1-CARD-0460','V1-FCT-1627','batch_retained_candidate'),
('V1-CARD-0461','V1-FCT-1628','batch_retained_candidate'),
('V1-CARD-0461','V1-FCT-1629','batch_retained_candidate'),
('V1-CARD-0461','V1-FCT-1630','batch_retained_candidate'),
('V1-CARD-0462','V1-FCT-1631','batch_retained_candidate'),
('V1-CARD-0462','V1-FCT-1632','batch_retained_candidate'),
('V1-CARD-0462','V1-FCT-1633','batch_retained_candidate'),
('V1-CARD-0463','V1-FCT-1634','batch_retained_candidate'),
('V1-CARD-0463','V1-FCT-1635','batch_retained_candidate'),
('V1-CARD-0463','V1-FCT-1636','batch_retained_candidate'),
('V1-CARD-0464','V1-FCT-1637','batch_retained_candidate'),
('V1-CARD-0464','V1-FCT-1638','batch_retained_candidate'),
('V1-CARD-0464','V1-FCT-1639','batch_retained_candidate'),
('V1-CARD-0464','V1-FCT-1640','research_note_only'),
('V1-CARD-0465','V1-FCT-1641','batch_retained_candidate'),
('V1-CARD-0465','V1-FCT-1642','batch_retained_candidate'),
('V1-CARD-0465','V1-FCT-1643','batch_retained_candidate'),
('V1-CARD-0466','V1-FCT-1644','batch_retained_candidate'),
('V1-CARD-0466','V1-FCT-1645','batch_retained_candidate'),
('V1-CARD-0466','V1-FCT-1646','batch_retained_candidate'),
('V1-CARD-0467','V1-FCT-1647','batch_retained_candidate'),
('V1-CARD-0467','V1-FCT-1648','batch_retained_candidate'),
('V1-CARD-0467','V1-FCT-1649','batch_retained_candidate'),
('V1-CARD-0468','V1-FCT-1650','batch_retained_candidate'),
('V1-CARD-0468','V1-FCT-1651','batch_retained_candidate'),
('V1-CARD-0468','V1-FCT-1652','batch_retained_candidate'),
('V1-CARD-0468','V1-FCT-1653','research_note_only'),
('V1-CARD-0469','V1-FCT-1654','batch_retained_candidate'),
('V1-CARD-0469','V1-FCT-1655','batch_retained_candidate'),
('V1-CARD-0469','V1-FCT-1656','batch_retained_candidate'),
('V1-CARD-0470','V1-FCT-1657','batch_retained_candidate'),
('V1-CARD-0470','V1-FCT-1658','batch_retained_candidate'),
('V1-CARD-0470','V1-FCT-1659','batch_retained_candidate'),
('V1-CARD-0471','V1-FCT-1660','batch_retained_candidate'),
('V1-CARD-0471','V1-FCT-1661','batch_retained_candidate'),
('V1-CARD-0471','V1-FCT-1662','batch_retained_candidate'),
('V1-CARD-0472','V1-FCT-1663','batch_retained_candidate'),
('V1-CARD-0472','V1-FCT-1664','batch_retained_candidate'),
('V1-CARD-0472','V1-FCT-1665','batch_retained_candidate'),
('V1-CARD-0472','V1-FCT-1666','research_note_only'),
('V1-CARD-0473','V1-FCT-1667','batch_retained_candidate'),
('V1-CARD-0473','V1-FCT-1668','batch_retained_candidate'),
('V1-CARD-0473','V1-FCT-1669','batch_retained_candidate'),
('V1-CARD-0473','V1-FCT-1670','research_note_only'),
('V1-CARD-0474','V1-FCT-1671','batch_retained_candidate'),
('V1-CARD-0474','V1-FCT-1672','batch_retained_candidate'),
('V1-CARD-0474','V1-FCT-1673','batch_retained_candidate'),
('V1-CARD-0475','V1-FCT-1674','batch_retained_candidate'),
('V1-CARD-0475','V1-FCT-1675','batch_retained_candidate'),
('V1-CARD-0475','V1-FCT-1676','batch_retained_candidate'),
('V1-CARD-0476','V1-FCT-1677','batch_retained_candidate'),
('V1-CARD-0476','V1-FCT-1678','batch_retained_candidate'),
('V1-CARD-0476','V1-FCT-1679','batch_retained_candidate'),
('V1-CARD-0476','V1-FCT-1680','batch_retained_candidate'),
('V1-CARD-0477','V1-FCT-1681','batch_retained_candidate'),
('V1-CARD-0477','V1-FCT-1682','batch_retained_candidate'),
('V1-CARD-0477','V1-FCT-1683','batch_retained_candidate'),
('V1-CARD-0478','V1-FCT-1684','batch_retained_candidate'),
('V1-CARD-0478','V1-FCT-1685','batch_retained_candidate'),
('V1-CARD-0478','V1-FCT-1686','batch_retained_candidate'),
('V1-CARD-0478','V1-FCT-1687','research_note_only'),
('V1-CARD-0479','V1-FCT-1688','batch_retained_candidate'),
('V1-CARD-0479','V1-FCT-1689','batch_retained_candidate'),
('V1-CARD-0479','V1-FCT-1690','batch_retained_candidate'),
('V1-CARD-0479','V1-FCT-1691','research_note_only'),
('V1-CARD-0480','V1-FCT-1692','batch_retained_candidate'),
('V1-CARD-0480','V1-FCT-1693','batch_retained_candidate'),
('V1-CARD-0480','V1-FCT-1694','batch_retained_candidate'),
('V1-CARD-0481','V1-FCT-1695','batch_retained_candidate'),
('V1-CARD-0481','V1-FCT-1696','batch_retained_candidate'),
('V1-CARD-0481','V1-FCT-1697','batch_retained_candidate'),
('V1-CARD-0482','V1-FCT-1698','batch_retained_candidate'),
('V1-CARD-0482','V1-FCT-1699','batch_retained_candidate'),
('V1-CARD-0482','V1-FCT-1700','batch_retained_candidate'),
('V1-CARD-0483','V1-FCT-1701','batch_retained_candidate'),
('V1-CARD-0483','V1-FCT-1702','batch_retained_candidate'),
('V1-CARD-0483','V1-FCT-1703','batch_retained_candidate'),
('V1-CARD-0484','V1-FCT-1704','batch_retained_candidate'),
('V1-CARD-0484','V1-FCT-1705','batch_retained_candidate'),
('V1-CARD-0484','V1-FCT-1706','batch_retained_candidate'),
('V1-CARD-0484','V1-FCT-1707','batch_retained_candidate'),
('V1-CARD-0485','V1-FCT-1708','batch_retained_candidate'),
('V1-CARD-0485','V1-FCT-1709','batch_retained_candidate'),
('V1-CARD-0485','V1-FCT-1710','batch_retained_candidate'),
('V1-CARD-0486','V1-FCT-1711','batch_retained_candidate'),
('V1-CARD-0486','V1-FCT-1712','batch_retained_candidate'),
('V1-CARD-0486','V1-FCT-1713','batch_retained_candidate'),
('V1-CARD-0487','V1-FCT-1714','batch_retained_candidate'),
('V1-CARD-0487','V1-FCT-1715','batch_retained_candidate'),
('V1-CARD-0487','V1-FCT-1716','batch_retained_candidate'),
('V1-CARD-0488','V1-FCT-1717','batch_retained_candidate'),
('V1-CARD-0488','V1-FCT-1718','batch_retained_candidate'),
('V1-CARD-0488','V1-FCT-1719','batch_retained_candidate'),
('V1-CARD-0489','V1-FCT-1720','batch_retained_candidate'),
('V1-CARD-0489','V1-FCT-1721','batch_retained_candidate'),
('V1-CARD-0489','V1-FCT-1722','batch_retained_candidate'),
('V1-CARD-0490','V1-FCT-1723','batch_retained_candidate'),
('V1-CARD-0490','V1-FCT-1724','batch_retained_candidate'),
('V1-CARD-0490','V1-FCT-1725','batch_retained_candidate'),
('V1-CARD-0491','V1-FCT-1726','batch_retained_candidate'),
('V1-CARD-0491','V1-FCT-1727','batch_retained_candidate'),
('V1-CARD-0491','V1-FCT-1728','batch_retained_candidate'),
('V1-CARD-0491','V1-FCT-1729','batch_retained_candidate'),
('V1-CARD-0491','V1-FCT-1730','research_note_only'),
('V1-CARD-0492','V1-FCT-1731','batch_retained_candidate'),
('V1-CARD-0492','V1-FCT-1732','batch_retained_candidate'),
('V1-CARD-0492','V1-FCT-1733','batch_retained_candidate'),
('V1-CARD-0493','V1-FCT-1734','batch_retained_candidate'),
('V1-CARD-0493','V1-FCT-1735','batch_retained_candidate'),
('V1-CARD-0493','V1-FCT-1736','batch_retained_candidate'),
('V1-CARD-0494','V1-FCT-1737','batch_retained_candidate'),
('V1-CARD-0494','V1-FCT-1738','batch_retained_candidate'),
('V1-CARD-0494','V1-FCT-1739','batch_retained_candidate'),
('V1-CARD-0495','V1-FCT-1740','batch_retained_candidate'),
('V1-CARD-0495','V1-FCT-1741','batch_retained_candidate'),
('V1-CARD-0495','V1-FCT-1742','batch_retained_candidate'),
('V1-CARD-0496','V1-FCT-1743','batch_retained_candidate'),
('V1-CARD-0496','V1-FCT-1744','batch_retained_candidate'),
('V1-CARD-0496','V1-FCT-1745','batch_retained_candidate'),
('V1-CARD-0497','V1-FCT-1746','batch_retained_candidate'),
('V1-CARD-0497','V1-FCT-1747','batch_retained_candidate'),
('V1-CARD-0497','V1-FCT-1748','batch_retained_candidate'),
('V1-CARD-0498','V1-FCT-1749','batch_retained_candidate'),
('V1-CARD-0498','V1-FCT-1750','batch_retained_candidate'),
('V1-CARD-0498','V1-FCT-1751','batch_retained_candidate'),
('V1-CARD-0499','V1-FCT-1752','batch_retained_candidate'),
('V1-CARD-0499','V1-FCT-1753','batch_retained_candidate'),
('V1-CARD-0499','V1-FCT-1754','batch_retained_candidate'),
('V1-CARD-0500','V1-FCT-1755','batch_retained_candidate'),
('V1-CARD-0500','V1-FCT-1756','batch_retained_candidate'),
('V1-CARD-0500','V1-FCT-1757','batch_retained_candidate'),
('V1-CARD-0501','V1-FCT-1758','batch_retained_candidate'),
('V1-CARD-0501','V1-FCT-1759','batch_retained_candidate'),
('V1-CARD-0501','V1-FCT-1760','batch_retained_candidate'),
('V1-CARD-0502','V1-FCT-1761','batch_retained_candidate'),
('V1-CARD-0502','V1-FCT-1762','batch_retained_candidate'),
('V1-CARD-0502','V1-FCT-1763','batch_retained_candidate'),
('V1-CARD-0502','V1-FCT-1764','batch_retained_candidate'),
('V1-CARD-0503','V1-FCT-1765','batch_retained_candidate'),
('V1-CARD-0503','V1-FCT-1766','batch_retained_candidate'),
('V1-CARD-0503','V1-FCT-1767','batch_retained_candidate'),
('V1-CARD-0504','V1-FCT-1768','batch_retained_candidate'),
('V1-CARD-0504','V1-FCT-1769','batch_retained_candidate'),
('V1-CARD-0504','V1-FCT-1770','batch_retained_candidate'),
('V1-CARD-0505','V1-FCT-1771','batch_retained_candidate'),
('V1-CARD-0505','V1-FCT-1772','batch_retained_candidate'),
('V1-CARD-0505','V1-FCT-1773','batch_retained_candidate'),
('V1-CARD-0506','V1-FCT-1774','batch_retained_candidate'),
('V1-CARD-0506','V1-FCT-1775','batch_retained_candidate'),
('V1-CARD-0506','V1-FCT-1776','batch_retained_candidate'),
('V1-CARD-0507','V1-FCT-1777','batch_retained_candidate'),
('V1-CARD-0507','V1-FCT-1778','batch_retained_candidate'),
('V1-CARD-0507','V1-FCT-1779','batch_retained_candidate'),
('V1-CARD-0508','V1-FCT-1780','batch_retained_candidate'),
('V1-CARD-0508','V1-FCT-1781','batch_retained_candidate'),
('V1-CARD-0508','V1-FCT-1782','batch_retained_candidate'),
('V1-CARD-0509','V1-FCT-1783','batch_retained_candidate'),
('V1-CARD-0509','V1-FCT-1784','batch_retained_candidate'),
('V1-CARD-0509','V1-FCT-1785','batch_retained_candidate'),
('V1-CARD-0510','V1-FCT-1786','batch_retained_candidate'),
('V1-CARD-0510','V1-FCT-1787','batch_retained_candidate'),
('V1-CARD-0510','V1-FCT-1788','batch_retained_candidate'),
('V1-CARD-0511','V1-FCT-1789','batch_retained_candidate'),
('V1-CARD-0511','V1-FCT-1790','batch_retained_candidate'),
('V1-CARD-0511','V1-FCT-1791','batch_retained_candidate'),
('V1-CARD-0512','V1-FCT-1792','batch_retained_candidate'),
('V1-CARD-0512','V1-FCT-1793','batch_retained_candidate'),
('V1-CARD-0512','V1-FCT-1794','batch_retained_candidate'),
('V1-CARD-0513','V1-FCT-1795','batch_retained_candidate'),
('V1-CARD-0513','V1-FCT-1796','batch_retained_candidate'),
('V1-CARD-0513','V1-FCT-1797','batch_retained_candidate'),
('V1-CARD-0514','V1-FCT-1798','batch_retained_candidate'),
('V1-CARD-0514','V1-FCT-1799','batch_retained_candidate'),
('V1-CARD-0514','V1-FCT-1800','batch_retained_candidate'),
('V1-CARD-0515','V1-FCT-1801','batch_retained_candidate'),
('V1-CARD-0515','V1-FCT-1802','batch_retained_candidate'),
('V1-CARD-0515','V1-FCT-1803','batch_retained_candidate'),
('V1-CARD-0516','V1-FCT-1804','batch_retained_candidate'),
('V1-CARD-0516','V1-FCT-1805','batch_retained_candidate'),
('V1-CARD-0516','V1-FCT-1806','batch_retained_candidate'),
('V1-CARD-0517','V1-FCT-1807','batch_retained_candidate'),
('V1-CARD-0517','V1-FCT-1808','batch_retained_candidate'),
('V1-CARD-0517','V1-FCT-1809','batch_retained_candidate'),
('V1-CARD-0517','V1-FCT-1810','batch_retained_candidate'),
('V1-CARD-0517','V1-FCT-1811','research_note_only'),
('V1-CARD-0518','V1-FCT-1812','batch_retained_candidate'),
('V1-CARD-0518','V1-FCT-1813','batch_retained_candidate'),
('V1-CARD-0518','V1-FCT-1814','batch_retained_candidate'),
('V1-CARD-0518','V1-FCT-1815','research_note_only'),
('V1-CARD-0519','V1-FCT-1816','batch_retained_candidate'),
('V1-CARD-0519','V1-FCT-1817','batch_retained_candidate'),
('V1-CARD-0519','V1-FCT-1818','batch_retained_candidate'),
('V1-CARD-0519','V1-FCT-1819','batch_retained_candidate'),
('V1-CARD-0520','V1-FCT-1820','batch_retained_candidate'),
('V1-CARD-0520','V1-FCT-1821','batch_retained_candidate'),
('V1-CARD-0520','V1-FCT-1822','batch_retained_candidate'),
('V1-CARD-0520','V1-FCT-1823','research_note_only'),
('V1-CARD-0521','V1-FCT-1824','batch_retained_candidate'),
('V1-CARD-0521','V1-FCT-1825','batch_retained_candidate'),
('V1-CARD-0521','V1-FCT-1826','batch_retained_candidate'),
('V1-CARD-0522','V1-FCT-1827','batch_retained_candidate'),
('V1-CARD-0522','V1-FCT-1828','batch_retained_candidate'),
('V1-CARD-0522','V1-FCT-1829','batch_retained_candidate'),
('V1-CARD-0523','V1-FCT-1830','batch_retained_candidate'),
('V1-CARD-0523','V1-FCT-1831','batch_retained_candidate'),
('V1-CARD-0523','V1-FCT-1832','batch_retained_candidate'),
('V1-CARD-0524','V1-FCT-1833','batch_retained_candidate'),
('V1-CARD-0524','V1-FCT-1834','batch_retained_candidate'),
('V1-CARD-0524','V1-FCT-1835','research_note_only'),
('V1-CARD-0524','V1-FCT-1836','batch_retained_candidate'),
('V1-CARD-0524','V1-FCT-1837','batch_retained_candidate'),
('V1-CARD-0525','V1-FCT-1838','batch_retained_candidate'),
('V1-CARD-0525','V1-FCT-1839','batch_retained_candidate'),
('V1-CARD-0525','V1-FCT-1840','batch_retained_candidate'),
('V1-CARD-0526','V1-FCT-1841','batch_retained_candidate'),
('V1-CARD-0526','V1-FCT-1842','batch_retained_candidate'),
('V1-CARD-0526','V1-FCT-1843','batch_retained_candidate'),
('V1-CARD-0526','V1-FCT-1844','research_note_only'),
('V1-CARD-0527','V1-FCT-1845','batch_retained_candidate'),
('V1-CARD-0527','V1-FCT-1846','batch_retained_candidate'),
('V1-CARD-0527','V1-FCT-1847','batch_retained_candidate'),
('V1-CARD-0527','V1-FCT-1848','research_note_only'),
('V1-CARD-0528','V1-FCT-1849','batch_retained_candidate'),
('V1-CARD-0528','V1-FCT-1850','batch_retained_candidate'),
('V1-CARD-0528','V1-FCT-1851','batch_retained_candidate'),
('V1-CARD-0528','V1-FCT-1852','research_note_only'),
('V1-CARD-0529','V1-FCT-1853','batch_retained_candidate'),
('V1-CARD-0529','V1-FCT-1854','batch_retained_candidate'),
('V1-CARD-0529','V1-FCT-1855','batch_retained_candidate'),
('V1-CARD-0529','V1-FCT-1856','research_note_only'),
('V1-CARD-0530','V1-FCT-1857','batch_retained_candidate'),
('V1-CARD-0530','V1-FCT-1858','batch_retained_candidate'),
('V1-CARD-0530','V1-FCT-1859','batch_retained_candidate'),
('V1-CARD-0530','V1-FCT-1860','research_note_only'),
('V1-CARD-0531','V1-FCT-1861','batch_retained_candidate'),
('V1-CARD-0531','V1-FCT-1862','batch_retained_candidate'),
('V1-CARD-0531','V1-FCT-1863','batch_retained_candidate'),
('V1-CARD-0531','V1-FCT-1864','research_note_only'),
('V1-CARD-0532','V1-FCT-1865','batch_retained_candidate'),
('V1-CARD-0532','V1-FCT-1866','batch_retained_candidate'),
('V1-CARD-0532','V1-FCT-1867','batch_retained_candidate'),
('V1-CARD-0532','V1-FCT-1868','research_note_only'),
('V1-CARD-0533','V1-FCT-1869','batch_retained_candidate'),
('V1-CARD-0533','V1-FCT-1870','batch_retained_candidate'),
('V1-CARD-0533','V1-FCT-1871','batch_retained_candidate'),
('V1-CARD-0533','V1-FCT-1872','research_note_only'),
('V1-CARD-0534','V1-FCT-1873','batch_retained_candidate'),
('V1-CARD-0534','V1-FCT-1874','batch_retained_candidate'),
('V1-CARD-0534','V1-FCT-1875','batch_retained_candidate'),
('V1-CARD-0534','V1-FCT-1876','research_note_only'),
('V1-CARD-0535','V1-FCT-1877','batch_retained_candidate'),
('V1-CARD-0535','V1-FCT-1878','batch_retained_candidate'),
('V1-CARD-0535','V1-FCT-1879','research_note_only'),
('V1-CARD-0536','V1-FCT-1880','batch_retained_candidate'),
('V1-CARD-0536','V1-FCT-1881','batch_retained_candidate'),
('V1-CARD-0536','V1-FCT-1882','research_note_only'),
('V1-CARD-0537','V1-FCT-1883','batch_retained_candidate'),
('V1-CARD-0537','V1-FCT-1884','batch_retained_candidate'),
('V1-CARD-0537','V1-FCT-1885','research_note_only'),
('V1-CARD-0538','V1-FCT-1886','batch_retained_candidate'),
('V1-CARD-0538','V1-FCT-1887','batch_retained_candidate'),
('V1-CARD-0538','V1-FCT-1888','batch_retained_candidate'),
('V1-CARD-0539','V1-FCT-1889','batch_retained_candidate'),
('V1-CARD-0539','V1-FCT-1890','batch_retained_candidate'),
('V1-CARD-0539','V1-FCT-1891','batch_retained_candidate'),
('V1-CARD-0540','V1-FCT-1892','batch_retained_candidate'),
('V1-CARD-0540','V1-FCT-1893','batch_retained_candidate'),
('V1-CARD-0541','V1-FCT-1894','batch_retained_candidate'),
('V1-CARD-0541','V1-FCT-1895','batch_retained_candidate'),
('V1-CARD-0542','V1-FCT-1896','batch_retained_candidate'),
('V1-CARD-0542','V1-FCT-1897','batch_retained_candidate'),
('V1-CARD-0543','V1-FCT-1898','batch_retained_candidate'),
('V1-CARD-0543','V1-FCT-1899','batch_retained_candidate');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0956','WCD10-B08-S001','V1-CARD-0444','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-0957','WCD10-B08-S002','V1-CARD-0444','SRC-0547','B','bibliography_or_bounded_description','yes','no','SRC-0547','accepted','NONE'),
('V1-CS-0958','WCD10-B08-S002','V1-CARD-0445','SRC-0547','B','bibliography_or_bounded_description','yes','no','SRC-0547','accepted','NONE'),
('V1-CS-0959','WCD10-B08-S009','V1-CARD-0445','SRC-0553','A','bibliography_or_bounded_description','yes','no','SRC-0553','accepted','NONE'),
('V1-CS-0960','WCD10-B08-S017','V1-CARD-0445','SRC-0559','B','bibliography_or_bounded_description','no','no','SRC-0559','accepted','NONE'),
('V1-CS-0961','WCD10-B08-S001','V1-CARD-0446','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-0962','WCD10-B08-S014','V1-CARD-0446','SRC-0556','B','bibliography_or_bounded_description','yes','no','SRC-0556','accepted','NONE'),
('V1-CS-0963','WCD10-B08-S018','V1-CARD-0446','SRC-0560','C','bibliography_or_bounded_description','no','no','SRC-0560','accepted','NONE'),
('V1-CS-0964','WCD10-B08-S001','V1-CARD-0447','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-0965','WCD10-B08-S002','V1-CARD-0447','SRC-0547','B','bibliography_or_bounded_description','yes','no','SRC-0547','accepted','NONE'),
('V1-CS-0966','WCD10-B08-S019','V1-CARD-0447','SRC-0561','C','bibliography_or_bounded_description','no','no','SRC-0561','accepted','NONE'),
('V1-CS-0967','WCD10-B08-S001','V1-CARD-0448','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-0968','WCD10-B08-S002','V1-CARD-0448','SRC-0547','B','bibliography_or_bounded_description','yes','no','SRC-0547','accepted','NONE'),
('V1-CS-0969','WCD10-B08-S032','V1-CARD-0448','SRC-0574','C','bibliography_or_bounded_description','no','no','SRC-0574','accepted','NONE'),
('V1-CS-0970','WCD10-B08-S040','V1-CARD-0448','SRC-0579','B','bibliography_or_bounded_description','no','no','SRC-0579','accepted','NONE'),
('V1-CS-0971','WCD10-B08-S001','V1-CARD-0449','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-0972','WCD10-B08-S003','V1-CARD-0449','SRC-0548','B','bibliography_or_bounded_description','yes','no','SRC-0548','accepted','NONE'),
('V1-CS-0973','WCD10-B08-S037','V1-CARD-0449','SRC-0576','B','bibliography_or_bounded_description','no','no','SRC-0576','accepted','NONE'),
('V1-CS-0974','WCD10-B08-S001','V1-CARD-0450','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-0975','WCD10-B08-S002','V1-CARD-0450','SRC-0547','B','bibliography_or_bounded_description','yes','no','SRC-0547','accepted','NONE'),
('V1-CS-0976','WCD10-B08-S021','V1-CARD-0450','SRC-0563','C','bibliography_or_bounded_description','no','no','SRC-0563','accepted','NONE'),
('V1-CS-0977','WCD10-B08-S001','V1-CARD-0451','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-0978','WCD10-B08-S002','V1-CARD-0451','SRC-0547','B','bibliography_or_bounded_description','yes','no','SRC-0547','accepted','NONE'),
('V1-CS-0979','WCD10-B08-S022','V1-CARD-0451','SRC-0564','C','bibliography_or_bounded_description','no','no','SRC-0564','accepted','NONE'),
('V1-CS-0980','WCD10-B08-S002','V1-CARD-0452','SRC-0547','B','bibliography_or_bounded_description','yes','no','SRC-0547','accepted','NONE'),
('V1-CS-0981','WCD10-B08-S041','V1-CARD-0452','SRC-0580','C','bibliography_or_bounded_description','no','no','SRC-0580','accepted','NONE'),
('V1-CS-0982','WCD10-B08-S001','V1-CARD-0453','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-0983','WCD10-B08-S002','V1-CARD-0453','SRC-0547','B','bibliography_or_bounded_description','yes','no','SRC-0547','accepted','NONE'),
('V1-CS-0984','WCD10-B08-S020','V1-CARD-0453','SRC-0562','C','bibliography_or_bounded_description','no','no','SRC-0562','accepted','NONE'),
('V1-CS-0985','WCD10-B08-S014','V1-CARD-0454','SRC-0556','B','bibliography_or_bounded_description','yes','no','SRC-0556','accepted','NONE'),
('V1-CS-0986','WCD10-B08-S015','V1-CARD-0454','SRC-0557','A','bibliography_or_bounded_description','no','no','SRC-0557','accepted','NONE'),
('V1-CS-0987','WCD10-B08-S001','V1-CARD-0455','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-0988','WCD10-B08-S002','V1-CARD-0455','SRC-0547','B','bibliography_or_bounded_description','yes','no','SRC-0547','accepted','NONE'),
('V1-CS-0989','WCD10-B08-S039','V1-CARD-0455','SRC-0578','C','bibliography_or_bounded_description','no','no','SRC-0578','accepted','NONE'),
('V1-CS-0990','WCD10-B08-S001','V1-CARD-0456','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-0991','WCD10-B08-S003','V1-CARD-0456','SRC-0548','B','bibliography_or_bounded_description','yes','no','SRC-0548','accepted','NONE'),
('V1-CS-0992','WCD10-B08-S038','V1-CARD-0456','SRC-0577','C','bibliography_or_bounded_description','no','no','SRC-0577','accepted','NONE'),
('V1-CS-0993','WCD10-B08-S014','V1-CARD-0457','SRC-0556','B','bibliography_or_bounded_description','yes','no','SRC-0556','accepted','NONE'),
('V1-CS-0994','WCD10-B08-S038','V1-CARD-0457','SRC-0577','C','bibliography_or_bounded_description','yes','no','SRC-0577','accepted','NONE'),
('V1-CS-0995','WCD10-B08-S014','V1-CARD-0458','SRC-0556','B','bibliography_or_bounded_description','yes','no','SRC-0556','accepted','NONE'),
('V1-CS-0996','WCD10-B08-S038','V1-CARD-0458','SRC-0577','C','bibliography_or_bounded_description','yes','no','SRC-0577','accepted','NONE'),
('V1-CS-0997','WCD10-B08-S004','V1-CARD-0459','SRC-0549','A','bibliography_or_bounded_description','yes','no','SRC-0549','accepted','NONE'),
('V1-CS-0998','WCD10-B08-S009','V1-CARD-0459','SRC-0553','A','bibliography_or_bounded_description','yes','no','SRC-0553','accepted','NONE'),
('V1-CS-0999','WCD10-B08-S027','V1-CARD-0459','SRC-0569','C','bibliography_or_bounded_description','no','no','SRC-0569','accepted','NONE'),
('V1-CS-1000','WCD10-B08-S001','V1-CARD-0460','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-1001','WCD10-B08-S004','V1-CARD-0460','SRC-0549','A','bibliography_or_bounded_description','yes','no','SRC-0549','accepted','NONE'),
('V1-CS-1002','WCD10-B08-S004','V1-CARD-0461','SRC-0549','A','bibliography_or_bounded_description','yes','no','SRC-0549','accepted','NONE'),
('V1-CS-1003','WCD10-B08-S029','V1-CARD-0461','SRC-0571','C','bibliography_or_bounded_description','no','no','SRC-0571','accepted','NONE'),
('V1-CS-1004','WCD10-B08-S001','V1-CARD-0462','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-1005','WCD10-B08-S004','V1-CARD-0462','SRC-0549','A','bibliography_or_bounded_description','yes','no','SRC-0549','accepted','NONE'),
('V1-CS-1006','WCD10-B08-S028','V1-CARD-0462','SRC-0570','C','bibliography_or_bounded_description','no','no','SRC-0570','accepted','NONE'),
('V1-CS-1007','WCD10-B08-S002','V1-CARD-0463','SRC-0547','B','bibliography_or_bounded_description','yes','no','SRC-0547','accepted','NONE'),
('V1-CS-1008','WCD10-B08-S014','V1-CARD-0463','SRC-0556','B','bibliography_or_bounded_description','yes','no','SRC-0556','accepted','NONE'),
('V1-CS-1009','WCD10-B08-S026','V1-CARD-0463','SRC-0568','C','bibliography_or_bounded_description','no','no','SRC-0568','accepted','NONE'),
('V1-CS-1010','WCD10-B08-S010','V1-CARD-0464','SRC-0554','A','attributed_study','yes','yes','SRC-0554','accepted','NONE'),
('V1-CS-1011','WCD10-B08-S001','V1-CARD-0465','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-1012','WCD10-B08-S025','V1-CARD-0465','SRC-0567','C','bibliography_or_bounded_description','no','no','SRC-0567','accepted','NONE'),
('V1-CS-1013','WCD10-B08-S005','V1-CARD-0466','SRC-0550','A','bibliography_or_bounded_description','yes','no','SRC-0550','accepted','NONE'),
('V1-CS-1014','WCD10-B08-S006','V1-CARD-0466','SRC-0551','B','bibliography_or_bounded_description','no','no','SRC-0551','accepted','NONE'),
('V1-CS-1015','WCD10-B08-S005','V1-CARD-0467','SRC-0550','A','bibliography_or_bounded_description','yes','no','SRC-0550','accepted','NONE'),
('V1-CS-1016','WCD10-B08-S005','V1-CARD-0468','SRC-0550','A','bibliography_or_bounded_description','yes','no','SRC-0550','accepted','NONE'),
('V1-CS-1017','WCD10-B08-S007','V1-CARD-0468','SRC-0552','A','attributed_study','yes','yes','SRC-0552','accepted','NONE'),
('V1-CS-1018','WCD10-B08-S005','V1-CARD-0469','SRC-0550','A','bibliography_or_bounded_description','yes','no','SRC-0550','accepted','NONE'),
('V1-CS-1019','WCD10-B08-S005','V1-CARD-0470','SRC-0550','A','bibliography_or_bounded_description','yes','no','SRC-0550','accepted','NONE'),
('V1-CS-1020','WCD10-B08-S042','V1-CARD-0470','SRC-0581','C','bibliography_or_bounded_description','no','no','SRC-0581','accepted','NONE'),
('V1-CS-1021','WCD10-B08-S004','V1-CARD-0471','SRC-0549','A','bibliography_or_bounded_description','yes','no','SRC-0549','accepted','NONE'),
('V1-CS-1022','WCD10-B08-S030','V1-CARD-0471','SRC-0572','C','bibliography_or_bounded_description','no','no','SRC-0572','accepted','NONE'),
('V1-CS-1023','WCD10-B08-S004','V1-CARD-0472','SRC-0549','A','attributed_study','yes','yes','SRC-0549','accepted','NONE'),
('V1-CS-1024','WCD10-B08-S004','V1-CARD-0473','SRC-0549','A','attributed_study','yes','yes','SRC-0549','accepted','NONE'),
('V1-CS-1025','WCD10-B08-S004','V1-CARD-0474','SRC-0549','A','bibliography_or_bounded_description','yes','no','SRC-0549','accepted','NONE'),
('V1-CS-1026','WCD10-B08-S031','V1-CARD-0474','SRC-0573','C','bibliography_or_bounded_description','no','no','SRC-0573','accepted','NONE'),
('V1-CS-1027','WCD10-B08-S014','V1-CARD-0475','SRC-0556','B','bibliography_or_bounded_description','yes','no','SRC-0556','accepted','NONE'),
('V1-CS-1028','WCD10-B08-S016','V1-CARD-0475','SRC-0558','C','bibliography_or_bounded_description','yes','no','SRC-0558','accepted','NONE'),
('V1-CS-1029','WCD10-B08-S043','V1-CARD-0475','SRC-0582','C','bibliography_or_bounded_description','no','no','SRC-0582','accepted','NONE'),
('V1-CS-1030','WCD10-B08-S011','V1-CARD-0476','SRC-0555','B','bibliography_or_bounded_description','yes','no','SRC-0555','accepted','NONE'),
('V1-CS-1031','WCD10-B08-S015','V1-CARD-0476','SRC-0557','A','bibliography_or_bounded_description','yes','no','SRC-0557','accepted','NONE'),
('V1-CS-1032','WCD10-B08-S011','V1-CARD-0477','SRC-0555','B','bibliography_or_bounded_description','yes','no','SRC-0555','accepted','NONE'),
('V1-CS-1033','WCD10-B08-S015','V1-CARD-0477','SRC-0557','A','bibliography_or_bounded_description','no','no','SRC-0557','accepted','NONE'),
('V1-CS-1034','WCD10-B08-S036','V1-CARD-0478','SRC-0575','A','attributed_study','yes','yes','SRC-0575','accepted','NONE'),
('V1-CS-1035','WCD10-B08-S036','V1-CARD-0479','SRC-0575','A','attributed_study','yes','yes','SRC-0575','accepted','NONE'),
('V1-CS-1036','WCD10-B08-S101','V1-CARD-0480','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1037','WCD10-B08-S102','V1-CARD-0480','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1038','WCD10-B08-S103','V1-CARD-0480','SRC-0583','B','bibliography_or_bounded_description','yes','no','SRC-0583','accepted','NONE'),
('V1-CS-1039','WCD10-B08-S117','V1-CARD-0480','SRC-0597','B','bibliography_or_bounded_description','no','no','SRC-0597','accepted','NONE'),
('V1-CS-1040','WCD10-B08-S101','V1-CARD-0481','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1041','WCD10-B08-S102','V1-CARD-0481','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1042','WCD10-B08-S104','V1-CARD-0481','SRC-0584','B','bibliography_or_bounded_description','yes','no','SRC-0584','accepted','NONE'),
('V1-CS-1043','WCD10-B08-S118','V1-CARD-0481','SRC-0598','B','bibliography_or_bounded_description','no','no','SRC-0598','accepted','NONE'),
('V1-CS-1044','WCD10-B08-S101','V1-CARD-0482','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1045','WCD10-B08-S102','V1-CARD-0482','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1046','WCD10-B08-S105','V1-CARD-0482','SRC-0585','B','bibliography_or_bounded_description','yes','no','SRC-0585','accepted','NONE'),
('V1-CS-1047','WCD10-B08-S119','V1-CARD-0482','SRC-0599','B','bibliography_or_bounded_description','no','no','SRC-0599','accepted','NONE'),
('V1-CS-1048','WCD10-B08-S101','V1-CARD-0483','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1049','WCD10-B08-S102','V1-CARD-0483','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1050','WCD10-B08-S120','V1-CARD-0483','SRC-0600','B','bibliography_or_bounded_description','no','no','SRC-0600','accepted','NONE'),
('V1-CS-1051','WCD10-B08-S114','V1-CARD-0484','SRC-0594','C','bibliography_or_bounded_description','yes','no','SRC-0594','accepted','NONE'),
('V1-CS-1052','WCD10-B08-S133','V1-CARD-0484','SRC-0608','B','bibliography_or_bounded_description','yes','no','SRC-0608','accepted','NONE'),
('V1-CS-1053','WCD10-B08-S154','V1-CARD-0484','SRC-0627','B','bibliography_or_bounded_description','no','no','SRC-0627','accepted','NONE'),
('V1-CS-1054','WCD10-B08-S101','V1-CARD-0485','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1055','WCD10-B08-S102','V1-CARD-0485','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1056','WCD10-B08-S121','V1-CARD-0485','SRC-0601','B','bibliography_or_bounded_description','no','no','SRC-0601','accepted','NONE'),
('V1-CS-1057','WCD10-B08-S101','V1-CARD-0486','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1058','WCD10-B08-S102','V1-CARD-0486','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1059','WCD10-B08-S122','V1-CARD-0486','SRC-0602','B','bibliography_or_bounded_description','no','no','SRC-0602','accepted','NONE'),
('V1-CS-1060','WCD10-B08-S101','V1-CARD-0487','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1061','WCD10-B08-S102','V1-CARD-0487','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1062','WCD10-B08-S128','V1-CARD-0487','SRC-0605','A','bibliography_or_bounded_description','no','no','SRC-0605','accepted','NONE'),
('V1-CS-1063','WCD10-B08-S158','V1-CARD-0488','SRC-0631','B','bibliography_or_bounded_description','yes','no','SRC-0631','accepted','NONE'),
('V1-CS-1064','WCD10-B08-S101','V1-CARD-0489','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1065','WCD10-B08-S102','V1-CARD-0489','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1066','WCD10-B08-S148','V1-CARD-0489','SRC-0622','B','bibliography_or_bounded_description','no','no','SRC-0622','accepted','NONE'),
('V1-CS-1067','WCD10-B08-S152','V1-CARD-0489','SRC-0625','B','bibliography_or_bounded_description','no','no','SRC-0625','accepted','NONE'),
('V1-CS-1068','WCD10-B08-S153','V1-CARD-0489','SRC-0626','B','bibliography_or_bounded_description','no','no','SRC-0626','accepted','NONE'),
('V1-CS-1069','WCD10-B08-S101','V1-CARD-0490','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1070','WCD10-B08-S102','V1-CARD-0490','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1071','WCD10-B08-S149','V1-CARD-0490','SRC-0623','B','bibliography_or_bounded_description','no','no','SRC-0623','accepted','NONE'),
('V1-CS-1072','WCD10-B08-S101','V1-CARD-0491','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1073','WCD10-B08-S102','V1-CARD-0491','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1074','WCD10-B08-S108','V1-CARD-0491','SRC-0588','B','bibliography_or_bounded_description','yes','no','SRC-0588','accepted','NONE'),
('V1-CS-1075','WCD10-B08-S109','V1-CARD-0491','SRC-0589','A','attributed_study','yes','yes','SRC-0589','accepted','NONE'),
('V1-CS-1076','WCD10-B08-S101','V1-CARD-0492','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1077','WCD10-B08-S102','V1-CARD-0492','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1078','WCD10-B08-S150','V1-CARD-0492','SRC-0624','B','bibliography_or_bounded_description','no','no','SRC-0624','accepted','NONE'),
('V1-CS-1079','WCD10-B08-S101','V1-CARD-0493','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1080','WCD10-B08-S102','V1-CARD-0493','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1081','WCD10-B08-S116','V1-CARD-0493','SRC-0596','B','bibliography_or_bounded_description','no','no','SRC-0596','accepted','NONE'),
('V1-CS-1082','WCD10-B08-S102','V1-CARD-0494','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1083','WCD10-B08-S131','V1-CARD-0494','SRC-0606','B','bibliography_or_bounded_description','yes','no','SRC-0606','accepted','NONE'),
('V1-CS-1084','WCD10-B08-S132','V1-CARD-0494','SRC-0607','B','bibliography_or_bounded_description','no','no','SRC-0607','accepted','NONE'),
('V1-CS-1085','WCD10-B08-S101','V1-CARD-0495','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1086','WCD10-B08-S102','V1-CARD-0495','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1087','WCD10-B08-S139','V1-CARD-0495','SRC-0613','B','bibliography_or_bounded_description','no','no','SRC-0613','accepted','NONE'),
('V1-CS-1088','WCD10-B08-S101','V1-CARD-0496','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1089','WCD10-B08-S102','V1-CARD-0496','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1090','WCD10-B08-S140','V1-CARD-0496','SRC-0614','B','bibliography_or_bounded_description','no','no','SRC-0614','accepted','NONE'),
('V1-CS-1091','WCD10-B08-S101','V1-CARD-0497','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1092','WCD10-B08-S102','V1-CARD-0497','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1093','WCD10-B08-S147','V1-CARD-0497','SRC-0621','B','bibliography_or_bounded_description','no','no','SRC-0621','accepted','NONE'),
('V1-CS-1094','WCD10-B08-S101','V1-CARD-0498','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1095','WCD10-B08-S102','V1-CARD-0498','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1096','WCD10-B08-S146','V1-CARD-0498','SRC-0620','B','bibliography_or_bounded_description','no','no','SRC-0620','accepted','NONE'),
('V1-CS-1097','WCD10-B08-S101','V1-CARD-0499','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1098','WCD10-B08-S102','V1-CARD-0499','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1099','WCD10-B08-S141','V1-CARD-0499','SRC-0615','B','bibliography_or_bounded_description','no','no','SRC-0615','accepted','NONE'),
('V1-CS-1100','WCD10-B08-S101','V1-CARD-0500','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1101','WCD10-B08-S102','V1-CARD-0500','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1102','WCD10-B08-S142','V1-CARD-0500','SRC-0616','B','bibliography_or_bounded_description','no','no','SRC-0616','accepted','NONE'),
('V1-CS-1103','WCD10-B08-S143','V1-CARD-0500','SRC-0617','A','bibliography_or_bounded_description','no','no','SRC-0617','accepted','NONE'),
('V1-CS-1104','WCD10-B08-S101','V1-CARD-0501','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1105','WCD10-B08-S102','V1-CARD-0501','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1106','WCD10-B08-S144','V1-CARD-0501','SRC-0618','B','bibliography_or_bounded_description','no','no','SRC-0618','accepted','NONE'),
('V1-CS-1107','WCD10-B08-S145','V1-CARD-0501','SRC-0619','B','bibliography_or_bounded_description','no','no','SRC-0619','accepted','NONE'),
('V1-CS-1108','WCD10-B08-S101','V1-CARD-0502','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1109','WCD10-B08-S102','V1-CARD-0502','SRC-0165','B','bibliography_or_bounded_description','no','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1110','WCD10-B08-S113','V1-CARD-0502','SRC-0593','B','bibliography_or_bounded_description','yes','no','SRC-0593','accepted','NONE'),
('V1-CS-1111','WCD10-B08-S111','V1-CARD-0503','SRC-0591','B','bibliography_or_bounded_description','yes','no','SRC-0591','accepted','NONE'),
('V1-CS-1112','WCD10-B08-S112','V1-CARD-0503','SRC-0592','B','bibliography_or_bounded_description','yes','no','SRC-0592','accepted','NONE'),
('V1-CS-1113','WCD10-B08-S116','V1-CARD-0504','SRC-0596','B','bibliography_or_bounded_description','yes','no','SRC-0596','accepted','NONE'),
('V1-CS-1114','WCD10-B08-S115','V1-CARD-0505','SRC-0595','B','bibliography_or_bounded_description','yes','no','SRC-0595','accepted','NONE'),
('V1-CS-1115','WCD10-B08-S134','V1-CARD-0506','SRC-0609','A','bibliography_or_bounded_description','yes','no','SRC-0609','accepted','NONE'),
('V1-CS-1116','WCD10-B08-S134','V1-CARD-0507','SRC-0609','A','bibliography_or_bounded_description','yes','no','SRC-0609','accepted','NONE'),
('V1-CS-1117','WCD10-B08-S134','V1-CARD-0508','SRC-0609','A','bibliography_or_bounded_description','yes','no','SRC-0609','accepted','NONE'),
('V1-CS-1118','WCD10-B08-S134','V1-CARD-0509','SRC-0609','A','bibliography_or_bounded_description','yes','no','SRC-0609','accepted','NONE'),
('V1-CS-1119','WCD10-B08-S134','V1-CARD-0510','SRC-0609','A','bibliography_or_bounded_description','yes','no','SRC-0609','accepted','NONE'),
('V1-CS-1120','WCD10-B08-S135','V1-CARD-0511','SRC-0610','B','bibliography_or_bounded_description','yes','no','SRC-0610','accepted','NONE'),
('V1-CS-1121','WCD10-B08-S134','V1-CARD-0512','SRC-0609','A','bibliography_or_bounded_description','yes','no','SRC-0609','accepted','NONE'),
('V1-CS-1122','WCD10-B08-S101','V1-CARD-0513','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1123','WCD10-B08-S137','V1-CARD-0513','SRC-0611','C','bibliography_or_bounded_description','yes','no','SRC-0611','accepted','NONE'),
('V1-CS-1124','WCD10-B08-S101','V1-CARD-0514','SRC-0166','B','bibliography_or_bounded_description','yes','no','SRC-0166','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1125','WCD10-B08-S138','V1-CARD-0514','SRC-0612','B','bibliography_or_bounded_description','yes','no','SRC-0612','accepted','NONE'),
('V1-CS-1126','WCD10-B08-S155','V1-CARD-0515','SRC-0628','A','bibliography_or_bounded_description','yes','no','SRC-0628','accepted','NONE'),
('V1-CS-1127','WCD10-B08-S156','V1-CARD-0516','SRC-0629','B','bibliography_or_bounded_description','yes','no','SRC-0629','accepted','NONE'),
('V1-CS-1128','WCD10-B08-S157','V1-CARD-0516','SRC-0630','A','bibliography_or_bounded_description','yes','no','SRC-0630','accepted','NONE'),
('V1-CS-1129','WCD10-B08-S128','V1-CARD-0517','SRC-0605','A','bibliography_or_bounded_description','yes','no','SRC-0605','accepted','NONE'),
('V1-CS-1130','WCD10-B08-S148','V1-CARD-0517','SRC-0622','B','bibliography_or_bounded_description','yes','no','SRC-0622','accepted','NONE'),
('V1-CS-1131','WCD10-B08-S152','V1-CARD-0517','SRC-0625','B','bibliography_or_bounded_description','no','no','SRC-0625','accepted','NONE'),
('V1-CS-1132','WCD10-B08-S159','V1-CARD-0517','SRC-0632','A','attributed_study','yes','yes','SRC-0632','accepted','NONE'),
('V1-CS-1133','WCD10-B08-S202','V1-CARD-0518','SRC-0633','A','attributed_study','yes','yes','SRC-0633','accepted','NONE'),
('V1-CS-1134','WCD10-B08-S203','V1-CARD-0519','SRC-0634','B','bibliography_or_bounded_description','yes','no','SRC-0634','accepted','NONE'),
('V1-CS-1135','WCD10-B08-S204','V1-CARD-0519','SRC-0635','B','bibliography_or_bounded_description','yes','no','SRC-0635','accepted','NONE'),
('V1-CS-1136','WCD10-B08-S212','V1-CARD-0519','SRC-0642','B','bibliography_or_bounded_description','no','no','SRC-0642','accepted','NONE'),
('V1-CS-1137','WCD10-B08-S206','V1-CARD-0520','SRC-0637','A','attributed_study','yes','yes','SRC-0637','accepted','NONE'),
('V1-CS-1138','WCD10-B08-S203','V1-CARD-0521','SRC-0634','B','bibliography_or_bounded_description','yes','no','SRC-0634','accepted','NONE'),
('V1-CS-1139','WCD10-B08-S212','V1-CARD-0521','SRC-0642','B','bibliography_or_bounded_description','yes','no','SRC-0642','accepted','NONE'),
('V1-CS-1140','WCD10-B08-S230','V1-CARD-0521','SRC-0658','B','bibliography_or_bounded_description','no','no','SRC-0658','accepted','NONE'),
('V1-CS-1141','WCD10-B08-S201','V1-CARD-0522','SRC-0169','B','bibliography_or_bounded_description','yes','no','SRC-0169','accepted','NONE'),
('V1-CS-1142','WCD10-B08-S225','V1-CARD-0522','SRC-0653','A','bibliography_or_bounded_description','yes','no','SRC-0653','accepted','NONE'),
('V1-CS-1143','WCD10-B08-S203','V1-CARD-0523','SRC-0634','B','bibliography_or_bounded_description','no','no','SRC-0634','accepted','NONE'),
('V1-CS-1144','WCD10-B08-S205','V1-CARD-0523','SRC-0636','B','bibliography_or_bounded_description','yes','no','SRC-0636','accepted','NONE'),
('V1-CS-1145','WCD10-B08-S223','V1-CARD-0523','SRC-0651','B','bibliography_or_bounded_description','yes','no','SRC-0651','accepted','NONE'),
('V1-CS-1146','WCD10-B08-S201','V1-CARD-0524','SRC-0169','B','bibliography_or_bounded_description','yes','no','SRC-0169','accepted','NONE'),
('V1-CS-1147','WCD10-B08-S211','V1-CARD-0524','SRC-0641','A','attributed_study','yes','yes','SRC-0641','accepted','NONE'),
('V1-CS-1148','WCD10-B08-S224','V1-CARD-0524','SRC-0652','A','attributed_study','yes','yes','SRC-0652','accepted','NONE'),
('V1-CS-1149','WCD10-B08-S229','V1-CARD-0524','SRC-0657','B','bibliography_or_bounded_description','yes','no','SRC-0657','accepted','NONE'),
('V1-CS-1150','WCD10-B08-S230','V1-CARD-0524','SRC-0658','B','bibliography_or_bounded_description','yes','no','SRC-0658','accepted','NONE'),
('V1-CS-1151','WCD10-B08-S207','V1-CARD-0525','SRC-0638','B','bibliography_or_bounded_description','yes','no','SRC-0638','accepted','NONE'),
('V1-CS-1152','WCD10-B08-S202','V1-CARD-0526','SRC-0633','A','bibliography_or_bounded_description','yes','no','SRC-0633','accepted','NONE'),
('V1-CS-1153','WCD10-B08-S215','V1-CARD-0526','SRC-0643','A','attributed_study','no','yes','SRC-0643','accepted','NONE'),
('V1-CS-1154','WCD10-B08-S202','V1-CARD-0527','SRC-0633','A','bibliography_or_bounded_description','yes','no','SRC-0633','accepted','NONE'),
('V1-CS-1155','WCD10-B08-S216','V1-CARD-0527','SRC-0644','A','attributed_study','no','yes','SRC-0644','accepted','NONE'),
('V1-CS-1156','WCD10-B08-S202','V1-CARD-0528','SRC-0633','A','bibliography_or_bounded_description','yes','no','SRC-0633','accepted','NONE'),
('V1-CS-1157','WCD10-B08-S219','V1-CARD-0528','SRC-0647','A','attributed_study','no','yes','SRC-0647','accepted','NONE'),
('V1-CS-1158','WCD10-B08-S202','V1-CARD-0529','SRC-0633','A','bibliography_or_bounded_description','yes','no','SRC-0633','accepted','NONE'),
('V1-CS-1159','WCD10-B08-S217','V1-CARD-0529','SRC-0645','A','attributed_study','no','yes','SRC-0645','accepted','NONE'),
('V1-CS-1160','WCD10-B08-S202','V1-CARD-0530','SRC-0633','A','bibliography_or_bounded_description','yes','no','SRC-0633','accepted','NONE'),
('V1-CS-1161','WCD10-B08-S220','V1-CARD-0530','SRC-0648','A','attributed_study','yes','yes','SRC-0648','accepted','NONE'),
('V1-CS-1162','WCD10-B08-S202','V1-CARD-0531','SRC-0633','A','bibliography_or_bounded_description','yes','no','SRC-0633','accepted','NONE'),
('V1-CS-1163','WCD10-B08-S218','V1-CARD-0531','SRC-0646','A','attributed_study','no','yes','SRC-0646','accepted','NONE'),
('V1-CS-1164','WCD10-B08-S202','V1-CARD-0532','SRC-0633','A','bibliography_or_bounded_description','yes','no','SRC-0633','accepted','NONE'),
('V1-CS-1165','WCD10-B08-S221','V1-CARD-0532','SRC-0649','A','attributed_study','no','yes','SRC-0649','accepted','NONE'),
('V1-CS-1166','WCD10-B08-S226','V1-CARD-0533','SRC-0654','A','attributed_study','yes','yes','SRC-0654','accepted','NONE'),
('V1-CS-1167','WCD10-B08-S226','V1-CARD-0534','SRC-0654','A','attributed_study','yes','yes','SRC-0654','accepted','NONE'),
('V1-CS-1168','WCD10-B08-S001','V1-CARD-0535','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-1169','WCD10-B08-S004','V1-CARD-0535','SRC-0549','A','attributed_study','no','yes','SRC-0549','accepted','NONE'),
('V1-CS-1170','WCD10-B08-S001','V1-CARD-0536','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-1171','WCD10-B08-S004','V1-CARD-0536','SRC-0549','A','attributed_study','no','yes','SRC-0549','accepted','NONE'),
('V1-CS-1172','WCD10-B08-S001','V1-CARD-0537','SRC-0162','B','bibliography_or_bounded_description','yes','no','SRC-0162','accepted','NONE'),
('V1-CS-1173','WCD10-B08-S004','V1-CARD-0537','SRC-0549','A','attributed_study','no','yes','SRC-0549','accepted','NONE'),
('V1-CS-1174','WCD10-B08-S102','V1-CARD-0538','SRC-0165','B','bibliography_or_bounded_description','yes','no','SRC-0165','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-1175','WCD10-B08-S123','V1-CARD-0538','SRC-0603','B','bibliography_or_bounded_description','yes','no','SRC-0603','accepted','NONE'),
('V1-CS-1176','WCD10-B08-S106','V1-CARD-0539','SRC-0586','A','bibliography_or_bounded_description','yes','no','SRC-0586','accepted','NONE'),
('V1-CS-1177','WCD10-B08-S107','V1-CARD-0539','SRC-0587','A','bibliography_or_bounded_description','yes','no','SRC-0587','accepted','NONE'),
('V1-CS-1178','WCD10-B08-S110','V1-CARD-0539','SRC-0590','A','bibliography_or_bounded_description','yes','no','SRC-0590','accepted','NONE'),
('V1-CS-1179','WCD10-B08-S124','V1-CARD-0540','SRC-0604','B','bibliography_or_bounded_description','yes','no','SRC-0604','accepted','NONE'),
('V1-CS-1180','WCD10-B08-S203','V1-CARD-0541','SRC-0634','B','bibliography_or_bounded_description','yes','no','SRC-0634','accepted','NONE'),
('V1-CS-1181','WCD10-B08-S227','V1-CARD-0541','SRC-0655','B','bibliography_or_bounded_description','yes','no','SRC-0655','accepted','NONE'),
('V1-CS-1182','WCD10-B08-S203','V1-CARD-0542','SRC-0634','B','bibliography_or_bounded_description','yes','no','SRC-0634','accepted','NONE'),
('V1-CS-1183','WCD10-B08-S228','V1-CARD-0542','SRC-0656','B','bibliography_or_bounded_description','yes','no','SRC-0656','accepted','NONE'),
('V1-CS-1184','WCD10-B08-S222','V1-CARD-0543','SRC-0650','B','bibliography_or_bounded_description','yes','no','SRC-0650','accepted','NONE');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0480','WCD-10-B08','WCD10-B08-W001-CREATED','V1-ENT-0200','CREATED','V1-ENT-0511','混合诗、散文与故事的早期作品集；不拆分单篇。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0481','WCD-10-B08','WCD10-B08-W002-CREATED','V1-ENT-0200','CREATED','V1-ENT-0512','奥拉西奥·基罗加创作 El crimen del otro','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0482','WCD-10-B08','WCD10-B08-W003-CREATED','V1-ENT-0200','CREATED','V1-ENT-0513','基罗加的中篇/长故事；此处“1908”指年表明确记载的发表年，未将其他来源的1905题名年份混作首发。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0483','WCD-10-B08','WCD10-B08-W004-CREATED','V1-ENT-0200','CREATED','V1-ENT-0514','奥拉西奥·基罗加创作 Historia de un amor turbio','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0484','WCD-10-B08','WCD10-B08-W005-CREATED','V1-ENT-0200','CREATED','V1-ENT-0515','奥拉西奥·基罗加创作 El salvaje','high','accepted','Codex-parent-independent-review:PASS','4','NONE'),
('V1-REL-0485','WCD-10-B08','WCD10-B08-W006-CREATED','V1-ENT-0200','CREATED','V1-ENT-0516','1920年四幕舞台作品；阿根廷国家教师图书馆称其为作者唯一戏剧创作。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0486','WCD-10-B08','WCD10-B08-W007-CREATED','V1-ENT-0200','CREATED','V1-ENT-0517','奥拉西奥·基罗加创作 Anaconda','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0487','WCD-10-B08','WCD10-B08-W008-CREATED','V1-ENT-0200','CREATED','V1-ENT-0518','奥拉西奥·基罗加创作 El desierto','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0488','WCD-10-B08','WCD10-B08-W009-CREATED','V1-ENT-0200','CREATED','V1-ENT-0519','1925年另版故事选集；与1917年故事集及其中单篇《La gallina degollada》分开。','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0489','WCD-10-B08','WCD10-B08-W010-CREATED','V1-ENT-0200','CREATED','V1-ENT-0520','奥拉西奥·基罗加创作 Pasado amor','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0490','WCD-10-B08','WCD10-B08-W011-CREATED','V1-ENT-0200','CREATED','V1-ENT-0521','Quiroga与教师Leonardo Glusberg共同编写/创作的学校阅读书；Rea称其兼收新文本、改写故事与动物短札，不视为Quiroga独著。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0491','WCD-10-B08','WCD10-B08-W012-CREATED','V1-ENT-0200','CREATED','V1-ENT-0522','奥拉西奥·基罗加创作 Más allá','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0492','WCD-10-B08','WCD10-B08-W013-CREATED','V1-ENT-0200','CREATED','V1-ENT-0523','面向短篇小说写作者的创作建议文本；年份依机构书目。','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0493','WCD-10-B08','WCD10-B08-W014-CREATED','V1-ENT-0200','CREATED','V1-ENT-0524','奥拉西奥·基罗加创作 El manual del perfecto cuentista','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0494','WCD-10-B08','WCD10-B08-W015-CREATED','V1-ENT-0200','CREATED','V1-ENT-0525','奥拉西奥·基罗加创作 Los trucos del perfecto cuentista','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0495','WCD-10-B08','WCD10-B08-W016-CREATED','V1-ENT-0200','CREATED','V1-ENT-0526','短篇小说；1907年为单篇期刊初刊年，后收入其他故事集。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0496','WCD-10-B08','WCD10-B08-W017-CREATED','V1-ENT-0200','CREATED','V1-ENT-0527','短篇小说；1909年为单篇初刊年，1917年收入《Cuentos de amor…》，1925年另有同名选集。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0497','WCD-10-B08','WCD10-B08-W018-CREATED','V1-ENT-0200','CREATED','V1-ENT-0528','短篇小说；初刊题名《Un sueño de amor》，后收入1917年故事集。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0498','WCD-10-B08','WCD10-B08-W019-CREATED','V1-ENT-0200','CREATED','V1-ENT-0529','奥拉西奥·基罗加创作 A la deriva','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0499','WCD-10-B08','WCD10-B08-W020-CREATED','V1-ENT-0200','CREATED','V1-ENT-0530','短篇小说；1920年为期刊初刊年，1926年后收入《Los desterrados》。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0500','WCD-10-B08','WCD10-B08-W021-CREATED','V1-ENT-0200','CREATED','V1-ENT-0531','短篇小说；初刊于《La novela del día》第12号（1919年2月14日）。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0501','WCD-10-B08','WCD10-B08-W022-CREATED','V1-ENT-0200','CREATED','V1-ENT-0532','短篇小说；1928年初刊题名《El padre》，1935年以《El hijo》收入《Más allá》。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0502','WCD-10-B08','WCD10-B08-W023-CREATED','V1-ENT-0200','CREATED','V1-ENT-0533','作者署笔名S. Fragoso Lima；学术研究将其归属Quiroga。连载年份按该篇第一期刊出年，非后续单行本年份。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0503','WCD-10-B08','WCD10-B08-W024-CREATED','V1-ENT-0200','CREATED','V1-ENT-0534','作者署笔名S. Fragoso Lima；学术研究将其归属Quiroga。连载年份按该篇第一期刊出年，非后续单行本年份。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0504','WCD-10-B08','WCD10-B08-W025-CREATED','V1-ENT-0200','CREATED','V1-ENT-0535','作者署笔名S. Fragoso Lima；学术研究将其归属Quiroga。连载年份按该篇第一期刊出年，非后续单行本年份。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0505','WCD-10-B08','WCD10-B08-W026-CREATED','V1-ENT-0200','CREATED','V1-ENT-0536','作者署笔名S. Fragoso Lima；学术研究将其归属Quiroga。连载年份按该篇第一期刊出年，非后续单行本年份。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0506','WCD-10-B08','WCD10-B08-W028-CREATED','V1-ENT-0200','CREATED','V1-ENT-0537','作者署笔名S. Fragoso Lima；学术研究将其归属Quiroga。连载年份按该篇第一期刊出年，非后续单行本年份。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0507','WCD-10-B08','WCD10-B08-W029-CREATED','V1-ENT-0200','CREATED','V1-ENT-0538','单篇短篇小说；候选记录所列年份为期刊初刊年，后收录版本另行说明。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0508','WCD-10-B08','WCD10-B08-W030-CREATED','V1-ENT-0200','CREATED','V1-ENT-0539','单篇短篇小说；候选记录所列年份为期刊初刊年，后收录版本另行说明。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0509','WCD-10-B08','WCD10-B08-W031-CREATED','V1-ENT-0200','CREATED','V1-ENT-0540','单篇短篇小说；候选记录所列年份为期刊初刊年，后收录版本另行说明。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0510','WCD-10-B08','WCD10-B08-W032-CREATED','V1-ENT-0200','CREATED','V1-ENT-0541','单篇短篇小说；候选记录所列年份为期刊初刊年，后收录版本另行说明。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0511','WCD-10-B08','WCD10-B08-W033-CREATED','V1-ENT-0200','CREATED','V1-ENT-0542','1918年以《La Novela Semanal》单篇小册子发行的短篇；故事沿雇工Olivera的劳作、情事、蛇险与寻宝逐段推进，末以其失踪收束。','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0512','WCD-10-B08','WCD10-B08-W034-CREATED','V1-ENT-0200','CREATED','V1-ENT-0543','先以杂志故事系列面世、逝后结集；此处1922指连载起始，不把1977年后编书年当作首刊。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0513','WCD-10-B08','WCD10-B08-W035-CREATED','V1-ENT-0200','CREATED','V1-ENT-0544','以报刊短札系列著录，1922–1925年跨三种刊物；1967年Arca版是逝后重编，不是初刊。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0514','WCD-10-B08','WCD10-B08-W036-CREATED','V1-ENT-0200','CREATED','V1-ENT-0545','1917年短篇，研究者据原刊记录将其列为此前目录遗漏的作品；故事以青年请人代写情书而被拒为情节，借此讨论真诚表达、写作经验与署名身份。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0515','WCD-10-B08','WCD10-B08-W037-CREATED','V1-ENT-0200','CREATED','V1-ENT-0546','1917年发表于《Mundo Argentino》的短篇；研究文章称其以残酷狩猎为题，呼应《Las fieras cómplices》，并把城市与丛林间的“文明”冲突带入叙事。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0516','WCD-10-B08','WCD10-B08-W101-CREATED','V1-ENT-0211','CREATED','V1-ENT-0547','马查多·德·阿西斯创作 Ressurreição','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0517','WCD-10-B08','WCD10-B08-W102-CREATED','V1-ENT-0211','CREATED','V1-ENT-0548','马查多·德·阿西斯创作 A mão e a luva','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0518','WCD-10-B08','WCD10-B08-W103-CREATED','V1-ENT-0211','CREATED','V1-ENT-0549','马查多·德·阿西斯创作 Helena','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0519','WCD-10-B08','WCD10-B08-W104-CREATED','V1-ENT-0211','CREATED','V1-ENT-0550','马查多·德·阿西斯创作 Iaiá Garcia','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0520','WCD-10-B08','WCD10-B08-W105-CREATED','V1-ENT-0211','CREATED','V1-ENT-0551','马查多·德·阿西斯创作 Casa velha','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0521','WCD-10-B08','WCD10-B08-W106-CREATED','V1-ENT-0211','CREATED','V1-ENT-0552','马查多·德·阿西斯创作 Esaú e Jacó','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0522','WCD-10-B08','WCD10-B08-W107-CREATED','V1-ENT-0211','CREATED','V1-ENT-0553','马查多·德·阿西斯创作 Memorial de Aires','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0523','WCD-10-B08','WCD10-B08-W108-CREATED','V1-ENT-0211','CREATED','V1-ENT-0554','马查多·德·阿西斯创作 Contos fluminenses','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0524','WCD-10-B08','WCD10-B08-W109-CREATED','V1-ENT-0211','CREATED','V1-ENT-0555','马查多·德·阿西斯创作 Histórias da meia-noite','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0525','WCD-10-B08','WCD10-B08-W110-CREATED','V1-ENT-0211','CREATED','V1-ENT-0556','马查多·德·阿西斯创作 Papéis avulsos','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0526','WCD-10-B08','WCD10-B08-W111-CREATED','V1-ENT-0211','CREATED','V1-ENT-0557','马查多·德·阿西斯创作 Histórias sem data','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0527','WCD-10-B08','WCD10-B08-W112-CREATED','V1-ENT-0211','CREATED','V1-ENT-0558','马查多·德·阿西斯创作 Várias histórias','high','accepted','Codex-parent-independent-review:PASS','4','NONE'),
('V1-REL-0528','WCD-10-B08','WCD10-B08-W113-CREATED','V1-ENT-0211','CREATED','V1-ENT-0559','马查多·德·阿西斯创作 Páginas recolhidas','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0529','WCD-10-B08','WCD10-B08-W114-CREATED','V1-ENT-0211','CREATED','V1-ENT-0560','马查多·德·阿西斯创作 Relíquias de casa velha','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0530','WCD-10-B08','WCD10-B08-W115-CREATED','V1-ENT-0211','CREATED','V1-ENT-0561','马查多·德·阿西斯创作 Crisálidas','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0531','WCD-10-B08','WCD10-B08-W116-CREATED','V1-ENT-0211','CREATED','V1-ENT-0562','马查多·德·阿西斯创作 Falenas','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0532','WCD-10-B08','WCD10-B08-W117-CREATED','V1-ENT-0211','CREATED','V1-ENT-0563','马查多·德·阿西斯创作 Americanas','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0533','WCD-10-B08','WCD10-B08-W118-CREATED','V1-ENT-0211','CREATED','V1-ENT-0564','马查多·德·阿西斯创作 Poesias completas','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0534','WCD-10-B08','WCD10-B08-W119-CREATED','V1-ENT-0211','CREATED','V1-ENT-0565','马查多·德·阿西斯创作 Teatro','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0535','WCD-10-B08','WCD10-B08-W120-CREATED','V1-ENT-0211','CREATED','V1-ENT-0566','马查多·德·阿西斯创作 Desencantos','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0536','WCD-10-B08','WCD10-B08-W121-CREATED','V1-ENT-0211','CREATED','V1-ENT-0567','马查多·德·阿西斯创作 Quase ministro','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0537','WCD-10-B08','WCD10-B08-W122-CREATED','V1-ENT-0211','CREATED','V1-ENT-0568','马查多·德·阿西斯创作 Os deuses de casaca','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0538','WCD-10-B08','WCD10-B08-W123-CREATED','V1-ENT-0211','CREATED','V1-ENT-0569','ABL记载该剧为卡蒙斯三百周年庆典创作、1880年6月登台；MEC数字文本记录其于1880年初刊于 Revista Brasileira，ABL书目列1881年书本出版。','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0539','WCD-10-B08','WCD10-B08-W124-CREATED','V1-ENT-0211','CREATED','V1-ENT-0570','马查多·德·阿西斯创作 Notícia da atual literatura brasileira: Instinto de nacionalidade','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0540','WCD-10-B08','WCD10-B08-W125-CREATED','V1-ENT-0211','CREATED','V1-ENT-0571','马查多·德·阿西斯创作 Lição de Botânica','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0541','WCD-10-B08','WCD10-B08-W126-CREATED','V1-ENT-0211','CREATED','V1-ENT-0572','马查多·德·阿西斯创作 Não consultes médico','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0542','WCD-10-B08','WCD10-B08-W127-CREATED','V1-ENT-0211','CREATED','V1-ENT-0573','该1956年后世选编收入《O anjo Rafael》；题名、卷年及篇目据 Oliveira 的馆藏型研究目录，非 Machado 生前自行编定的故事集。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0543','WCD-10-B08','WCD10-B08-W128-CREATED','V1-ENT-0211','CREATED','V1-ENT-0574','该1956年后世选编收入《Decadência de dois grandes homens》与《Um esqueleto》；题名、卷年及篇目据 Oliveira 的目录说明。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0544','WCD-10-B08','WCD10-B08-W129-CREATED','V1-ENT-0211','CREATED','V1-ENT-0575','该1956年后世选编收入《O capitão Mendonça》；题名、卷年及篇目据 Oliveira 的目录说明。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0545','WCD-10-B08','WCD10-B08-W130-CREATED','V1-ENT-0211','CREATED','V1-ENT-0576','该1956年后世选编收入《A vida eterna》与《Os óculos de Pedro Antão》；题名、卷年及篇目据 Oliveira 的目录说明。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0546','WCD-10-B08','WCD10-B08-W131-CREATED','V1-ENT-0211','CREATED','V1-ENT-0577','该1956年后世选编收入《A mulher pálida》；题名、卷年及篇目据 Oliveira 的目录说明。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0547','WCD-10-B08','WCD10-B08-W132-CREATED','V1-ENT-0211','CREATED','V1-ENT-0578','1958年由 Raimundo Magalhães Júnior 编选的后世合集；目录可见短篇与编年文，CREATED仅指其中归属 Machado 的写作。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0548','WCD-10-B08','WCD10-B08-W133-CREATED','V1-ENT-0211','CREATED','V1-ENT-0579','1973年后世选编短篇集，由 Raimundo Magalhães Júnior 组织；收录 Machado 的十一篇故事，编者选篇不等同于 Machado 生前自行编集。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0549','WCD-10-B08','WCD10-B08-W134-CREATED','V1-ENT-0211','CREATED','V1-ENT-0580','后世批评选集，Mário de Alencar 为编者；CREATED仅指 Machado 所写评论文本，选编角色归编者。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0550','WCD-10-B08','WCD10-B08-W135-CREATED','V1-ENT-0211','CREATED','V1-ENT-0581','1910年Garnier出版的遗著合集；卷首说明其汇集 Machado 的故事、诗作与散页，作为文本作者关系登记，不把合编行为归给 Machado。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0551','WCD-10-B08','WCD10-B08-W136-CREATED','V1-ENT-0211','CREATED','V1-ENT-0582','Fernando Nery 汇集并注释、Américo Bedeschi 于1932年出版的往返信件选集；包含 Machado 与其他人的通信及收信人回复，CREATED限定为其中 Machado 撰写的信件。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0552','WCD-10-B08','WCD10-B08-W137-CREATED','V1-ENT-0211','CREATED','V1-ENT-0583','Raimundo Magalhães Júnior 1956年编选的报刊编年文集；收录 Machado 的“A + B”及“Bons dias”系列，后者缺一篇，勿将合集题名误作单篇连贯作品。','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0553','WCD-10-B08','WCD10-B08-W138-CREATED','V1-ENT-0211','CREATED','V1-ENT-0584','独立故事文本；报刊连载后收入《Papéis avulsos》。CREATED指 Machado 创作的故事，不指后续合集的选编行为。','high','accepted','Codex-parent-independent-review:PASS','4','NONE'),
('V1-REL-0554','WCD-10-B08','WCD10-B08-W201-CREATED','V1-ENT-0212','CREATED','V1-ENT-0585','若昂·吉马朗埃斯·罗萨创作 Corpo de Baile','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0555','WCD-10-B08','WCD10-B08-W202-CREATED','V1-ENT-0212','CREATED','V1-ENT-0586','若昂·吉马朗埃斯·罗萨创作 Com o vaqueiro Mariano','high','accepted','Codex-parent-independent-review:PASS','4','NONE'),
('V1-REL-0556','WCD-10-B08','WCD10-B08-W203-CREATED','V1-ENT-0212','CREATED','V1-ENT-0587','若昂·吉马朗埃斯·罗萨创作 Tutameia (Terceiras estórias)','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0557','WCD-10-B08','WCD10-B08-W204-CREATED','V1-ENT-0212','CREATED','V1-ENT-0588','若昂·吉马朗埃斯·罗萨创作 Estas estórias','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0558','WCD-10-B08','WCD10-B08-W205-CREATED','V1-ENT-0212','CREATED','V1-ENT-0589','若昂·吉马朗埃斯·罗萨创作 Ave, Palavra','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0559','WCD-10-B08','WCD10-B08-W206-CREATED','V1-ENT-0212','CREATED','V1-ENT-0590','若昂·吉马朗埃斯·罗萨创作 Magma','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0560','WCD-10-B08','WCD10-B08-W207-CREATED','V1-ENT-0212','CREATED','V1-ENT-0591','作为十位合作者之一参与由João Condé协调的合作侦探小说；来源确认每位作者各续写一章。本关系不表示Rosa独著。','high','accepted','Codex-parent-independent-review:PASS','4','NONE'),
('V1-REL-0561','WCD-10-B08','WCD10-B08-W208-CREATED','V1-ENT-0212','CREATED','V1-ENT-0592','作为合著者之一参与该合编故事集；可核实的具体贡献为篇目“Os chapéus transeuntes”（第1–36页）。本关系不表示该书为Rosa独著。','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0562','WCD-10-B08','WCD10-B08-W209-CREATED','V1-ENT-0212','CREATED','V1-ENT-0593','若昂·吉马朗埃斯·罗萨创作 Campo Geral','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0563','WCD-10-B08','WCD10-B08-W210-CREATED','V1-ENT-0212','CREATED','V1-ENT-0594','若昂·吉马朗埃斯·罗萨创作 Uma estória de amor','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0564','WCD-10-B08','WCD10-B08-W211-CREATED','V1-ENT-0212','CREATED','V1-ENT-0595','若昂·吉马朗埃斯·罗萨创作 A estória de Lélio e Lina','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0565','WCD-10-B08','WCD10-B08-W212-CREATED','V1-ENT-0212','CREATED','V1-ENT-0596','若昂·吉马朗埃斯·罗萨创作 O Recado do Morro','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0566','WCD-10-B08','WCD10-B08-W213-CREATED','V1-ENT-0212','CREATED','V1-ENT-0597','若昂·吉马朗埃斯·罗萨创作 Lão-Dalalão (Dão-Lalalão)','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0567','WCD-10-B08','WCD10-B08-W214-CREATED','V1-ENT-0212','CREATED','V1-ENT-0598','若昂·吉马朗埃斯·罗萨创作 Cara-de-Bronze','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0568','WCD-10-B08','WCD10-B08-W215-CREATED','V1-ENT-0212','CREATED','V1-ENT-0599','若昂·吉马朗埃斯·罗萨创作 Buriti','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0569','WCD-10-B08','WCD10-B08-W216-CREATED','V1-ENT-0212','CREATED','V1-ENT-0600','若昂·吉马朗埃斯·罗萨创作 O mistério de Highmore Hall','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0570','WCD-10-B08','WCD10-B08-W217-CREATED','V1-ENT-0212','CREATED','V1-ENT-0601','若昂·吉马朗埃斯·罗萨创作 Chronos kai Anagke (Tempo e Destino)','high','accepted','Codex-parent-independent-review:PASS','1','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0480','SRC-0162'),
('V1-REL-0480','SRC-0547'),
('V1-REL-0481','SRC-0559'),
('V1-REL-0481','SRC-0553'),
('V1-REL-0482','SRC-0560'),
('V1-REL-0482','SRC-0556'),
('V1-REL-0483','SRC-0561'),
('V1-REL-0483','SRC-0162'),
('V1-REL-0484','SRC-0556'),
('V1-REL-0484','SRC-0547'),
('V1-REL-0484','SRC-0579'),
('V1-REL-0484','SRC-0574'),
('V1-REL-0485','SRC-0548'),
('V1-REL-0485','SRC-0576'),
('V1-REL-0486','SRC-0563'),
('V1-REL-0486','SRC-0162'),
('V1-REL-0487','SRC-0564'),
('V1-REL-0487','SRC-0162'),
('V1-REL-0488','SRC-0556'),
('V1-REL-0488','SRC-0547'),
('V1-REL-0488','SRC-0580'),
('V1-REL-0489','SRC-0562'),
('V1-REL-0489','SRC-0162'),
('V1-REL-0490','SRC-0557'),
('V1-REL-0490','SRC-0556'),
('V1-REL-0491','SRC-0162'),
('V1-REL-0491','SRC-0547'),
('V1-REL-0491','SRC-0578'),
('V1-REL-0492','SRC-0548'),
('V1-REL-0492','SRC-0565'),
('V1-REL-0492','SRC-0577'),
('V1-REL-0493','SRC-0556'),
('V1-REL-0493','SRC-0566'),
('V1-REL-0493','SRC-0577'),
('V1-REL-0494','SRC-0556'),
('V1-REL-0494','SRC-0577'),
('V1-REL-0495','SRC-0569'),
('V1-REL-0495','SRC-0549'),
('V1-REL-0496','SRC-0549'),
('V1-REL-0496','SRC-0556'),
('V1-REL-0497','SRC-0571'),
('V1-REL-0497','SRC-0549'),
('V1-REL-0498','SRC-0570'),
('V1-REL-0498','SRC-0549'),
('V1-REL-0499','SRC-0568'),
('V1-REL-0499','SRC-0556'),
('V1-REL-0500','SRC-0554'),
('V1-REL-0501','SRC-0567'),
('V1-REL-0501','SRC-0162'),
('V1-REL-0502','SRC-0550'),
('V1-REL-0502','SRC-0551'),
('V1-REL-0503','SRC-0550'),
('V1-REL-0504','SRC-0550'),
('V1-REL-0504','SRC-0552'),
('V1-REL-0505','SRC-0550'),
('V1-REL-0506','SRC-0550'),
('V1-REL-0506','SRC-0581'),
('V1-REL-0507','SRC-0572'),
('V1-REL-0507','SRC-0549'),
('V1-REL-0508','SRC-0549'),
('V1-REL-0509','SRC-0549'),
('V1-REL-0510','SRC-0573'),
('V1-REL-0510','SRC-0549'),
('V1-REL-0511','SRC-0556'),
('V1-REL-0511','SRC-0558'),
('V1-REL-0511','SRC-0582'),
('V1-REL-0512','SRC-0555'),
('V1-REL-0512','SRC-0557'),
('V1-REL-0513','SRC-0555'),
('V1-REL-0513','SRC-0557'),
('V1-REL-0514','SRC-0575'),
('V1-REL-0515','SRC-0575'),
('V1-REL-0516','SRC-0166'),
('V1-REL-0516','SRC-0165'),
('V1-REL-0516','SRC-0583'),
('V1-REL-0517','SRC-0166'),
('V1-REL-0517','SRC-0165'),
('V1-REL-0517','SRC-0584'),
('V1-REL-0518','SRC-0166'),
('V1-REL-0518','SRC-0165'),
('V1-REL-0518','SRC-0585'),
('V1-REL-0519','SRC-0166'),
('V1-REL-0519','SRC-0165'),
('V1-REL-0520','SRC-0166'),
('V1-REL-0520','SRC-0594'),
('V1-REL-0520','SRC-0608'),
('V1-REL-0521','SRC-0166'),
('V1-REL-0521','SRC-0165'),
('V1-REL-0522','SRC-0166'),
('V1-REL-0522','SRC-0165'),
('V1-REL-0523','SRC-0166'),
('V1-REL-0523','SRC-0165'),
('V1-REL-0524','SRC-0166'),
('V1-REL-0524','SRC-0165'),
('V1-REL-0524','SRC-0631'),
('V1-REL-0525','SRC-0166'),
('V1-REL-0525','SRC-0165'),
('V1-REL-0526','SRC-0166'),
('V1-REL-0526','SRC-0165'),
('V1-REL-0527','SRC-0166'),
('V1-REL-0527','SRC-0165'),
('V1-REL-0527','SRC-0588'),
('V1-REL-0527','SRC-0589'),
('V1-REL-0528','SRC-0166'),
('V1-REL-0528','SRC-0165'),
('V1-REL-0529','SRC-0166'),
('V1-REL-0529','SRC-0165'),
('V1-REL-0530','SRC-0166'),
('V1-REL-0530','SRC-0165'),
('V1-REL-0530','SRC-0606'),
('V1-REL-0531','SRC-0166'),
('V1-REL-0531','SRC-0165'),
('V1-REL-0532','SRC-0166'),
('V1-REL-0532','SRC-0165'),
('V1-REL-0533','SRC-0166'),
('V1-REL-0533','SRC-0165'),
('V1-REL-0534','SRC-0166'),
('V1-REL-0534','SRC-0165'),
('V1-REL-0535','SRC-0166'),
('V1-REL-0535','SRC-0165'),
('V1-REL-0536','SRC-0166'),
('V1-REL-0536','SRC-0165'),
('V1-REL-0537','SRC-0166'),
('V1-REL-0537','SRC-0165'),
('V1-REL-0538','SRC-0166'),
('V1-REL-0538','SRC-0165'),
('V1-REL-0538','SRC-0593'),
('V1-REL-0539','SRC-0591'),
('V1-REL-0539','SRC-0592'),
('V1-REL-0540','SRC-0166'),
('V1-REL-0540','SRC-0596'),
('V1-REL-0541','SRC-0166'),
('V1-REL-0541','SRC-0595'),
('V1-REL-0542','SRC-0609'),
('V1-REL-0543','SRC-0609'),
('V1-REL-0544','SRC-0609'),
('V1-REL-0545','SRC-0609'),
('V1-REL-0546','SRC-0609'),
('V1-REL-0547','SRC-0610'),
('V1-REL-0548','SRC-0609'),
('V1-REL-0549','SRC-0611'),
('V1-REL-0549','SRC-0166'),
('V1-REL-0550','SRC-0612'),
('V1-REL-0550','SRC-0166'),
('V1-REL-0551','SRC-0628'),
('V1-REL-0551','SRC-0166'),
('V1-REL-0552','SRC-0629'),
('V1-REL-0552','SRC-0630'),
('V1-REL-0552','SRC-0165'),
('V1-REL-0553','SRC-0605'),
('V1-REL-0553','SRC-0622'),
('V1-REL-0553','SRC-0625'),
('V1-REL-0553','SRC-0632'),
('V1-REL-0554','SRC-0633'),
('V1-REL-0554','SRC-0639'),
('V1-REL-0555','SRC-0635'),
('V1-REL-0555','SRC-0640'),
('V1-REL-0555','SRC-0634'),
('V1-REL-0555','SRC-0642'),
('V1-REL-0556','SRC-0637'),
('V1-REL-0557','SRC-0642'),
('V1-REL-0557','SRC-0634'),
('V1-REL-0557','SRC-0658'),
('V1-REL-0558','SRC-0169'),
('V1-REL-0558','SRC-0653'),
('V1-REL-0559','SRC-0636'),
('V1-REL-0559','SRC-0651'),
('V1-REL-0559','SRC-0634'),
('V1-REL-0560','SRC-0169'),
('V1-REL-0560','SRC-0652'),
('V1-REL-0560','SRC-0641'),
('V1-REL-0560','SRC-0658'),
('V1-REL-0561','SRC-0638'),
('V1-REL-0562','SRC-0633'),
('V1-REL-0562','SRC-0643'),
('V1-REL-0563','SRC-0633'),
('V1-REL-0563','SRC-0644'),
('V1-REL-0564','SRC-0633'),
('V1-REL-0564','SRC-0647'),
('V1-REL-0565','SRC-0633'),
('V1-REL-0565','SRC-0645'),
('V1-REL-0566','SRC-0633'),
('V1-REL-0566','SRC-0648'),
('V1-REL-0567','SRC-0633'),
('V1-REL-0567','SRC-0646'),
('V1-REL-0568','SRC-0633'),
('V1-REL-0568','SRC-0649'),
('V1-REL-0569','SRC-0634'),
('V1-REL-0569','SRC-0654'),
('V1-REL-0570','SRC-0654');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0674','V1-REL-0480','WCD10-B08-S001','SRC-0162','Horacio Quiroga – Academia Nacional de Letras','正文第126–139行；页面实读日期2026-10-10。','混合诗、散文与故事的早期作品集；不拆分单篇。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0675','V1-REL-0480','WCD10-B08-S002','SRC-0547','Biobibliografías: Horacio Quiroga','正文第62–91行；书目及遗著条目。','混合诗、散文与故事的早期作品集；不拆分单篇。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0676','V1-REL-0481','WCD10-B08-S017','SRC-0559','El crimen del otro • Horacio Quiroga','25–61','奥拉西奥·基罗加创作 El crimen del otro','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0677','V1-REL-0481','WCD10-B08-S009','SRC-0553','Poe en Quiroga (full text)','正文第7–13、23–42、52–73行；CVC数字版。','奥拉西奥·基罗加创作 El crimen del otro','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0678','V1-REL-0482','WCD10-B08-S018','SRC-0560','Los perseguidos','19–31','基罗加的中篇/长故事；此处“1908”指年表明确记载的发表年，未将其他来源的1905题名年份混作首发。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0679','V1-REL-0482','WCD10-B08-S014','SRC-0556','Cronología de Horacio Quiroga','正文第50–52、76–79、88–99、113行。','基罗加的中篇/长故事；此处“1908”指年表明确记载的发表年，未将其他来源的1905题名年份混作首发。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0680','V1-REL-0483','WCD10-B08-S019','SRC-0561','Historia de un amor turbio','19–31, 55–72','奥拉西奥·基罗加创作 Historia de un amor turbio','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0681','V1-REL-0483','WCD10-B08-S001','SRC-0162','Horacio Quiroga – Academia Nacional de Letras','正文第126–139行；页面实读日期2026-10-10。','奥拉西奥·基罗加创作 Historia de un amor turbio','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0682','V1-REL-0484','WCD10-B08-S014','SRC-0556','Cronología de Horacio Quiroga','正文第50–52、76–79、88–99、113行。','奥拉西奥·基罗加创作 El salvaje','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0683','V1-REL-0484','WCD10-B08-S002','SRC-0547','Biobibliografías: Horacio Quiroga','正文第62–91行；书目及遗著条目。','奥拉西奥·基罗加创作 El salvaje','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0684','V1-REL-0484','WCD10-B08-S040','SRC-0579','El salvaje.','Biblioteca Pública de las Misiones item record/abstract lines 27–49; the item record date is 1926, while the abstract describes the collection as published in 1920 and lists contents.','奥拉西奥·基罗加创作 El salvaje','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0685','V1-REL-0484','WCD10-B08-S032','SRC-0574','El salvaje y otros cuentos','Later digital selection: title-story text and contents only; posted 2017-10-23 by Edu Robsy. Not evidence for the original 1920 edition contents; page posting date 2017-10-23 by Edu Robsy.','奥拉西奥·基罗加创作 El salvaje','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0686','V1-REL-0485','WCD10-B08-S003','SRC-0548','Las sacrificadas de Horacio Quiroga','正文第17–43行；页面日期2022-03-09。','1920年四幕舞台作品；阿根廷国家教师图书馆称其为作者唯一戏剧创作。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0687','V1-REL-0485','WCD10-B08-S037','SRC-0576','Las sacrificadas: cuento escénico en 4 actos','Biblioteca Virtual Miguel de Cervantes text lines 7–21 and 26–120; first-act scene / character list','1920年四幕舞台作品；阿根廷国家教师图书馆称其为作者唯一戏剧创作。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0688','V1-REL-0486','WCD10-B08-S021','SRC-0563','Anaconda y otros cuentos','21–42; page posting date 2017-10-23 by Edu Robsy.','奥拉西奥·基罗加创作 Anaconda','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0689','V1-REL-0486','WCD10-B08-S001','SRC-0162','Horacio Quiroga – Academia Nacional de Letras','正文第126–139行；页面实读日期2026-10-10。','奥拉西奥·基罗加创作 Anaconda','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0690','V1-REL-0487','WCD10-B08-S022','SRC-0564','El desierto','Biblioteca Pública de las Misiones record lines 27–55: scan/catalogue metadata and eleven-item contents list; the abstract explicitly credits the story synopsis to Lecturalia.','奥拉西奥·基罗加创作 El desierto','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0691','V1-REL-0487','WCD10-B08-S001','SRC-0162','Horacio Quiroga – Academia Nacional de Letras','正文第126–139行；页面实读日期2026-10-10。','奥拉西奥·基罗加创作 El desierto','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0692','V1-REL-0488','WCD10-B08-S014','SRC-0556','Cronología de Horacio Quiroga','正文第50–52、76–79、88–99、113行。','1925年另版故事选集；与1917年故事集及其中单篇《La gallina degollada》分开。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0693','V1-REL-0488','WCD10-B08-S002','SRC-0547','Biobibliografías: Horacio Quiroga','正文第62–91行；书目及遗著条目。','1925年另版故事选集；与1917年故事集及其中单篇《La gallina degollada》分开。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0694','V1-REL-0488','WCD10-B08-S041','SRC-0580','La Gallina Degollada','Textos.info primary text lines 20–26, 36–43, 111–133, 147–153; page posting date at lines 154–157.','1925年另版故事选集；与1917年故事集及其中单篇《La gallina degollada》分开。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0695','V1-REL-0489','WCD10-B08-S020','SRC-0562','Pasado amor','19–31','奥拉西奥·基罗加创作 Pasado amor','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0696','V1-REL-0489','WCD10-B08-S001','SRC-0162','Horacio Quiroga – Academia Nacional de Letras','正文第126–139行；页面实读日期2026-10-10。','奥拉西奥·基罗加创作 Pasado amor','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0697','V1-REL-0490','WCD10-B08-S015','SRC-0557','Trajectories in Argentine children’s literature: Constancio C. Vigil and Horacio Quiroga','197–245','Quiroga与教师Leonardo Glusberg共同编写/创作的学校阅读书；Rea称其兼收新文本、改写故事与动物短札，不视为Quiroga独著。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0698','V1-REL-0490','WCD10-B08-S014','SRC-0556','Cronología de Horacio Quiroga','正文第50–52、76–79、88–99、113行。','Quiroga与教师Leonardo Glusberg共同编写/创作的学校阅读书；Rea称其兼收新文本、改写故事与动物短札，不视为Quiroga独著。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0699','V1-REL-0491','WCD10-B08-S001','SRC-0162','Horacio Quiroga – Academia Nacional de Letras','正文第126–139行；页面实读日期2026-10-10。','奥拉西奥·基罗加创作 Más allá','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0700','V1-REL-0491','WCD10-B08-S002','SRC-0547','Biobibliografías: Horacio Quiroga','正文第62–91行；书目及遗著条目。','奥拉西奥·基罗加创作 Más allá','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0701','V1-REL-0491','WCD10-B08-S039','SRC-0578','Libro gratis: Más Allá y Otros Cuentos','Textos.info lines 11–42, page posting date lines 86–88','奥拉西奥·基罗加创作 Más allá','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0702','V1-REL-0492','WCD10-B08-S003','SRC-0548','Las sacrificadas de Horacio Quiroga','正文第17–43行；页面日期2022-03-09。','面向短篇小说写作者的创作建议文本；年份依机构书目。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0703','V1-REL-0492','WCD10-B08-S023','SRC-0565','Decálogo del perfecto cuentista','11–29, 54–64; page posting date 2016-05-18 by Edu Robsy.','面向短篇小说写作者的创作建议文本；年份依机构书目。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0704','V1-REL-0492','WCD10-B08-S038','SRC-0577','Sobre el Arte de Contar Historias','《El manual del perfecto cuentista》L31–97；《Los “trucs” del perfecto cuentista》L98–142；相邻篇目边界按页面目录与正文标题确认。; page posting date 2017-10-20 by Edu Robsy.','面向短篇小说写作者的创作建议文本；年份依机构书目。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0705','V1-REL-0493','WCD10-B08-S014','SRC-0556','Cronología de Horacio Quiroga','正文第50–52、76–79、88–99、113行。','奥拉西奥·基罗加创作 El manual del perfecto cuentista','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0706','V1-REL-0493','WCD10-B08-S024','SRC-0566','El manual del perfecto cuentista','19–33, 58–end','奥拉西奥·基罗加创作 El manual del perfecto cuentista','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0707','V1-REL-0493','WCD10-B08-S038','SRC-0577','Sobre el Arte de Contar Historias','《El manual del perfecto cuentista》L31–97；《Los “trucs” del perfecto cuentista》L98–142；相邻篇目边界按页面目录与正文标题确认。; page posting date 2017-10-20 by Edu Robsy.','奥拉西奥·基罗加创作 El manual del perfecto cuentista','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0708','V1-REL-0494','WCD10-B08-S014','SRC-0556','Cronología de Horacio Quiroga','正文第50–52、76–79、88–99、113行。','奥拉西奥·基罗加创作 Los trucos del perfecto cuentista','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0709','V1-REL-0494','WCD10-B08-S038','SRC-0577','Sobre el Arte de Contar Historias','《El manual del perfecto cuentista》L31–97；《Los “trucs” del perfecto cuentista》L98–142；相邻篇目边界按页面目录与正文标题确认。; page posting date 2017-10-20 by Edu Robsy.','奥拉西奥·基罗加创作 Los trucos del perfecto cuentista','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0710','V1-REL-0495','WCD10-B08-S027','SRC-0569','El almohadón de pluma','story text, opening and ending; page posting date 2016-07-28 by Edu Robsy.','短篇小说；1907年为单篇期刊初刊年，后收入其他故事集。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0711','V1-REL-0495','WCD10-B08-S004','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas','article lines 282–317 for collection/periodical crosswalk; 691–799 for close reading; 891–911 for three retained collections','短篇小说；1907年为单篇期刊初刊年，后收入其他故事集。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0712','V1-REL-0496','WCD10-B08-S004','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas','article lines 282–317 for collection/periodical crosswalk; 691–799 for close reading; 891–911 for three retained collections','短篇小说；1909年为单篇初刊年，1917年收入《Cuentos de amor…》，1925年另有同名选集。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0713','V1-REL-0496','WCD10-B08-S014','SRC-0556','Cronología de Horacio Quiroga','正文第50–52、76–79、88–99、113行。','短篇小说；1909年为单篇初刊年，1917年收入《Cuentos de amor…》，1925年另有同名选集。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0714','V1-REL-0497','WCD10-B08-S029','SRC-0571','Una estación de amor','opening and part headings','短篇小说；初刊题名《Un sueño de amor》，后收入1917年故事集。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0715','V1-REL-0497','WCD10-B08-S004','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas','article lines 282–317 for collection/periodical crosswalk; 691–799 for close reading; 891–911 for three retained collections','短篇小说；初刊题名《Un sueño de amor》，后收入1917年故事集。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0716','V1-REL-0498','WCD10-B08-S028','SRC-0570','A la deriva','opening and ending','奥拉西奥·基罗加创作 A la deriva','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0717','V1-REL-0498','WCD10-B08-S004','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas','article lines 282–317 for collection/periodical crosswalk; 691–799 for close reading; 891–911 for three retained collections','奥拉西奥·基罗加创作 A la deriva','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0718','V1-REL-0499','WCD10-B08-S026','SRC-0568','El hombre muerto','opening and closing paragraphs','短篇小说；1920年为期刊初刊年，1926年后收入《Los desterrados》。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0719','V1-REL-0499','WCD10-B08-S014','SRC-0556','Cronología de Horacio Quiroga','正文第50–52、76–79、88–99、113行。','短篇小说；1920年为期刊初刊年，1926年后收入《Los desterrados》。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0720','V1-REL-0500','WCD10-B08-S010','SRC-0554','La estrategia de la duplicidad en "Miss Dorothy Phillips, mi esposa" de Horacio Quiroga','PDF lines 7–20 title/citation; 37–89 direct plot and criticism','短篇小说；初刊于《La novela del día》第12号（1919年2月14日）。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0721','V1-REL-0501','WCD10-B08-S025','SRC-0567','El hijo','full text, opening and ending','短篇小说；1928年初刊题名《El padre》，1935年以《El hijo》收入《Más allá》。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0722','V1-REL-0501','WCD10-B08-S001','SRC-0162','Horacio Quiroga – Academia Nacional de Letras','正文第126–139行；页面实读日期2026-10-10。','短篇小说；1928年初刊题名《El padre》，1935年以《El hijo》收入《Más allá》。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0723','V1-REL-0502','WCD10-B08-S005','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.','PDF lines 0–45; full bibliographic reference at line 0; DOI 10.22201/cialc.24486914e.2020.70.57207','作者署笔名S. Fragoso Lima；学术研究将其归属Quiroga。连载年份按该篇第一期刊出年，非后续单行本年份。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0724','V1-REL-0502','WCD10-B08-S006','SRC-0551','Las fieras cómplices / S. Fragoso Lima','catalog lines 7–28','作者署笔名S. Fragoso Lima；学术研究将其归属Quiroga。连载年份按该篇第一期刊出年，非后续单行本年份。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0725','V1-REL-0503','WCD10-B08-S005','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.','PDF lines 0–45; full bibliographic reference at line 0; DOI 10.22201/cialc.24486914e.2020.70.57207','作者署笔名S. Fragoso Lima；学术研究将其归属Quiroga。连载年份按该篇第一期刊出年，非后续单行本年份。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0726','V1-REL-0504','WCD10-B08-S005','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.','PDF lines 0–45; full bibliographic reference at line 0; DOI 10.22201/cialc.24486914e.2020.70.57207','作者署笔名S. Fragoso Lima；学术研究将其归属Quiroga。连载年份按该篇第一期刊出年，非后续单行本年份。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0727','V1-REL-0504','WCD10-B08-S007','SRC-0552','El folletín como campo de experimentación narrativa: el recurso cinematográfico en El hombre artificial de Horacio Quiroga','期刊记录第35–52行；Lejana 2 (2010)。','作者署笔名S. Fragoso Lima；学术研究将其归属Quiroga。连载年份按该篇第一期刊出年，非后续单行本年份。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0728','V1-REL-0505','WCD10-B08-S005','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.','PDF lines 0–45; full bibliographic reference at line 0; DOI 10.22201/cialc.24486914e.2020.70.57207','作者署笔名S. Fragoso Lima；学术研究将其归属Quiroga。连载年份按该篇第一期刊出年，非后续单行本年份。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0729','V1-REL-0506','WCD10-B08-S005','SRC-0550','Pionetti, Marinela. Betancor, Martín y Alejandra Ferrari (eds.). Estudios sobre los folletines de Horacio Quiroga. Montevideo: +Quiroga Ediciones, 2019.','PDF lines 0–45; full bibliographic reference at line 0; DOI 10.22201/cialc.24486914e.2020.70.57207','作者署笔名S. Fragoso Lima；学术研究将其归属Quiroga。连载年份按该篇第一期刊出年，非后续单行本年份。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0730','V1-REL-0506','WCD10-B08-S042','SRC-0581','Libro gratis: El Remate Del Imperio Romano','Textos.info visible story excerpt lines 58–69; title/author/form lines 11–19; page posting date 1 September 2026 at line 69.','作者署笔名S. Fragoso Lima；学术研究将其归属Quiroga。连载年份按该篇第一期刊出年，非后续单行本年份。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0731','V1-REL-0507','WCD10-B08-S030','SRC-0572','Los buques suicidantes','full text; page posting date 2016-07-27 by Edu Robsy.','单篇短篇小说；候选记录所列年份为期刊初刊年，后收录版本另行说明。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0732','V1-REL-0507','WCD10-B08-S004','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas','article lines 282–317 for collection/periodical crosswalk; 691–799 for close reading; 891–911 for three retained collections','单篇短篇小说；候选记录所列年份为期刊初刊年，后收录版本另行说明。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0733','V1-REL-0508','WCD10-B08-S004','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas','article lines 282–317 for collection/periodical crosswalk; 691–799 for close reading; 891–911 for three retained collections','单篇短篇小说；候选记录所列年份为期刊初刊年，后收录版本另行说明。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0734','V1-REL-0509','WCD10-B08-S004','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas','article lines 282–317 for collection/periodical crosswalk; 691–799 for close reading; 891–911 for three retained collections','单篇短篇小说；候选记录所列年份为期刊初刊年，后收录版本另行说明。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0735','V1-REL-0510','WCD10-B08-S031','SRC-0573','El alambre de púa','opening; page posting date 2016-07-28 by Edu Robsy.','单篇短篇小说；候选记录所列年份为期刊初刊年，后收录版本另行说明。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0736','V1-REL-0510','WCD10-B08-S004','SRC-0549','Presentación: Cien años… y algunos más. La publicación original de los Cuentos de amor de locura y de muerte en las revistas ilustradas porteñas','article lines 282–317 for collection/periodical crosswalk; 691–799 for close reading; 891–911 for three retained collections','单篇短篇小说；候选记录所列年份为期刊初刊年，后收录版本另行说明。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0737','V1-REL-0511','WCD10-B08-S014','SRC-0556','Cronología de Horacio Quiroga','正文第50–52、76–79、88–99、113行。','1918年以《La Novela Semanal》单篇小册子发行的短篇；故事沿雇工Olivera的劳作、情事、蛇险与寻宝逐段推进，末以其失踪收束。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0738','V1-REL-0511','WCD10-B08-S016','SRC-0558','Índice: La Novela Semanal - Año II - Núm. 9 - Un peón.pdf','84–95','1918年以《La Novela Semanal》单篇小册子发行的短篇；故事沿雇工Olivera的劳作、情事、蛇险与寻宝逐段推进，末以其失踪收束。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0739','V1-REL-0511','WCD10-B08-S043','SRC-0582','Un Peón','Textos.info full story lines 23–29 and 32–76 for identity/first episode; lines 134–196 for Cirila and snake bite; lines 247–end for final events; posting date lines 431–434.','1918年以《La Novela Semanal》单篇小册子发行的短篇；故事沿雇工Olivera的劳作、情事、蛇险与寻宝逐段推进，末以其失踪收束。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0740','V1-REL-0512','WCD10-B08-S011','SRC-0555','Cuentos de la selva: Estudio preliminar','PDF lines 264–287 for series and posthumous editions; lines 571–575 for Cuentos de la selva','先以杂志故事系列面世、逝后结集；此处1922指连载起始，不把1977年后编书年当作首刊。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0741','V1-REL-0512','WCD10-B08-S015','SRC-0557','Trajectories in Argentine children’s literature: Constancio C. Vigil and Horacio Quiroga','197–245','先以杂志故事系列面世、逝后结集；此处1922指连载起始，不把1977年后编书年当作首刊。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0742','V1-REL-0513','WCD10-B08-S011','SRC-0555','Cuentos de la selva: Estudio preliminar','PDF lines 264–287 for series and posthumous editions; lines 571–575 for Cuentos de la selva','以报刊短札系列著录，1922–1925年跨三种刊物；1967年Arca版是逝后重编，不是初刊。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0743','V1-REL-0513','WCD10-B08-S015','SRC-0557','Trajectories in Argentine children’s literature: Constancio C. Vigil and Horacio Quiroga','197–245','以报刊短札系列著录，1922–1925年跨三种刊物；1967年Arca版是逝后重编，不是初刊。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0744','V1-REL-0514','WCD10-B08-S036','SRC-0575','Adendas a la bibliografía de Horacio Quiroga','UNAM (an)ecdótica landing page (article identity/metadata) and Alejandro Ferrari author-uploaded ResearchGate full text (1706 extracted lines); printed pp.99–101 support the two stories, their dates, and the bounded readings. The direct UNAM/DOI fetch failed on the later parent check; the author-uploaded full text remained readable.','1917年短篇，研究者据原刊记录将其列为此前目录遗漏的作品；故事以青年请人代写情书而被拒为情节，借此讨论真诚表达、写作经验与署名身份。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0745','V1-REL-0515','WCD10-B08-S036','SRC-0575','Adendas a la bibliografía de Horacio Quiroga','UNAM (an)ecdótica landing page (article identity/metadata) and Alejandro Ferrari author-uploaded ResearchGate full text (1706 extracted lines); printed pp.99–101 support the two stories, their dates, and the bounded readings. The direct UNAM/DOI fetch failed on the later parent check; the author-uploaded full text remained readable.','1917年发表于《Mundo Argentino》的短篇；研究文章称其以残酷狩猎为题，呼应《Las fieras cómplices》，并把城市与丛林间的“文明”冲突带入叙事。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0746','V1-REL-0516','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Ressurreição','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0747','V1-REL-0516','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Ressurreição','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0748','V1-REL-0516','WCD10-B08-S103','SRC-0583','Ressurreição - 1872','Official work page lines 21–25: title, year, genre Romance, download of the primary text.','马查多·德·阿西斯创作 Ressurreição','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0749','V1-REL-0517','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 A mão e a luva','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0750','V1-REL-0517','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 A mão e a luva','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0751','V1-REL-0517','WCD10-B08-S104','SRC-0584','A Mão e a Luva - 1874','Official work page lines 21–25: title, year and genre Romance.','马查多·德·阿西斯创作 A mão e a luva','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0752','V1-REL-0518','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Helena','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0753','V1-REL-0518','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Helena','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0754','V1-REL-0518','WCD10-B08-S105','SRC-0585','Helena - 1876','Official work page lines 21–25: title, year and genre Romance.','马查多·德·阿西斯创作 Helena','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0755','V1-REL-0519','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Iaiá Garcia','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0756','V1-REL-0519','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Iaiá Garcia','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0757','V1-REL-0520','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Casa velha','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0758','V1-REL-0520','WCD10-B08-S114','SRC-0594','Casa Velha','Lines 91–105: author/title, classification Romance, original A Estação serial in 25 episodes 1885–1886, and first book publication posthumously in 1944.','马查多·德·阿西斯创作 Casa velha','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0759','V1-REL-0520','WCD10-B08-S133','SRC-0608','Casa velha','Lines 7–18: title, author, Martins, issue date 1944, series, and Lucia Miguel Pereira as introduction contributor.','马查多·德·阿西斯创作 Casa velha','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0760','V1-REL-0521','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Esaú e Jacó','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0761','V1-REL-0521','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Esaú e Jacó','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0762','V1-REL-0522','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Memorial de Aires','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0763','V1-REL-0522','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Memorial de Aires','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0764','V1-REL-0523','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Contos fluminenses','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0765','V1-REL-0523','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Contos fluminenses','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0766','V1-REL-0524','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Histórias da meia-noite','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0767','V1-REL-0524','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Histórias da meia-noite','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0768','V1-REL-0524','WCD10-B08-S158','SRC-0631','Historias da meia noite','Lines 7–16; author, first-edition label, [1873] imprint, all six titles and author preface.','马查多·德·阿西斯创作 Histórias da meia-noite','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0769','V1-REL-0525','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Papéis avulsos','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0770','V1-REL-0525','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Papéis avulsos','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0771','V1-REL-0526','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Histórias sem data','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0772','V1-REL-0526','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Histórias sem data','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0773','V1-REL-0527','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Várias histórias','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0774','V1-REL-0527','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Várias histórias','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0775','V1-REL-0527','WCD10-B08-S108','SRC-0588','Várias histórias','Catalog lines 7–17, 19–23: first edition, publisher, issue date, genre, and contents.','马查多·德·阿西斯创作 Várias histórias','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0776','V1-REL-0527','WCD10-B08-S109','SRC-0589','De Botafogo à Tijuca: sobrevivência e autonomia feminina nas Várias histórias de Machado de Assis','SciELO article lines 78–90 and 159–166; author and credentials lines 509–515; issue metadata line 78.','马查多·德·阿西斯创作 Várias histórias','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0777','V1-REL-0528','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Páginas recolhidas','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0778','V1-REL-0528','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Páginas recolhidas','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0779','V1-REL-0529','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Relíquias de casa velha','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0780','V1-REL-0529','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Relíquias de casa velha','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0781','V1-REL-0530','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Crisálidas','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0782','V1-REL-0530','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Crisálidas','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0783','V1-REL-0530','WCD10-B08-S131','SRC-0606','Chrysalidas : poesias / [Crisálidas : poesias]','Lines 7–15: title, Garnier publisher, issue date 1864, 29 titled poems, and general contents note identifying Machado’s first poetry book.','马查多·德·阿西斯创作 Crisálidas','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0784','V1-REL-0531','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Falenas','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0785','V1-REL-0531','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Falenas','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0786','V1-REL-0532','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Americanas','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0787','V1-REL-0532','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Americanas','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0788','V1-REL-0533','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Poesias completas','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0789','V1-REL-0533','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Poesias completas','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0790','V1-REL-0534','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Teatro','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0791','V1-REL-0534','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Teatro','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0792','V1-REL-0535','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Desencantos','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0793','V1-REL-0535','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Desencantos','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0794','V1-REL-0536','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Quase ministro','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0795','V1-REL-0536','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Quase ministro','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0796','V1-REL-0537','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Os deuses de casaca','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0797','V1-REL-0537','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Os deuses de casaca','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0798','V1-REL-0538','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','ABL记载该剧为卡蒙斯三百周年庆典创作、1880年6月登台；MEC数字文本记录其于1880年初刊于 Revista Brasileira，ABL书目列1881年书本出版。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0799','V1-REL-0538','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','ABL记载该剧为卡蒙斯三百周年庆典创作、1880年6月登台；MEC数字文本记录其于1880年初刊于 Revista Brasileira，ABL书目列1881年书本出版。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0800','V1-REL-0538','WCD10-B08-S113','SRC-0593','Tu, só tu, puro amor','PDF page 0 lines 0–8: title, primary text, Nova Aguilar 1994 source edition and statement “Publicado originalmente em Revista Brasileira, Rio de Janeiro, 1880”; lines 16–22 identify comedy and its bounded subject.','ABL记载该剧为卡蒙斯三百周年庆典创作、1880年6月登台；MEC数字文本记录其于1880年初刊于 Revista Brasileira，ABL书目列1881年书本出版。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0801','V1-REL-0539','WCD10-B08-S111','SRC-0591','1873 — A literatura e a língua por Machado de Assis','Lines 79–90, especially 80–82: exact essay title, author, publication 24 March 1873 in O Novo Mundo, and broad essay description.','马查多·德·阿西斯创作 Notícia da atual literatura brasileira: Instinto de nacionalidade','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0802','V1-REL-0539','WCD10-B08-S112','SRC-0592','Notícia da atual literatura brasileira: Instinto de nacionalidade — Work Data','Lines 2–17, 25–32, 39–41: author, classification Estudos literários, publication year 1873, periodical O Novo Mundo and printed medium.','马查多·德·阿西斯创作 Notícia da atual literatura brasileira: Instinto de nacionalidade','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0803','V1-REL-0540','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Lição de Botânica','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0804','V1-REL-0540','WCD10-B08-S116','SRC-0596','Lição de Botânica','PDF p.0 lines 0–8: title, source edition, original inclusion in Relíquias de Casa Velha, Garnier 1906; lines 12–29 identify dramatis personae and single-act scene format.','马查多·德·阿西斯创作 Lição de Botânica','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0805','V1-REL-0541','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','马查多·德·阿西斯创作 Não consultes médico','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0806','V1-REL-0541','WCD10-B08-S115','SRC-0595','Não consultes médico','PDF p.0 lines 0–8: title, source edition, and original inclusion in Páginas Recolhidas, Garnier 1899; lines 13–29 identify cast and scene format.','马查多·德·阿西斯创作 Não consultes médico','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0807','V1-REL-0542','WCD10-B08-S134','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis','Title pages PDF pp.0–2/web lines 0–23 establish author and 2012 thesis year; PDF pp.13–14/web lines 243–282 list the five 1956 Magalhães Júnior collections and identified contents.','该1956年后世选编收入《O anjo Rafael》；题名、卷年及篇目据 Oliveira 的馆藏型研究目录，非 Machado 生前自行编定的故事集。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0808','V1-REL-0543','WCD10-B08-S134','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis','Title pages PDF pp.0–2/web lines 0–23 establish author and 2012 thesis year; PDF pp.13–14/web lines 243–282 list the five 1956 Magalhães Júnior collections and identified contents.','该1956年后世选编收入《Decadência de dois grandes homens》与《Um esqueleto》；题名、卷年及篇目据 Oliveira 的目录说明。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0809','V1-REL-0544','WCD10-B08-S134','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis','Title pages PDF pp.0–2/web lines 0–23 establish author and 2012 thesis year; PDF pp.13–14/web lines 243–282 list the five 1956 Magalhães Júnior collections and identified contents.','该1956年后世选编收入《O capitão Mendonça》；题名、卷年及篇目据 Oliveira 的目录说明。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0810','V1-REL-0545','WCD10-B08-S134','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis','Title pages PDF pp.0–2/web lines 0–23 establish author and 2012 thesis year; PDF pp.13–14/web lines 243–282 list the five 1956 Magalhães Júnior collections and identified contents.','该1956年后世选编收入《A vida eterna》与《Os óculos de Pedro Antão》；题名、卷年及篇目据 Oliveira 的目录说明。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0811','V1-REL-0546','WCD10-B08-S134','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis','Title pages PDF pp.0–2/web lines 0–23 establish author and 2012 thesis year; PDF pp.13–14/web lines 243–282 list the five 1956 Magalhães Júnior collections and identified contents.','该1956年后世选编收入《A mulher pálida》；题名、卷年及篇目据 Oliveira 的目录说明。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0812','V1-REL-0547','WCD10-B08-S135','SRC-0610','Contos e crônicas','Lines 17–43: title, editor, publisher, 1958 date, page count, preface and sample contents.','1958年由 Raimundo Magalhães Júnior 编选的后世合集；目录可见短篇与编年文，CREATED仅指其中归属 Machado 的写作。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0813','V1-REL-0548','WCD10-B08-S134','SRC-0609','A medalha e seu reverso: fantástico e desfantasticização em contos de Machado de Assis','Title pages PDF pp.0–2/web lines 0–23 establish author and 2012 thesis year; PDF pp.13–14/web lines 243–282 list the five 1956 Magalhães Júnior collections and identified contents.','1973年后世选编短篇集，由 Raimundo Magalhães Júnior 组织；收录 Machado 的十一篇故事，编者选篇不等同于 Machado 生前自行编集。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0814','V1-REL-0549','WCD10-B08-S137','SRC-0611','Critica (Machado de Assis, 1910)','Lines 92–97 and 101–175: Mário de Alencar editor; Garnier 1910 reference edition; posthumous anthology label and contents index.','后世批评选集，Mário de Alencar 为编者；CREATED仅指 Machado 所写评论文本，选编角色归编者。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0815','V1-REL-0549','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','后世批评选集，Mário de Alencar 为编者；CREATED仅指 Machado 所写评论文本，选编角色归编者。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0816','V1-REL-0550','WCD10-B08-S138','SRC-0612','Outras Reliquias : (proza e verso)','Lines 7–21: Machado author field, Livraria Garnier imprint, 1910, contents list and prefatory note describing collected short stories, poems and loose pages.','1910年Garnier出版的遗著合集；卷首说明其汇集 Machado 的故事、诗作与散页，作为文本作者关系登记，不把合编行为归给 Machado。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0817','V1-REL-0550','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','1910年Garnier出版的遗著合集；卷首说明其汇集 Machado 的故事、诗作与散页，作为文本作者关系登记，不把合编行为归给 Machado。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0818','V1-REL-0551','WCD10-B08-S155','SRC-0628','Anotações sobre a correspondência de Machado de Assis','Lines 78–87; 154–158; 249.','Fernando Nery 汇集并注释、Américo Bedeschi 于1932年出版的往返信件选集；包含 Machado 与其他人的通信及收信人回复，CREATED限定为其中 Machado 撰写的信件。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0819','V1-REL-0551','WCD10-B08-S101','SRC-0166','Machado de Assis – Bibliografia','Bibliografia lines 6–37; title/year entries individually recorded in RESEARCH_NOTES.md.','Fernando Nery 汇集并注释、Américo Bedeschi 于1932年出版的往返信件选集；包含 Machado 与其他人的通信及收信人回复，CREATED限定为其中 Machado 撰写的信件。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0820','V1-REL-0552','WCD10-B08-S156','SRC-0629','Diálogos e reflexões de um relojoeiro','Lines 272–300 and 342–366.','Raimundo Magalhães Júnior 1956年编选的报刊编年文集；收录 Machado 的“A + B”及“Bons dias”系列，后者缺一篇，勿将合集题名误作单篇连贯作品。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0821','V1-REL-0552','WCD10-B08-S157','SRC-0630','Edição da série de crônicas “A + B”','PDF pp. 99–103; web lines 0–16, 108–137.','Raimundo Magalhães Júnior 1956年编选的报刊编年文集；收录 Machado 的“A + B”及“Bons dias”系列，后者缺一篇，勿将合集题名误作单篇连贯作品。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0822','V1-REL-0552','WCD10-B08-S102','SRC-0165','Machado de Assis – Biografia','Biography lines 10–21; publication, genre, and phase-specific statements noted per candidate in RESEARCH_NOTES.md.','Raimundo Magalhães Júnior 1956年编选的报刊编年文集；收录 Machado 的“A + B”及“Bons dias”系列，后者缺一篇，勿将合集题名误作单篇连贯作品。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0823','V1-REL-0553','WCD10-B08-S128','SRC-0605','Machado de Assis: recortes avulsos','Abstract lines 86–93 (Papéis avulsos contents and O Alienista serial span); lines 145–153 and 167–175 (Contos fluminenses and Histórias da meia-noite); lines 227–245 (publication date and author identity).','独立故事文本；报刊连载后收入《Papéis avulsos》。CREATED指 Machado 创作的故事，不指后续合集的选编行为。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0824','V1-REL-0553','WCD10-B08-S148','SRC-0622','Papeis avulsos [Papéis avulsos]','Lines 7–16: Lombaerts, 1882, complete 12-item table of contents and Machado’s prefatory statement about unity among diverse texts.','独立故事文本；报刊连载后收入《Papéis avulsos》。CREATED指 Machado 创作的故事，不指后续合集的选编行为。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0825','V1-REL-0553','WCD10-B08-S152','SRC-0625','O alienista','Text lines 545–572: Simão Bacamarte reverses the Casa Verde classification rule after finding four-fifths of Itaguaí’s population confined, frees them and changes whom he will admit.','独立故事文本；报刊连载后收入《Papéis avulsos》。CREATED指 Machado 创作的故事，不指后续合集的选编行为。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0826','V1-REL-0553','WCD10-B08-S159','SRC-0632','Machado de Assis: uma edição crítica de O Alienista com ensaio introdutório: O Alienista, ou do Objeto Inapreensível','PDF title pages 0–1 and abstract p.4; web lines 0–20 and 40–61; serial contents/date PDF p.120 lines 2822–2825 and p.132 lines 3113–3116; book comparison pp.127–128 and 140–141.','独立故事文本；报刊连载后收入《Papéis avulsos》。CREATED指 Machado 创作的故事，不指后续合集的选编行为。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0827','V1-REL-0554','WCD10-B08-S202','SRC-0633','Tradição impressa de Corpo de Baile','已打开7页PDF。P0 L0–13；P1 L28–33；P2 L53–62；P3 L68–93；正文明确1956两卷、1960单卷、第三版三册1964/65，列七篇及分类、人物跨篇。','若昂·吉马朗埃斯·罗萨创作 Corpo de Baile','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0828','V1-REL-0554','WCD10-B08-S209','SRC-0639','Corpo de baile, sete novelas | WorldCat','L39–51题名、作者、1956葡文印本与J. Olympio；用作书目交叉核对。','若昂·吉马朗埃斯·罗萨创作 Corpo de Baile','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0829','V1-REL-0555','WCD10-B08-S204','SRC-0635','Com o vaqueiro Mariano | Banco de Dados Bibliográfico João Guimarães Rosa','USP作品书目L22–46记录1952年独立书版及收入Estas estórias；L48–106列1947–48报刊分期；页面L256–269为Andrea Ramos Jubé Vianna 2019年研究摘要（reportagem），L282–294另列Guilherme Mazzafera e Silva Vilhena 2017年不同研究。','若昂·吉马朗埃斯·罗萨创作 Com o vaqueiro Mariano','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0830','V1-REL-0555','WCD10-B08-S210','SRC-0640','Com o vaqueiro Mariano | Biblioteca Digital de Literatura de Países Lusófonos','L9–33结构化Work Data给出题名/作者/contos分类/1947；L34起页面明确转入Wikipedia Data。仅用上方结构化字段。','若昂·吉马朗埃斯·罗萨创作 Com o vaqueiro Mariano','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0831','V1-REL-0555','WCD10-B08-S203','SRC-0634','João Guimarães Rosa | Biografia','正文L10–19：Magma于1936获奖且未出版；Sagarana 1946；Com o vaqueiro Mariano文本与1952远行、遗作 Estas estórias 1969；Grande sertão/Corpo 1956。','若昂·吉马朗埃斯·罗萨创作 Com o vaqueiro Mariano','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0832','V1-REL-0555','WCD10-B08-S212','SRC-0642','Estas estórias | Banco de Dados Bibliográfico João Guimarães Rosa','L315–381列书版；L321–326首版出版社和1969；L87–101把Entremeio: com o vaqueiro Mariano收入该集；L539–540将其称为遗作书。','若昂·吉马朗埃斯·罗萨创作 Com o vaqueiro Mariano','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0833','V1-REL-0556','WCD10-B08-S206','SRC-0637','O (en)canto da linguagem rendada: ritmo e sonoridade em Tutameia, de Guimarães Rosa','已打开UFMG博士论文全文。题名/作者/学位与年份P0–1 L0–15；摘要P9 L71–99；P16–17 L205–242核实双目录中40篇contos、4篇prefácios（三篇穿插叙事）及目录结构；P177–178 L5437–40核对1967书目。','若昂·吉马朗埃斯·罗萨创作 Tutameia (Terceiras estórias)','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0834','V1-REL-0557','WCD10-B08-S212','SRC-0642','Estas estórias | Banco de Dados Bibliográfico João Guimarães Rosa','L315–381列书版；L321–326首版出版社和1969；L87–101把Entremeio: com o vaqueiro Mariano收入该集；L539–540将其称为遗作书。','若昂·吉马朗埃斯·罗萨创作 Estas estórias','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0835','V1-REL-0557','WCD10-B08-S203','SRC-0634','João Guimarães Rosa | Biografia','正文L10–19：Magma于1936获奖且未出版；Sagarana 1946；Com o vaqueiro Mariano文本与1952远行、遗作 Estas estórias 1969；Grande sertão/Corpo 1956。','若昂·吉马朗埃斯·罗萨创作 Estas estórias','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0836','V1-REL-0557','WCD10-B08-S230','SRC-0658','Pequena Bibliografia de João Guimarães Rosa','已打开全文转录L125–126（MMM：1961年10–12月O Cruzeiro连载，另列1962书版）；L127列Estas estórias 1969年初版及九篇内容。USP RIEB官方题录检索记录确认原文作者Covizzi与Verlangieri、期刊第41期、1996、页213–234及DOI；官方页面直接打开失败，全文从Scribd托管转录阅读。','若昂·吉马朗埃斯·罗萨创作 Estas estórias','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0837','V1-REL-0558','WCD10-B08-S201','SRC-0169','João Guimarães Rosa – Bibliografia','打开页第7–30行；书目逐项列Sagarana、Com o vaqueiro Mariano、Corpo de baile、三分卷、Tutameia (Terceiras estórias)、Estas estórias、Ave, palavra及合作书目。URL与既有SRC-0169完全相同，旧等级/元数据不修改。','若昂·吉马朗埃斯·罗萨创作 Ave, Palavra','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0838','V1-REL-0558','WCD10-B08-S225','SRC-0653','As Configurações da Linguagem Roseana em Ave, Palavra','实际打开官方期刊17页PDF：P0 L1–17题名/作者/摘要；P9 L349–355列crônicas、contos、diários、notas de viagem并举“O lago do Itamaraty”；P10 L364–371讨论1947–1967报刊文本与杂集编排。此前访问失败仅作为检索历史记录。','若昂·吉马朗埃斯·罗萨创作 Ave, Palavra','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0839','V1-REL-0559','WCD10-B08-S205','SRC-0636','Magma | Museu Casa Guimarães Rosa','L47–61题名与1997馆藏编年；L70–96书目收藏层级、作者和Nova Fronteira；L109–114题名/作者/出版地出版社年份。','若昂·吉马朗埃斯·罗萨创作 Magma','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0840','V1-REL-0559','WCD10-B08-S223','SRC-0651','Guimarães Rosa: Magma e gênese da obra','L30–45为UNESP出版社书目页，载Magma未刊至1997及诗歌集概述；网页自身未列可核的页面发表日期，故来源publication_year留空。','若昂·吉马朗埃斯·罗萨创作 Magma','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0841','V1-REL-0559','WCD10-B08-S203','SRC-0634','João Guimarães Rosa | Biografia','正文L10–19：Magma于1936获奖且未出版；Sagarana 1946；Com o vaqueiro Mariano文本与1952远行、遗作 Estas estórias 1969；Grande sertão/Corpo 1956。','若昂·吉马朗埃斯·罗萨创作 Magma','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0842','V1-REL-0560','WCD10-B08-S201','SRC-0169','João Guimarães Rosa – Bibliografia','打开页第7–30行；书目逐项列Sagarana、Com o vaqueiro Mariano、Corpo de baile、三分卷、Tutameia (Terceiras estórias)、Estas estórias、Ave, palavra及合作书目。URL与既有SRC-0169完全相同，旧等级/元数据不修改。','作为十位合作者之一参与由João Condé协调的合作侦探小说；来源确认每位作者各续写一章。本关系不表示Rosa独著。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0843','V1-REL-0560','WCD10-B08-S224','SRC-0652','A escrita em conjunto na literatura policial brasileira: um olhar sobre os arquivos de João Condé','已打开12页论文；P2 L95–96原文称MMM于1964年在O Cruzeiro连载、后来又出版成书；P3 L105–111概述谋杀案线索；P4 L154–156确认十名合作者含Rosa与Jorge Amado。该1964连载年代与S230 1961连载及1962书本目录相冲突。','作为十位合作者之一参与由João Condé协调的合作侦探小说；来源确认每位作者各续写一章。本关系不表示Rosa独著。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0844','V1-REL-0560','WCD10-B08-S211','SRC-0641','O filho da mãe, de Bernardo Carvalho, e a figuração do amor na escrita patrocinada da coleção Amores Expressos','UEL 2016硕士论文，题名页P0–1 L0–15确认作者、题名、学位机构和年份；P44–45 L1389–95是在另一作品研究中的合作写作综述，提及O Mistério dos MMM的1962年出版、十名作者及逐章接写。不是专门研究该书的论文。','作为十位合作者之一参与由João Condé协调的合作侦探小说；来源确认每位作者各续写一章。本关系不表示Rosa独著。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0845','V1-REL-0560','WCD10-B08-S230','SRC-0658','Pequena Bibliografia de João Guimarães Rosa','已打开全文转录L125–126（MMM：1961年10–12月O Cruzeiro连载，另列1962书版）；L127列Estas estórias 1969年初版及九篇内容。USP RIEB官方题录检索记录确认原文作者Covizzi与Verlangieri、期刊第41期、1996、页213–234及DOI；官方页面直接打开失败，全文从Scribd托管转录阅读。','作为十位合作者之一参与由João Condé协调的合作侦探小说；来源确认每位作者各续写一章。本关系不表示Rosa独著。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0846','V1-REL-0561','WCD10-B08-S207','SRC-0638','Os sete pecados capitais | Banco de Dados Bibliográfico João Guimarães Rosa','L22–40题名、七位作者、Rosa标注co-autor，目录列其篇名Os chapéus transeuntes并标首版1964，p.1–36。','作为合著者之一参与该合编故事集；可核实的具体贡献为篇目“Os chapéus transeuntes”（第1–36页）。本关系不表示该书为Rosa独著。','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0847','V1-REL-0562','WCD10-B08-S202','SRC-0633','Tradição impressa de Corpo de Baile','已打开7页PDF。P0 L0–13；P1 L28–33；P2 L53–62；P3 L68–93；正文明确1956两卷、1960单卷、第三版三册1964/65，列七篇及分类、人物跨篇。','若昂·吉马朗埃斯·罗萨创作 Campo Geral','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0848','V1-REL-0562','WCD10-B08-S215','SRC-0643','O Corpo e a palavra: uma leitura de "Campo geral" de J. Guimarães Rosa','L30–31：Nogueira摘要将Miguilim描述为以感官经验理解世界、通过讲故事应对充满疑虑、恐惧与死亡的童年；L69–74为期刊卷期页码与出版年。','若昂·吉马朗埃斯·罗萨创作 Campo Geral','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0849','V1-REL-0563','WCD10-B08-S202','SRC-0633','Tradição impressa de Corpo de Baile','已打开7页PDF。P0 L0–13；P1 L28–33；P2 L53–62；P3 L68–93；正文明确1956两卷、1960单卷、第三版三册1964/65，列七篇及分类、人物跨篇。','若昂·吉马朗埃斯·罗萨创作 Uma estória de amor','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0850','V1-REL-0563','WCD10-B08-S216','SRC-0644','A representação da masculinidade no conto "Uma estória de amor", de João Guimarães Rosa','L38–39：Silva摘要说明Manuelzão强悍勇敢的外表下隐藏焦虑与不安；期刊卷3第1期为2015年，网页L57–62记在线日期2018-04-06。','若昂·吉马朗埃斯·罗萨创作 Uma estória de amor','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0851','V1-REL-0564','WCD10-B08-S202','SRC-0633','Tradição impressa de Corpo de Baile','已打开7页PDF。P0 L0–13；P1 L28–33；P2 L53–62；P3 L68–93；正文明确1956两卷、1960单卷、第三版三册1964/65，列七篇及分类、人物跨篇。','若昂·吉马朗埃斯·罗萨创作 A estória de Lélio e Lina','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0852','V1-REL-0564','WCD10-B08-S219','SRC-0647','“Saudades de destino”: forças e corpos fora de regra no "Corpo de baile", de Guimarães Rosa','L23–32题名和作者；L37–40摘要：Lélio为牧牛人，从城中返回米纳斯吉拉斯荒原，经历主要在Pinhém农庄展开；L142正式引用。','若昂·吉马朗埃斯·罗萨创作 A estória de Lélio e Lina','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0853','V1-REL-0565','WCD10-B08-S202','SRC-0633','Tradição impressa de Corpo de Baile','已打开7页PDF。P0 L0–13；P1 L28–33；P2 L53–62；P3 L68–93；正文明确1956两卷、1960单卷、第三版三册1964/65，列七篇及分类、人物跨篇。','若昂·吉马朗埃斯·罗萨创作 O Recado do Morro','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0854','V1-REL-0565','WCD10-B08-S217','SRC-0645','O recado do Morro: profecia e redenção','UCP仓储页面L8–28给题名、作者、文章类型、2020-06-08仓储日期及摘要；全文12页PDF P0 L20–P1 L40交代五人旅行和叙事背景，P2 L81–89论谋害阴谋及七重预言，P6–7 L245–260论最后关头获救。仓储机构与期刊出版者分开记录。','若昂·吉马朗埃斯·罗萨创作 O Recado do Morro','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0855','V1-REL-0566','WCD10-B08-S202','SRC-0633','Tradição impressa de Corpo de Baile','已打开7页PDF。P0 L0–13；P1 L28–33；P2 L53–62；P3 L68–93；正文明确1956两卷、1960单卷、第三版三册1964/65，列七篇及分类、人物跨篇。','若昂·吉马朗埃斯·罗萨创作 Lão-Dalalão (Dão-Lalalão)','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0856','V1-REL-0566','WCD10-B08-S220','SRC-0648','Dão-Lalalão, a reescrita do desejo','L23–38作者与摘要：D’Angelo称该篇为romance breve，讨论Soropita与Doralda的肉身之爱和欲望；期刊v.12为2006年，卷期信息L59–65。','若昂·吉马朗埃斯·罗萨创作 Lão-Dalalão (Dão-Lalalão)','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0857','V1-REL-0567','WCD10-B08-S202','SRC-0633','Tradição impressa de Corpo de Baile','已打开7页PDF。P0 L0–13；P1 L28–33；P2 L53–62；P3 L68–93；正文明确1956两卷、1960单卷、第三版三册1964/65，列七篇及分类、人物跨篇。','若昂·吉马朗埃斯·罗萨创作 Cara-de-Bronze','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0858','V1-REL-0567','WCD10-B08-S218','SRC-0646','“Cara de Bronze”: uma história em linguagem de cinema ou o místico em Guimarães Rosa','L36–37摘要：Sá Rosa叙述Cara-de-Bronze误解父亲死因、临终派Grivo寻访事物本质并带回讲述；期刊卷5第10期为2011年，网页L53–58记在线日期2012-04-13。','若昂·吉马朗埃斯·罗萨创作 Cara-de-Bronze','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0859','V1-REL-0568','WCD10-B08-S202','SRC-0633','Tradição impressa de Corpo de Baile','已打开7页PDF。P0 L0–13；P1 L28–33；P2 L53–62；P3 L68–93；正文明确1956两卷、1960单卷、第三版三册1964/65，列七篇及分类、人物跨篇。','若昂·吉马朗埃斯·罗萨创作 Buriti','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0860','V1-REL-0568','WCD10-B08-S221','SRC-0649','O mundo que perdeu suas paredes: Lalinha e o belo poço parado em “Buriti” de João Guimarães Rosa','L18–32作者与摘要：Diogo讨论Lalinha抵达Buriti Bom及其对封闭父权秩序的扰动；L39–45为期刊卷3 (2011)出版元数据。','若昂·吉马朗埃斯·罗萨创作 Buriti','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0861','V1-REL-0569','WCD10-B08-S203','SRC-0634','João Guimarães Rosa | Biografia','正文L10–19：Magma于1936获奖且未出版；Sagarana 1946；Com o vaqueiro Mariano文本与1952远行、遗作 Estas estórias 1969；Grande sertão/Corpo 1956。','若昂·吉马朗埃斯·罗萨创作 O mistério de Highmore Hall','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0862','V1-REL-0569','WCD10-B08-S226','SRC-0654','O fantástico em O Mistério de Highmore Hall e Tempo e Destino, os primeiros contos de Guimarães Rosa','16页论文：P0 L0–4作者与题名；P6 L213–216直接记载Tempo e Destino于1930-06-22发表于O Cruzeiro并说明主角Zviazline为求婚资助而参加棋赛；P7–P9 L217–310叙述神秘棋手、Tempo与Destino对弈、Zviazline经历超自然启示并赢得比赛。','若昂·吉马朗埃斯·罗萨创作 O mistério de Highmore Hall','high','eligible_evidence','WCD-10-B08'),
('V1-EV-0863','V1-REL-0570','WCD10-B08-S226','SRC-0654','O fantástico em O Mistério de Highmore Hall e Tempo e Destino, os primeiros contos de Guimarães Rosa','16页论文：P0 L0–4作者与题名；P6 L213–216直接记载Tempo e Destino于1930-06-22发表于O Cruzeiro并说明主角Zviazline为求婚资助而参加棋赛；P7–P9 L217–310叙述神秘棋手、Tempo与Destino对弈、Zviazline经历超自然启示并赢得比赛。','若昂·吉马朗埃斯·罗萨创作 Chronos kai Anagke (Tempo e Destino)','high','eligible_evidence','WCD-10-B08');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0271','WCD-10-B08-G01','research_gap','WCD10:B08:V1-ENT-0200:Diario-de-viaje-a-Paris','open','逐项检索议会书目条目（S002列1945）、教师图书馆页面、数字馆藏和《Diario de viaje a París》题名。馆藏/研究线索将写作旅行置于1900年，却未得到可亲验的Quiroga生前完整出版记录；S002的1945可能为后世文集编年。当前来源对写作年与遗著/书本出版层未闭合，未新增。','','Independent Reviewer: preserve research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0272','WCD-10-B08-G02','research_gap','WCD10:B08:V1-ENT-0200:Nuevos-cuentos-de-la-selva','open','逐项检索议会作者书目、图书馆馆藏及题名/出版社记录；现只能从S002确认2005遗著书目题名，未取得编者、目录、原稿关系和出版物完整主记录。此为后编对象且作者层/编辑层未明，暂缓。','','Independent Reviewer: preserve research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0273','WCD-10-B08-G03','research_gap','WCD10:B08:V1-ENT-0200:La-Jangada','open','已实际打开Textos.info全文（S013），其副题明确为“Bosquejo de filme”；另查S002议会书目仅给1961遗著线索。题名很可能为电影提案稿，仍未核得1961单行本/首次公开发表的可读馆藏记录，故不把手稿等同已出版作品。','','Independent Reviewer: preserve research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0274','WCD-10-B08-G04','research_gap','WCD10:B08:V1-ENT-0200:Cartas-ineditas-de-Horacio-Quiroga','open','逐项核查S002中1959书目条目并搜索国家/议会馆藏题名；现有身份是编辑者整理的作者书信集，不是Quiroga署名创作的文学作品。作为作者作品图谱的边界项继续保留核查记录，不纳入CREATED文学作品。','','Independent Reviewer: preserve research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0275','WCD-10-B08-G05','research_gap','WCD10:B08:V1-ENT-0200:Una-caceria-humana-en-Africa','open','全文重查Pionetti (S005)的叙述日期和各刊号，并交叉核对乌拉圭议会书目、国家图书馆数字期刊年度目录和Google Books卷期信息；S005说1912，议会书目说1913，Hemeroteca只见1913年卷且本次原期访问502/不可读。未见原期，不断言首刊年，故整项延期。','','Independent Reviewer: preserve research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0276','WCD-10-B08-G06','research_gap','WCD10:B08:V1-ENT-0200:El-Teatro-Mudo','open','Ferrari 2021全文（pp.99–100）确认这是1917年发表于Mundo Argentino no.332（16 May 1917）的电影评论短文，并分析其电影/戏剧与特写表达；该对象属非文学电影评论，故作为作者目录边界项保留，不纳入文学作品候选。','','Independent Reviewer: preserve research_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0277','WCD-10-B08-G07','research_gap','WCD10:B08:V1-ENT-0211:translation:Queda que as mulheres têm para os tolos','open','ABL biography identifies this 1861 volume as Machado’s translation, so it is not an original-authored work for this author-to-CREATED work inventory.','','Independent Reviewer: preserve out_of_scope_translation','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0278','WCD-10-B08-G08','research_gap','WCD10:B08:V1-ENT-0211:posthumous:Crônicas, 4 vols.','open','Direct title-level review: ABL lists a four-volume 1937 set, but UCS institutional catalog records a three-volume 1937 copy; UFMG scholarship describes a seven-volume Jackson chronicles arrangement without equating it to that 1937 title. Exact set, contents and boundary are unresolved; defer the object rather than infer a first edition.','','Independent Reviewer: preserve deferred_editorial_collection','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0279','WCD-10-B08-G09','research_gap','WCD10:B08:V1-ENT-0211:posthumous:Crítica literária','open','Direct title-level review: ABL lists a 1937 title; the UCS catalog directly records a Jackson 1957 copy (336 pages). The consulted record does not establish whether 1957 is a reissue of the 1937 volume or a distinct edition; no direct contents list for the initial 1937 object was obtained, so retain this bounded research gap.','','Independent Reviewer: preserve deferred_editorial_collection','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0280','WCD-10-B08-G10','research_gap','WCD10:B08:V1-ENT-0211:posthumous:MagalhãesJúnior:Crônicas de Lélio','open','Targeted search found ABL bibliography references to the title among Magalhães Júnior-organized material, but no directly opened catalog/edition page establishing a standalone book’s first year and contents was obtained. Authorship of the Lélio newspaper byline alone does not establish this collection object; defer pending edition-level source.','','Independent Reviewer: preserve deferred_editorial_collection','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0281','WCD-10-B08-G11','research_gap','WCD10:B08:V1-ENT-0212:Manuelzao-e-Miguilim-1964','open','ABL bibliography lines 13–17 and Calzolari P0–P1 show this is one of three autonomous volumes created only with the third edition of the 1956 cycle; it repeats two already represented 1956 narratives and is retained as version/split-volume lineage rather than a duplicate independent work entity. Google Books record verifies a 1964, third-edition, volume 1 of Corpo de baile; no separate text object proposed.','','Independent Reviewer: preserve edition_split_of_existing_cycle_no_duplicate','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0282','WCD-10-B08-G12','research_gap','WCD10:B08:V1-ENT-0212:No-Urubuquaqa-no-Pinhem-1965','open','ABL bibliography lines 15–17 and Calzolari P0–P1 identify this as the second autonomous title in the third-edition tripartition, not a new first-published work; its constituent narratives remain the 1956 texts. Treat as split-volume manifestation/version of W201 and avoid duplicate work entity.','','Independent Reviewer: preserve edition_split_of_existing_cycle_no_duplicate','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0283','WCD-10-B08-G13','research_gap','WCD10:B08:V1-ENT-0212:Noites-do-sertao-1965','open','ABL bibliography lines 17 and Calzolari P0–P1 identify this as the third autonomous volume in the third-edition tripartition; it reissues two 1956 constituent narratives. Treat as split-volume manifestation/version of W201 and do not count as a new independent first-publication object.','','Independent Reviewer: preserve edition_split_of_existing_cycle_no_duplicate','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0284','WCD-10-B08-G14','research_gap','WCD10:B08:existing-work-inventory','open','These are the three existing book objects V1-ENT-0218, V1-ENT-0217 and V1-ENT-0219 respectively; no duplicates created. Their complete legacy facts/cards/relationships and all four source chains are preserved in COVERAGE.','','Independent Reviewer: preserve preserved_existing_objects','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0285','WCD-10-B08-G15','research_gap','WCD10:B08:V1-ENT-0212:Os-sete-pecados-capitais-1964:cross-author-coverage','open','USP书目S207直接列出Lygia Fagundes Telles与Rosa共同参与《Os sete pecados capitais》。本作者包只记录Rosa的参与边，不建立其他作者边；稳定题名去重键保留，待正式ID后由TASK-125/TASK-127受控回补。','','Independent Reviewer: preserve deferred_cross_author_relationships','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0286','WCD-10-B08-G16','research_gap','WCD10:B08:V1-ENT-0212:O-misterio-dos-MMM-1962:cross-author-coverage','open','ABL书目S201与帕拉州基金会馆藏目录S229均列1962年合作书本版；S224另称先于1964年在《O Cruzeiro》连载，该年份冲突只保留在对象书目注。此项仅延后其他作者的CREATED边，待正式ID后由TASK-125/TASK-127受控回补；不因关系延后而撤下当前作者的有边界参与记录。','','Independent Reviewer: preserve deferred_cross_author_relationships','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0287','WCD-10-B08:WCD10-B08-W001','research_gap','WCD10:work_level_research:V1-ENT-0511','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0288','WCD-10-B08:WCD10-B08-W002','research_gap','WCD10:work_level_research:V1-ENT-0512','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0289','WCD-10-B08:WCD10-B08-W003','research_gap','WCD10:work_level_research:V1-ENT-0513','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0290','WCD-10-B08:WCD10-B08-W004','research_gap','WCD10:work_level_research:V1-ENT-0514','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0291','WCD-10-B08:WCD10-B08-W005','research_gap','WCD10:work_level_research:V1-ENT-0515','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0292','WCD-10-B08:WCD10-B08-W006','research_gap','WCD10:work_level_research:V1-ENT-0516','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0293','WCD-10-B08:WCD10-B08-W007','research_gap','WCD10:work_level_research:V1-ENT-0517','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0294','WCD-10-B08:WCD10-B08-W008','research_gap','WCD10:work_level_research:V1-ENT-0518','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0295','WCD-10-B08:WCD10-B08-W009','research_gap','WCD10:work_level_research:V1-ENT-0519','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0296','WCD-10-B08:WCD10-B08-W010','research_gap','WCD10:work_level_research:V1-ENT-0520','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0297','WCD-10-B08:WCD10-B08-W011','research_gap','WCD10:work_level_research:V1-ENT-0521','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0298','WCD-10-B08:WCD10-B08-W012','research_gap','WCD10:work_level_research:V1-ENT-0522','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0299','WCD-10-B08:WCD10-B08-W013','research_gap','WCD10:work_level_research:V1-ENT-0523','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0300','WCD-10-B08:WCD10-B08-W014','research_gap','WCD10:work_level_research:V1-ENT-0524','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0301','WCD-10-B08:WCD10-B08-W015','research_gap','WCD10:work_level_research:V1-ENT-0525','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0302','WCD-10-B08:WCD10-B08-W016','research_gap','WCD10:work_level_research:V1-ENT-0526','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0303','WCD-10-B08:WCD10-B08-W017','research_gap','WCD10:work_level_research:V1-ENT-0527','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0304','WCD-10-B08:WCD10-B08-W018','research_gap','WCD10:work_level_research:V1-ENT-0528','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0305','WCD-10-B08:WCD10-B08-W019','research_gap','WCD10:work_level_research:V1-ENT-0529','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0306','WCD-10-B08:WCD10-B08-W020','research_gap','WCD10:work_level_research:V1-ENT-0530','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0307','WCD-10-B08:WCD10-B08-W022','research_gap','WCD10:work_level_research:V1-ENT-0532','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0308','WCD-10-B08:WCD10-B08-W023','research_gap','WCD10:work_level_research:V1-ENT-0533','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0309','WCD-10-B08:WCD10-B08-W024','research_gap','WCD10:work_level_research:V1-ENT-0534','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0310','WCD-10-B08:WCD10-B08-W026','research_gap','WCD10:work_level_research:V1-ENT-0536','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0311','WCD-10-B08:WCD10-B08-W028','research_gap','WCD10:work_level_research:V1-ENT-0537','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0312','WCD-10-B08:WCD10-B08-W029','research_gap','WCD10:work_level_research:V1-ENT-0538','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0313','WCD-10-B08:WCD10-B08-W032','research_gap','WCD10:work_level_research:V1-ENT-0541','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0314','WCD-10-B08:WCD10-B08-W033','research_gap','WCD10:work_level_research:V1-ENT-0542','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0315','WCD-10-B08:WCD10-B08-W034','research_gap','WCD10:work_level_research:V1-ENT-0543','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0316','WCD-10-B08:WCD10-B08-W035','research_gap','WCD10:work_level_research:V1-ENT-0544','open','Review source-level title, first edition/periodical evidence and any edition conflicts before Curation admission.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0317','WCD-10-B08:WCD10-B08-W101','research_gap','WCD10:work_level_research:V1-ENT-0547','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0318','WCD-10-B08:WCD10-B08-W102','research_gap','WCD10:work_level_research:V1-ENT-0548','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0319','WCD-10-B08:WCD10-B08-W103','research_gap','WCD10:work_level_research:V1-ENT-0549','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0320','WCD-10-B08:WCD10-B08-W104','research_gap','WCD10:work_level_research:V1-ENT-0550','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0321','WCD-10-B08:WCD10-B08-W105','research_gap','WCD10:work_level_research:V1-ENT-0551','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0322','WCD-10-B08:WCD10-B08-W106','research_gap','WCD10:work_level_research:V1-ENT-0552','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0323','WCD-10-B08:WCD10-B08-W107','research_gap','WCD10:work_level_research:V1-ENT-0553','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0324','WCD-10-B08:WCD10-B08-W108','research_gap','WCD10:work_level_research:V1-ENT-0554','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0325','WCD-10-B08:WCD10-B08-W109','research_gap','WCD10:work_level_research:V1-ENT-0555','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0326','WCD-10-B08:WCD10-B08-W110','research_gap','WCD10:work_level_research:V1-ENT-0556','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0327','WCD-10-B08:WCD10-B08-W111','research_gap','WCD10:work_level_research:V1-ENT-0557','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0328','WCD-10-B08:WCD10-B08-W113','research_gap','WCD10:work_level_research:V1-ENT-0559','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0329','WCD-10-B08:WCD10-B08-W114','research_gap','WCD10:work_level_research:V1-ENT-0560','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0330','WCD-10-B08:WCD10-B08-W115','research_gap','WCD10:work_level_research:V1-ENT-0561','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0331','WCD-10-B08:WCD10-B08-W116','research_gap','WCD10:work_level_research:V1-ENT-0562','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0332','WCD-10-B08:WCD10-B08-W117','research_gap','WCD10:work_level_research:V1-ENT-0563','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0333','WCD-10-B08:WCD10-B08-W118','research_gap','WCD10:work_level_research:V1-ENT-0564','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0334','WCD-10-B08:WCD10-B08-W119','research_gap','WCD10:work_level_research:V1-ENT-0565','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0335','WCD-10-B08:WCD10-B08-W120','research_gap','WCD10:work_level_research:V1-ENT-0566','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0336','WCD-10-B08:WCD10-B08-W121','research_gap','WCD10:work_level_research:V1-ENT-0567','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0337','WCD-10-B08:WCD10-B08-W122','research_gap','WCD10:work_level_research:V1-ENT-0568','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0338','WCD-10-B08:WCD10-B08-W123','research_gap','WCD10:work_level_research:V1-ENT-0569','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0339','WCD-10-B08:WCD10-B08-W124','research_gap','WCD10:work_level_research:V1-ENT-0570','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0340','WCD-10-B08:WCD10-B08-W125','research_gap','WCD10:work_level_research:V1-ENT-0571','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0341','WCD-10-B08:WCD10-B08-W126','research_gap','WCD10:work_level_research:V1-ENT-0572','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0342','WCD-10-B08:WCD10-B08-W127','research_gap','WCD10:work_level_research:V1-ENT-0573','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0343','WCD-10-B08:WCD10-B08-W128','research_gap','WCD10:work_level_research:V1-ENT-0574','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0344','WCD-10-B08:WCD10-B08-W129','research_gap','WCD10:work_level_research:V1-ENT-0575','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0345','WCD-10-B08:WCD10-B08-W130','research_gap','WCD10:work_level_research:V1-ENT-0576','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0346','WCD-10-B08:WCD10-B08-W131','research_gap','WCD10:work_level_research:V1-ENT-0577','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0347','WCD-10-B08:WCD10-B08-W132','research_gap','WCD10:work_level_research:V1-ENT-0578','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0348','WCD-10-B08:WCD10-B08-W133','research_gap','WCD10:work_level_research:V1-ENT-0579','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0349','WCD-10-B08:WCD10-B08-W134','research_gap','WCD10:work_level_research:V1-ENT-0580','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0350','WCD-10-B08:WCD10-B08-W135','research_gap','WCD10:work_level_research:V1-ENT-0581','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0351','WCD-10-B08:WCD10-B08-W136','research_gap','WCD10:work_level_research:V1-ENT-0582','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0352','WCD-10-B08:WCD10-B08-W137','research_gap','WCD10:work_level_research:V1-ENT-0583','open','本对象本批按institutional_commentary准入；作品级学术阐释未达本批准入，保持开放缺口。目录/机构资料或局部研究存在不等于全项学术覆盖通过。','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0353','WCD-10-B08:WCD10-B08-W204','research_gap','WCD10:work_level_research:V1-ENT-0588','open','Independent parent review pending.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0354','WCD-10-B08:WCD10-B08-W205','research_gap','WCD10:work_level_research:V1-ENT-0589','open','Independent parent review pending.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0355','WCD-10-B08:WCD10-B08-W206','research_gap','WCD10:work_level_research:V1-ENT-0590','open','Independent parent review pending.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0356','WCD-10-B08:WCD10-B08-W208','research_gap','WCD10:work_level_research:V1-ENT-0592','open','Independent parent review pending.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B08' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-12' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 656 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 599 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 597 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 543 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1893 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 2319 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1872 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 1176 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 568 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 892 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 863 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 356 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
