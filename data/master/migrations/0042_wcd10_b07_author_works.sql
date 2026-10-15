-- Prepared WCD-10 research-only migration; independent SQL review required.

-- Candidate review: Codex-parent-independent-review

-- Registration sha256: 6114ea2e569ba318e4186b90434f3ba831a57adb53ae3f15b533822e3a862487

CREATE TEMP TABLE wcd10_guard (ok INTEGER NOT NULL CHECK (ok = 1));

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1349 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 752 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 380 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 454 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 452 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 1523 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1370 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 194 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "legacy_relation_groups") = 15 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "metadata") = 16 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "migration_log") = 41 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "n3_decisions") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_hold_evidence") = 58 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relation_holds") = 51 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 521 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 550 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 423 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "source_holds") = 4 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 456 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='schema_version') = '0.4' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='last_change_set') = 'WCD-10-B06' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT value FROM metadata WHERE key='research_version') = '1.5.0' THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0459' OR canonical_url='https://www.planetadelibros.com.ar/libro-uno-y-el-universo/132674') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0460' OR canonical_url='https://proapi.planetadelibros.com.ar/descargas/sala-prensa-libro/sinopsis-y-biografia/132686/hombres-y-engranajes.pdf?_locale=ar') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0461' OR canonical_url='https://www.planetadelibros.com/libro-el-escritor-y-sus-fantasmas/13010') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0462' OR canonical_url='https://www.planetadelibros.com.ar/libro-apologias-y-rechazos/132667') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0463' OR canonical_url='https://www.planetadelibros.com/libro-antes-del-fin/12917') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0464' OR canonical_url='https://www.planetadelibros.com/libro-la-resistencia/65837') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0465' OR canonical_url='https://www.planetadelibros.com/libro-espana-en-los-diarios-de-mi-vejez/13366') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0466' OR canonical_url='https://www.planetadelibros.com/libro-el-tunel/49945') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0467' OR canonical_url='https://www.planetadelibros.com/libro-sobre-heroes-y-tumbas/49444') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0468' OR canonical_url='https://www.planetadelibros.com/libro-abaddon-el-exterminador/50558') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0469' OR canonical_url='https://revistasincronia.cucsh.udg.mx/index.php/sincronia/article/view/257') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0470' OR canonical_url='https://revistas.uis.edu.co/index.php/revistahumanidades/article/download/4929/5047/22458') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0471' OR canonical_url='https://revistas.udec.cl/acta_literaria/article/view/4863') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0472' OR canonical_url='https://publicaciones.uap.edu.ar/index.php/revistaenfoques/article/view/254/245') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0473' OR canonical_url='https://www.cervantes.es/bibliotecas_documentacion_espanol/biografias/budapest_ernesto_sabato_1.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0474' OR canonical_url='https://revistaschilenas.uchile.cl/handle/2250/217663') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0475' OR canonical_url='https://redbiblio.unne.edu.ar/pergamo/documento.php?id=RESISTENCIA.44.93584&recno=93584&ui=44') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0476' OR canonical_url='https://catalogo.biblio.unc.edu.ar/index.php/Record/mayor.55747?sid=73076372') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0477' OR canonical_url='https://cedinpe.unsam.edu.ar/content/sabato-ernesto-el-otro-rostro-del-peronismo') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0478' OR canonical_url='https://www.cervantesvirtual.com/portales/adolfo_bioy_casares/su_obra_bibliografia/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0479' OR canonical_url='https://www.penguinlibros.com/es/libros-clasicos/311047-libro-diario-de-la-guerra-del-cerdo-9788466360296') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0480' OR canonical_url='https://www.penguinlibros.com/es/libros-clasicos/315794-libro-dormir-al-sol-9788466364287') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0481' OR canonical_url='https://www.penguinlibros.com/ar/grandes-clasicos/313590-libro-la-trama-celeste-9789877386691') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0482' OR canonical_url='https://www.penguinlibros.com/es/libros-clasicos/312947-ebook-historia-prodigiosa-9788420475875') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0483' OR canonical_url='https://www.penguinlibros.com/es/libros-clasicos/312945-ebook-el-gran-serafin-9788420475851') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0484' OR canonical_url='https://www.penguinlibros.com/es/libros-clasicos/312946-ebook-guirnalda-con-amores-9788420475868') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0485' OR canonical_url='https://www.penguinlibros.com/mx/grandes-clasicos/363117-libro-ultimas-novelas-9788466373753') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0486' OR canonical_url='https://www.penguinlibros.com/es/literatura-contemporanea/310496-libro-la-invencion-de-morel-edicion-definitiva-9788420462905') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0487' OR canonical_url='https://www.scielo.cl/scielo.php?pid=S0717-68482017000100143&script=sci_arttext') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0488' OR canonical_url='https://www.orillas.net/orillas/index.php/orillas/article/view/349') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0489' OR canonical_url='https://www.scielo.cl/scielo.php?pid=S0718-22012005000100003&script=sci_arttext') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0490' OR canonical_url='https://revistas.javeriana.edu.co/index.php/cualit/article/view/17278') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0491' OR canonical_url='https://revistaargos.cucsh.udg.mx/index.php/argos/article/view/130') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0492' OR canonical_url='https://p3.usal.edu.ar/index.php/gramma/article/view/2030') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0493' OR canonical_url='https://edizionicafoscari.unive.it/media/pdf/article/annali-di-ca-foscari-serie-occidentale/2016/50/art-10.14277-2499-1562-AnnOc-50-16-21.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0494' OR canonical_url='https://www.cervantesvirtual.com/obra-visor/un-conflicto-tragico-entre-dos-lealtades--el-sueno-de-los-heroes/html/9d1c4842-61d8-4dd5-a322-23d45f82d381_4.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0495' OR canonical_url='https://www.cervantesvirtual.com/obra/el-sueno-de-los-heroes--una-novela-de-transicion/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0496' OR canonical_url='https://www.penguinlibros.com/es/libros-clasicos/315793-libro-plan-de-evasion-9788466364270') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0497' OR canonical_url='https://www.penguinlibros.com/co/tematicas/312948-ebook-el-lado-de-la-sombra-9788420475882') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0498' OR canonical_url='https://www.penguinlibros.com/ar/content/645-todo-bioy') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0499' OR canonical_url='https://revistas.pucp.edu.pe/index.php/lexis/article/download/4866/4865/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0500' OR canonical_url='https://www.cervantesvirtual.com/obra-visor/adolfo-bioy-casares-o-las-mascaras-de-la-verdad/html/6245ede1-38ae-4404-a1c0-739815743c9f_3.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0501' OR canonical_url='https://www.cervantesvirtual.com/obra-visor/poetica-de-la-casa-bioycasareana/html/4686751f-d812-481c-83c5-8a20b64253cb_3.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0502' OR canonical_url='https://www.penguinlibros.com/mx/literatura-contemporanea/460590-libro-la-otra-aventura-y-otros-escritos-9788466378192') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0503' OR canonical_url='https://proapi.planetadelibros.com/descargas/sala-prensa-libro/sinopsis-y-biografia/88293/memorias.pdf?_locale=es') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0504' OR canonical_url='https://bibliotecavirtual.unl.edu.ar/publicaciones/index.php/Texturas/en/article/download/4792/7303/12237') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0505' OR canonical_url='https://books.google.com/books/about/Descanso_de_caminantes.html?id=OShfAAAAMAAJ') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0506' OR canonical_url='https://www.lanacion.com.ar/cultura/posfacio-nid215346/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0507' OR canonical_url='https://elcairo.cervantes.es/es/biblioteca_espanol/biografia_adolfo_bioy_casares_espanol.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0508' OR canonical_url='https://www.planetadelibros.com/libro-en-viaje/89404') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0509' OR canonical_url='https://letras.filo.uba.ar/sites/letras.filo.uba.ar/files/documentos/BARRAL_ACTAS_2014.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0510' OR canonical_url='https://www.planetadelibros.com/libro-una-muneca-rusa/88223') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0511' OR canonical_url='https://www.agenciabalcells.com/autores/obra/adolfo-bioy-casares/memoria-sobre-la-pampa-y-los-gauchos/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0512' OR canonical_url='https://www.cervantesvirtual.com/portales/adolfo_bioy_casares/autor_apunte/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0513' OR canonical_url='https://books.google.com/books/about/El_perjurio_de_la_nieve.html?id=dB8zAAAAMAAJ') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0514' OR canonical_url='https://cvc.cervantes.es/literatura/aih/pdf/18/aih_18_2_02_05_44.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0515' OR canonical_url='https://portal.amelica.org/ameli/jatsRepo/125/125958006/html/index.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0516' OR canonical_url='https://rarebooks.library.nd.edu/collections/latin_american/south_american/southern_cone_lit/bioy_casares.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0517' OR canonical_url='https://ffyh.unc.edu.ar/boletin/ediciones_anteriores/archivos/imagenes/e-books/TESIS-GIOVANNINI-GUSTAVO-E-BOOK.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0518' OR canonical_url='https://www.cervantesvirtual.com/obra/bioy-borges-y-sur/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0519' OR canonical_url='https://proapi.planetadelibros.com.ar/descargas/sala-prensa-libro/sinopsis-y-biografia/219757/los-que-aman-odian.pdf?_locale=ar') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0520' OR canonical_url='https://www.cervantesvirtual.com/obra/bioy-pasado-y-presente/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0521' OR canonical_url='https://dehesa.unex.es/bitstreams/76321a28-570c-4afd-8df5-b61ca59cfbfb/download') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0522' OR canonical_url='https://fundacionroabastos.org/novelas/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0523' OR canonical_url='https://fundacionroabastos.org/cuento/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0524' OR canonical_url='https://fundacionroabastos.org/antologias-de-augusto-roa-bastos/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0525' OR canonical_url='https://cvc.cervantes.es/actcult/roa/bibliografia/bibliografia01.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0526' OR canonical_url='https://www.cervantes.es/bibliotecas_documentacion_espanol/biografias/munich_augusto_roa_bastos_1.htm') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0527' OR canonical_url='https://www.cervantes.es/imagenes/File/biblioteca/bibliografias/roa_bastos_augusto_bibliografia_2022.pdf') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0528' OR canonical_url='https://portalguarani.com/537_augusto_roa_bastos/13770_contravida_1994__novela_de_augusto_roa_bastos.html') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0529' OR canonical_url='https://revistas.ucm.es/index.php/ALHI/article/download/79808/4564456559743') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0530' OR canonical_url='https://ve.scielo.org/scielo.php?pid=S0459-12832006000100003&script=sci_arttext') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0531' OR canonical_url='https://portal.amelica.org/ameli/journal/785/7855388007/html/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0532' OR canonical_url='https://www.scielo.org.mx/scielo.php?lng=es&nrm=iso&pid=S2448-60192021000100007&script=sci_arttext_plus&tlng=es') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0533' OR canonical_url='https://revistas.javeriana.edu.co/index.php/cualit/article/download/35723/27626/143092') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0534' OR canonical_url='https://americasinnombre.ua.es/article/view/23930') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0535' OR canonical_url='https://periodicos.ufmg.br/index.php/caligrama/article/download/29948/23546') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0536' OR canonical_url='https://pmb.parlamento.gub.uy/pmb/opac_css/index.php?id=22101&lvl=notice_display') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0537' OR canonical_url='https://revistatelar.ct.unt.edu.ar/index.php/revistatelar/article/view/563') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0538' OR canonical_url='https://books.google.com/books/about/El_ruise%C3%B1or_de_la_aurora_y_otros_poemas.html?id=3dNHGwAACAAJ') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0539' OR canonical_url='https://fundacionroabastos.org/ensayo/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0540' OR canonical_url='https://fundacionroabastos.org/poesia/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0541' OR canonical_url='https://search.worldcat.org/title/Metaforismos/oclc/36486024') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0542' OR canonical_url='https://books.google.com/books/about/Metaforismos.html?id=S-8dAQAAIAAJ') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0543' OR canonical_url='https://journals.iai.spk-berlin.de/index.php/iberoamericana/article/download/3003/2492/6866') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0544' OR canonical_url='https://www.elem.mx/autor/datos/106726') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0545' OR canonical_url='https://fundacionroabastos.org/ediciones/') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM sources WHERE source_id='SRC-0546' OR canonical_url='https://books.google.com/books/about/Las_culturas_condenadas.html?id=Ld8rAAAAYAAJ') THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0457' OR (entity_type='work' AND original_name='Uno y el Universo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0458' OR (entity_type='work' AND original_name='Hombres y engranajes')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0459' OR (entity_type='work' AND original_name='El escritor y sus fantasmas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0460' OR (entity_type='work' AND original_name='Apologías y rechazos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0461' OR (entity_type='work' AND original_name='Antes del fin')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0462' OR (entity_type='work' AND original_name='La resistencia')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0463' OR (entity_type='work' AND original_name='España en los diarios de mi vejez')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0464' OR (entity_type='work' AND original_name='El otro rostro del peronismo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0465' OR (entity_type='work' AND original_name='Tres aproximaciones a la literatura de nuestro tiempo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0466' OR (entity_type='work' AND original_name='Diario de la guerra del cerdo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0467' OR (entity_type='work' AND original_name='Dormir al sol')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0468' OR (entity_type='collection' AND original_name='La trama celeste')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0469' OR (entity_type='collection' AND original_name='Historia prodigiosa')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0470' OR (entity_type='collection' AND original_name='Guirnalda con amores')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0471' OR (entity_type='collection' AND original_name='El gran Serafín')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0472' OR (entity_type='work' AND original_name='La aventura de un fotógrafo en La Plata')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0473' OR (entity_type='work' AND original_name='Un campeón desparejo')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0474' OR (entity_type='work' AND original_name='De un mundo a otro')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0475' OR (entity_type='collection' AND original_name='El lado de la sombra')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0476' OR (entity_type='collection' AND original_name='El héroe de las mujeres')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0477' OR (entity_type='collection' AND original_name='Historias desaforadas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0478' OR (entity_type='collection' AND original_name='Una muñeca rusa')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0479' OR (entity_type='collection' AND original_name='Una magia modesta')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0480' OR (entity_type='collection' AND original_name='La otra aventura')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0481' OR (entity_type='work' AND original_name='Memorias')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0482' OR (entity_type='collection' AND original_name='De jardines ajenos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0483' OR (entity_type='work' AND original_name='De las cosas maravillosas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0484' OR (entity_type='collection' AND original_name='Descanso de caminantes, Diarios íntimos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0485' OR (entity_type='work' AND original_name='Borges')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0486' OR (entity_type='collection' AND original_name='En viaje (1967)')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0487' OR (entity_type='work' AND original_name='Memoria sobre la pampa y los gauchos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0488' OR (entity_type='work' AND original_name='Breve diccionario del argentino exquisito')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0489' OR (entity_type='work' AND original_name='La estatua casera')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0490' OR (entity_type='work' AND original_name='El perjurio de la nieve')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0491' OR (entity_type='work' AND original_name='Las vísperas de Fausto')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0492' OR (entity_type='work' AND original_name='Homenaje a Francisco Almeyra')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0493' OR (entity_type='work' AND original_name='Los que aman, odian')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0494' OR (entity_type='work' AND original_name='Antología de la literatura fantástica')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0495' OR (entity_type='collection' AND original_name='El trueno entre las hojas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0496' OR (entity_type='collection' AND original_name='El baldío')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0497' OR (entity_type='collection' AND original_name='Los pies sobre el agua')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0498' OR (entity_type='collection' AND original_name='Madera quemada')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0499' OR (entity_type='collection' AND original_name='Moriencia')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0500' OR (entity_type='collection' AND original_name='Cuerpo presente y otros cuentos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0501' OR (entity_type='work' AND original_name='El pollito de fuego')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0502' OR (entity_type='work' AND original_name='Vigilia del Almirante')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0503' OR (entity_type='work' AND original_name='Contravida')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0504' OR (entity_type='collection' AND original_name='El naranjal ardiente')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0505' OR (entity_type='collection' AND original_name='El ruiseñor de la aurora y otros poemas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0506' OR (entity_type='collection' AND original_name='La Inglaterra que yo vi')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0507' OR (entity_type='work' AND original_name='Madama Sui')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0508' OR (entity_type='collection' AND original_name='Metaforismos')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0509' OR (entity_type='work' AND original_name='Los Juegos 1: Carolina y Gaspar')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM entities WHERE entity_id='V1-ENT-0510' OR (entity_type='collection' AND original_name='Las culturas condenadas')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1377' OR (subject_id='V1-ENT-0457' AND fact_field='first_publication_year' AND value_text='1945')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1378' OR (subject_id='V1-ENT-0457' AND fact_field='genre_or_form' AND value_text='essay')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1379' OR (subject_id='V1-ENT-0457' AND fact_field='one_sentence_summary' AND value_text='文章集；据出版社简介，为萨瓦托首部著作，收入其1945年撰写的文章；国家图书馆称其批评科学表面上的中立性。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1380' OR (subject_id='V1-ENT-0457' AND fact_field='research_note' AND value_text='Noelia M. Senarega 的摘要将本书列入四篇被研究的萨瓦托论说，并把分析范围限定为其中涉及的道德问题。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1381' OR (subject_id='V1-ENT-0458' AND fact_field='first_publication_year' AND value_text='1951')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1382' OR (subject_id='V1-ENT-0458' AND fact_field='genre_or_form' AND value_text='essay')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1383' OR (subject_id='V1-ENT-0458' AND fact_field='one_sentence_summary' AND value_text='出版社简介将其定位为围绕现代文化危机、科学技术、人的工具化及人文价值而展开的散文作品。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1384' OR (subject_id='V1-ENT-0458' AND fact_field='research_note' AND value_text='Noelia M. Senarega 的摘要将本书列入四篇被研究的萨瓦托论说，并把分析范围限定为其中涉及的道德问题。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1385' OR (subject_id='V1-ENT-0459' AND fact_field='first_publication_year' AND value_text='1963')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1386' OR (subject_id='V1-ENT-0459' AND fact_field='genre_or_form' AND value_text='essay')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1387' OR (subject_id='V1-ENT-0459' AND fact_field='one_sentence_summary' AND value_text='据出版社转引作者序言，本书围绕“为什么、怎样、为了什么而写小说”这一持续困扰作者的问题展开。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1388' OR (subject_id='V1-ENT-0460' AND fact_field='first_publication_year' AND value_text='1979')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1389' OR (subject_id='V1-ENT-0460' AND fact_field='genre_or_form' AND value_text='essay collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1390' OR (subject_id='V1-ENT-0460' AND fact_field='one_sentence_summary' AND value_text='出版社简介称本书汇集七篇较长文章；作者书目将其列为1979年出版的现代性与文学论说类作品。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1391' OR (subject_id='V1-ENT-0461' AND fact_field='first_publication_year' AND value_text='1998')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1392' OR (subject_id='V1-ENT-0461' AND fact_field='genre_or_form' AND value_text='memoir')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1393' OR (subject_id='V1-ENT-0461' AND fact_field='one_sentence_summary' AND value_text='出版社将本书称为回忆录，叙述作者从科学职业经历转向文学与艺术的过程。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1394' OR (subject_id='V1-ENT-0462' AND fact_field='first_publication_year' AND value_text='2000')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1395' OR (subject_id='V1-ENT-0462' AND fact_field='genre_or_form' AND value_text='essay')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1396' OR (subject_id='V1-ENT-0462' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，本书由五封致读者的长信构成，讨论当代社会价值流失与技术社会中的非人化。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1397' OR (subject_id='V1-ENT-0463' AND fact_field='first_publication_year' AND value_text='2004')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1398' OR (subject_id='V1-ENT-0463' AND fact_field='genre_or_form' AND value_text='travel diary')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1399' OR (subject_id='V1-ENT-0463' AND fact_field='one_sentence_summary' AND value_text='出版社简介称其以作者此前两年西班牙旅行经历为主轴，是记录行旅与个人状态的私密札记。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1400' OR (subject_id='V1-ENT-0464' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1401' OR (subject_id='V1-ENT-0464' AND fact_field='genre_or_form' AND value_text='政治论说 / 致马里奥·阿马德奥的公开信')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1402' OR (subject_id='V1-ENT-0464' AND fact_field='one_sentence_summary' AND value_text='UNNE catalogs the book as an open letter to Mario Amadeo; CEDINPE’s contents list includes “Las bases de la conciliación nacional.” Senarega’s abstract lists the book among four essays in her study of moral issues.')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1403' OR (subject_id='V1-ENT-0464' AND fact_field='research_note' AND value_text='Noelia M. Senarega 的摘要将该书列为萨瓦托四篇论说之一，研究其涉及的道德问题及个人与社会群体间的对立倾向。此处仅归述摘要范围，不延伸为全书结论。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1404' OR (subject_id='V1-ENT-0465' AND fact_field='first_publication_year' AND value_text='1968')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1405' OR (subject_id='V1-ENT-0465' AND fact_field='genre_or_form' AND value_text='literary-critical essay collection')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1406' OR (subject_id='V1-ENT-0465' AND fact_field='one_sentence_summary' AND value_text='据馆藏编目题名、副题和主题词，本书由围绕Robbe-Grillet、Jorge Luis Borges与Jean-Paul Sartre的文学批评论说构成。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1407' OR (subject_id='V1-ENT-0466' AND fact_field='first_publication_year' AND value_text='1969')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1408' OR (subject_id='V1-ENT-0466' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1409' OR (subject_id='V1-ENT-0466' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，这部半奇幻小说写布宜诺斯艾利斯巴勒莫区年轻人与老年人之间突发的暴力冲突，以及主人公日常生活被袭击事件打乱。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1410' OR (subject_id='V1-ENT-0467' AND fact_field='first_publication_year' AND value_text='1973')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1411' OR (subject_id='V1-ENT-0467' AND fact_field='genre_or_form' AND value_text='书信体小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1412' OR (subject_id='V1-ENT-0467' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，钟表匠卢西奥写信讲述他与妻子戴安娜及训犬师斯坦德尔相识后的生活；作品后续将犬训练所与新式精神治疗带入叙事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1413' OR (subject_id='V1-ENT-0468' AND fact_field='first_publication_year' AND value_text='1948')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1414' OR (subject_id='V1-ENT-0468' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1415' OR (subject_id='V1-ENT-0468' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，这部1948年故事集以表象与现实、平行世界及空间和时间游戏为叙事线索。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1416' OR (subject_id='V1-ENT-0469' AND fact_field='first_publication_year' AND value_text='1956')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1417' OR (subject_id='V1-ENT-0469' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1418' OR (subject_id='V1-ENT-0469' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，这部1956年在墨西哥初版的故事集收录1949至1955年间写成的六篇故事；简介概括其爱情、吸引力与命运主题，并补述同名故事的情节。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1419' OR (subject_id='V1-ENT-0470' AND fact_field='first_publication_year' AND value_text='1959')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1420' OR (subject_id='V1-ENT-0470' AND fact_field='genre_or_form' AND value_text='杂集（含故事、格言与寓言）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1421' OR (subject_id='V1-ENT-0470' AND fact_field='one_sentence_summary' AND value_text='据出版社介绍，作者将本书称作“杂集”：全书十一部分交替安排短篇叙事与日常/哲理格言；不将其简化成单一小说或纯故事集。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1422' OR (subject_id='V1-ENT-0471' AND fact_field='first_publication_year' AND value_text='1967')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1423' OR (subject_id='V1-ENT-0471' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1424' OR (subject_id='V1-ENT-0471' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，此集含十篇故事，场景从蒙得维的亚到潘帕斯；简介列出超自然事件、日常转为奇幻及爱情等要素。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1425' OR (subject_id='V1-ENT-0472' AND fact_field='first_publication_year' AND value_text='1985')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1426' OR (subject_id='V1-ENT-0472' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1427' OR (subject_id='V1-ENT-0472' AND fact_field='one_sentence_summary' AND value_text='据出版社对后编选集所收该书的简介，摄影师尼古拉斯·阿尔曼萨受派到拉普拉塔拍摄城市图册，结识伦巴多家族；简介提及幽默和恐怖成分。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1428' OR (subject_id='V1-ENT-0473' AND fact_field='first_publication_year' AND value_text='1993')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1429' OR (subject_id='V1-ENT-0473' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1430' OR (subject_id='V1-ENT-0473' AND fact_field='one_sentence_summary' AND value_text='据出版社对后编选集所收该书的简介，出租车司机路易斯·安赫尔·莫拉莱斯因乘客给的饮剂而逐渐摆脱原有拘谨，并显露与拳击有关的身手。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1431' OR (subject_id='V1-ENT-0474' AND fact_field='first_publication_year' AND value_text='1998')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1432' OR (subject_id='V1-ENT-0474' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1433' OR (subject_id='V1-ENT-0474' AND fact_field='one_sentence_summary' AND value_text='据出版社对后编选集所收该书的简介，记者哈维尔·阿尔马格罗与女友玛格丽塔展开一次星际远征。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1434' OR (subject_id='V1-ENT-0475' AND fact_field='first_publication_year' AND value_text='1962')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1435' OR (subject_id='V1-ENT-0475' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1436' OR (subject_id='V1-ENT-0475' AND fact_field='one_sentence_summary' AND value_text='据出版社介绍，该短篇集收录十篇1962年发表的故事；其中同名故事与《Los afanes》从不同角度重访《La invención de Morel》的若干主题。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1437' OR (subject_id='V1-ENT-0476' AND fact_field='first_publication_year' AND value_text='1978')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1438' OR (subject_id='V1-ENT-0476' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1439' OR (subject_id='V1-ENT-0476' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，这部短篇集反复描写男性人物受命运支配、女性成为最后希望或警讯的戏剧情境。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1440' OR (subject_id='V1-ENT-0477' AND fact_field='first_publication_year' AND value_text='1986')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1441' OR (subject_id='V1-ENT-0477' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1442' OR (subject_id='V1-ENT-0477' AND fact_field='one_sentence_summary' AND value_text='据Teobaldi对集内《Máscaras venecianas》的分析，该篇写叙述者病后赴威尼斯、与妻子分离，并以克隆/相似者问题展开关于双重身份的幻想叙事；此说明仅限该单篇。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1443' OR (subject_id='V1-ENT-0478' AND fact_field='first_publication_year' AND value_text='1991')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1444' OR (subject_id='V1-ENT-0478' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1445' OR (subject_id='V1-ENT-0478' AND fact_field='one_sentence_summary' AND value_text='据Tusquets出版社对该集的简介，集中的日常小事逐渐带入难以捉摸的陌生或异化感；简介以《Un encuentro en Rauch》举例。此为整集的出版社概述，不据此推定同名篇的目录归属或具体情节。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1446' OR (subject_id='V1-ENT-0479' AND fact_field='first_publication_year' AND value_text='1997')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1447' OR (subject_id='V1-ENT-0479' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1448' OR (subject_id='V1-ENT-0479' AND fact_field='one_sentence_summary' AND value_text='据Gambetta Chuk对集内《El último piso》的解读，故事围绕似有似无的第九层、主人公“Bioy”与Margarita的相遇，以及现实/梦幻边界展开；此说明只指该单篇，不代表全书。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1449' OR (subject_id='V1-ENT-0480' AND fact_field='first_publication_year' AND value_text='1968')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1450' OR (subject_id='V1-ENT-0480' AND fact_field='genre_or_form' AND value_text='essay collection (prologues and articles)')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1451' OR (subject_id='V1-ENT-0480' AND fact_field='one_sentence_summary' AND value_text='出版社在后来的非虚构合编本中称1968年原作是一组序言与文章，并举出关于《La Celestina》原创性的分析和作者与Borges友谊的短文；释义限于出版社列出的例项。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1452' OR (subject_id='V1-ENT-0481' AND fact_field='first_publication_year' AND value_text='1994')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1453' OR (subject_id='V1-ENT-0481' AND fact_field='genre_or_form' AND value_text='autobiographical memoir')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1454' OR (subject_id='V1-ENT-0481' AND fact_field='one_sentence_summary' AND value_text='据Tusquets出版社简介，作品以作者从童年到成年的人生经历为线索，涉及Borges、Silvina Ocampo、家人、书籍与城市，并反思生活如何经书写转化为文学；属于作者回忆录，不把参与编辑/编排者列为共同作者。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1455' OR (subject_id='V1-ENT-0482' AND fact_field='first_publication_year' AND value_text='1997')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1456' OR (subject_id='V1-ENT-0482' AND fact_field='genre_or_form' AND value_text='reader’s anthology / miscellany of quotations and poems')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1457' OR (subject_id='V1-ENT-0482' AND fact_field='one_sentence_summary' AND value_text='据Mariano García对该书的直接讨论，Bioy称其为“libro abierto”，汇集其多年抄录的短诗与散文片段，是带有作者编选痕迹的阅读者选集；以编选身份描述，不把被引作者列为合著者。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1458' OR (subject_id='V1-ENT-0483' AND fact_field='first_publication_year' AND value_text='1999')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1459' OR (subject_id='V1-ENT-0483' AND fact_field='genre_or_form' AND value_text='nonfiction essays / reflections')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1460' OR (subject_id='V1-ENT-0483' AND fact_field='one_sentence_summary' AND value_text='出版社在非虚构合编本中把1999年原作描述为旨在帮助读者认识自身的反思性作品；本包不把宣传性概括扩展成更具体的主题断言。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1461' OR (subject_id='V1-ENT-0484' AND fact_field='first_publication_year' AND value_text='2001')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1462' OR (subject_id='V1-ENT-0484' AND fact_field='genre_or_form' AND value_text='posthumous selection of intimate diaries and notebooks, edited by Daniel Martino')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1463' OR (subject_id='V1-ENT-0484' AND fact_field='one_sentence_summary' AND value_text='据Daniel Martino的同期后记，Bioy本人决定将这些日记/笔记本统称为Descanso de caminantes；选本中的反思、逸事、谈话、梦和故事构想，构成对自身行为与日常生活的回顾。此处将Martino记为编者而非合著者。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1464' OR (subject_id='V1-ENT-0485' AND fact_field='first_publication_year' AND value_text='2006')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1465' OR (subject_id='V1-ENT-0485' AND fact_field='genre_or_form' AND value_text='posthumous selection from Bioy’s diary, edited by Daniel Martino')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1466' OR (subject_id='V1-ENT-0485' AND fact_field='one_sentence_summary' AND value_text='据Manuela Barral对该书的研究，Borges是从Bioy私人文本中筛选与Borges相关的日记内容、以年份分节的遗作；作品记录两人对话，同时呈现Bioy作为记录者的视角。Borges是被记录者，不据书名列为共同作者。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1467' OR (subject_id='V1-ENT-0486' AND fact_field='first_publication_year' AND value_text='1996')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1468' OR (subject_id='V1-ENT-0486' AND fact_field='genre_or_form' AND value_text='letters / travel writing drawn from letters written in 1967')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1469' OR (subject_id='V1-ENT-0486' AND fact_field='one_sentence_summary' AND value_text='据出版社对后来的Tusquets版次的介绍，作品记录Bioy 1967年独自欧洲旅行；2014年研究文献将其书目出版标为1996年并说明这一自传性文本属于写给妻子与女儿的信件。此处区分信件写作时间、首次结集年和当前1997版次。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1470' OR (subject_id='V1-ENT-0487' AND fact_field='first_publication_year' AND value_text='1970')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1471' OR (subject_id='V1-ENT-0487' AND fact_field='genre_or_form' AND value_text='nonfiction prose essay')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1472' OR (subject_id='V1-ENT-0487' AND fact_field='one_sentence_summary' AND value_text='据Carmen Balcells文学代理页面，作者从童年对“pampa”和“gaucho”一词的早期困惑写起，并反思这些词语与阿根廷国家/爱国想象的关系；只概述页面披露的文字内容。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1473' OR (subject_id='V1-ENT-0488' AND fact_field='first_publication_year' AND value_text='1971')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1474' OR (subject_id='V1-ENT-0488' AND fact_field='genre_or_form' AND value_text='lexicographic book / satirical dictionary')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1475' OR (subject_id='V1-ENT-0488' AND fact_field='one_sentence_summary' AND value_text='据Mariano García的直接研究，这部词典以虚构词条、人物和对语言使用的戏谑性处理构造其词典形式；1971年初版使用Javier Miranda笔名，1978年起的版本署Adolfo Bioy Casares。此处保留题名、作者笔名和后版身份差异。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1476' OR (subject_id='V1-ENT-0489' AND fact_field='first_publication_year' AND value_text='1936')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1477' OR (subject_id='V1-ENT-0489' AND fact_field='genre_or_form' AND value_text='杂集（混合散文、短篇叙事与短篇文论；不归为单一小说体裁）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1478' OR (subject_id='V1-ENT-0489' AND fact_field='one_sentence_summary' AND value_text='据García对原书的直接讨论，本书由实验性短篇叙事和反思性文字构成，包含《El hermano de la nonata》《Locus》《Utilidad y fin práctico》及《Sobre la técnica de los cuentos fantásticos》等不同文本；此说明概括其杂集构成，不把任何单篇另作合集身份。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1479' OR (subject_id='V1-ENT-0490' AND fact_field='first_publication_year' AND value_text='1944')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1480' OR (subject_id='V1-ENT-0490' AND fact_field='genre_or_form' AND value_text='cuento / 短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1481' OR (subject_id='V1-ENT-0490' AND fact_field='one_sentence_summary' AND value_text='据Amparo Reyes Velázquez对故事的梗概，记者Juan Luis Villafañe与诗人Carlos Oribe来到巴塔哥尼亚庄园La Adela，卷入鳏夫Luis Vermehren及其四名女儿封闭而重复的生活；José Miguel Rodríguez Zamora的研究指出，故事将时间停滞的奇异情节与侦探叙事并置。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1482' OR (subject_id='V1-ENT-0490' AND fact_field='bibliographic_note' AND value_text='初版年份存在1944/1945来源分歧：Google Books目录列Emecé 1944年单行本、64页；Reyes Velázquez与Rodríguez Zamora的直接研究均称 cuento 于1944年出版；Carlos Dámaso Martínez的CVC作者传记则记1945年。本提案依据单行本目录与两项直接研究采用1944，同时保留1945异说供审核；后收入故事集的版本不作为首发证据。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1483' OR (subject_id='V1-ENT-0491' AND fact_field='first_publication_year' AND value_text='1949')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1484' OR (subject_id='V1-ENT-0491' AND fact_field='genre_or_form' AND value_text='cuento / 短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1485' OR (subject_id='V1-ENT-0491' AND fact_field='one_sentence_summary' AND value_text='故事聚焦浮士德生命最后一夜：他与仆人瓦格纳及狗Señor等待午夜到来，在魔鬼索取灵魂前仍面对逃避或接受的抉择。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1486' OR (subject_id='V1-ENT-0492' AND fact_field='first_publication_year' AND value_text='1954')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1487' OR (subject_id='V1-ENT-0492' AND fact_field='genre_or_form' AND value_text='cuento / 短篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1488' OR (subject_id='V1-ENT-0492' AND fact_field='one_sentence_summary' AND value_text='单篇以阿根廷一位流亡蒙得维的亚的单一派诗人为中心：他返回布宜诺斯艾利斯后遭mazorqueros杀害。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1489' OR (subject_id='V1-ENT-0493' AND fact_field='first_publication_year' AND value_text='1946')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1490' OR (subject_id='V1-ENT-0493' AND fact_field='genre_or_form' AND value_text='novela policial / 侦探小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1491' OR (subject_id='V1-ENT-0493' AND fact_field='one_sentence_summary' AND value_text='孤立海滨旅馆遭风暴围困期间发生投毒命案与失踪，医生Humberto Huberman被卷入复仇与未竟爱情，旅客在数夜封闭环境中成为嫌疑人。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1492' OR (subject_id='V1-ENT-0493' AND fact_field='bibliographic_note' AND value_text='CVC书目与编年（S101、S102）均将这部合著侦探小说列于1946年；Emecé press sheet作者简介第0页L36–37则称1945年。该press sheet标注“Fecha de publicación: 01/07/2016”，这是所述当前书版日期；PDF没有单独的网页上线日期，且2016不是作品初版年。本提案以CVC书目/编年支持1946，保留出版社简介中的1945异说；不把2016版年作为首发年。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1493' OR (subject_id='V1-ENT-0494' AND fact_field='first_publication_year' AND value_text='1940')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1494' OR (subject_id='V1-ENT-0494' AND fact_field='genre_or_form' AND value_text='奇幻文学选集（共同编选、翻译）')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1495' OR (subject_id='V1-ENT-0494' AND fact_field='one_sentence_summary' AND value_text='该选集汇集H. G. Wells、Franz Kafka、Rudyard Kipling等作者作品，并收入Macedonio Fernández、Silvina Ocampo与Jorge Luis Borges的文本；Bioy另撰序。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1496' OR (subject_id='V1-ENT-0495' AND fact_field='first_publication_year' AND value_text='1953')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1497' OR (subject_id='V1-ENT-0495' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1498' OR (subject_id='V1-ENT-0495' AND fact_field='one_sentence_summary' AND value_text='据基金会对集首尾故事的说明，“Carpincheros”中的人物在同名末篇再次出现；基金会小说页称该人物为Gretchen，而短篇集页称Margaret，故此处保留两页各自的姓名，不合并为单一无异名的人物表述。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1499' OR (subject_id='V1-ENT-0495' AND fact_field='research_note' AND value_text='An Van Hecke将该书分析为具有内在统一性的短篇集/“integrated stories”，讨论神话、梦、社会政治观念及西语—瓜拉尼语双语。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1500' OR (subject_id='V1-ENT-0496' AND fact_field='first_publication_year' AND value_text='1966')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1501' OR (subject_id='V1-ENT-0496' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1502' OR (subject_id='V1-ENT-0496' AND fact_field='one_sentence_summary' AND value_text='据基金会作品页，该短篇集以人物的具体言行呈现巴拉圭社会生活，采用干涩、动荡而哀痛的现实主义叙述，不以解释性旁白替人物概括处境。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1503' OR (subject_id='V1-ENT-0497' AND fact_field='first_publication_year' AND value_text='1967')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1504' OR (subject_id='V1-ENT-0497' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1505' OR (subject_id='V1-ENT-0497' AND fact_field='one_sentence_summary' AND value_text='据基金会说明，该集纳入新写短篇并重收部分此前作品；它与《木材燃烧》等集在单篇选入及改写上有交叉，故书集和单篇作品须分层记录。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1506' OR (subject_id='V1-ENT-0498' AND fact_field='first_publication_year' AND value_text='1967')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1507' OR (subject_id='V1-ENT-0498' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1508' OR (subject_id='V1-ENT-0498' AND fact_field='one_sentence_summary' AND value_text='据基金会版本说明，“Madera quemada”既是1967年短篇集名，也是一篇在《人子》首版后被独立编入短篇集、并于1980年代重写版重新收入小说的文本；本对象指书集，不等同其中单篇或小说章节。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1509' OR (subject_id='V1-ENT-0499' AND fact_field='first_publication_year' AND value_text='1969')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1510' OR (subject_id='V1-ENT-0499' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1511' OR (subject_id='V1-ENT-0499' AND fact_field='one_sentence_summary' AND value_text='据基金会说明，该书汇集两组不同写作时期的短篇：一组写于1967年并属于仍在发展的故事循环，另一组写于1955—1960年，收入时经作者选择、修改或重写。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1512' OR (subject_id='V1-ENT-0500' AND fact_field='first_publication_year' AND value_text='1971')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1513' OR (subject_id='V1-ENT-0500' AND fact_field='genre_or_form' AND value_text='短篇小说集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1514' OR (subject_id='V1-ENT-0500' AND fact_field='one_sentence_summary' AND value_text='乌拉圭立法图书馆目录将此对象著录为CELA、c1971的印刷合集，并列出九篇：〈Nonato〉、〈Cuando un pájaro entierra sus plumas〉、〈Función〉、〈Moriencia〉、〈Bajo el puente〉、〈Macario〉、〈Borrador de un informe〉、〈Hogar〉与〈La excavación〉。基金会另列1972年《Cuerpo presente y otros textos》；可见资料确认题名和年代各异，但未解决两者是否为选集、重版或相关版本关系，因此不把1972年内容移用于此1971年对象。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1515' OR (subject_id='V1-ENT-0500' AND fact_field='bibliographic_note' AND value_text='乌拉圭立法图书馆记录为 [Buenos Aires] : CELA, c1971；丛书 Biblioteca Básica Universal 137；127页。基金会另列 Cuerpo presente y otros textos (1972)，并称后者含两段 Hijo de hombre；两条目录是不同题名/年代记录，现有来源未证实其版本关系。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1516' OR (subject_id='V1-ENT-0501' AND fact_field='first_publication_year' AND value_text='1974')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1517' OR (subject_id='V1-ENT-0501' AND fact_field='genre_or_form' AND value_text='儿童故事')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1518' OR (subject_id='V1-ENT-0501' AND fact_field='one_sentence_summary' AND value_text='基金会所载故事中，成人向孩子讲述小鸡Pipiolín变为火焰小鸡的经历；它点燃鸡舍，之后投入溪流与蛇搏斗，长成彩羽公鸡。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1519' OR (subject_id='V1-ENT-0502' AND fact_field='first_publication_year' AND value_text='1992')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1520' OR (subject_id='V1-ENT-0502' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1521' OR (subject_id='V1-ENT-0502' AND fact_field='one_sentence_summary' AND value_text='作者将本书描述为“混合”的历史虚构：以哥伦布为对象，在两个相矛盾的历史/文化世界间，想象海军上将失落的名字、记忆及其历史形象。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1522' OR (subject_id='V1-ENT-0503' AND fact_field='first_publication_year' AND value_text='1994')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1523' OR (subject_id='V1-ENT-0503' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1524' OR (subject_id='V1-ENT-0503' AND fact_field='one_sentence_summary' AND value_text='原版副文本介绍：小说第一人称叙述者是越狱与监狱屠杀的唯一幸存者，该事件与短篇“La excavación”相连；基金会另指出Nonato/教师Cristaldo成为小说叙事中心，并有先前小说人物重现。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1525' OR (subject_id='V1-ENT-0504' AND fact_field='first_publication_year' AND value_text='1960')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1526' OR (subject_id='V1-ENT-0504' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1527' OR (subject_id='V1-ENT-0504' AND fact_field='one_sentence_summary' AND value_text='基金会称《El naranjal ardiente》为作者第二部诗集：1960年出版的是较早未刊诗稿的选本；基金会另称1983年出版近乎完整的第二版。其Antologías页将早期与新作、以及《Silenciario》收入“Poesías Reunidas”(1998)的当前卷，故不把这些内容归到1983版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1528' OR (subject_id='V1-ENT-0504' AND fact_field='bibliographic_note' AND value_text='基金会年表记载作者1947年流亡并在布宜诺斯艾利斯生活，另称1960年《El naranjal ardiente》选自此前未刊诗集；可限定为1947年流亡后、1960年出版前形成，现有来源不支持精确到1947年写成。1983年近完整第二版与1998年合集须分开记录。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1529' OR (subject_id='V1-ENT-0505' AND fact_field='first_publication_year' AND value_text='1942')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1530' OR (subject_id='V1-ENT-0505' AND fact_field='genre_or_form' AND value_text='诗集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1531' OR (subject_id='V1-ENT-0505' AND fact_field='one_sentence_summary' AND value_text='目录预览显示该诗集至少收录〈Pórtico〉、〈¿Quién?〉和〈En la callada noche〉，另有15个未展示的章节；基金会对1942年诗作的评论称其风格尚未统一，并举〈Voz menor para el oratorio de Romain Rolland〉为兼具史诗—抒情特征的作品。此处仅描述可见篇目及机构评论，不概括未查看的全书。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1532' OR (subject_id='V1-ENT-0505' AND fact_field='bibliographic_note' AND value_text='CVC年表另记1952年在布宜诺斯艾利斯出版《El ruiseñor y la aurora》的“完整版本”；与1942年《El ruiseñor de la aurora y otros poemas》分层记录，现有来源未确定1952版的逐篇增删。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1533' OR (subject_id='V1-ENT-0506' AND fact_field='first_publication_year' AND value_text='1946')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1534' OR (subject_id='V1-ENT-0506' AND fact_field='genre_or_form' AND value_text='新闻文章结集 / 旅行报道小册子')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1535' OR (subject_id='V1-ENT-0506' AND fact_field='one_sentence_summary' AND value_text='据基金会与《墨西哥文学百科全书》作者条目，本书以作者首次欧洲之行为背景，结集其新闻文章、旅行观察及对路易斯·塞尔努达、安德烈·马尔罗、夏尔·戴高乐等人的访谈；FLM称其由《El País》以小册子形式出版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1536' OR (subject_id='V1-ENT-0507' AND fact_field='first_publication_year' AND value_text='1995')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1537' OR (subject_id='V1-ENT-0507' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1538' OR (subject_id='V1-ENT-0507' AND fact_field='one_sentence_summary' AND value_text='Laura Welsch分析小说通过前言中的虚构作者A.R.B.及男性叙述者重构Sui的生命，并将其读作男性凝视投射的对象；论文还讨论小说中日本/东西方意象与被重新想象的巴拉圭历史之间的寓言联系。该概括仅归属于Welsch的阅读。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1539' OR (subject_id='V1-ENT-0507' AND fact_field='bibliographic_note' AND value_text='Laura Welsch将《Madama Sui》标为1995年出版，并说明其研究引用的是1996年Seix Barral第二版；Instituto Cervantes书目列1996 Alfaguara版，基金会页面列1995，故把1995作为初版年、1996作为后续版本年，不再混作首发年份冲突。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1540' OR (subject_id='V1-ENT-0507' AND fact_field='research_note' AND value_text='Laura Welsch在Iberoamericana XXIII, 82 (2023), pp.217–235直接分析《Madama Sui》，主张小说中的Sui被男性叙述者重构为男性凝视的对象，并联系日本/东西方意象与被重塑的巴拉圭历史。此为该论文的明确阅读，不转写为作者意图或人物事实。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1541' OR (subject_id='V1-ENT-0508' AND fact_field='first_publication_year' AND value_text='1996')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1542' OR (subject_id='V1-ENT-0508' AND fact_field='genre_or_form' AND value_text='格言/警句类散文选集')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1543' OR (subject_id='V1-ENT-0508' AND fact_field='one_sentence_summary' AND value_text='WorldCat所载《拉丁美洲手册》摘要称本书汇集从已出版作品及未刊材料中选出的格言、箴言、谚语、悖论、寓言、警句、思绪和随笔，多数摘自《Yo el Supremo》；Google Books预览引作者说明，选材还来自未完成或毁弃的草稿、笔记本及书信。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1544' OR (subject_id='V1-ENT-0508' AND fact_field='bibliographic_note' AND value_text='基金会版次页记Editorial El Lector、1996、primera edición；WorldCat记录Buenos Aires: Seix Barral, 1996, 1a ed.; Google Books另显示Edhasa, 1996。不同出版者的同年记录关系尚未查明，保留为版本差异，不静默选定单一出版者。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1545' OR (subject_id='V1-ENT-0509' AND fact_field='first_publication_year' AND value_text='1979')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1546' OR (subject_id='V1-ENT-0509' AND fact_field='genre_or_form' AND value_text='儿童故事书')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1547' OR (subject_id='V1-ENT-0509' AND fact_field='one_sentence_summary' AND value_text='基金会公开片段中，Carolina与Gaspar反对教师Petra把昆虫钉在标本盒里，称这种“自然史”做法反自然；Gaspar说这是犯罪，Carolina追问死去的虫子如何还能教人。该片段说明书中儿童对僵化教学和捕捉昆虫的质疑，不据此概括全书。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1548' OR (subject_id='V1-ENT-0510' AND fact_field='first_publication_year' AND value_text='1978')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1549' OR (subject_id='V1-ENT-0510' AND fact_field='genre_or_form' AND value_text='编纂型文集／民族志与原住民口述、诗歌及仪式材料选编')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1550' OR (subject_id='V1-ENT-0510' AND fact_field='one_sentence_summary' AND value_text='Google Books可见目录显示该书含Roa Bastos所作导言及M. Chase-Sardi署名的巴拉圭族群概要；Flores将全书描述为汇集多种民族志、诗歌与仪式来源的编纂，并分析其编者如何组织这些材料。本描述限于已见目录和论文实际论述，不把所有收录文本归为Roa独著。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1551' OR (subject_id='V1-ENT-0510' AND fact_field='bibliographic_note' AND value_text='CVC Bibliografía称其为“compilación”，Siglo XXI, México, 1978；Google Books列Augusto Roa Bastos为Editor/Compiled by，并显示Siglo Veintiuno 1978。候选author_id仅对应编纂／编辑角色，非全书全部文本的唯一作者；页面未提供可建模的独立作者角色关系字段，故在书目说明中明确限界。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1552' OR (subject_id='V1-ENT-0510' AND fact_field='research_note' AND value_text='Enrique Flores的具名论文直接以《Las culturas condenadas》(1978)为研究对象，分析Roa Bastos作为编者如何汇集多源民族志、诗歌和仪式材料，以及编者／阐释者角色与作品复调结构的关系；论文摘要明确指出研究对象和编者问题，正文继续展开。此为对编纂行为与文集结构的学术解释，不转述为所有收录口述/田野材料由Roa原创。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1553' OR (subject_id='V1-ENT-0193' AND fact_field='genre_or_form' AND value_text='novel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1554' OR (subject_id='V1-ENT-0193' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，因欺骗而中断的爱情使主人公以刀终结痛苦，作品呈现萨瓦托对存在的形而上视野；Sincronía论文称这名主人公为画家胡安·巴勃罗·卡斯特尔。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1555' OR (subject_id='V1-ENT-0193' AND fact_field='research_note' AND value_text='J. M. Delgado del Águila (2023) abstracts a study of Castel’s psychosis as a way of interpreting reality; this is a limited attribution to the article abstract, not a summary of the whole novel.')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1556' OR (subject_id='V1-ENT-0194' AND fact_field='genre_or_form' AND value_text='novel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1557' OR (subject_id='V1-ENT-0194' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，小说以寻找自我的马丁为中心，呈现现代人的孤独与沟通困境。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1558' OR (subject_id='V1-ENT-0194' AND fact_field='research_note' AND value_text='Jhon Alexánder Monsalve Flórez’s abstract (Revista UIS Humanidades 41(2), issue 2013, pp.53–63; site posted 2015) analyzes the pessimistic outlook of Martín, Alejandra, Fernando and Bruno through Bobbio; Alejandro Hermosilla Sánchez’s abstract (Acta Literaria 33, 2006, pp.27–39) reads Martín’s journey as learning Argentina’s history.')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1559' OR (subject_id='V1-ENT-0195' AND fact_field='genre_or_form' AND value_text='novel')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1560' OR (subject_id='V1-ENT-0195' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，本书是三部曲的收束之作，以《盲人报告》的隐喻为发展线索，并将萨瓦托本人纳入小说人物。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1561' OR (subject_id='V1-ENT-0195' AND fact_field='research_note' AND value_text='Alejandro Hermosilla Sánchez (Enfoques 19(1–2), issue 2007; page date 2016) abstracts a mythic-symbolic reading linking the novel with 1970s Argentina; this reports the article’s stated lens, not a verified full-text conclusion.')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1562' OR (subject_id='V1-ENT-0201' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1563' OR (subject_id='V1-ENT-0201' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，小说以一名逃亡者写下的日记、岛上神秘建筑及他爱上的一位冷漠女子构成叙事前提。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1564' OR (subject_id='V1-ENT-0202' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1565' OR (subject_id='V1-ENT-0202' AND fact_field='one_sentence_summary' AND value_text='据出版社简介，小说借法国圭亚那监狱群岛的安排及新任军官内韦尔斯的见闻，展开一场由延迟揭示的谜题构成的逃逸叙事。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1566' OR (subject_id='V1-ENT-0203' AND fact_field='genre_or_form' AND value_text='小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1567' OR (subject_id='V1-ENT-0203' AND fact_field='one_sentence_summary' AND value_text='据作品研究，1954年小说以埃米利亚诺·高纳和一段逐渐被重演的梦境/往事为叙事中心；此处仅作篇章对作品的有限释义。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1568' OR (subject_id='V1-ENT-0204' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1569' OR (subject_id='V1-ENT-0204' AND fact_field='one_sentence_summary' AND value_text='据Zara对1980年代重写版的研究，小说以Gaspar Mora（木匠、制琴者、麻风病人）及其在Itapé雕刻木制基督像为叙事中心之一，故事把瓜拉尼口传与西语书写、巴拉圭战争史及神话框架交织起来；该概括对应研究所用重写版。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1570' OR (subject_id='V1-ENT-0204' AND fact_field='research_note' AND value_text='Juan Manuel Zara在《Gaspar Mora: fundamento mitológico y moral en Hijo de hombre》中以1983版（并参照1998年Sudamericana版）分析Gaspar Mora与木雕基督、历史/神话结构及西语书写和瓜拉尼口传的张力；此释义仅代表该论文的版本和论点。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1571' OR (subject_id='V1-ENT-0205' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1572' OR (subject_id='V1-ENT-0205' AND fact_field='one_sentence_summary' AND value_text='Aguilera Navarrete区分编纂者叙事层与情节层：虚构的Compilador救出文书后开始编写最高统帅传记，统帅随后质疑这项工作；围绕贴在大教堂门上的告示及作者身份展开的情节，则以最高统帅和秘书Policarpo Patiño为主要对话主角。论文据此讨论口述、书写与权力。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1573' OR (subject_id='V1-ENT-0205' AND fact_field='research_note' AND value_text='Aguilera Navarrete从瓜拉尼口述与西班牙语书写的权力冲突解读该小说；Lupi将其书写/媒介形式与国家、技术和统治权力并置，但明确不主张控制论影响了小说或控制论是小说主题；Martinez则聚焦手迹、主权及文件/虚构。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1574' OR (subject_id='V1-ENT-0206' AND fact_field='genre_or_form' AND value_text='长篇小说')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1575' OR (subject_id='V1-ENT-0206' AND fact_field='one_sentence_summary' AND value_text='小说围绕流亡者Félix Moral返回受独裁统治的巴拉圭并谋划刺杀统治者展开；计划失败后他遭受酷刑，最后由Jimena讲述他的命运和人民起义推翻独裁者。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM facts WHERE fact_id='V1-FCT-1576' OR (subject_id='V1-ENT-0206' AND fact_field='research_note' AND value_text='Ravetti将Félix Moral的自我牺牲计划、受刑和独裁者被人民起义推翻的结局放在牺牲、道德/法律、暴力和权力关系中分析。')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0426' OR (subject_id='V1-ENT-0186' AND relation_type='CREATED' AND object_id='V1-ENT-0457')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0427' OR (subject_id='V1-ENT-0186' AND relation_type='CREATED' AND object_id='V1-ENT-0458')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0428' OR (subject_id='V1-ENT-0186' AND relation_type='CREATED' AND object_id='V1-ENT-0459')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0429' OR (subject_id='V1-ENT-0186' AND relation_type='CREATED' AND object_id='V1-ENT-0460')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0430' OR (subject_id='V1-ENT-0186' AND relation_type='CREATED' AND object_id='V1-ENT-0461')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0431' OR (subject_id='V1-ENT-0186' AND relation_type='CREATED' AND object_id='V1-ENT-0462')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0432' OR (subject_id='V1-ENT-0186' AND relation_type='CREATED' AND object_id='V1-ENT-0463')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0433' OR (subject_id='V1-ENT-0186' AND relation_type='CREATED' AND object_id='V1-ENT-0464')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0434' OR (subject_id='V1-ENT-0186' AND relation_type='CREATED' AND object_id='V1-ENT-0465')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0435' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0466')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0436' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0467')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0437' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0468')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0438' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0469')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0439' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0470')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0440' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0471')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0441' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0472')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0442' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0473')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0443' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0474')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0444' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0475')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0445' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0476')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0446' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0477')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0447' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0478')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0448' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0479')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0449' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0480')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0450' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0481')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0451' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0482')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0452' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0483')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0453' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0484')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0454' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0485')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0455' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0486')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0456' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0487')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0457' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0488')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0458' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0489')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0459' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0490')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0460' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0491')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0461' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0492')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0462' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0493')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0463' OR (subject_id='V1-ENT-0198' AND relation_type='CREATED' AND object_id='V1-ENT-0494')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0464' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0495')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0465' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0496')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0466' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0497')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0467' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0498')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0468' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0499')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0469' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0500')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0470' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0501')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0471' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0502')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0472' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0503')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0473' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0504')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0474' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0505')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0475' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0506')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0476' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0507')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0477' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0508')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0478' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0509')) THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN NOT EXISTS (SELECT 1 FROM relationships WHERE relationship_id='V1-REL-0479' OR (subject_id='V1-ENT-0199' AND relation_type='CREATED' AND object_id='V1-ENT-0510')) THEN 1 ELSE 0 END);

INSERT INTO sources (source_id,temporary_id,title,original_title,author_or_editor,translator,publisher,publication_year,isbn,format,page_count,language,source_level,processing_status,source_task,public_content_scope,local_asset_status,persistent_id,canonical_url) VALUES
('SRC-0459','WCD10-B07-S004','Uno y el universo','Uno y el universo','Seix Barral / PlanetadeLibros Argentina','','Seix Barral / PlanetadeLibros Argentina','','','publisher_work_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.planetadelibros.com.ar/libro-uno-y-el-universo/132674'),
('SRC-0460','WCD10-B07-S005','Hombres y engranajes','Hombres y engranajes','Seix Barral','','Seix Barral / PlanetadeLibros Argentina','','','publisher_press_release_pdf','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://proapi.planetadelibros.com.ar/descargas/sala-prensa-libro/sinopsis-y-biografia/132686/hombres-y-engranajes.pdf?_locale=ar'),
('SRC-0461','WCD10-B07-S006','El escritor y sus fantasmas','El escritor y sus fantasmas','Seix Barral / PlanetadeLibros','','Seix Barral / PlanetadeLibros','','','publisher_work_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.planetadelibros.com/libro-el-escritor-y-sus-fantasmas/13010'),
('SRC-0462','WCD10-B07-S007','Apologías y rechazos','Apologías y rechazos','Seix Barral / PlanetadeLibros Argentina','','Seix Barral / PlanetadeLibros Argentina','','','publisher_work_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.planetadelibros.com.ar/libro-apologias-y-rechazos/132667'),
('SRC-0463','WCD10-B07-S008','Antes del fin','Antes del fin','Seix Barral / PlanetadeLibros','','Seix Barral / PlanetadeLibros','','','publisher_work_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.planetadelibros.com/libro-antes-del-fin/12917'),
('SRC-0464','WCD10-B07-S009','La resistencia','La resistencia','Austral Editorial / PlanetadeLibros','','Austral Editorial / PlanetadeLibros','','','publisher_work_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.planetadelibros.com/libro-la-resistencia/65837'),
('SRC-0465','WCD10-B07-S010','España en los diarios de mi vejez','España en los diarios de mi vejez','Seix Barral / PlanetadeLibros','','Seix Barral / PlanetadeLibros','','','publisher_work_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.planetadelibros.com/libro-espana-en-los-diarios-de-mi-vejez/13366'),
('SRC-0466','WCD10-B07-S011','El túnel','El túnel','Austral Editorial / PlanetadeLibros','','Austral Editorial / PlanetadeLibros','','','publisher_work_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.planetadelibros.com/libro-el-tunel/49945'),
('SRC-0467','WCD10-B07-S012','Sobre héroes y tumbas','Sobre héroes y tumbas','Austral Editorial / PlanetadeLibros','','Austral Editorial / PlanetadeLibros','','','publisher_work_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.planetadelibros.com/libro-sobre-heroes-y-tumbas/49444'),
('SRC-0468','WCD10-B07-S013','Abaddón el exterminador','Abaddón el exterminador','Austral Editorial / PlanetadeLibros','','Austral Editorial / PlanetadeLibros','','','publisher_work_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.planetadelibros.com/libro-abaddon-el-exterminador/50558'),
('SRC-0469','WCD10-B07-S014','La psicosis como mecanismo involuntario de interpretación de la realidad en el protagonista de El túnel','La psicosis como mecanismo involuntario de interpretación de la realidad en el protagonista de El túnel','Jesús Miguel Delgado del Águila; Sincronía / Universidad de Guadalajara','','Universidad de Guadalajara / Sincronía','2023','','scholarly_journal_article','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://revistasincronia.cucsh.udg.mx/index.php/sincronia/article/view/257'),
('SRC-0470','WCD10-B07-S015','El decadentismo bobbiano en Sobre héroes y tumbas','El decadentismo bobbiano en Sobre héroes y tumbas','Jhon Alexánder Monsalve Flórez','','Universidad Industrial de Santander / Revista UIS Humanidades','2013','','scholarly_journal_article','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://revistas.uis.edu.co/index.php/revistahumanidades/article/download/4929/5047/22458'),
('SRC-0471','WCD10-B07-S016','El camino americano de Martín en Sobre héroes y tumbas','El camino americano de Martín en Sobre héroes y tumbas','Alejandro Hermosilla Sánchez; Acta Literaria / Universidad de Concepción','','Universidad de Concepción / Acta Literaria','2006','','scholarly_journal_article','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://revistas.udec.cl/acta_literaria/article/view/4863'),
('SRC-0472','WCD10-B07-S017','Abaddón el exterminador: El Apocalipsis de los desaparecidos','Abaddón el exterminador: El Apocalipsis de los desaparecidos','Alejandro Hermosilla Sánchez','','Universidad Adventista del Plata / Enfoques','2007','','scholarly_journal_article','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://publicaciones.uap.edu.ar/index.php/revistaenfoques/article/view/254/245'),
('SRC-0473','WCD10-B07-S019','Ernesto Sabato. Cronología de obras','Ernesto Sabato. Cronología de obras','Instituto Cervantes','','Instituto Cervantes','','','institutional_author_bibliography_web_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.cervantes.es/bibliotecas_documentacion_espanol/biografias/budapest_ernesto_sabato_1.htm'),
('SRC-0474','WCD10-B07-S020','Nociones psicoanalíticas acerca del debate moral en el ensayo de Ernesto Sábato','Nociones psicoanalíticas acerca del debate moral en el ensayo de Ernesto Sábato','Noelia M. Senarega','','Universidad Andrés Bello / Departamento de Humanidades','2015','','scholarly_journal_article','','es+en','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://revistaschilenas.uchile.cl/handle/2250/217663'),
('SRC-0475','WCD10-B07-S021','El otro rostro del peronismo : carta abierta a Mario Amadeo','El otro rostro del peronismo : carta abierta a Mario Amadeo','Red de Bibliotecas de la Universidad Nacional del Nordeste (UNNE)','','Red de Bibliotecas de la Universidad Nacional del Nordeste','','','university_library_catalog_record','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://redbiblio.unne.edu.ar/pergamo/documento.php?id=RESISTENCIA.44.93584&recno=93584&ui=44'),
('SRC-0476','WCD10-B07-S022','Tres aproximaciones a la literatura de nuestro tiempo : Robbe-Grillet, Borges, Sartre','Tres aproximaciones a la literatura de nuestro tiempo : Robbe-Grillet, Borges, Sartre','Universidad Nacional de Córdoba, Catálogo colectivo','','Universidad Nacional de Córdoba','','','university_library_catalog_record','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://catalogo.biblio.unc.edu.ar/index.php/Record/mayor.55747?sid=73076372'),
('SRC-0477','WCD10-B07-S023','Sabato, Ernesto. El otro rostro del peronismo.','Sabato, Ernesto. El otro rostro del peronismo.','CEDINPE / Universidad Nacional de San Martín','','Universidad Nacional de San Martín / CEDINPE','','','institutional_catalog_record','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://cedinpe.unsam.edu.ar/content/sabato-ernesto-el-otro-rostro-del-peronismo'),
('SRC-0478','WCD10-B07-S101','Bibliografía de Adolfo Bioy Casares','Bibliografía de Adolfo Bioy Casares','Carlos Dámaso Martínez','','Biblioteca Virtual Miguel de Cervantes','','','institutional_bibliography_web_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.cervantesvirtual.com/portales/adolfo_bioy_casares/su_obra_bibliografia/'),
('SRC-0479','WCD10-B07-S105','Diario de la guerra del cerdo','Diario de la guerra del cerdo','Adolfo Bioy Casares','','Penguin Random House Grupo Editorial / Penguin Libros','','','publisher_book_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.penguinlibros.com/es/libros-clasicos/311047-libro-diario-de-la-guerra-del-cerdo-9788466360296'),
('SRC-0480','WCD10-B07-S106','Dormir al sol','Dormir al sol','Adolfo Bioy Casares','','Penguin Random House Grupo Editorial / Penguin Libros','','','publisher_book_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.penguinlibros.com/es/libros-clasicos/315794-libro-dormir-al-sol-9788466364287'),
('SRC-0481','WCD10-B07-S107','La trama celeste','La trama celeste','Adolfo Bioy Casares','','Penguin Random House Grupo Editorial / Penguin Libros Argentina','','','publisher_book_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.penguinlibros.com/ar/grandes-clasicos/313590-libro-la-trama-celeste-9789877386691'),
('SRC-0482','WCD10-B07-S108','Historia prodigiosa','Historia prodigiosa','Adolfo Bioy Casares','','Penguin Random House Grupo Editorial / Penguin Libros','','','publisher_book_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.penguinlibros.com/es/libros-clasicos/312947-ebook-historia-prodigiosa-9788420475875'),
('SRC-0483','WCD10-B07-S109','El gran Serafín','El gran Serafín','Adolfo Bioy Casares','','Penguin Random House Grupo Editorial / Penguin Libros','','','publisher_book_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.penguinlibros.com/es/libros-clasicos/312945-ebook-el-gran-serafin-9788420475851'),
('SRC-0484','WCD10-B07-S110','Guirnalda con amores','Guirnalda con amores','Adolfo Bioy Casares','','Penguin Random House Grupo Editorial / Penguin Libros','','','publisher_book_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.penguinlibros.com/es/libros-clasicos/312946-ebook-guirnalda-con-amores-9788420475868'),
('SRC-0485','WCD10-B07-S111','Últimas novelas','Últimas novelas','Adolfo Bioy Casares','','Penguin Random House Grupo Editorial / Penguin Libros México','','','publisher_anthology_edition_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.penguinlibros.com/mx/grandes-clasicos/363117-libro-ultimas-novelas-9788466373753'),
('SRC-0486','WCD10-B07-S112','La invención de Morel (edición definitiva)','La invención de Morel (edición definitiva)','Adolfo Bioy Casares','','Penguin Random House Grupo Editorial / Penguin Libros','','','publisher_book_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.penguinlibros.com/es/literatura-contemporanea/310496-libro-la-invencion-de-morel-edicion-definitiva-9788420462905'),
('SRC-0487','WCD10-B07-S113','La invención de Morel: anotaciones sobre el territorio y la obsolescencia','La invención de Morel: anotaciones sobre el territorio y la obsolescencia','Camilo Lozano-Rivera','','Acta Literaria','2017','','peer_reviewed_journal_article','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.scielo.cl/scielo.php?pid=S0717-68482017000100143&script=sci_arttext'),
('SRC-0488','WCD10-B07-S114','Las islas, espacios heterotópicos y de conspiración en Bioy Casares','Las islas, espacios heterotópicos y de conspiración en Bioy Casares','Carlos Dámaso Martínez','','Orillas. Rivista d’ispanistica','2014','','peer_reviewed_journal_article','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.orillas.net/orillas/index.php/orillas/article/view/349'),
('SRC-0489','WCD10-B07-S115','Utopía y ficción en la narrativa temprana de Adolfo Bioy Casares','Utopía y ficción en la narrativa temprana de Adolfo Bioy Casares','Kristov D. Cerda Neira','','Alpha','2005','','peer_reviewed_journal_article','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.scielo.cl/scielo.php?pid=S0718-22012005000100003&script=sci_arttext'),
('SRC-0490','WCD10-B07-S116','La barbarie entre la minucia y la alegoría: Diario de la guerra del cerdo, de Adolfo Bioy Casares','La barbarie entre la minucia y la alegoría: Diario de la guerra del cerdo, de Adolfo Bioy Casares','Elisa Calabrese','','Cuadernos de Literatura','2016','','peer_reviewed_journal_article','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://revistas.javeriana.edu.co/index.php/cualit/article/view/17278'),
('SRC-0491','WCD10-B07-S117','La dramaturgia del poder en Diario de la guerra del cerdo','La dramaturgia del poder en Diario de la guerra del cerdo','Amparo Reyes Velázquez','','Revista Argos','2022','','peer_reviewed_journal_article','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://revistaargos.cucsh.udg.mx/index.php/argos/article/view/130'),
('SRC-0492','WCD10-B07-S118','Ciencia, animalidad y domesticación en Dormir al sol, de Adolfo Bioy Casares','Ciencia, animalidad y domesticación en Dormir al sol, de Adolfo Bioy Casares','Mariano Vilar','','Gramma','2014','','conference_proceedings_article','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://p3.usal.edu.ar/index.php/gramma/article/view/2030'),
('SRC-0493','WCD10-B07-S119','Bioy Casares: neofantástico y deconstrucción','Bioy Casares: neofantástico y deconstrucción','Emanuele Leonardi','','Annali di Ca’ Foscari. Serie occidentale','2016','','peer_reviewed_journal_article_pdf','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://edizionicafoscari.unive.it/media/pdf/article/annali-di-ca-foscari-serie-occidentale/2016/50/art-10.14277-2499-1562-AnnOc-50-16-21.pdf'),
('SRC-0494','WCD10-B07-S120','Un conflicto trágico entre dos lealtades: «El sueño de los héroes»','Un conflicto trágico entre dos lealtades: «El sueño de los héroes»','Javier de Navascués','','Biblioteca Virtual Miguel de Cervantes; originally in El esperpento controlado: la narrativa de Adolfo Bioy Casares (EUNSA, 1995)','','','scholarly_book_chapter_digital_reproduction','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.cervantesvirtual.com/obra-visor/un-conflicto-tragico-entre-dos-lealtades--el-sueno-de-los-heroes/html/9d1c4842-61d8-4dd5-a322-23d45f82d381_4.html'),
('SRC-0495','WCD10-B07-S121','«El sueño de los héroes»: una novela de transición','«El sueño de los héroes»: una novela de transición','Paquita Suárez Coalla','','Biblioteca Virtual Miguel de Cervantes; originally in Lo fantástico en la obra de Adolfo Bioy Casares (Universidad Autónoma de México, 1994)','2013','','scholarly_book_chapter_catalogued_web_page','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.cervantesvirtual.com/obra/el-sueno-de-los-heroes--una-novela-de-transicion/'),
('SRC-0496','WCD10-B07-S122','Plan de evasión','Plan de evasión','Adolfo Bioy Casares','','Penguin Random House Grupo Editorial / Penguin Libros','','','publisher_book_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.penguinlibros.com/es/libros-clasicos/315793-libro-plan-de-evasion-9788466364270'),
('SRC-0497','WCD10-B07-S123','El lado de la sombra','El lado de la sombra','Adolfo Bioy Casares','','ALFAGUARA / Penguin Libros','','','publisher_ebook_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.penguinlibros.com/co/tematicas/312948-ebook-el-lado-de-la-sombra-9788420475882'),
('SRC-0498','WCD10-B07-S124','Todo Bioy — Biblioteca Adolfo Bioy Casares (catalogue page)','Todo Bioy — Biblioteca Adolfo Bioy Casares (catalogue page)','Penguin Random House Grupo Editorial','','Penguin Libros Argentina','','','publisher_catalogue_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.penguinlibros.com/ar/content/645-todo-bioy'),
('SRC-0499','WCD10-B07-S125','Hipótesis del tigre: sobre un relato de Bioy Casares','Hipótesis del tigre: sobre un relato de Bioy Casares','José Miguel Oviedo','','Lexis, Pontificia Universidad Católica del Perú','1981','','journal_article_pdf','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://revistas.pucp.edu.pe/index.php/lexis/article/download/4866/4865/'),
('SRC-0500','WCD10-B07-S127','Adolfo Bioy Casares o las máscaras de la verdad','Adolfo Bioy Casares o las máscaras de la verdad','Daniel Gustavo Teobaldi','','Actas de las VII Jornadas Nacionales de Literatura Italiana y I Jornadas Nacionales de Lengua Italiana, Universidad Nacional de Córdoba','1992','','conference_proceedings_article_digital_text','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.cervantesvirtual.com/obra-visor/adolfo-bioy-casares-o-las-mascaras-de-la-verdad/html/6245ede1-38ae-4404-a1c0-739815743c9f_3.html'),
('SRC-0501','WCD10-B07-S128','Poética de la casa bioycasareana','Poética de la casa bioycasareana','Aída Nadi Gambetta Chuk','','Escritos, no. 21','2000','','journal_article_digital_text','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.cervantesvirtual.com/obra-visor/poetica-de-la-casa-bioycasareana/html/4686751f-d812-481c-83c5-8a20b64253cb_3.html'),
('SRC-0502','WCD10-B07-S129','La otra aventura y otros escritos','La otra aventura y otros escritos','Adolfo Bioy Casares','','Penguin Random House','','','book product page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.penguinlibros.com/mx/literatura-contemporanea/460590-libro-la-otra-aventura-y-otros-escritos-9788466378192'),
('SRC-0503','WCD10-B07-S130','Memorias','Memorias','Adolfo Bioy Casares','','Tusquets Editores','','','publisher_press_pdf','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://proapi.planetadelibros.com/descargas/sala-prensa-libro/sinopsis-y-biografia/88293/memorias.pdf?_locale=es'),
('SRC-0504','WCD10-B07-S131','La voz ajena. Bioy Casares como lexicógrafo y antólogo','La voz ajena. Bioy Casares como lexicógrafo y antólogo','Mariano García','','','','','journal_article_pdf','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://bibliotecavirtual.unl.edu.ar/publicaciones/index.php/Texturas/en/article/download/4792/7303/12237'),
('SRC-0505','WCD10-B07-S132','Descanso de caminantes: diarios íntimos','Descanso de caminantes: diarios íntimos','Adolfo Bioy Casares','','Google Books','','','book_catalogue_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://books.google.com/books/about/Descanso_de_caminantes.html?id=OShfAAAAMAAJ'),
('SRC-0506','WCD10-B07-S133','Posfacio (Descanso de caminantes)','Posfacio (Descanso de caminantes)','Daniel Martino','','La Nación','2001','','newspaper_essay','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.lanacion.com.ar/cultura/posfacio-nid215346/'),
('SRC-0507','WCD10-B07-S134','Biografía de Bioy Casares. Biblioteca. Instituto Cervantes de El Cairo','Biografía de Bioy Casares. Biblioteca. Instituto Cervantes de El Cairo','Instituto Cervantes de El Cairo','','Instituto Cervantes','','','institutional_biography','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://elcairo.cervantes.es/es/biblioteca_espanol/biografia_adolfo_bioy_casares_espanol.htm'),
('SRC-0508','WCD10-B07-S135','En viaje','En viaje','Adolfo Bioy Casares','','Tusquets Editores','','','publisher_product_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.planetadelibros.com/libro-en-viaje/89404'),
('SRC-0509','WCD10-B07-S136','Figuraciones autobiográficas de Bioy Casares en el Borges','Figuraciones autobiográficas de Bioy Casares en el Borges','Manuela Barral','','','2014','','conference_proceedings_pdf','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://letras.filo.uba.ar/sites/letras.filo.uba.ar/files/documentos/BARRAL_ACTAS_2014.pdf'),
('SRC-0510','WCD10-B07-S137','Una muñeca rusa','Una muñeca rusa','Adolfo Bioy Casares','','Tusquets Editores','','','publisher_product_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.planetadelibros.com/libro-una-muneca-rusa/88223'),
('SRC-0511','WCD10-B07-S138','Memoria sobre la pampa y los gauchos','Memoria sobre la pampa y los gauchos','Adolfo Bioy Casares','','Agencia Literaria Carmen Balcells','','','literary_agency_work_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.agenciabalcells.com/autores/obra/adolfo-bioy-casares/memoria-sobre-la-pampa-y-los-gauchos/'),
('SRC-0512','WCD10-B07-S140','Biografía de Adolfo Bioy Casares','Biografía de Adolfo Bioy Casares','Carlos Dámaso Martínez','','Biblioteca Virtual Miguel de Cervantes','','','web_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.cervantesvirtual.com/portales/adolfo_bioy_casares/autor_apunte/'),
('SRC-0513','WCD10-B07-S141','El perjurio de la nieve','El perjurio de la nieve','Adolfo Bioy Casares','','Google Books','','','book_catalogue_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://books.google.com/books/about/El_perjurio_de_la_nieve.html?id=dB8zAAAAMAAJ'),
('SRC-0514','WCD10-B07-S142','La casa bioycasareana y el mito en “El perjurio de la nieve”','La casa bioycasareana y el mito en “El perjurio de la nieve”','Amparo Reyes Velázquez','','','','','academic_chapter_pdf','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://cvc.cervantes.es/literatura/aih/pdf/18/aih_18_2_02_05_44.pdf'),
('SRC-0515','WCD10-B07-S143','Poética de lo siniestro en el relato “El perjurio de la nieve” de Adolfo Bioy Casares','Poética de lo siniestro en el relato “El perjurio de la nieve” de Adolfo Bioy Casares','José Miguel Rodríguez Zamora','','Universidad de Costa Rica','2019','','academic_journal_article','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://portal.amelica.org/ameli/jatsRepo/125/125958006/html/index.html'),
('SRC-0516','WCD10-B07-S144','Adolfo Bioy Casares (1914-1999)','Adolfo Bioy Casares (1914-1999)','University of Notre Dame Rare Books and Special Collections','','','','','special_collection_catalogue_page','','en','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://rarebooks.library.nd.edu/collections/latin_american/south_american/southern_cone_lit/bioy_casares.html'),
('SRC-0517','WCD10-B07-S145','Metamorfosis del mito fáustico en la literatura alemana y en la literatura argentina en la segunda mitad del siglo XX','Metamorfosis del mito fáustico en la literatura alemana y en la literatura argentina en la segunda mitad del siglo XX','Gustavo Giovannini','','Universidad Nacional de Córdoba','2013','','academic_monograph_pdf','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://ffyh.unc.edu.ar/boletin/ediciones_anteriores/archivos/imagenes/e-books/TESIS-GIOVANNINI-GUSTAVO-E-BOOK.pdf'),
('SRC-0518','WCD10-B07-S146','Bioy, Borges y “Sur”: diálogos y duelos','Bioy, Borges y “Sur”: diálogos y duelos','María Teresa Gramuglio','','Biblioteca Virtual Miguel de Cervantes','2012','','academic_study_page','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.cervantesvirtual.com/obra/bioy-borges-y-sur/'),
('SRC-0519','WCD10-B07-S147','Los que aman, odian','Los que aman, odian','Silvina Ocampo; Adolfo Bioy Casares','','Emecé Editores','','','publisher_press_sheet_pdf','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://proapi.planetadelibros.com.ar/descargas/sala-prensa-libro/sinopsis-y-biografia/219757/los-que-aman-odian.pdf?_locale=ar'),
('SRC-0520','WCD10-B07-S148','Bioy, pasado y presente','Bioy, pasado y presente','Andrés Avellaneda','','Biblioteca Virtual Miguel de Cervantes','2013','','academic_study_page','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.cervantesvirtual.com/obra/bioy-pasado-y-presente/'),
('SRC-0521','WCD10-B07-S149','La novela hispanoamericana en el siglo XXI: la recepción de la obra de Silvina Ocampo en España','La novela hispanoamericana en el siglo XXI: la recepción de la obra de Silvina Ocampo en España','Gabriela Galán Carrasco','','','2024','','undergraduate_thesis_pdf','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://dehesa.unex.es/bitstreams/76321a28-570c-4afd-8df5-b61ca59cfbfb/download'),
('SRC-0522','WCD10-B07-S201','Novelas – Fundación Augusto Roa Bastos','Novelas – Fundación Augusto Roa Bastos','Fundación Augusto Roa Bastos','','Fundación Augusto Roa Bastos','','','institutional_work_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://fundacionroabastos.org/novelas/'),
('SRC-0523','WCD10-B07-S202','Cuento – Fundación Augusto Roa Bastos','Cuento – Fundación Augusto Roa Bastos','Fundación Augusto Roa Bastos','','Fundación Augusto Roa Bastos','','','institutional_work_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://fundacionroabastos.org/cuento/'),
('SRC-0524','WCD10-B07-S203','Antologías de Augusto Roa Bastos – Fundación Augusto Roa Bastos','Antologías de Augusto Roa Bastos – Fundación Augusto Roa Bastos','Fundación Augusto Roa Bastos','','Fundación Augusto Roa Bastos','','','institutional_anthology_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://fundacionroabastos.org/antologias-de-augusto-roa-bastos/'),
('SRC-0525','WCD10-B07-S204','CVC. Augusto Roa Bastos. Bibliografía','CVC. Augusto Roa Bastos. Bibliografía','Centro Virtual Cervantes / Instituto Cervantes','','Instituto Cervantes','','','institutional_bibliography_web_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://cvc.cervantes.es/actcult/roa/bibliografia/bibliografia01.htm'),
('SRC-0526','WCD10-B07-S205','Augusto Roa Bastos. Cronología de obras','Augusto Roa Bastos. Cronología de obras','Instituto Cervantes, Bibliotecas y Documentación','','Instituto Cervantes','','','institutional_author_chronology_web_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.cervantes.es/bibliotecas_documentacion_espanol/biografias/munich_augusto_roa_bastos_1.htm'),
('SRC-0527','WCD10-B07-S206','Bibliografía de Augusto Roa Bastos','Bibliografía de Augusto Roa Bastos','Departamento de Bibliotecas y Documentación, Instituto Cervantes','','Departamento de Bibliotecas y Documentación, Instituto Cervantes','','','institutional_bibliography_pdf','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.cervantes.es/imagenes/File/biblioteca/bibliografias/roa_bastos_augusto_bibliografia_2022.pdf'),
('SRC-0528','WCD10-B07-S207','CONTRAVIDA, 1994 – Novela de Augusto Roa Bastos','CONTRAVIDA, 1994 – Novela de Augusto Roa Bastos','Portal Guaraní (reproduces the 1994 Editorial El Lector edition paratext)','','Portal Guaraní','','','reproduced_1994_book_paratext_web_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://portalguarani.com/537_augusto_roa_bastos/13770_contravida_1994__novela_de_augusto_roa_bastos.html'),
('SRC-0529','WCD10-B07-S208','Mundos conflictivos en El trueno entre las hojas, una colección de cuentos integrados de Augusto Roa Bastos','Mundos conflictivos en El trueno entre las hojas, una colección de cuentos integrados de Augusto Roa Bastos','An Van Hecke','','Universidad Complutense de Madrid','2021','','peer_reviewed_journal_article_pdf','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://revistas.ucm.es/index.php/ALHI/article/download/79808/4564456559743'),
('SRC-0530','WCD10-B07-S209','Léxicos guaraníes en Hijo de hombre de Augusto Roa Bastos','Léxicos guaraníes en Hijo de hombre de Augusto Roa Bastos','Isabel Baca de Espínola; Ebelio Espínola Benítez','','Universidad Pedagógica Experimental Libertador (UPEL), Instituto Venezolano de Investigaciones Lingüísticas y Literarias “Andrés Bello” (IVILLAB)','2006','','journal_article_html','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://ve.scielo.org/scielo.php?pid=S0459-12832006000100003&script=sci_arttext'),
('SRC-0531','WCD10-B07-S210','Gaspar Mora: fundamento mitológico y moral en Hijo de hombre, de Augusto Roa Bastos','Gaspar Mora: fundamento mitológico y moral en Hijo de hombre, de Augusto Roa Bastos','Juan Manuel Zara','','Universidad Nacional del Nordeste','2025','','peer_reviewed_journal_article_html','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://portal.amelica.org/ameli/journal/785/7855388007/html/'),
('SRC-0532','WCD10-B07-S211','Entre la oralidad y la escritura: una poética del poder en Yo el Supremo, de Augusto Roa Bastos','Entre la oralidad y la escritura: una poética del poder en Yo el Supremo, de Augusto Roa Bastos','Flor Esther Aguilera Navarrete','','Universidad de Sonora','2021','','peer_reviewed_journal_article_html','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.scielo.org.mx/scielo.php?lng=es&nrm=iso&pid=S2448-60192021000100007&script=sci_arttext_plus&tlng=es'),
('SRC-0533','WCD10-B07-S212','Yo el Supremo, dictado y cibernética','Yo el Supremo, dictado y cibernética','Juan Pablo Lupi','','Pontificia Universidad Javeriana','2022','','peer_reviewed_journal_article_pdf','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://revistas.javeriana.edu.co/index.php/cualit/article/download/35723/27626/143092'),
('SRC-0534','WCD10-B07-S213','Bajo su mano. Escritura y soberanía en "Yo, el supremo"','Bajo su mano. Escritura y soberanía en "Yo, el supremo"','Alejandro Martinez','','Universidad de Alicante','2024','','peer_reviewed_journal_article_html','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://americasinnombre.ua.es/article/view/23930'),
('SRC-0535','WCD10-B07-S214','Escribir la pasión: El fiscal, de Augusto Roa Bastos','Escribir la pasión: El fiscal, de Augusto Roa Bastos','Graciela Ravetti','','Universidade Federal de Minas Gerais','2006','','peer_reviewed_journal_article_pdf','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://periodicos.ufmg.br/index.php/caligrama/article/download/29948/23546'),
('SRC-0536','WCD10-B07-S216','Cuerpo presente y otros cuentos / Augusto ROA BASTOS — Catálogo en línea','Cuerpo presente y otros cuentos / Augusto ROA BASTOS — Catálogo en línea','Biblioteca del Poder Legislativo (Uruguay)','','Biblioteca del Poder Legislativo (Uruguay)','','','library_catalogue_record','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://pmb.parlamento.gub.uy/pmb/opac_css/index.php?id=22101&lvl=notice_display'),
('SRC-0537','WCD10-B07-S218','Las “culturas condenadas”: el mitólogo como compilador','Las “culturas condenadas”: el mitólogo como compilador','Enrique Flores','','Universidad Nacional de Tucumán, Facultad de Filosofía y Letras / Instituto Interdisciplinario de Estudios Latinoamericanos','2021','','peer_reviewed_journal_article_pdf','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://revistatelar.ct.unt.edu.ar/index.php/revistatelar/article/view/563'),
('SRC-0538','WCD10-B07-S220','El ruiseñor de la aurora, y otros poemas — Google Books catalog record','El ruiseñor de la aurora, y otros poemas — Google Books catalog record','Augusto Roa Bastos','','Google Books / catalog record sourced from University of Iowa copy','','','library_catalog_record','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://books.google.com/books/about/El_ruise%C3%B1or_de_la_aurora_y_otros_poemas.html?id=3dNHGwAACAAJ'),
('SRC-0539','WCD10-B07-S221','Ensayos y Artículos – Fundación Augusto Roa Bastos','Ensayos y Artículos – Fundación Augusto Roa Bastos','Fundación Augusto Roa Bastos','','Fundación Augusto Roa Bastos','','','institutional_work_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://fundacionroabastos.org/ensayo/'),
('SRC-0540','WCD10-B07-S222','Poesía – Fundación Augusto Roa Bastos','Poesía – Fundación Augusto Roa Bastos','Fundación Augusto Roa Bastos','','Fundación Augusto Roa Bastos','','','institutional_work_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://fundacionroabastos.org/poesia/'),
('SRC-0541','WCD10-B07-S223','Metaforismos — WorldCat record','Metaforismos — WorldCat record','Augusto Roa Bastos; catalog record by OCLC WorldCat','','OCLC WorldCat','','','library_catalog_record','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://search.worldcat.org/title/Metaforismos/oclc/36486024'),
('SRC-0542','WCD10-B07-S224','Metaforismos — Google Books catalog record','Metaforismos — Google Books catalog record','Augusto Roa Bastos','','Google Books','','','library_catalog_record','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://books.google.com/books/about/Metaforismos.html?id=S-8dAQAAIAAJ'),
('SRC-0543','WCD10-B07-S225','La mujer como objeto de la mirada masculina en Madama Sui de Augusto Roa Bastos','La mujer como objeto de la mirada masculina en Madama Sui de Augusto Roa Bastos','Laura Welsch','','Ibero-Amerikanisches Institut, Stiftung Preußischer Kulturbesitz','2023','','peer_reviewed_journal_article_pdf','','es','A','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://journals.iai.spk-berlin.de/index.php/iberoamericana/article/download/3003/2492/6866'),
('SRC-0544','WCD10-B07-S226','Augusto Roa Bastos — Enciclopedia de la Literatura en México (FLM)','Augusto Roa Bastos — Enciclopedia de la Literatura en México (FLM)','Fundación para las Letras Mexicanas / Enciclopedia de la Literatura en México','','Fundación para las Letras Mexicanas / Enciclopedia de la Literatura en México','','','institutional_author_entry','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://www.elem.mx/autor/datos/106726'),
('SRC-0545','WCD10-B07-S227','Ediciones – Fundación Augusto Roa Bastos','Ediciones – Fundación Augusto Roa Bastos','Fundación Augusto Roa Bastos','','Fundación Augusto Roa Bastos','','','institutional_editions_web_page','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://fundacionroabastos.org/ediciones/'),
('SRC-0546','WCD10-B07-S228','Las culturas condenadas – Google Books','Las culturas condenadas – Google Books','Google Books catalog; source metadata attributes editor/compiler to Augusto Roa Bastos','','Google Books catalog / metadata describes Siglo Veintiuno','','','book_catalog_with_partial_contents_preview','','es','B','access_pass','WCD-10-B07','Research-only candidate; no Curation admission or public release.','remote_only','','https://books.google.com/books/about/Las_culturas_condenadas.html?id=Ld8rAAAAYAAJ');

INSERT INTO entities (entity_id,entity_type,name_zh,original_name,canonical_status,origin_count,origin_refs,normalization_basis,issue_codes) VALUES
('V1-ENT-0457','work','《一个与宇宙》','Uno y el Universo','candidate','1','WCD10-B07-W001','与基线作者/作品及所见书目交叉核对；为萨瓦托书目中有机构/出版社记录的独立书籍对象。只提议此作品本身，不将版本、合集、单篇文章或章节拆为新对象。; 工作中文显示名为可读性工作译名；原西班牙语题名作为身份锚点，不据此主张已出版的正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0458','work','《人和齿轮》','Hombres y engranajes','candidate','1','WCD10-B07-W002','与基线作者/作品及所见书目交叉核对；为萨瓦托书目中有机构/出版社记录的独立书籍对象。只提议此作品本身，不将版本、合集、单篇文章或章节拆为新对象。; 工作中文显示名为可读性工作译名；原西班牙语题名作为身份锚点，不据此主张已出版的正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0459','work','《作家与他的幽灵》','El escritor y sus fantasmas','candidate','1','WCD10-B07-W003','与基线作者/作品及所见书目交叉核对；为萨瓦托书目中有机构/出版社记录的独立书籍对象。只提议此作品本身，不将版本、合集、单篇文章或章节拆为新对象。; 工作中文显示名为可读性工作译名；原西班牙语题名作为身份锚点，不据此主张已出版的正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0460','work','《辩护与拒绝》','Apologías y rechazos','candidate','1','WCD10-B07-W004','与基线作者/作品及所见书目交叉核对；为萨瓦托书目中有机构/出版社记录的独立书籍对象。只提议此作品本身，不将版本、合集、单篇文章或章节拆为新对象。; 工作中文显示名为可读性工作译名；原西班牙语题名作为身份锚点，不据此主张已出版的正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0461','work','《终之前》','Antes del fin','candidate','1','WCD10-B07-W005','与基线作者/作品及所见书目交叉核对；为萨瓦托书目中有机构/出版社记录的独立书籍对象。只提议此作品本身，不将版本、合集、单篇文章或章节拆为新对象。; 工作中文显示名为可读性工作译名；原西班牙语题名作为身份锚点，不据此主张已出版的正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0462','work','《抵抗》','La resistencia','candidate','1','WCD10-B07-W006','与基线作者/作品及所见书目交叉核对；为萨瓦托书目中有机构/出版社记录的独立书籍对象。只提议此作品本身，不将版本、合集、单篇文章或章节拆为新对象。; 工作中文显示名为可读性工作译名；原西班牙语题名作为身份锚点，不据此主张已出版的正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0463','work','《我暮年日记中的西班牙》','España en los diarios de mi vejez','candidate','1','WCD10-B07-W007','与基线作者/作品及所见书目交叉核对；为萨瓦托书目中有机构/出版社记录的独立书籍对象。只提议此作品本身，不将版本、合集、单篇文章或章节拆为新对象。; 工作中文显示名为可读性工作译名；原西班牙语题名作为身份锚点，不据此主张已出版的正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0464','work','《庇隆主义的另一面》','El otro rostro del peronismo','candidate','1','WCD10-B07-W008','Instituto Cervantes chronology and UNNE library catalog identify an independent Sábato book/essay from 1956, with the UNNE record specifying a letter to Mario Amadeo; the bibliography scan and direct scholarly abstract establish its relevance as a substantial work.; 工作中文显示名为可读性工作译名；原西班牙语题名作为身份锚点，不据此主张已出版的正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0465','work','《关于我们时代文学的三种探讨》','Tres aproximaciones a la literatura de nuestro tiempo','candidate','1','WCD10-B07-W009','Institutional Cervantes chronology lists the 1968 essay; University of Córdoba catalog independently identifies the 1968 Spanish-language book by Sábato in the Letras de América series and indexes it as essays/literary criticism on Robbe-Grillet, Borges and Sartre.; 工作中文显示名为可读性工作译名；原西班牙语题名及副题Robbe-Grillet, Borges, Sartre作为身份锚点，不据此主张已出版的正式中文译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0466','work','《Diario de la guerra del cerdo》','Diario de la guerra del cerdo','candidate','1','WCD10-B07-W101','CVC作者书目与年代表均直接列出该题名/首发年，Master基线无同名Bioy作品；已查候选与原对象、合集/单篇版本边界。只有直接打开的对象来源提供的类型/释义进入事实。; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0467','work','《Dormir al sol》','Dormir al sol','candidate','1','WCD10-B07-W102','CVC作者书目与年代表均直接列出该题名/首发年，Master基线无同名Bioy作品；已查候选与原对象、合集/单篇版本边界。只有直接打开的对象来源提供的类型/释义进入事实。; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0468','collection','《La trama celeste》','La trama celeste','candidate','1','WCD10-B07-W103','CVC作者书目与年代表均直接列出该题名/首发年，Master基线无同名Bioy作品；已查候选与原对象、合集/单篇版本边界。只有直接打开的对象来源提供的类型/释义进入事实。; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0469','collection','《Historia prodigiosa》','Historia prodigiosa','candidate','1','WCD10-B07-W104','CVC作者书目与年代表均直接列出该题名/首发年，Master基线无同名Bioy作品；已查候选与原对象、合集/单篇版本边界。只有直接打开的对象来源提供的类型/释义进入事实。; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0470','collection','《Guirnalda con amores》','Guirnalda con amores','candidate','1','WCD10-B07-W105','CVC作者书目与年代表均直接列出该题名/首发年，Master基线无同名Bioy作品；已查候选与原对象、合集/单篇版本边界。只有直接打开的对象来源提供的类型/释义进入事实。; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0471','collection','《El gran Serafín》','El gran Serafín','candidate','1','WCD10-B07-W106','CVC作者书目与年代表均直接列出该题名/首发年，Master基线无同名Bioy作品；已查候选与原对象、合集/单篇版本边界。只有直接打开的对象来源提供的类型/释义进入事实。; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0472','work','《La aventura de un fotógrafo en La Plata》','La aventura de un fotógrafo en La Plata','candidate','1','WCD10-B07-W107','CVC作者书目与年代表均直接列出该题名/首发年，Master基线无同名Bioy作品；已查候选与原对象、合集/单篇版本边界。只有直接打开的对象来源提供的类型/释义进入事实。; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0473','work','《Un campeón desparejo》','Un campeón desparejo','candidate','1','WCD10-B07-W108','CVC作者书目与年代表均直接列出该题名/首发年，Master基线无同名Bioy作品；已查候选与原对象、合集/单篇版本边界。只有直接打开的对象来源提供的类型/释义进入事实。; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0474','work','《De un mundo a otro》','De un mundo a otro','candidate','1','WCD10-B07-W109','CVC作者书目与年代表均直接列出该题名/首发年，Master基线无同名Bioy作品；已查候选与原对象、合集/单篇版本边界。只有直接打开的对象来源提供的类型/释义进入事实。; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0475','collection','《El lado de la sombra》','El lado de la sombra','candidate','1','WCD10-B07-W110','CVC作者书目直接列出单独书名与首发年，官方出版页支持对象类型/有限释义；Master基线无同名Bioy作品。若来源为后期合集，仅按其明确列出的单独题名与年份引用，且保留原作与后编合集的边界。; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0476','collection','《El héroe de las mujeres》','El héroe de las mujeres','candidate','1','WCD10-B07-W111','CVC作者书目直接列出单独书名与首发年，官方出版页支持对象类型/有限释义；Master基线无同名Bioy作品。若来源为后期合集，仅按其明确列出的单独题名与年份引用，且保留原作与后编合集的边界。; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0477','collection','《Historias desaforadas》','Historias desaforadas','candidate','1','WCD10-B07-W112','CVC作者书目直接列出单独书名与首发年，官方出版页支持对象类型/有限释义；Master基线无同名Bioy作品。若来源为后期合集，仅按其明确列出的单独题名与年份引用，且保留原作与后编合集的边界。; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0478','collection','《Una muñeca rusa》','Una muñeca rusa','candidate','1','WCD10-B07-W113','CVC作者书目直接列出单独书名与首发年，官方出版页支持对象类型/有限释义；Master基线无同名Bioy作品。若来源为后期合集，仅按其明确列出的单独题名与年份引用，且保留原作与后编合集的边界。; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0479','collection','《Una magia modesta》','Una magia modesta','candidate','1','WCD10-B07-W114','CVC作者书目直接列出单独书名与首发年，官方出版页支持对象类型/有限释义；Master基线无同名Bioy作品。若来源为后期合集，仅按其明确列出的单独题名与年份引用，且保留原作与后编合集的边界。; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0480','collection','《La otra aventura》','La otra aventura','candidate','1','WCD10-B07-W115','CVC署名书目与实际打开的机构/出版社/直接研究来源确认独立书目身份及出版年；类型、摘要和后编者边界逐字段据相应来源限定。仅将Bioy作为原作/日记/信件的创作者或编选者；不将被引作者、Borges、Silvina Ocampo或Daniel Martino列作未经证实的共同作者。; 保留西班牙语原题名；中文显示为候选占位，不自行制造已出版译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0481','work','《Memorias》','Memorias','candidate','1','WCD10-B07-W116','CVC署名书目与实际打开的机构/出版社/直接研究来源确认独立书目身份及出版年；类型、摘要和后编者边界逐字段据相应来源限定。仅将Bioy作为原作/日记/信件的创作者或编选者；不将被引作者、Borges、Silvina Ocampo或Daniel Martino列作未经证实的共同作者。; 保留西班牙语原题名；中文显示为候选占位，不自行制造已出版译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0482','collection','《De jardines ajenos》','De jardines ajenos','candidate','1','WCD10-B07-W117','CVC署名书目与实际打开的机构/出版社/直接研究来源确认独立书目身份及出版年；类型、摘要和后编者边界逐字段据相应来源限定。仅将Bioy作为原作/日记/信件的创作者或编选者；不将被引作者、Borges、Silvina Ocampo或Daniel Martino列作未经证实的共同作者。; 保留西班牙语原题名；中文显示为候选占位，不自行制造已出版译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0483','work','《De las cosas maravillosas》','De las cosas maravillosas','candidate','1','WCD10-B07-W118','CVC署名书目与实际打开的机构/出版社/直接研究来源确认独立书目身份及出版年；类型、摘要和后编者边界逐字段据相应来源限定。仅将Bioy作为原作/日记/信件的创作者或编选者；不将被引作者、Borges、Silvina Ocampo或Daniel Martino列作未经证实的共同作者。; 保留西班牙语原题名；中文显示为候选占位，不自行制造已出版译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0484','collection','《Descanso de caminantes, Diarios íntimos》','Descanso de caminantes, Diarios íntimos','candidate','1','WCD10-B07-W119','CVC署名书目与实际打开的机构/出版社/直接研究来源确认独立书目身份及出版年；类型、摘要和后编者边界逐字段据相应来源限定。仅将Bioy作为原作/日记/信件的创作者或编选者；不将被引作者、Borges、Silvina Ocampo或Daniel Martino列作未经证实的共同作者。; 保留西班牙语原题名；中文显示为候选占位，不自行制造已出版译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0485','work','《Borges》','Borges','candidate','1','WCD10-B07-W120','CVC署名书目与实际打开的机构/出版社/直接研究来源确认独立书目身份及出版年；类型、摘要和后编者边界逐字段据相应来源限定。仅将Bioy作为原作/日记/信件的创作者或编选者；不将被引作者、Borges、Silvina Ocampo或Daniel Martino列作未经证实的共同作者。; 保留西班牙语原题名；中文显示为候选占位，不自行制造已出版译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0486','collection','《En viaje (1967)》','En viaje (1967)','candidate','1','WCD10-B07-W121','CVC署名书目与实际打开的机构/出版社/直接研究来源确认独立书目身份及出版年；类型、摘要和后编者边界逐字段据相应来源限定。仅将Bioy作为原作/日记/信件的创作者或编选者；不将被引作者、Borges、Silvina Ocampo或Daniel Martino列作未经证实的共同作者。; 保留西班牙语原题名；中文显示为候选占位，不自行制造已出版译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0487','work','《Memoria sobre la pampa y los gauchos》','Memoria sobre la pampa y los gauchos','candidate','1','WCD10-B07-W122','作者官方年表及直接机构/研究来源确认题名、出版年和对象边界；笔名只按来源所示记录，实际作者仍归属Bioy Casares。; 保留西班牙语原题名；中文显示为候选占位，不自行制造已出版译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0488','work','《Breve diccionario del argentino exquisito》','Breve diccionario del argentino exquisito','candidate','1','WCD10-B07-W123','作者官方年表及直接机构/研究来源确认题名、出版年和对象边界；笔名只按来源所示记录，实际作者仍归属Bioy Casares。; 保留西班牙语原题名；中文显示为候选占位，不自行制造已出版译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0489','work','《La estatua casera》','La estatua casera','candidate','1','WCD10-B07-W124','CVC chronology (S102) identifies La estatua casera as a Bioy book published in 1936; García’s direct study (S131, printed pp.81–82) analyzes the independent book and describes its mixed contents. It is absent from the frozen baseline and is not conflated with later collections or the individual pieces discussed within it.; 中文暂以原文题名作显示候选，避免未经核实的译名；原文题名是身份锚点。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0490','work','《El perjurio de la nieve》','El perjurio de la nieve','candidate','1','WCD10-B07-W125','Google Books lists the standalone Emecé book (1944, 64 pages), and two direct studies identify the cuento as a 1944 work. The CVC author biography by Carlos Dámaso Martínez (S140, L97) instead gives 1945. The first-year candidate uses only the 1944 catalogue and direct studies; the 1945 statement is preserved as an edition-year conflict for review. The separate book/story appearance is kept distinct from later anthology reuse.; 以原文题名保留书目身份；中文显示暂作直书题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0491','work','《Las vísperas de Fausto》','Las vísperas de Fausto','candidate','1','WCD10-B07-W126','Notre Dame馆藏记录该作品的1949年独立限量版；Giovannini直接研究明确其为cuento、以1949单行本初刊并于1956年收入《Historia prodigiosa》。候选实体是单篇故事，不是1956年合集。; 以原文题名保留书目身份；中文显示暂作直书题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0492','work','《Homenaje a Francisco Almeyra》','Homenaje a Francisco Almeyra','candidate','1','WCD10-B07-W127','Avellaneda的直接研究记录《Homenaje a Francisco Almeyra》于1954年刊于Sur，后收入《Historia prodigiosa》(1956)；Gramuglio提供有界情节说明。候选实体是单篇故事，不是1956年合集。; 以原文题名保留书目身份；中文显示暂作直书题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0493','work','《Los que aman, odian》','Los que aman, odian','candidate','1','WCD10-B07-W128','CVC bibliography and chronology list the novel in 1946; the Universidad de Extremadura undergraduate thesis also identifies the first Emecé edition as Buenos Aires, 1946. Emecé confirms Bioy and Silvina Ocampo as coauthors and provides the plot synopsis, but its press-sheet biographical paragraph separately says 1945. W128-F04 preserves the discrepancy; the press-sheet 2016 date is a current edition date, not the novel’s first-publication year.; 以原文题名保留书目身份；中文显示暂作直书题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0494','work','《Antología de la literatura fantástica》','Antología de la literatura fantástica','candidate','1','WCD10-B07-W129','CVC页面署名Carlos Dámaso Martínez，直接记1940年由Bioy、Borges与Silvina Ocampo共同编译选、Bioy作序，并列部分收录作者/文本；1965为扩充版，作为同一选集对象的后续版本，不重复建物件。; 以原文题名保留书目身份；中文显示暂作直书题名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0495','collection','《树叶间的雷声》','El trueno entre las hojas','candidate','1','WCD10-B07-W201','基金会称其为作者首部/代表性短篇集；有具名直接作品研究，满足对象重要性。; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0496','collection','《荒地》','El baldío','candidate','1','WCD10-B07-W202','基金会称作者的重要短篇集，且已取得对应作品页的集级介绍；未把同名单篇当成电影。; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0497','collection','《水上的脚》','Los pies sobre el agua','candidate','1','WCD10-B07-W203','Instituto Cervantes将其列为作者短篇集，基金会提供集级版本/收录说明。; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0498','collection','《燃烧的木材》','Madera quemada','candidate','1','WCD10-B07-W204','列入缺失的重要短篇集；支持集中可直接说明书集与《人子》章节/单篇版本关系，避免对象混淆。; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0499','collection','《濒死》','Moriencia','candidate','1','WCD10-B07-W205','基金会和Cervantes书目均列为作者核心短篇集，且基金会直接描述其作品集结构。; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0500','collection','《现身及其他故事》','Cuerpo presente y otros cuentos','candidate','1','WCD10-B07-W206','Biblioteca del Poder Legislativo (Uruguay) record identifies the named CELA c1971 printed item and exact contents. Fundación separately lists a 1972 item titled Cuerpo presente y otros textos; available records identify separate title/date objects, but do not settle whether the 1972 item is a derivative selection, reissue, or related edition. Do not transfer its contents to the 1971 item.; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0501','work','《火焰小鸡》','El pollito de fuego','candidate','1','WCD10-B07-W207','Cervantes目录与基金会页面均将其列作作者儿童叙事，且作品页有直接故事内容。; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0502','work','《海军上将守夜》','Vigilia del Almirante','candidate','1','WCD10-B07-W208','被CVC/基金会明确列为小说，且作品本身自述和对象说明可读。; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0503','work','《逆生命》','Contravida','candidate','1','WCD10-B07-W209','巴拉圭1994原版副文本和两项Cervantes书目证据互证首发年；基金会生平将Contravida排于1995，候选明确采用原版1994而保留冲突说明。; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0504','collection','《燃烧的橘园》','El naranjal ardiente','candidate','1','WCD10-B07-W210','基金会称其为作者第二部诗集；分别记录1960选本、1983近完整第二版及1998后续合集的信息，不把1998卷中的新旧诗/ Silenciario内容下推至1983版。; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0505','collection','《黎明的夜莺及其他诗篇》','El ruiseñor de la aurora y otros poemas','candidate','1','WCD10-B07-W212','1942诗集在CVC书目、Google Books目录和基金会诗歌页也直接标出1942；CVC年表另称1952出版“完整版本”，故本候选只锚定1942项并显式记录后续版本，不把1952当首发年。; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0506','collection','《我所见的英格兰》','La Inglaterra que yo vi','candidate','1','WCD10-B07-W213','CVC书目列1946书目项；基金会将其描述为首次赴欧期间新闻文章的汇集，FLM作者条目进一步称其为El País刊行的小册子，并列出旅行观察/访谈对象，足以说明体裁和对象内容。; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0507','work','《苏伊夫人》','Madama Sui','candidate','1','WCD10-B07-W214','CVC及基金会记录1996年版本，但Laura Welsch学术论文明确区分1995年初版与1996年Seix Barral第二版，消解首发年冲突；论文直接以该小说为研究对象，满足重要性及有界直接研究要求。; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0508','collection','《隐喻主义格言集》','Metaforismos','candidate','1','WCD10-B07-W215','CVC书目及基金会版次页均列1996；WorldCat和Google Books记录分别描述格言类内容并确认1996版次。两个不同出版者的1996记录（El Lector与Seix Barral/Edhasa）并存，现有来源未证明二者先后/共版关系，故不判定唯一首版出版者。; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0509','work','《游戏1：卡罗琳娜与加斯帕尔》','Los Juegos 1: Carolina y Gaspar','candidate','1','WCD10-B07-W216','1979儿童读物在CVC年表、基金会传记及CVC书目均有记录；基金会短篇小说（Cuento）页面提供该书片段，足以给出有界的对象级说明，但不把片段延伸为全书情节。; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY'),
('V1-ENT-0510','collection','《被诅咒的文化》','Las culturas condenadas','candidate','1','WCD10-B07-W217','CVC Bibliografía calls the 1978 Siglo XXI object a compilación; Google Books identifies Roa Bastos as editor and “Compiled by”; Enrique Flores directly studies his compiler role and the anthology’s mixed ethnographic, poetic and ritual materials. Here author_id records only the source-backed compiler/editor association; it does not claim Roa solely authored every included text.; 中文名仅作工作显示候选，原文题名为实体身份锚点；未核实正式中文译本，不宣称规范译名。','PROVISIONAL-ZH-DISPLAY');

INSERT INTO entity_id_map (mapping_id,preview_entity_ref,origin_layer,origin_ref,entity_id,mapping_action,mapping_basis) VALUES
('V1-EMAP-0453','WCD10-B07-W001','WCD-10-B07','WCD10-B07-W001','V1-ENT-0457','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0454','WCD10-B07-W002','WCD-10-B07','WCD10-B07-W002','V1-ENT-0458','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0455','WCD10-B07-W003','WCD-10-B07','WCD10-B07-W003','V1-ENT-0459','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0456','WCD10-B07-W004','WCD-10-B07','WCD10-B07-W004','V1-ENT-0460','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0457','WCD10-B07-W005','WCD-10-B07','WCD10-B07-W005','V1-ENT-0461','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0458','WCD10-B07-W006','WCD-10-B07','WCD10-B07-W006','V1-ENT-0462','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0459','WCD10-B07-W007','WCD-10-B07','WCD10-B07-W007','V1-ENT-0463','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0460','WCD10-B07-W008','WCD-10-B07','WCD10-B07-W008','V1-ENT-0464','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0461','WCD10-B07-W009','WCD-10-B07','WCD10-B07-W009','V1-ENT-0465','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0462','WCD10-B07-W101','WCD-10-B07','WCD10-B07-W101','V1-ENT-0466','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0463','WCD10-B07-W102','WCD-10-B07','WCD10-B07-W102','V1-ENT-0467','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0464','WCD10-B07-W103','WCD-10-B07','WCD10-B07-W103','V1-ENT-0468','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0465','WCD10-B07-W104','WCD-10-B07','WCD10-B07-W104','V1-ENT-0469','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0466','WCD10-B07-W105','WCD-10-B07','WCD10-B07-W105','V1-ENT-0470','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0467','WCD10-B07-W106','WCD-10-B07','WCD10-B07-W106','V1-ENT-0471','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0468','WCD10-B07-W107','WCD-10-B07','WCD10-B07-W107','V1-ENT-0472','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0469','WCD10-B07-W108','WCD-10-B07','WCD10-B07-W108','V1-ENT-0473','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0470','WCD10-B07-W109','WCD-10-B07','WCD10-B07-W109','V1-ENT-0474','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0471','WCD10-B07-W110','WCD-10-B07','WCD10-B07-W110','V1-ENT-0475','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0472','WCD10-B07-W111','WCD-10-B07','WCD10-B07-W111','V1-ENT-0476','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0473','WCD10-B07-W112','WCD-10-B07','WCD10-B07-W112','V1-ENT-0477','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0474','WCD10-B07-W113','WCD-10-B07','WCD10-B07-W113','V1-ENT-0478','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0475','WCD10-B07-W114','WCD-10-B07','WCD10-B07-W114','V1-ENT-0479','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0476','WCD10-B07-W115','WCD-10-B07','WCD10-B07-W115','V1-ENT-0480','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0477','WCD10-B07-W116','WCD-10-B07','WCD10-B07-W116','V1-ENT-0481','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0478','WCD10-B07-W117','WCD-10-B07','WCD10-B07-W117','V1-ENT-0482','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0479','WCD10-B07-W118','WCD-10-B07','WCD10-B07-W118','V1-ENT-0483','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0480','WCD10-B07-W119','WCD-10-B07','WCD10-B07-W119','V1-ENT-0484','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0481','WCD10-B07-W120','WCD-10-B07','WCD10-B07-W120','V1-ENT-0485','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0482','WCD10-B07-W121','WCD-10-B07','WCD10-B07-W121','V1-ENT-0486','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0483','WCD10-B07-W122','WCD-10-B07','WCD10-B07-W122','V1-ENT-0487','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0484','WCD10-B07-W123','WCD-10-B07','WCD10-B07-W123','V1-ENT-0488','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0485','WCD10-B07-W124','WCD-10-B07','WCD10-B07-W124','V1-ENT-0489','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0486','WCD10-B07-W125','WCD-10-B07','WCD10-B07-W125','V1-ENT-0490','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0487','WCD10-B07-W126','WCD-10-B07','WCD10-B07-W126','V1-ENT-0491','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0488','WCD10-B07-W127','WCD-10-B07','WCD10-B07-W127','V1-ENT-0492','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0489','WCD10-B07-W128','WCD-10-B07','WCD10-B07-W128','V1-ENT-0493','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0490','WCD10-B07-W129','WCD-10-B07','WCD10-B07-W129','V1-ENT-0494','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0491','WCD10-B07-W201','WCD-10-B07','WCD10-B07-W201','V1-ENT-0495','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0492','WCD10-B07-W202','WCD-10-B07','WCD10-B07-W202','V1-ENT-0496','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0493','WCD10-B07-W203','WCD-10-B07','WCD10-B07-W203','V1-ENT-0497','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0494','WCD10-B07-W204','WCD-10-B07','WCD10-B07-W204','V1-ENT-0498','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0495','WCD10-B07-W205','WCD-10-B07','WCD10-B07-W205','V1-ENT-0499','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0496','WCD10-B07-W206','WCD-10-B07','WCD10-B07-W206','V1-ENT-0500','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0497','WCD10-B07-W207','WCD-10-B07','WCD10-B07-W207','V1-ENT-0501','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0498','WCD10-B07-W208','WCD-10-B07','WCD10-B07-W208','V1-ENT-0502','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0499','WCD10-B07-W209','WCD-10-B07','WCD10-B07-W209','V1-ENT-0503','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0500','WCD10-B07-W210','WCD-10-B07','WCD10-B07-W210','V1-ENT-0504','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0501','WCD10-B07-W212','WCD-10-B07','WCD10-B07-W212','V1-ENT-0505','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0502','WCD10-B07-W213','WCD-10-B07','WCD10-B07-W213','V1-ENT-0506','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0503','WCD10-B07-W214','WCD-10-B07','WCD10-B07-W214','V1-ENT-0507','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0504','WCD10-B07-W215','WCD-10-B07','WCD10-B07-W215','V1-ENT-0508','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0505','WCD10-B07-W216','WCD-10-B07','WCD10-B07-W216','V1-ENT-0509','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission'),
('V1-EMAP-0506','WCD10-B07-W217','WCD-10-B07','WCD10-B07-W217','V1-ENT-0510','retain_as_formal_candidate','Independent candidate review PASS; Research-only, no Curation admission');

INSERT INTO content_cards (card_id,origin_card_id,subject_id,card_type,title_zh,author_label,original_title,country_or_region,language,period_bucket,genre_or_form,input_layer,source_minimum_status,issue_code,content_markdown) VALUES
('V1-CARD-0381','WCD-10-B07:V1-ENT-0457','V1-ENT-0457','work','《一个与宇宙》','埃内斯托·萨瓦托','Uno y el Universo','阿根廷','es','1945','essay','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《一个与宇宙》｜Uno y el Universo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1945
- genre_or_form：essay
- one_sentence_summary：文章集；据出版社简介，为萨瓦托首部著作，收入其1945年撰写的文章；国家图书馆称其批评科学表面上的中立性。

#### 署名研究说明（research_note_only）

- Noelia M. Senarega 的摘要将本书列入四篇被研究的萨瓦托论说，并把分析范围限定为其中涉及的道德问题。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0382','WCD-10-B07:V1-ENT-0458','V1-ENT-0458','work','《人和齿轮》','埃内斯托·萨瓦托','Hombres y engranajes','阿根廷','es','1951','essay','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《人和齿轮》｜Hombres y engranajes

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1951
- genre_or_form：essay
- one_sentence_summary：出版社简介将其定位为围绕现代文化危机、科学技术、人的工具化及人文价值而展开的散文作品。

#### 署名研究说明（research_note_only）

- Noelia M. Senarega 的摘要将本书列入四篇被研究的萨瓦托论说，并把分析范围限定为其中涉及的道德问题。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0383','WCD-10-B07:V1-ENT-0459','V1-ENT-0459','work','《作家与他的幽灵》','埃内斯托·萨瓦托','El escritor y sus fantasmas','阿根廷','es','1963','essay','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《作家与他的幽灵》｜El escritor y sus fantasmas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1963
- genre_or_form：essay
- one_sentence_summary：据出版社转引作者序言，本书围绕“为什么、怎样、为了什么而写小说”这一持续困扰作者的问题展开。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0384','WCD-10-B07:V1-ENT-0460','V1-ENT-0460','work','《辩护与拒绝》','埃内斯托·萨瓦托','Apologías y rechazos','阿根廷','es','1979','essay collection','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《辩护与拒绝》｜Apologías y rechazos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1979
- genre_or_form：essay collection
- one_sentence_summary：出版社简介称本书汇集七篇较长文章；作者书目将其列为1979年出版的现代性与文学论说类作品。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0385','WCD-10-B07:V1-ENT-0461','V1-ENT-0461','work','《终之前》','埃内斯托·萨瓦托','Antes del fin','阿根廷','es','1998','memoir','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《终之前》｜Antes del fin

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1998
- genre_or_form：memoir
- one_sentence_summary：出版社将本书称为回忆录，叙述作者从科学职业经历转向文学与艺术的过程。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0386','WCD-10-B07:V1-ENT-0462','V1-ENT-0462','work','《抵抗》','埃内斯托·萨瓦托','La resistencia','阿根廷','es','2000','essay','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《抵抗》｜La resistencia

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2000
- genre_or_form：essay
- one_sentence_summary：据出版社简介，本书由五封致读者的长信构成，讨论当代社会价值流失与技术社会中的非人化。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0387','WCD-10-B07:V1-ENT-0463','V1-ENT-0463','work','《我暮年日记中的西班牙》','埃内斯托·萨瓦托','España en los diarios de mi vejez','阿根廷','es','2004','travel diary','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《我暮年日记中的西班牙》｜España en los diarios de mi vejez

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2004
- genre_or_form：travel diary
- one_sentence_summary：出版社简介称其以作者此前两年西班牙旅行经历为主轴，是记录行旅与个人状态的私密札记。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0388','WCD-10-B07:V1-ENT-0464','V1-ENT-0464','work','《庇隆主义的另一面》','埃内斯托·萨瓦托','El otro rostro del peronismo','阿根廷','es','1956','政治论说 / 致马里奥·阿马德奥的公开信','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《庇隆主义的另一面》｜El otro rostro del peronismo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：政治论说 / 致马里奥·阿马德奥的公开信
- one_sentence_summary：UNNE catalogs the book as an open letter to Mario Amadeo; CEDINPE’s contents list includes “Las bases de la conciliación nacional.” Senarega’s abstract lists the book among four essays in her study of moral issues.

#### 署名研究说明（research_note_only）

- Noelia M. Senarega 的摘要将该书列为萨瓦托四篇论说之一，研究其涉及的道德问题及个人与社会群体间的对立倾向。此处仅归述摘要范围，不延伸为全书结论。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0389','WCD-10-B07:V1-ENT-0465','V1-ENT-0465','work','《关于我们时代文学的三种探讨》','埃内斯托·萨瓦托','Tres aproximaciones a la literatura de nuestro tiempo','阿根廷','es','1968','literary-critical essay collection','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《关于我们时代文学的三种探讨》｜Tres aproximaciones a la literatura de nuestro tiempo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1968
- genre_or_form：literary-critical essay collection
- one_sentence_summary：据馆藏编目题名、副题和主题词，本书由围绕Robbe-Grillet、Jorge Luis Borges与Jean-Paul Sartre的文学批评论说构成。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0390','WCD-10-B07:V1-ENT-0466','V1-ENT-0466','work','《Diario de la guerra del cerdo》','阿道夫·比奥伊·卡萨雷斯','Diario de la guerra del cerdo','阿根廷','es','1969','长篇小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Diario de la guerra del cerdo》｜Diario de la guerra del cerdo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1969
- genre_or_form：长篇小说
- one_sentence_summary：据出版社简介，这部半奇幻小说写布宜诺斯艾利斯巴勒莫区年轻人与老年人之间突发的暴力冲突，以及主人公日常生活被袭击事件打乱。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0391','WCD-10-B07:V1-ENT-0467','V1-ENT-0467','work','《Dormir al sol》','阿道夫·比奥伊·卡萨雷斯','Dormir al sol','阿根廷','es','1973','书信体小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Dormir al sol》｜Dormir al sol

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1973
- genre_or_form：书信体小说
- one_sentence_summary：据出版社简介，钟表匠卢西奥写信讲述他与妻子戴安娜及训犬师斯坦德尔相识后的生活；作品后续将犬训练所与新式精神治疗带入叙事。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0392','WCD-10-B07:V1-ENT-0468','V1-ENT-0468','collection','《La trama celeste》','阿道夫·比奥伊·卡萨雷斯','La trama celeste','阿根廷','es','1948','短篇小说集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《La trama celeste》｜La trama celeste

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1948
- genre_or_form：短篇小说集
- one_sentence_summary：据出版社简介，这部1948年故事集以表象与现实、平行世界及空间和时间游戏为叙事线索。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0393','WCD-10-B07:V1-ENT-0469','V1-ENT-0469','collection','《Historia prodigiosa》','阿道夫·比奥伊·卡萨雷斯','Historia prodigiosa','阿根廷','es','1956','短篇小说集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Historia prodigiosa》｜Historia prodigiosa

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1956
- genre_or_form：短篇小说集
- one_sentence_summary：据出版社简介，这部1956年在墨西哥初版的故事集收录1949至1955年间写成的六篇故事；简介概括其爱情、吸引力与命运主题，并补述同名故事的情节。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0394','WCD-10-B07:V1-ENT-0470','V1-ENT-0470','collection','《Guirnalda con amores》','阿道夫·比奥伊·卡萨雷斯','Guirnalda con amores','阿根廷','es','1959','杂集（含故事、格言与寓言）','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Guirnalda con amores》｜Guirnalda con amores

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1959
- genre_or_form：杂集（含故事、格言与寓言）
- one_sentence_summary：据出版社介绍，作者将本书称作“杂集”：全书十一部分交替安排短篇叙事与日常/哲理格言；不将其简化成单一小说或纯故事集。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0395','WCD-10-B07:V1-ENT-0471','V1-ENT-0471','collection','《El gran Serafín》','阿道夫·比奥伊·卡萨雷斯','El gran Serafín','阿根廷','es','1967','短篇小说集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《El gran Serafín》｜El gran Serafín

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1967
- genre_or_form：短篇小说集
- one_sentence_summary：据出版社简介，此集含十篇故事，场景从蒙得维的亚到潘帕斯；简介列出超自然事件、日常转为奇幻及爱情等要素。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0396','WCD-10-B07:V1-ENT-0472','V1-ENT-0472','work','《La aventura de un fotógrafo en La Plata》','阿道夫·比奥伊·卡萨雷斯','La aventura de un fotógrafo en La Plata','阿根廷','es','1985','长篇小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《La aventura de un fotógrafo en La Plata》｜La aventura de un fotógrafo en La Plata

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1985
- genre_or_form：长篇小说
- one_sentence_summary：据出版社对后编选集所收该书的简介，摄影师尼古拉斯·阿尔曼萨受派到拉普拉塔拍摄城市图册，结识伦巴多家族；简介提及幽默和恐怖成分。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0397','WCD-10-B07:V1-ENT-0473','V1-ENT-0473','work','《Un campeón desparejo》','阿道夫·比奥伊·卡萨雷斯','Un campeón desparejo','阿根廷','es','1993','长篇小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Un campeón desparejo》｜Un campeón desparejo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1993
- genre_or_form：长篇小说
- one_sentence_summary：据出版社对后编选集所收该书的简介，出租车司机路易斯·安赫尔·莫拉莱斯因乘客给的饮剂而逐渐摆脱原有拘谨，并显露与拳击有关的身手。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0398','WCD-10-B07:V1-ENT-0474','V1-ENT-0474','work','《De un mundo a otro》','阿道夫·比奥伊·卡萨雷斯','De un mundo a otro','阿根廷','es','1998','长篇小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《De un mundo a otro》｜De un mundo a otro

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1998
- genre_or_form：长篇小说
- one_sentence_summary：据出版社对后编选集所收该书的简介，记者哈维尔·阿尔马格罗与女友玛格丽塔展开一次星际远征。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0399','WCD-10-B07:V1-ENT-0475','V1-ENT-0475','collection','《El lado de la sombra》','阿道夫·比奥伊·卡萨雷斯','El lado de la sombra','阿根廷','es','1962','短篇小说集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《El lado de la sombra》｜El lado de la sombra

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1962
- genre_or_form：短篇小说集
- one_sentence_summary：据出版社介绍，该短篇集收录十篇1962年发表的故事；其中同名故事与《Los afanes》从不同角度重访《La invención de Morel》的若干主题。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0400','WCD-10-B07:V1-ENT-0476','V1-ENT-0476','collection','《El héroe de las mujeres》','阿道夫·比奥伊·卡萨雷斯','El héroe de las mujeres','阿根廷','es','1978','短篇小说集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《El héroe de las mujeres》｜El héroe de las mujeres

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1978
- genre_or_form：短篇小说集
- one_sentence_summary：据出版社简介，这部短篇集反复描写男性人物受命运支配、女性成为最后希望或警讯的戏剧情境。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0401','WCD-10-B07:V1-ENT-0477','V1-ENT-0477','collection','《Historias desaforadas》','阿道夫·比奥伊·卡萨雷斯','Historias desaforadas','阿根廷','es','1986','短篇小说集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Historias desaforadas》｜Historias desaforadas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1986
- genre_or_form：短篇小说集
- one_sentence_summary：据Teobaldi对集内《Máscaras venecianas》的分析，该篇写叙述者病后赴威尼斯、与妻子分离，并以克隆/相似者问题展开关于双重身份的幻想叙事；此说明仅限该单篇。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0402','WCD-10-B07:V1-ENT-0478','V1-ENT-0478','collection','《Una muñeca rusa》','阿道夫·比奥伊·卡萨雷斯','Una muñeca rusa','阿根廷','es','1991','短篇小说集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Una muñeca rusa》｜Una muñeca rusa

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1991
- genre_or_form：短篇小说集
- one_sentence_summary：据Tusquets出版社对该集的简介，集中的日常小事逐渐带入难以捉摸的陌生或异化感；简介以《Un encuentro en Rauch》举例。此为整集的出版社概述，不据此推定同名篇的目录归属或具体情节。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0403','WCD-10-B07:V1-ENT-0479','V1-ENT-0479','collection','《Una magia modesta》','阿道夫·比奥伊·卡萨雷斯','Una magia modesta','阿根廷','es','1997','短篇小说集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Una magia modesta》｜Una magia modesta

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1997
- genre_or_form：短篇小说集
- one_sentence_summary：据Gambetta Chuk对集内《El último piso》的解读，故事围绕似有似无的第九层、主人公“Bioy”与Margarita的相遇，以及现实/梦幻边界展开；此说明只指该单篇，不代表全书。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0404','WCD-10-B07:V1-ENT-0480','V1-ENT-0480','collection','《La otra aventura》','阿道夫·比奥伊·卡萨雷斯','La otra aventura','阿根廷','es','1968','essay collection (prologues and articles)','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《La otra aventura》｜La otra aventura

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1968
- genre_or_form：essay collection (prologues and articles)
- one_sentence_summary：出版社在后来的非虚构合编本中称1968年原作是一组序言与文章，并举出关于《La Celestina》原创性的分析和作者与Borges友谊的短文；释义限于出版社列出的例项。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0405','WCD-10-B07:V1-ENT-0481','V1-ENT-0481','work','《Memorias》','阿道夫·比奥伊·卡萨雷斯','Memorias','阿根廷','es','1994','autobiographical memoir','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Memorias》｜Memorias

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1994
- genre_or_form：autobiographical memoir
- one_sentence_summary：据Tusquets出版社简介，作品以作者从童年到成年的人生经历为线索，涉及Borges、Silvina Ocampo、家人、书籍与城市，并反思生活如何经书写转化为文学；属于作者回忆录，不把参与编辑/编排者列为共同作者。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0406','WCD-10-B07:V1-ENT-0482','V1-ENT-0482','collection','《De jardines ajenos》','阿道夫·比奥伊·卡萨雷斯','De jardines ajenos','阿根廷','es','1997','reader’s anthology / miscellany of quotations and poems','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《De jardines ajenos》｜De jardines ajenos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1997
- genre_or_form：reader’s anthology / miscellany of quotations and poems
- one_sentence_summary：据Mariano García对该书的直接讨论，Bioy称其为“libro abierto”，汇集其多年抄录的短诗与散文片段，是带有作者编选痕迹的阅读者选集；以编选身份描述，不把被引作者列为合著者。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0407','WCD-10-B07:V1-ENT-0483','V1-ENT-0483','work','《De las cosas maravillosas》','阿道夫·比奥伊·卡萨雷斯','De las cosas maravillosas','阿根廷','es','1999','nonfiction essays / reflections','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《De las cosas maravillosas》｜De las cosas maravillosas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1999
- genre_or_form：nonfiction essays / reflections
- one_sentence_summary：出版社在非虚构合编本中把1999年原作描述为旨在帮助读者认识自身的反思性作品；本包不把宣传性概括扩展成更具体的主题断言。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0408','WCD-10-B07:V1-ENT-0484','V1-ENT-0484','collection','《Descanso de caminantes, Diarios íntimos》','阿道夫·比奥伊·卡萨雷斯','Descanso de caminantes, Diarios íntimos','阿根廷','es','2001','posthumous selection of intimate diaries and notebooks, edited by Daniel Martino','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Descanso de caminantes, Diarios íntimos》｜Descanso de caminantes, Diarios íntimos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2001
- genre_or_form：posthumous selection of intimate diaries and notebooks, edited by Daniel Martino
- one_sentence_summary：据Daniel Martino的同期后记，Bioy本人决定将这些日记/笔记本统称为Descanso de caminantes；选本中的反思、逸事、谈话、梦和故事构想，构成对自身行为与日常生活的回顾。此处将Martino记为编者而非合著者。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0409','WCD-10-B07:V1-ENT-0485','V1-ENT-0485','work','《Borges》','阿道夫·比奥伊·卡萨雷斯','Borges','阿根廷','es','2006','posthumous selection from Bioy’s diary, edited by Daniel Martino','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Borges》｜Borges

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：2006
- genre_or_form：posthumous selection from Bioy’s diary, edited by Daniel Martino
- one_sentence_summary：据Manuela Barral对该书的研究，Borges是从Bioy私人文本中筛选与Borges相关的日记内容、以年份分节的遗作；作品记录两人对话，同时呈现Bioy作为记录者的视角。Borges是被记录者，不据书名列为共同作者。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0410','WCD-10-B07:V1-ENT-0486','V1-ENT-0486','collection','《En viaje (1967)》','阿道夫·比奥伊·卡萨雷斯','En viaje (1967)','阿根廷','es','1996','letters / travel writing drawn from letters written in 1967','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《En viaje (1967)》｜En viaje (1967)

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1996
- genre_or_form：letters / travel writing drawn from letters written in 1967
- one_sentence_summary：据出版社对后来的Tusquets版次的介绍，作品记录Bioy 1967年独自欧洲旅行；2014年研究文献将其书目出版标为1996年并说明这一自传性文本属于写给妻子与女儿的信件。此处区分信件写作时间、首次结集年和当前1997版次。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0411','WCD-10-B07:V1-ENT-0487','V1-ENT-0487','work','《Memoria sobre la pampa y los gauchos》','阿道夫·比奥伊·卡萨雷斯','Memoria sobre la pampa y los gauchos','阿根廷','es','1970','nonfiction prose essay','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Memoria sobre la pampa y los gauchos》｜Memoria sobre la pampa y los gauchos

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1970
- genre_or_form：nonfiction prose essay
- one_sentence_summary：据Carmen Balcells文学代理页面，作者从童年对“pampa”和“gaucho”一词的早期困惑写起，并反思这些词语与阿根廷国家/爱国想象的关系；只概述页面披露的文字内容。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0412','WCD-10-B07:V1-ENT-0488','V1-ENT-0488','work','《Breve diccionario del argentino exquisito》','阿道夫·比奥伊·卡萨雷斯','Breve diccionario del argentino exquisito','阿根廷','es','1971','lexicographic book / satirical dictionary','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Breve diccionario del argentino exquisito》｜Breve diccionario del argentino exquisito

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1971
- genre_or_form：lexicographic book / satirical dictionary
- one_sentence_summary：据Mariano García的直接研究，这部词典以虚构词条、人物和对语言使用的戏谑性处理构造其词典形式；1971年初版使用Javier Miranda笔名，1978年起的版本署Adolfo Bioy Casares。此处保留题名、作者笔名和后版身份差异。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0413','WCD-10-B07:V1-ENT-0489','V1-ENT-0489','work','《La estatua casera》','阿道夫·比奥伊·卡萨雷斯','La estatua casera','阿根廷','es','1936','杂集（混合散文、短篇叙事与短篇文论；不归为单一小说体裁）','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《La estatua casera》｜La estatua casera

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1936
- genre_or_form：杂集（混合散文、短篇叙事与短篇文论；不归为单一小说体裁）
- one_sentence_summary：据García对原书的直接讨论，本书由实验性短篇叙事和反思性文字构成，包含《El hermano de la nonata》《Locus》《Utilidad y fin práctico》及《Sobre la técnica de los cuentos fantásticos》等不同文本；此说明概括其杂集构成，不把任何单篇另作合集身份。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0414','WCD-10-B07:V1-ENT-0490','V1-ENT-0490','work','《El perjurio de la nieve》','阿道夫·比奥伊·卡萨雷斯','El perjurio de la nieve','阿根廷','es','1944','cuento / 短篇小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《El perjurio de la nieve》｜El perjurio de la nieve

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1944
- genre_or_form：cuento / 短篇小说
- one_sentence_summary：据Amparo Reyes Velázquez对故事的梗概，记者Juan Luis Villafañe与诗人Carlos Oribe来到巴塔哥尼亚庄园La Adela，卷入鳏夫Luis Vermehren及其四名女儿封闭而重复的生活；José Miguel Rodríguez Zamora的研究指出，故事将时间停滞的奇异情节与侦探叙事并置。
- bibliographic_note：初版年份存在1944/1945来源分歧：Google Books目录列Emecé 1944年单行本、64页；Reyes Velázquez与Rodríguez Zamora的直接研究均称 cuento 于1944年出版；Carlos Dámaso Martínez的CVC作者传记则记1945年。本提案依据单行本目录与两项直接研究采用1944，同时保留1945异说供审核；后收入故事集的版本不作为首发证据。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0415','WCD-10-B07:V1-ENT-0491','V1-ENT-0491','work','《Las vísperas de Fausto》','阿道夫·比奥伊·卡萨雷斯','Las vísperas de Fausto','阿根廷','es','1949','cuento / 短篇小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Las vísperas de Fausto》｜Las vísperas de Fausto

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1949
- genre_or_form：cuento / 短篇小说
- one_sentence_summary：故事聚焦浮士德生命最后一夜：他与仆人瓦格纳及狗Señor等待午夜到来，在魔鬼索取灵魂前仍面对逃避或接受的抉择。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0416','WCD-10-B07:V1-ENT-0492','V1-ENT-0492','work','《Homenaje a Francisco Almeyra》','阿道夫·比奥伊·卡萨雷斯','Homenaje a Francisco Almeyra','阿根廷','es','1954','cuento / 短篇小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Homenaje a Francisco Almeyra》｜Homenaje a Francisco Almeyra

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1954
- genre_or_form：cuento / 短篇小说
- one_sentence_summary：单篇以阿根廷一位流亡蒙得维的亚的单一派诗人为中心：他返回布宜诺斯艾利斯后遭mazorqueros杀害。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0417','WCD-10-B07:V1-ENT-0493','V1-ENT-0493','work','《Los que aman, odian》','阿道夫·比奥伊·卡萨雷斯','Los que aman, odian','阿根廷','es','1946','novela policial / 侦探小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Los que aman, odian》｜Los que aman, odian

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1946
- genre_or_form：novela policial / 侦探小说
- one_sentence_summary：孤立海滨旅馆遭风暴围困期间发生投毒命案与失踪，医生Humberto Huberman被卷入复仇与未竟爱情，旅客在数夜封闭环境中成为嫌疑人。
- bibliographic_note：CVC书目与编年（S101、S102）均将这部合著侦探小说列于1946年；Emecé press sheet作者简介第0页L36–37则称1945年。该press sheet标注“Fecha de publicación: 01/07/2016”，这是所述当前书版日期；PDF没有单独的网页上线日期，且2016不是作品初版年。本提案以CVC书目/编年支持1946，保留出版社简介中的1945异说；不把2016版年作为首发年。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0418','WCD-10-B07:V1-ENT-0494','V1-ENT-0494','work','《Antología de la literatura fantástica》','阿道夫·比奥伊·卡萨雷斯','Antología de la literatura fantástica','阿根廷','es','1940','奇幻文学选集（共同编选、翻译）','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《Antología de la literatura fantástica》｜Antología de la literatura fantástica

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1940
- genre_or_form：奇幻文学选集（共同编选、翻译）
- one_sentence_summary：该选集汇集H. G. Wells、Franz Kafka、Rudyard Kipling等作者作品，并收入Macedonio Fernández、Silvina Ocampo与Jorge Luis Borges的文本；Bioy另撰序。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0419','WCD-10-B07:V1-ENT-0495','V1-ENT-0495','collection','《树叶间的雷声》','奥古斯托·罗亚·巴斯托斯','El trueno entre las hojas','巴拉圭','es','1953','短篇小说集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《树叶间的雷声》｜El trueno entre las hojas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1953
- genre_or_form：短篇小说集
- one_sentence_summary：据基金会对集首尾故事的说明，“Carpincheros”中的人物在同名末篇再次出现；基金会小说页称该人物为Gretchen，而短篇集页称Margaret，故此处保留两页各自的姓名，不合并为单一无异名的人物表述。

#### 署名研究说明（research_note_only）

- An Van Hecke将该书分析为具有内在统一性的短篇集/“integrated stories”，讨论神话、梦、社会政治观念及西语—瓜拉尼语双语。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0420','WCD-10-B07:V1-ENT-0496','V1-ENT-0496','collection','《荒地》','奥古斯托·罗亚·巴斯托斯','El baldío','巴拉圭','es','1966','短篇小说集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《荒地》｜El baldío

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1966
- genre_or_form：短篇小说集
- one_sentence_summary：据基金会作品页，该短篇集以人物的具体言行呈现巴拉圭社会生活，采用干涩、动荡而哀痛的现实主义叙述，不以解释性旁白替人物概括处境。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0421','WCD-10-B07:V1-ENT-0497','V1-ENT-0497','collection','《水上的脚》','奥古斯托·罗亚·巴斯托斯','Los pies sobre el agua','巴拉圭','es','1967','短篇小说集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《水上的脚》｜Los pies sobre el agua

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1967
- genre_or_form：短篇小说集
- one_sentence_summary：据基金会说明，该集纳入新写短篇并重收部分此前作品；它与《木材燃烧》等集在单篇选入及改写上有交叉，故书集和单篇作品须分层记录。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0422','WCD-10-B07:V1-ENT-0498','V1-ENT-0498','collection','《燃烧的木材》','奥古斯托·罗亚·巴斯托斯','Madera quemada','巴拉圭','es','1967','短篇小说集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《燃烧的木材》｜Madera quemada

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1967
- genre_or_form：短篇小说集
- one_sentence_summary：据基金会版本说明，“Madera quemada”既是1967年短篇集名，也是一篇在《人子》首版后被独立编入短篇集、并于1980年代重写版重新收入小说的文本；本对象指书集，不等同其中单篇或小说章节。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0423','WCD-10-B07:V1-ENT-0499','V1-ENT-0499','collection','《濒死》','奥古斯托·罗亚·巴斯托斯','Moriencia','巴拉圭','es','1969','短篇小说集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《濒死》｜Moriencia

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1969
- genre_or_form：短篇小说集
- one_sentence_summary：据基金会说明，该书汇集两组不同写作时期的短篇：一组写于1967年并属于仍在发展的故事循环，另一组写于1955—1960年，收入时经作者选择、修改或重写。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0424','WCD-10-B07:V1-ENT-0500','V1-ENT-0500','collection','《现身及其他故事》','奥古斯托·罗亚·巴斯托斯','Cuerpo presente y otros cuentos','巴拉圭','es','1971','短篇小说集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《现身及其他故事》｜Cuerpo presente y otros cuentos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1971
- genre_or_form：短篇小说集
- one_sentence_summary：乌拉圭立法图书馆目录将此对象著录为CELA、c1971的印刷合集，并列出九篇：〈Nonato〉、〈Cuando un pájaro entierra sus plumas〉、〈Función〉、〈Moriencia〉、〈Bajo el puente〉、〈Macario〉、〈Borrador de un informe〉、〈Hogar〉与〈La excavación〉。基金会另列1972年《Cuerpo presente y otros textos》；可见资料确认题名和年代各异，但未解决两者是否为选集、重版或相关版本关系，因此不把1972年内容移用于此1971年对象。
- bibliographic_note：乌拉圭立法图书馆记录为 [Buenos Aires] : CELA, c1971；丛书 Biblioteca Básica Universal 137；127页。基金会另列 Cuerpo presente y otros textos (1972)，并称后者含两段 Hijo de hombre；两条目录是不同题名/年代记录，现有来源未证实其版本关系。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0425','WCD-10-B07:V1-ENT-0501','V1-ENT-0501','work','《火焰小鸡》','奥古斯托·罗亚·巴斯托斯','El pollito de fuego','巴拉圭','es','1974','儿童故事','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《火焰小鸡》｜El pollito de fuego

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1974
- genre_or_form：儿童故事
- one_sentence_summary：基金会所载故事中，成人向孩子讲述小鸡Pipiolín变为火焰小鸡的经历；它点燃鸡舍，之后投入溪流与蛇搏斗，长成彩羽公鸡。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0426','WCD-10-B07:V1-ENT-0502','V1-ENT-0502','work','《海军上将守夜》','奥古斯托·罗亚·巴斯托斯','Vigilia del Almirante','巴拉圭','es','1992','长篇小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《海军上将守夜》｜Vigilia del Almirante

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1992
- genre_or_form：长篇小说
- one_sentence_summary：作者将本书描述为“混合”的历史虚构：以哥伦布为对象，在两个相矛盾的历史/文化世界间，想象海军上将失落的名字、记忆及其历史形象。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0427','WCD-10-B07:V1-ENT-0503','V1-ENT-0503','work','《逆生命》','奥古斯托·罗亚·巴斯托斯','Contravida','巴拉圭','es','1994','长篇小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《逆生命》｜Contravida

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1994
- genre_or_form：长篇小说
- one_sentence_summary：原版副文本介绍：小说第一人称叙述者是越狱与监狱屠杀的唯一幸存者，该事件与短篇“La excavación”相连；基金会另指出Nonato/教师Cristaldo成为小说叙事中心，并有先前小说人物重现。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0428','WCD-10-B07:V1-ENT-0504','V1-ENT-0504','collection','《燃烧的橘园》','奥古斯托·罗亚·巴斯托斯','El naranjal ardiente','巴拉圭','es','1960','诗集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《燃烧的橘园》｜El naranjal ardiente

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1960
- genre_or_form：诗集
- one_sentence_summary：基金会称《El naranjal ardiente》为作者第二部诗集：1960年出版的是较早未刊诗稿的选本；基金会另称1983年出版近乎完整的第二版。其Antologías页将早期与新作、以及《Silenciario》收入“Poesías Reunidas”(1998)的当前卷，故不把这些内容归到1983版。
- bibliographic_note：基金会年表记载作者1947年流亡并在布宜诺斯艾利斯生活，另称1960年《El naranjal ardiente》选自此前未刊诗集；可限定为1947年流亡后、1960年出版前形成，现有来源不支持精确到1947年写成。1983年近完整第二版与1998年合集须分开记录。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0429','WCD-10-B07:V1-ENT-0505','V1-ENT-0505','collection','《黎明的夜莺及其他诗篇》','奥古斯托·罗亚·巴斯托斯','El ruiseñor de la aurora y otros poemas','巴拉圭','es','1942','诗集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《黎明的夜莺及其他诗篇》｜El ruiseñor de la aurora y otros poemas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1942
- genre_or_form：诗集
- one_sentence_summary：目录预览显示该诗集至少收录〈Pórtico〉、〈¿Quién?〉和〈En la callada noche〉，另有15个未展示的章节；基金会对1942年诗作的评论称其风格尚未统一，并举〈Voz menor para el oratorio de Romain Rolland〉为兼具史诗—抒情特征的作品。此处仅描述可见篇目及机构评论，不概括未查看的全书。
- bibliographic_note：CVC年表另记1952年在布宜诺斯艾利斯出版《El ruiseñor y la aurora》的“完整版本”；与1942年《El ruiseñor de la aurora y otros poemas》分层记录，现有来源未确定1952版的逐篇增删。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0430','WCD-10-B07:V1-ENT-0506','V1-ENT-0506','collection','《我所见的英格兰》','奥古斯托·罗亚·巴斯托斯','La Inglaterra que yo vi','巴拉圭','es','1946','新闻文章结集 / 旅行报道小册子','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《我所见的英格兰》｜La Inglaterra que yo vi

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1946
- genre_or_form：新闻文章结集 / 旅行报道小册子
- one_sentence_summary：据基金会与《墨西哥文学百科全书》作者条目，本书以作者首次欧洲之行为背景，结集其新闻文章、旅行观察及对路易斯·塞尔努达、安德烈·马尔罗、夏尔·戴高乐等人的访谈；FLM称其由《El País》以小册子形式出版。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0431','WCD-10-B07:V1-ENT-0507','V1-ENT-0507','work','《苏伊夫人》','奥古斯托·罗亚·巴斯托斯','Madama Sui','巴拉圭','es','1995','长篇小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《苏伊夫人》｜Madama Sui

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1995
- genre_or_form：长篇小说
- one_sentence_summary：Laura Welsch分析小说通过前言中的虚构作者A.R.B.及男性叙述者重构Sui的生命，并将其读作男性凝视投射的对象；论文还讨论小说中日本/东西方意象与被重新想象的巴拉圭历史之间的寓言联系。该概括仅归属于Welsch的阅读。
- bibliographic_note：Laura Welsch将《Madama Sui》标为1995年出版，并说明其研究引用的是1996年Seix Barral第二版；Instituto Cervantes书目列1996 Alfaguara版，基金会页面列1995，故把1995作为初版年、1996作为后续版本年，不再混作首发年份冲突。

#### 署名研究说明（research_note_only）

- Laura Welsch在Iberoamericana XXIII, 82 (2023), pp.217–235直接分析《Madama Sui》，主张小说中的Sui被男性叙述者重构为男性凝视的对象，并联系日本/东西方意象与被重塑的巴拉圭历史。此为该论文的明确阅读，不转写为作者意图或人物事实。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0432','WCD-10-B07:V1-ENT-0508','V1-ENT-0508','collection','《隐喻主义格言集》','奥古斯托·罗亚·巴斯托斯','Metaforismos','巴拉圭','es','1996','格言/警句类散文选集','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《隐喻主义格言集》｜Metaforismos

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1996
- genre_or_form：格言/警句类散文选集
- one_sentence_summary：WorldCat所载《拉丁美洲手册》摘要称本书汇集从已出版作品及未刊材料中选出的格言、箴言、谚语、悖论、寓言、警句、思绪和随笔，多数摘自《Yo el Supremo》；Google Books预览引作者说明，选材还来自未完成或毁弃的草稿、笔记本及书信。
- bibliographic_note：基金会版次页记Editorial El Lector、1996、primera edición；WorldCat记录Buenos Aires: Seix Barral, 1996, 1a ed.; Google Books另显示Edhasa, 1996。不同出版者的同年记录关系尚未查明，保留为版本差异，不静默选定单一出版者。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0433','WCD-10-B07:V1-ENT-0509','V1-ENT-0509','work','《游戏1：卡罗琳娜与加斯帕尔》','奥古斯托·罗亚·巴斯托斯','Los Juegos 1: Carolina y Gaspar','巴拉圭','es','1979','儿童故事书','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《游戏1：卡罗琳娜与加斯帕尔》｜Los Juegos 1: Carolina y Gaspar

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1979
- genre_or_form：儿童故事书
- one_sentence_summary：基金会公开片段中，Carolina与Gaspar反对教师Petra把昆虫钉在标本盒里，称这种“自然史”做法反自然；Gaspar说这是犯罪，Carolina追问死去的虫子如何还能教人。该片段说明书中儿童对僵化教学和捕捉昆虫的质疑，不据此概括全书。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0434','WCD-10-B07:V1-ENT-0510','V1-ENT-0510','collection','《被诅咒的文化》','奥古斯托·罗亚·巴斯托斯','Las culturas condenadas','巴拉圭','es','1978','编纂型文集／民族志与原住民口述、诗歌及仪式材料选编','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《被诅咒的文化》｜Las culturas condenadas

- 对象类型：collection
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- first_publication_year：1978
- genre_or_form：编纂型文集／民族志与原住民口述、诗歌及仪式材料选编
- one_sentence_summary：Google Books可见目录显示该书含Roa Bastos所作导言及M. Chase-Sardi署名的巴拉圭族群概要；Flores将全书描述为汇集多种民族志、诗歌与仪式来源的编纂，并分析其编者如何组织这些材料。本描述限于已见目录和论文实际论述，不把所有收录文本归为Roa独著。
- bibliographic_note：CVC Bibliografía称其为“compilación”，Siglo XXI, México, 1978；Google Books列Augusto Roa Bastos为Editor/Compiled by，并显示Siglo Veintiuno 1978。候选author_id仅对应编纂／编辑角色，非全书全部文本的唯一作者；页面未提供可建模的独立作者角色关系字段，故在书目说明中明确限界。

#### 署名研究说明（research_note_only）

- Enrique Flores的具名论文直接以《Las culturas condenadas》(1978)为研究对象，分析Roa Bastos作为编者如何汇集多源民族志、诗歌和仪式材料，以及编者／阐释者角色与作品复调结构的关系；论文摘要明确指出研究对象和编者问题，正文继续展开。此为对编纂行为与文集结构的学术解释，不转述为所有收录口述/田野材料由Roa原创。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0435','WCD-10-B07:V1-ENT-0193','V1-ENT-0193','work','《隧道》','埃内斯托·萨瓦托','El túnel','阿根廷','es','','novel','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《隧道》｜El túnel

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：novel
- one_sentence_summary：据出版社简介，因欺骗而中断的爱情使主人公以刀终结痛苦，作品呈现萨瓦托对存在的形而上视野；Sincronía论文称这名主人公为画家胡安·巴勃罗·卡斯特尔。

#### 署名研究说明（research_note_only）

- J. M. Delgado del Águila (2023) abstracts a study of Castel’s psychosis as a way of interpreting reality; this is a limited attribution to the article abstract, not a summary of the whole novel.

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0436','WCD-10-B07:V1-ENT-0194','V1-ENT-0194','work','《英雄与坟墓》','埃内斯托·萨瓦托','Sobre héroes y tumbas','阿根廷','es','','novel','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《英雄与坟墓》｜Sobre héroes y tumbas

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：novel
- one_sentence_summary：据出版社简介，小说以寻找自我的马丁为中心，呈现现代人的孤独与沟通困境。

#### 署名研究说明（research_note_only）

- Jhon Alexánder Monsalve Flórez’s abstract (Revista UIS Humanidades 41(2), issue 2013, pp.53–63; site posted 2015) analyzes the pessimistic outlook of Martín, Alejandra, Fernando and Bruno through Bobbio; Alejandro Hermosilla Sánchez’s abstract (Acta Literaria 33, 2006, pp.27–39) reads Martín’s journey as learning Argentina’s history.

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0437','WCD-10-B07:V1-ENT-0195','V1-ENT-0195','work','《毁灭者亚巴顿》','埃内斯托·萨瓦托','Abaddón el exterminador','阿根廷','es','','novel','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《毁灭者亚巴顿》｜Abaddón el exterminador

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：novel
- one_sentence_summary：据出版社简介，本书是三部曲的收束之作，以《盲人报告》的隐喻为发展线索，并将萨瓦托本人纳入小说人物。

#### 署名研究说明（research_note_only）

- Alejandro Hermosilla Sánchez (Enfoques 19(1–2), issue 2007; page date 2016) abstracts a mythic-symbolic reading linking the novel with 1970s Argentina; this reports the article’s stated lens, not a verified full-text conclusion.

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0438','WCD-10-B07:V1-ENT-0201','V1-ENT-0201','work','《莫雷尔的发明》','阿道夫·比奥伊·卡萨雷斯','La invención de Morel','阿根廷','es','','小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《莫雷尔的发明》｜La invención de Morel

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：据出版社简介，小说以一名逃亡者写下的日记、岛上神秘建筑及他爱上的一位冷漠女子构成叙事前提。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0439','WCD-10-B07:V1-ENT-0202','V1-ENT-0202','work','《逃亡计划》','阿道夫·比奥伊·卡萨雷斯','Plan de evasión','阿根廷','es','','小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《逃亡计划》｜Plan de evasión

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：据出版社简介，小说借法国圭亚那监狱群岛的安排及新任军官内韦尔斯的见闻，展开一场由延迟揭示的谜题构成的逃逸叙事。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0440','WCD-10-B07:V1-ENT-0203','V1-ENT-0203','work','《英雄的梦》','阿道夫·比奥伊·卡萨雷斯','El sueño de los héroes','阿根廷','es','','小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《英雄的梦》｜El sueño de los héroes

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：小说
- one_sentence_summary：据作品研究，1954年小说以埃米利亚诺·高纳和一段逐渐被重演的梦境/往事为叙事中心；此处仅作篇章对作品的有限释义。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0441','WCD-10-B07:V1-ENT-0204','V1-ENT-0204','work','《人子》','奥古斯托·罗亚·巴斯托斯','Hijo de hombre','巴拉圭','es','','长篇小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《人子》｜Hijo de hombre

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：据Zara对1980年代重写版的研究，小说以Gaspar Mora（木匠、制琴者、麻风病人）及其在Itapé雕刻木制基督像为叙事中心之一，故事把瓜拉尼口传与西语书写、巴拉圭战争史及神话框架交织起来；该概括对应研究所用重写版。

#### 署名研究说明（research_note_only）

- Juan Manuel Zara在《Gaspar Mora: fundamento mitológico y moral en Hijo de hombre》中以1983版（并参照1998年Sudamericana版）分析Gaspar Mora与木雕基督、历史/神话结构及西语书写和瓜拉尼口传的张力；此释义仅代表该论文的版本和论点。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0442','WCD-10-B07:V1-ENT-0205','V1-ENT-0205','work','《我，最高统帅》','奥古斯托·罗亚·巴斯托斯','Yo el Supremo','巴拉圭','es','','长篇小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《我，最高统帅》｜Yo el Supremo

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：Aguilera Navarrete区分编纂者叙事层与情节层：虚构的Compilador救出文书后开始编写最高统帅传记，统帅随后质疑这项工作；围绕贴在大教堂门上的告示及作者身份展开的情节，则以最高统帅和秘书Policarpo Patiño为主要对话主角。论文据此讨论口述、书写与权力。

#### 署名研究说明（research_note_only）

- Aguilera Navarrete从瓜拉尼口述与西班牙语书写的权力冲突解读该小说；Lupi将其书写/媒介形式与国家、技术和统治权力并置，但明确不主张控制论影响了小说或控制论是小说主题；Martinez则聚焦手迹、主权及文件/虚构。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。'),
('V1-CARD-0443','WCD-10-B07:V1-ENT-0206','V1-ENT-0206','work','《检察官》','奥古斯托·罗亚·巴斯托斯','El fiscal','巴拉圭','es','','长篇小说','WCD-10-B07','research_gap','RESEARCH-ONLY-NOT-CURATED','### 《检察官》｜El fiscal

- 对象类型：work
- 研究边界：本补充卡仅保存下列已复核事实和有归属的研究说明，不是策展批准。
- genre_or_form：长篇小说
- one_sentence_summary：小说围绕流亡者Félix Moral返回受独裁统治的巴拉圭并谋划刺杀统治者展开；计划失败后他遭受酷刑，最后由Jimena讲述他的命运和人民起义推翻独裁者。

#### 署名研究说明（research_note_only）

- Ravetti将Félix Moral的自我牺牲计划、受刑和独裁者被人民起义推翻的结局放在牺牲、道德/法律、暴力和权力关系中分析。

#### 未关闭的研究边界

本卡不升级任何既有 hold；未核实的文学解释或作品级学术研究保持 research_gap。');

INSERT INTO facts (fact_id,origin_material_id,card_id,subject_id,fact_field,value_text,material_class,origin_id,confidence,admission_status,usage_note) VALUES
('V1-FCT-1377','WCD10-B07-W001-F01','V1-CARD-0381','V1-ENT-0457','first_publication_year','1945','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1378','WCD10-B07-W001-F02','V1-CARD-0381','V1-ENT-0457','genre_or_form','essay','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1379','WCD10-B07-W001-F03','V1-CARD-0381','V1-ENT-0457','one_sentence_summary','文章集；据出版社简介，为萨瓦托首部著作，收入其1945年撰写的文章；国家图书馆称其批评科学表面上的中立性。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1380','WCD10-B07-W001-F04','V1-CARD-0381','V1-ENT-0457','research_note','Noelia M. Senarega 的摘要将本书列入四篇被研究的萨瓦托论说，并把分析范围限定为其中涉及的道德问题。','scholarly_paraphrase','WCD-10-B07','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1381','WCD10-B07-W002-F01','V1-CARD-0382','V1-ENT-0458','first_publication_year','1951','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1382','WCD10-B07-W002-F02','V1-CARD-0382','V1-ENT-0458','genre_or_form','essay','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1383','WCD10-B07-W002-F03','V1-CARD-0382','V1-ENT-0458','one_sentence_summary','出版社简介将其定位为围绕现代文化危机、科学技术、人的工具化及人文价值而展开的散文作品。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1384','WCD10-B07-W002-F04','V1-CARD-0382','V1-ENT-0458','research_note','Noelia M. Senarega 的摘要将本书列入四篇被研究的萨瓦托论说，并把分析范围限定为其中涉及的道德问题。','scholarly_paraphrase','WCD-10-B07','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1385','WCD10-B07-W003-F01','V1-CARD-0383','V1-ENT-0459','first_publication_year','1963','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1386','WCD10-B07-W003-F02','V1-CARD-0383','V1-ENT-0459','genre_or_form','essay','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1387','WCD10-B07-W003-F03','V1-CARD-0383','V1-ENT-0459','one_sentence_summary','据出版社转引作者序言，本书围绕“为什么、怎样、为了什么而写小说”这一持续困扰作者的问题展开。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1388','WCD10-B07-W004-F01','V1-CARD-0384','V1-ENT-0460','first_publication_year','1979','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1389','WCD10-B07-W004-F02','V1-CARD-0384','V1-ENT-0460','genre_or_form','essay collection','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1390','WCD10-B07-W004-F03','V1-CARD-0384','V1-ENT-0460','one_sentence_summary','出版社简介称本书汇集七篇较长文章；作者书目将其列为1979年出版的现代性与文学论说类作品。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1391','WCD10-B07-W005-F01','V1-CARD-0385','V1-ENT-0461','first_publication_year','1998','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1392','WCD10-B07-W005-F02','V1-CARD-0385','V1-ENT-0461','genre_or_form','memoir','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1393','WCD10-B07-W005-F03','V1-CARD-0385','V1-ENT-0461','one_sentence_summary','出版社将本书称为回忆录，叙述作者从科学职业经历转向文学与艺术的过程。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1394','WCD10-B07-W006-F01','V1-CARD-0386','V1-ENT-0462','first_publication_year','2000','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1395','WCD10-B07-W006-F02','V1-CARD-0386','V1-ENT-0462','genre_or_form','essay','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1396','WCD10-B07-W006-F03','V1-CARD-0386','V1-ENT-0462','one_sentence_summary','据出版社简介，本书由五封致读者的长信构成，讨论当代社会价值流失与技术社会中的非人化。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1397','WCD10-B07-W007-F01','V1-CARD-0387','V1-ENT-0463','first_publication_year','2004','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1398','WCD10-B07-W007-F02','V1-CARD-0387','V1-ENT-0463','genre_or_form','travel diary','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1399','WCD10-B07-W007-F03','V1-CARD-0387','V1-ENT-0463','one_sentence_summary','出版社简介称其以作者此前两年西班牙旅行经历为主轴，是记录行旅与个人状态的私密札记。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1400','WCD10-B07-W008-F01','V1-CARD-0388','V1-ENT-0464','first_publication_year','1956','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1401','WCD10-B07-W008-F02','V1-CARD-0388','V1-ENT-0464','genre_or_form','政治论说 / 致马里奥·阿马德奥的公开信','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1402','WCD10-B07-W008-F03','V1-CARD-0388','V1-ENT-0464','one_sentence_summary','UNNE catalogs the book as an open letter to Mario Amadeo; CEDINPE’s contents list includes “Las bases de la conciliación nacional.” Senarega’s abstract lists the book among four essays in her study of moral issues.','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1403','WCD10-B07-W008-F04','V1-CARD-0388','V1-ENT-0464','research_note','Noelia M. Senarega 的摘要将该书列为萨瓦托四篇论说之一，研究其涉及的道德问题及个人与社会群体间的对立倾向。此处仅归述摘要范围，不延伸为全书结论。','scholarly_paraphrase','WCD-10-B07','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1404','WCD10-B07-W009-F01','V1-CARD-0389','V1-ENT-0465','first_publication_year','1968','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1405','WCD10-B07-W009-F02','V1-CARD-0389','V1-ENT-0465','genre_or_form','literary-critical essay collection','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1406','WCD10-B07-W009-F03','V1-CARD-0389','V1-ENT-0465','one_sentence_summary','据馆藏编目题名、副题和主题词，本书由围绕Robbe-Grillet、Jorge Luis Borges与Jean-Paul Sartre的文学批评论说构成。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1407','WCD10-B07-W101-F01','V1-CARD-0390','V1-ENT-0466','first_publication_year','1969','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1408','WCD10-B07-W101-F02','V1-CARD-0390','V1-ENT-0466','genre_or_form','长篇小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1409','WCD10-B07-W101-F03','V1-CARD-0390','V1-ENT-0466','one_sentence_summary','据出版社简介，这部半奇幻小说写布宜诺斯艾利斯巴勒莫区年轻人与老年人之间突发的暴力冲突，以及主人公日常生活被袭击事件打乱。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1410','WCD10-B07-W102-F01','V1-CARD-0391','V1-ENT-0467','first_publication_year','1973','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1411','WCD10-B07-W102-F02','V1-CARD-0391','V1-ENT-0467','genre_or_form','书信体小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1412','WCD10-B07-W102-F03','V1-CARD-0391','V1-ENT-0467','one_sentence_summary','据出版社简介，钟表匠卢西奥写信讲述他与妻子戴安娜及训犬师斯坦德尔相识后的生活；作品后续将犬训练所与新式精神治疗带入叙事。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1413','WCD10-B07-W103-F01','V1-CARD-0392','V1-ENT-0468','first_publication_year','1948','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1414','WCD10-B07-W103-F02','V1-CARD-0392','V1-ENT-0468','genre_or_form','短篇小说集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1415','WCD10-B07-W103-F03','V1-CARD-0392','V1-ENT-0468','one_sentence_summary','据出版社简介，这部1948年故事集以表象与现实、平行世界及空间和时间游戏为叙事线索。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1416','WCD10-B07-W104-F01','V1-CARD-0393','V1-ENT-0469','first_publication_year','1956','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1417','WCD10-B07-W104-F02','V1-CARD-0393','V1-ENT-0469','genre_or_form','短篇小说集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1418','WCD10-B07-W104-F03','V1-CARD-0393','V1-ENT-0469','one_sentence_summary','据出版社简介，这部1956年在墨西哥初版的故事集收录1949至1955年间写成的六篇故事；简介概括其爱情、吸引力与命运主题，并补述同名故事的情节。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1419','WCD10-B07-W105-F01','V1-CARD-0394','V1-ENT-0470','first_publication_year','1959','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1420','WCD10-B07-W105-F02','V1-CARD-0394','V1-ENT-0470','genre_or_form','杂集（含故事、格言与寓言）','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1421','WCD10-B07-W105-F03','V1-CARD-0394','V1-ENT-0470','one_sentence_summary','据出版社介绍，作者将本书称作“杂集”：全书十一部分交替安排短篇叙事与日常/哲理格言；不将其简化成单一小说或纯故事集。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1422','WCD10-B07-W106-F01','V1-CARD-0395','V1-ENT-0471','first_publication_year','1967','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1423','WCD10-B07-W106-F02','V1-CARD-0395','V1-ENT-0471','genre_or_form','短篇小说集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1424','WCD10-B07-W106-F03','V1-CARD-0395','V1-ENT-0471','one_sentence_summary','据出版社简介，此集含十篇故事，场景从蒙得维的亚到潘帕斯；简介列出超自然事件、日常转为奇幻及爱情等要素。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1425','WCD10-B07-W107-F01','V1-CARD-0396','V1-ENT-0472','first_publication_year','1985','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1426','WCD10-B07-W107-F02','V1-CARD-0396','V1-ENT-0472','genre_or_form','长篇小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1427','WCD10-B07-W107-F03','V1-CARD-0396','V1-ENT-0472','one_sentence_summary','据出版社对后编选集所收该书的简介，摄影师尼古拉斯·阿尔曼萨受派到拉普拉塔拍摄城市图册，结识伦巴多家族；简介提及幽默和恐怖成分。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1428','WCD10-B07-W108-F01','V1-CARD-0397','V1-ENT-0473','first_publication_year','1993','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1429','WCD10-B07-W108-F02','V1-CARD-0397','V1-ENT-0473','genre_or_form','长篇小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1430','WCD10-B07-W108-F03','V1-CARD-0397','V1-ENT-0473','one_sentence_summary','据出版社对后编选集所收该书的简介，出租车司机路易斯·安赫尔·莫拉莱斯因乘客给的饮剂而逐渐摆脱原有拘谨，并显露与拳击有关的身手。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1431','WCD10-B07-W109-F01','V1-CARD-0398','V1-ENT-0474','first_publication_year','1998','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1432','WCD10-B07-W109-F02','V1-CARD-0398','V1-ENT-0474','genre_or_form','长篇小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1433','WCD10-B07-W109-F03','V1-CARD-0398','V1-ENT-0474','one_sentence_summary','据出版社对后编选集所收该书的简介，记者哈维尔·阿尔马格罗与女友玛格丽塔展开一次星际远征。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1434','WCD10-B07-W110-F01','V1-CARD-0399','V1-ENT-0475','first_publication_year','1962','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1435','WCD10-B07-W110-F02','V1-CARD-0399','V1-ENT-0475','genre_or_form','短篇小说集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1436','WCD10-B07-W110-F03','V1-CARD-0399','V1-ENT-0475','one_sentence_summary','据出版社介绍，该短篇集收录十篇1962年发表的故事；其中同名故事与《Los afanes》从不同角度重访《La invención de Morel》的若干主题。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1437','WCD10-B07-W111-F01','V1-CARD-0400','V1-ENT-0476','first_publication_year','1978','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1438','WCD10-B07-W111-F02','V1-CARD-0400','V1-ENT-0476','genre_or_form','短篇小说集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1439','WCD10-B07-W111-F03','V1-CARD-0400','V1-ENT-0476','one_sentence_summary','据出版社简介，这部短篇集反复描写男性人物受命运支配、女性成为最后希望或警讯的戏剧情境。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1440','WCD10-B07-W112-F01','V1-CARD-0401','V1-ENT-0477','first_publication_year','1986','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1441','WCD10-B07-W112-F02','V1-CARD-0401','V1-ENT-0477','genre_or_form','短篇小说集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1442','WCD10-B07-W112-F03','V1-CARD-0401','V1-ENT-0477','one_sentence_summary','据Teobaldi对集内《Máscaras venecianas》的分析，该篇写叙述者病后赴威尼斯、与妻子分离，并以克隆/相似者问题展开关于双重身份的幻想叙事；此说明仅限该单篇。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1443','WCD10-B07-W113-F01','V1-CARD-0402','V1-ENT-0478','first_publication_year','1991','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1444','WCD10-B07-W113-F02','V1-CARD-0402','V1-ENT-0478','genre_or_form','短篇小说集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1445','WCD10-B07-W113-F03','V1-CARD-0402','V1-ENT-0478','one_sentence_summary','据Tusquets出版社对该集的简介，集中的日常小事逐渐带入难以捉摸的陌生或异化感；简介以《Un encuentro en Rauch》举例。此为整集的出版社概述，不据此推定同名篇的目录归属或具体情节。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1446','WCD10-B07-W114-F01','V1-CARD-0403','V1-ENT-0479','first_publication_year','1997','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1447','WCD10-B07-W114-F02','V1-CARD-0403','V1-ENT-0479','genre_or_form','短篇小说集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1448','WCD10-B07-W114-F03','V1-CARD-0403','V1-ENT-0479','one_sentence_summary','据Gambetta Chuk对集内《El último piso》的解读，故事围绕似有似无的第九层、主人公“Bioy”与Margarita的相遇，以及现实/梦幻边界展开；此说明只指该单篇，不代表全书。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1449','WCD10-B07-W115-F01','V1-CARD-0404','V1-ENT-0480','first_publication_year','1968','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1450','WCD10-B07-W115-F02','V1-CARD-0404','V1-ENT-0480','genre_or_form','essay collection (prologues and articles)','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1451','WCD10-B07-W115-F03','V1-CARD-0404','V1-ENT-0480','one_sentence_summary','出版社在后来的非虚构合编本中称1968年原作是一组序言与文章，并举出关于《La Celestina》原创性的分析和作者与Borges友谊的短文；释义限于出版社列出的例项。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1452','WCD10-B07-W116-F01','V1-CARD-0405','V1-ENT-0481','first_publication_year','1994','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1453','WCD10-B07-W116-F02','V1-CARD-0405','V1-ENT-0481','genre_or_form','autobiographical memoir','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1454','WCD10-B07-W116-F03','V1-CARD-0405','V1-ENT-0481','one_sentence_summary','据Tusquets出版社简介，作品以作者从童年到成年的人生经历为线索，涉及Borges、Silvina Ocampo、家人、书籍与城市，并反思生活如何经书写转化为文学；属于作者回忆录，不把参与编辑/编排者列为共同作者。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1455','WCD10-B07-W117-F01','V1-CARD-0406','V1-ENT-0482','first_publication_year','1997','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1456','WCD10-B07-W117-F02','V1-CARD-0406','V1-ENT-0482','genre_or_form','reader’s anthology / miscellany of quotations and poems','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1457','WCD10-B07-W117-F03','V1-CARD-0406','V1-ENT-0482','one_sentence_summary','据Mariano García对该书的直接讨论，Bioy称其为“libro abierto”，汇集其多年抄录的短诗与散文片段，是带有作者编选痕迹的阅读者选集；以编选身份描述，不把被引作者列为合著者。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1458','WCD10-B07-W118-F01','V1-CARD-0407','V1-ENT-0483','first_publication_year','1999','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1459','WCD10-B07-W118-F02','V1-CARD-0407','V1-ENT-0483','genre_or_form','nonfiction essays / reflections','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1460','WCD10-B07-W118-F03','V1-CARD-0407','V1-ENT-0483','one_sentence_summary','出版社在非虚构合编本中把1999年原作描述为旨在帮助读者认识自身的反思性作品；本包不把宣传性概括扩展成更具体的主题断言。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1461','WCD10-B07-W119-F01','V1-CARD-0408','V1-ENT-0484','first_publication_year','2001','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1462','WCD10-B07-W119-F02','V1-CARD-0408','V1-ENT-0484','genre_or_form','posthumous selection of intimate diaries and notebooks, edited by Daniel Martino','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1463','WCD10-B07-W119-F03','V1-CARD-0408','V1-ENT-0484','one_sentence_summary','据Daniel Martino的同期后记，Bioy本人决定将这些日记/笔记本统称为Descanso de caminantes；选本中的反思、逸事、谈话、梦和故事构想，构成对自身行为与日常生活的回顾。此处将Martino记为编者而非合著者。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1464','WCD10-B07-W120-F01','V1-CARD-0409','V1-ENT-0485','first_publication_year','2006','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1465','WCD10-B07-W120-F02','V1-CARD-0409','V1-ENT-0485','genre_or_form','posthumous selection from Bioy’s diary, edited by Daniel Martino','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1466','WCD10-B07-W120-F03','V1-CARD-0409','V1-ENT-0485','one_sentence_summary','据Manuela Barral对该书的研究，Borges是从Bioy私人文本中筛选与Borges相关的日记内容、以年份分节的遗作；作品记录两人对话，同时呈现Bioy作为记录者的视角。Borges是被记录者，不据书名列为共同作者。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1467','WCD10-B07-W121-F01','V1-CARD-0410','V1-ENT-0486','first_publication_year','1996','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1468','WCD10-B07-W121-F02','V1-CARD-0410','V1-ENT-0486','genre_or_form','letters / travel writing drawn from letters written in 1967','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1469','WCD10-B07-W121-F03','V1-CARD-0410','V1-ENT-0486','one_sentence_summary','据出版社对后来的Tusquets版次的介绍，作品记录Bioy 1967年独自欧洲旅行；2014年研究文献将其书目出版标为1996年并说明这一自传性文本属于写给妻子与女儿的信件。此处区分信件写作时间、首次结集年和当前1997版次。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1470','WCD10-B07-W122-F01','V1-CARD-0411','V1-ENT-0487','first_publication_year','1970','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1471','WCD10-B07-W122-F02','V1-CARD-0411','V1-ENT-0487','genre_or_form','nonfiction prose essay','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1472','WCD10-B07-W122-F03','V1-CARD-0411','V1-ENT-0487','one_sentence_summary','据Carmen Balcells文学代理页面，作者从童年对“pampa”和“gaucho”一词的早期困惑写起，并反思这些词语与阿根廷国家/爱国想象的关系；只概述页面披露的文字内容。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1473','WCD10-B07-W123-F01','V1-CARD-0412','V1-ENT-0488','first_publication_year','1971','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1474','WCD10-B07-W123-F02','V1-CARD-0412','V1-ENT-0488','genre_or_form','lexicographic book / satirical dictionary','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1475','WCD10-B07-W123-F03','V1-CARD-0412','V1-ENT-0488','one_sentence_summary','据Mariano García的直接研究，这部词典以虚构词条、人物和对语言使用的戏谑性处理构造其词典形式；1971年初版使用Javier Miranda笔名，1978年起的版本署Adolfo Bioy Casares。此处保留题名、作者笔名和后版身份差异。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1476','WCD10-B07-W124-F01','V1-CARD-0413','V1-ENT-0489','first_publication_year','1936','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1477','WCD10-B07-W124-F02','V1-CARD-0413','V1-ENT-0489','genre_or_form','杂集（混合散文、短篇叙事与短篇文论；不归为单一小说体裁）','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1478','WCD10-B07-W124-F03','V1-CARD-0413','V1-ENT-0489','one_sentence_summary','据García对原书的直接讨论，本书由实验性短篇叙事和反思性文字构成，包含《El hermano de la nonata》《Locus》《Utilidad y fin práctico》及《Sobre la técnica de los cuentos fantásticos》等不同文本；此说明概括其杂集构成，不把任何单篇另作合集身份。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1479','WCD10-B07-W125-F01','V1-CARD-0414','V1-ENT-0490','first_publication_year','1944','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1480','WCD10-B07-W125-F02','V1-CARD-0414','V1-ENT-0490','genre_or_form','cuento / 短篇小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1481','WCD10-B07-W125-F03','V1-CARD-0414','V1-ENT-0490','one_sentence_summary','据Amparo Reyes Velázquez对故事的梗概，记者Juan Luis Villafañe与诗人Carlos Oribe来到巴塔哥尼亚庄园La Adela，卷入鳏夫Luis Vermehren及其四名女儿封闭而重复的生活；José Miguel Rodríguez Zamora的研究指出，故事将时间停滞的奇异情节与侦探叙事并置。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1482','WCD10-B07-W125-F04','V1-CARD-0414','V1-ENT-0490','bibliographic_note','初版年份存在1944/1945来源分歧：Google Books目录列Emecé 1944年单行本、64页；Reyes Velázquez与Rodríguez Zamora的直接研究均称 cuento 于1944年出版；Carlos Dámaso Martínez的CVC作者传记则记1945年。本提案依据单行本目录与两项直接研究采用1944，同时保留1945异说供审核；后收入故事集的版本不作为首发证据。','bibliographic_note','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1483','WCD10-B07-W126-F01','V1-CARD-0415','V1-ENT-0491','first_publication_year','1949','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1484','WCD10-B07-W126-F02','V1-CARD-0415','V1-ENT-0491','genre_or_form','cuento / 短篇小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1485','WCD10-B07-W126-F03','V1-CARD-0415','V1-ENT-0491','one_sentence_summary','故事聚焦浮士德生命最后一夜：他与仆人瓦格纳及狗Señor等待午夜到来，在魔鬼索取灵魂前仍面对逃避或接受的抉择。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1486','WCD10-B07-W127-F01','V1-CARD-0416','V1-ENT-0492','first_publication_year','1954','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1487','WCD10-B07-W127-F02','V1-CARD-0416','V1-ENT-0492','genre_or_form','cuento / 短篇小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1488','WCD10-B07-W127-F03','V1-CARD-0416','V1-ENT-0492','one_sentence_summary','单篇以阿根廷一位流亡蒙得维的亚的单一派诗人为中心：他返回布宜诺斯艾利斯后遭mazorqueros杀害。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1489','WCD10-B07-W128-F01','V1-CARD-0417','V1-ENT-0493','first_publication_year','1946','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1490','WCD10-B07-W128-F02','V1-CARD-0417','V1-ENT-0493','genre_or_form','novela policial / 侦探小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1491','WCD10-B07-W128-F03','V1-CARD-0417','V1-ENT-0493','one_sentence_summary','孤立海滨旅馆遭风暴围困期间发生投毒命案与失踪，医生Humberto Huberman被卷入复仇与未竟爱情，旅客在数夜封闭环境中成为嫌疑人。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1492','WCD10-B07-W128-F04','V1-CARD-0417','V1-ENT-0493','bibliographic_note','CVC书目与编年（S101、S102）均将这部合著侦探小说列于1946年；Emecé press sheet作者简介第0页L36–37则称1945年。该press sheet标注“Fecha de publicación: 01/07/2016”，这是所述当前书版日期；PDF没有单独的网页上线日期，且2016不是作品初版年。本提案以CVC书目/编年支持1946，保留出版社简介中的1945异说；不把2016版年作为首发年。','bibliographic_note','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1493','WCD10-B07-W129-F01','V1-CARD-0418','V1-ENT-0494','first_publication_year','1940','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1494','WCD10-B07-W129-F02','V1-CARD-0418','V1-ENT-0494','genre_or_form','奇幻文学选集（共同编选、翻译）','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1495','WCD10-B07-W129-F03','V1-CARD-0418','V1-ENT-0494','one_sentence_summary','该选集汇集H. G. Wells、Franz Kafka、Rudyard Kipling等作者作品，并收入Macedonio Fernández、Silvina Ocampo与Jorge Luis Borges的文本；Bioy另撰序。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1496','WCD10-B07-W201-F01','V1-CARD-0419','V1-ENT-0495','first_publication_year','1953','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1497','WCD10-B07-W201-F02','V1-CARD-0419','V1-ENT-0495','genre_or_form','短篇小说集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1498','WCD10-B07-W201-F03','V1-CARD-0419','V1-ENT-0495','one_sentence_summary','据基金会对集首尾故事的说明，“Carpincheros”中的人物在同名末篇再次出现；基金会小说页称该人物为Gretchen，而短篇集页称Margaret，故此处保留两页各自的姓名，不合并为单一无异名的人物表述。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1499','WCD10-B07-W201-F04','V1-CARD-0419','V1-ENT-0495','research_note','An Van Hecke将该书分析为具有内在统一性的短篇集/“integrated stories”，讨论神话、梦、社会政治观念及西语—瓜拉尼语双语。','scholarly_paraphrase','WCD-10-B07','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1500','WCD10-B07-W202-F01','V1-CARD-0420','V1-ENT-0496','first_publication_year','1966','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1501','WCD10-B07-W202-F02','V1-CARD-0420','V1-ENT-0496','genre_or_form','短篇小说集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1502','WCD10-B07-W202-F03','V1-CARD-0420','V1-ENT-0496','one_sentence_summary','据基金会作品页，该短篇集以人物的具体言行呈现巴拉圭社会生活，采用干涩、动荡而哀痛的现实主义叙述，不以解释性旁白替人物概括处境。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1503','WCD10-B07-W203-F01','V1-CARD-0421','V1-ENT-0497','first_publication_year','1967','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1504','WCD10-B07-W203-F02','V1-CARD-0421','V1-ENT-0497','genre_or_form','短篇小说集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1505','WCD10-B07-W203-F03','V1-CARD-0421','V1-ENT-0497','one_sentence_summary','据基金会说明，该集纳入新写短篇并重收部分此前作品；它与《木材燃烧》等集在单篇选入及改写上有交叉，故书集和单篇作品须分层记录。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1506','WCD10-B07-W204-F01','V1-CARD-0422','V1-ENT-0498','first_publication_year','1967','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1507','WCD10-B07-W204-F02','V1-CARD-0422','V1-ENT-0498','genre_or_form','短篇小说集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1508','WCD10-B07-W204-F03','V1-CARD-0422','V1-ENT-0498','one_sentence_summary','据基金会版本说明，“Madera quemada”既是1967年短篇集名，也是一篇在《人子》首版后被独立编入短篇集、并于1980年代重写版重新收入小说的文本；本对象指书集，不等同其中单篇或小说章节。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1509','WCD10-B07-W205-F01','V1-CARD-0423','V1-ENT-0499','first_publication_year','1969','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1510','WCD10-B07-W205-F02','V1-CARD-0423','V1-ENT-0499','genre_or_form','短篇小说集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1511','WCD10-B07-W205-F03','V1-CARD-0423','V1-ENT-0499','one_sentence_summary','据基金会说明，该书汇集两组不同写作时期的短篇：一组写于1967年并属于仍在发展的故事循环，另一组写于1955—1960年，收入时经作者选择、修改或重写。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1512','WCD10-B07-W206-F01','V1-CARD-0424','V1-ENT-0500','first_publication_year','1971','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1513','WCD10-B07-W206-F02','V1-CARD-0424','V1-ENT-0500','genre_or_form','短篇小说集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1514','WCD10-B07-W206-F03','V1-CARD-0424','V1-ENT-0500','one_sentence_summary','乌拉圭立法图书馆目录将此对象著录为CELA、c1971的印刷合集，并列出九篇：〈Nonato〉、〈Cuando un pájaro entierra sus plumas〉、〈Función〉、〈Moriencia〉、〈Bajo el puente〉、〈Macario〉、〈Borrador de un informe〉、〈Hogar〉与〈La excavación〉。基金会另列1972年《Cuerpo presente y otros textos》；可见资料确认题名和年代各异，但未解决两者是否为选集、重版或相关版本关系，因此不把1972年内容移用于此1971年对象。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1515','WCD10-B07-W206-F04','V1-CARD-0424','V1-ENT-0500','bibliographic_note','乌拉圭立法图书馆记录为 [Buenos Aires] : CELA, c1971；丛书 Biblioteca Básica Universal 137；127页。基金会另列 Cuerpo presente y otros textos (1972)，并称后者含两段 Hijo de hombre；两条目录是不同题名/年代记录，现有来源未证实其版本关系。','bibliographic_note','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1516','WCD10-B07-W207-F01','V1-CARD-0425','V1-ENT-0501','first_publication_year','1974','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1517','WCD10-B07-W207-F02','V1-CARD-0425','V1-ENT-0501','genre_or_form','儿童故事','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1518','WCD10-B07-W207-F03','V1-CARD-0425','V1-ENT-0501','one_sentence_summary','基金会所载故事中，成人向孩子讲述小鸡Pipiolín变为火焰小鸡的经历；它点燃鸡舍，之后投入溪流与蛇搏斗，长成彩羽公鸡。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1519','WCD10-B07-W208-F01','V1-CARD-0426','V1-ENT-0502','first_publication_year','1992','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1520','WCD10-B07-W208-F02','V1-CARD-0426','V1-ENT-0502','genre_or_form','长篇小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1521','WCD10-B07-W208-F03','V1-CARD-0426','V1-ENT-0502','one_sentence_summary','作者将本书描述为“混合”的历史虚构：以哥伦布为对象，在两个相矛盾的历史/文化世界间，想象海军上将失落的名字、记忆及其历史形象。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1522','WCD10-B07-W209-F01','V1-CARD-0427','V1-ENT-0503','first_publication_year','1994','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1523','WCD10-B07-W209-F02','V1-CARD-0427','V1-ENT-0503','genre_or_form','长篇小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1524','WCD10-B07-W209-F03','V1-CARD-0427','V1-ENT-0503','one_sentence_summary','原版副文本介绍：小说第一人称叙述者是越狱与监狱屠杀的唯一幸存者，该事件与短篇“La excavación”相连；基金会另指出Nonato/教师Cristaldo成为小说叙事中心，并有先前小说人物重现。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1525','WCD10-B07-W210-F01','V1-CARD-0428','V1-ENT-0504','first_publication_year','1960','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1526','WCD10-B07-W210-F02','V1-CARD-0428','V1-ENT-0504','genre_or_form','诗集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1527','WCD10-B07-W210-F03','V1-CARD-0428','V1-ENT-0504','one_sentence_summary','基金会称《El naranjal ardiente》为作者第二部诗集：1960年出版的是较早未刊诗稿的选本；基金会另称1983年出版近乎完整的第二版。其Antologías页将早期与新作、以及《Silenciario》收入“Poesías Reunidas”(1998)的当前卷，故不把这些内容归到1983版。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1528','WCD10-B07-W210-F04','V1-CARD-0428','V1-ENT-0504','bibliographic_note','基金会年表记载作者1947年流亡并在布宜诺斯艾利斯生活，另称1960年《El naranjal ardiente》选自此前未刊诗集；可限定为1947年流亡后、1960年出版前形成，现有来源不支持精确到1947年写成。1983年近完整第二版与1998年合集须分开记录。','bibliographic_note','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1529','WCD10-B07-W212-F01','V1-CARD-0429','V1-ENT-0505','first_publication_year','1942','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1530','WCD10-B07-W212-F02','V1-CARD-0429','V1-ENT-0505','genre_or_form','诗集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1531','WCD10-B07-W212-F03','V1-CARD-0429','V1-ENT-0505','one_sentence_summary','目录预览显示该诗集至少收录〈Pórtico〉、〈¿Quién?〉和〈En la callada noche〉，另有15个未展示的章节；基金会对1942年诗作的评论称其风格尚未统一，并举〈Voz menor para el oratorio de Romain Rolland〉为兼具史诗—抒情特征的作品。此处仅描述可见篇目及机构评论，不概括未查看的全书。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1532','WCD10-B07-W212-F04','V1-CARD-0429','V1-ENT-0505','bibliographic_note','CVC年表另记1952年在布宜诺斯艾利斯出版《El ruiseñor y la aurora》的“完整版本”；与1942年《El ruiseñor de la aurora y otros poemas》分层记录，现有来源未确定1952版的逐篇增删。','bibliographic_note','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1533','WCD10-B07-W213-F01','V1-CARD-0430','V1-ENT-0506','first_publication_year','1946','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1534','WCD10-B07-W213-F02','V1-CARD-0430','V1-ENT-0506','genre_or_form','新闻文章结集 / 旅行报道小册子','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1535','WCD10-B07-W213-F03','V1-CARD-0430','V1-ENT-0506','one_sentence_summary','据基金会与《墨西哥文学百科全书》作者条目，本书以作者首次欧洲之行为背景，结集其新闻文章、旅行观察及对路易斯·塞尔努达、安德烈·马尔罗、夏尔·戴高乐等人的访谈；FLM称其由《El País》以小册子形式出版。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1536','WCD10-B07-W214-F01','V1-CARD-0431','V1-ENT-0507','first_publication_year','1995','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1537','WCD10-B07-W214-F02','V1-CARD-0431','V1-ENT-0507','genre_or_form','长篇小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1538','WCD10-B07-W214-F03','V1-CARD-0431','V1-ENT-0507','one_sentence_summary','Laura Welsch分析小说通过前言中的虚构作者A.R.B.及男性叙述者重构Sui的生命，并将其读作男性凝视投射的对象；论文还讨论小说中日本/东西方意象与被重新想象的巴拉圭历史之间的寓言联系。该概括仅归属于Welsch的阅读。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1539','WCD10-B07-W214-F04','V1-CARD-0431','V1-ENT-0507','bibliographic_note','Laura Welsch将《Madama Sui》标为1995年出版，并说明其研究引用的是1996年Seix Barral第二版；Instituto Cervantes书目列1996 Alfaguara版，基金会页面列1995，故把1995作为初版年、1996作为后续版本年，不再混作首发年份冲突。','bibliographic_note','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1540','WCD10-B07-W214-F05','V1-CARD-0431','V1-ENT-0507','research_note','Laura Welsch在Iberoamericana XXIII, 82 (2023), pp.217–235直接分析《Madama Sui》，主张小说中的Sui被男性叙述者重构为男性凝视的对象，并联系日本/东西方意象与被重塑的巴拉圭历史。此为该论文的明确阅读，不转写为作者意图或人物事实。','scholarly_paraphrase','WCD-10-B07','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1541','WCD10-B07-W215-F01','V1-CARD-0432','V1-ENT-0508','first_publication_year','1996','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1542','WCD10-B07-W215-F02','V1-CARD-0432','V1-ENT-0508','genre_or_form','格言/警句类散文选集','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1543','WCD10-B07-W215-F03','V1-CARD-0432','V1-ENT-0508','one_sentence_summary','WorldCat所载《拉丁美洲手册》摘要称本书汇集从已出版作品及未刊材料中选出的格言、箴言、谚语、悖论、寓言、警句、思绪和随笔，多数摘自《Yo el Supremo》；Google Books预览引作者说明，选材还来自未完成或毁弃的草稿、笔记本及书信。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1544','WCD10-B07-W215-F04','V1-CARD-0432','V1-ENT-0508','bibliographic_note','基金会版次页记Editorial El Lector、1996、primera edición；WorldCat记录Buenos Aires: Seix Barral, 1996, 1a ed.; Google Books另显示Edhasa, 1996。不同出版者的同年记录关系尚未查明，保留为版本差异，不静默选定单一出版者。','bibliographic_note','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1545','WCD10-B07-W216-F01','V1-CARD-0433','V1-ENT-0509','first_publication_year','1979','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1546','WCD10-B07-W216-F02','V1-CARD-0433','V1-ENT-0509','genre_or_form','儿童故事书','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1547','WCD10-B07-W216-F03','V1-CARD-0433','V1-ENT-0509','one_sentence_summary','基金会公开片段中，Carolina与Gaspar反对教师Petra把昆虫钉在标本盒里，称这种“自然史”做法反自然；Gaspar说这是犯罪，Carolina追问死去的虫子如何还能教人。该片段说明书中儿童对僵化教学和捕捉昆虫的质疑，不据此概括全书。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1548','WCD10-B07-W217-F01','V1-CARD-0434','V1-ENT-0510','first_publication_year','1978','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1549','WCD10-B07-W217-F02','V1-CARD-0434','V1-ENT-0510','genre_or_form','编纂型文集／民族志与原住民口述、诗歌及仪式材料选编','bibliographic','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1550','WCD10-B07-W217-F03','V1-CARD-0434','V1-ENT-0510','one_sentence_summary','Google Books可见目录显示该书含Roa Bastos所作导言及M. Chase-Sardi署名的巴拉圭族群概要；Flores将全书描述为汇集多种民族志、诗歌与仪式来源的编纂，并分析其编者如何组织这些材料。本描述限于已见目录和论文实际论述，不把所有收录文本归为Roa独著。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1551','WCD10-B07-W217-F04','V1-CARD-0434','V1-ENT-0510','bibliographic_note','CVC Bibliografía称其为“compilación”，Siglo XXI, México, 1978；Google Books列Augusto Roa Bastos为Editor/Compiled by，并显示Siglo Veintiuno 1978。候选author_id仅对应编纂／编辑角色，非全书全部文本的唯一作者；页面未提供可建模的独立作者角色关系字段，故在书目说明中明确限界。','bibliographic_note','WCD-10-B07','high','batch_retained_candidate','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1552','WCD10-B07-W217-F05','V1-CARD-0434','V1-ENT-0510','research_note','Enrique Flores的具名论文直接以《Las culturas condenadas》(1978)为研究对象，分析Roa Bastos作为编者如何汇集多源民族志、诗歌和仪式材料，以及编者／阐释者角色与作品复调结构的关系；论文摘要明确指出研究对象和编者问题，正文继续展开。此为对编纂行为与文集结构的学术解释，不转述为所有收录口述/田野材料由Roa原创。','scholarly_paraphrase','WCD-10-B07','high','research_note_only','Research-only; independent candidate review PASS; no public admission'),
('V1-FCT-1553','WCD10-B07-F001','V1-CARD-0435','V1-ENT-0193','genre_or_form','novel','bibliographic','WCD-10-B07','high','batch_retained_candidate','Fresh work-level supplementary fact only; old facts, cards and source chains remain unchanged. Publisher summary is attributed; no extra interpretation or relationship is inferred.'),
('V1-FCT-1554','WCD10-B07-F002','V1-CARD-0435','V1-ENT-0193','one_sentence_summary','据出版社简介，因欺骗而中断的爱情使主人公以刀终结痛苦，作品呈现萨瓦托对存在的形而上视野；Sincronía论文称这名主人公为画家胡安·巴勃罗·卡斯特尔。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Fresh work-level supplementary fact only; old facts, cards and source chains remain unchanged. Publisher summary is attributed; no extra interpretation or relationship is inferred.'),
('V1-FCT-1555','WCD10-B07-F003','V1-CARD-0435','V1-ENT-0193','research_note','J. M. Delgado del Águila (2023) abstracts a study of Castel’s psychosis as a way of interpreting reality; this is a limited attribution to the article abstract, not a summary of the whole novel.','scholarly_paraphrase','WCD-10-B07','high','research_note_only','Research note reports only the named article abstract’s stated scope and is not a whole-book interpretation or full-text claim.'),
('V1-FCT-1556','WCD10-B07-F004','V1-CARD-0436','V1-ENT-0194','genre_or_form','novel','bibliographic','WCD-10-B07','high','batch_retained_candidate','Fresh work-level supplementary fact only; old facts, cards and source chains remain unchanged. Publisher summary is attributed; no extra interpretation or relationship is inferred.'),
('V1-FCT-1557','WCD10-B07-F005','V1-CARD-0436','V1-ENT-0194','one_sentence_summary','据出版社简介，小说以寻找自我的马丁为中心，呈现现代人的孤独与沟通困境。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Fresh work-level supplementary fact only; old facts, cards and source chains remain unchanged. Publisher summary is attributed; no extra interpretation or relationship is inferred.'),
('V1-FCT-1558','WCD10-B07-F006','V1-CARD-0436','V1-ENT-0194','research_note','Jhon Alexánder Monsalve Flórez’s abstract (Revista UIS Humanidades 41(2), issue 2013, pp.53–63; site posted 2015) analyzes the pessimistic outlook of Martín, Alejandra, Fernando and Bruno through Bobbio; Alejandro Hermosilla Sánchez’s abstract (Acta Literaria 33, 2006, pp.27–39) reads Martín’s journey as learning Argentina’s history.','scholarly_paraphrase','WCD-10-B07','high','research_note_only','Research note reports only the named article abstract’s stated scope and is not a whole-book interpretation or full-text claim.'),
('V1-FCT-1559','WCD10-B07-F007','V1-CARD-0437','V1-ENT-0195','genre_or_form','novel','bibliographic','WCD-10-B07','high','batch_retained_candidate','Fresh work-level supplementary fact only; old facts, cards and source chains remain unchanged. Publisher summary is attributed; no extra interpretation or relationship is inferred.'),
('V1-FCT-1560','WCD10-B07-F008','V1-CARD-0437','V1-ENT-0195','one_sentence_summary','据出版社简介，本书是三部曲的收束之作，以《盲人报告》的隐喻为发展线索，并将萨瓦托本人纳入小说人物。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Fresh work-level supplementary fact only; old facts, cards and source chains remain unchanged. Publisher summary is attributed; no extra interpretation or relationship is inferred.'),
('V1-FCT-1561','WCD10-B07-F009','V1-CARD-0437','V1-ENT-0195','research_note','Alejandro Hermosilla Sánchez (Enfoques 19(1–2), issue 2007; page date 2016) abstracts a mythic-symbolic reading linking the novel with 1970s Argentina; this reports the article’s stated lens, not a verified full-text conclusion.','scholarly_paraphrase','WCD-10-B07','high','research_note_only','Research note reports only the named article abstract’s stated scope and is not a whole-book interpretation or full-text claim.'),
('V1-FCT-1562','WCD10-B07-F101','V1-CARD-0438','V1-ENT-0201','genre_or_form','小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','publisher lines 484–490 explicitly call it a novel; current edition date not used.'),
('V1-FCT-1563','WCD10-B07-F102','V1-CARD-0438','V1-ENT-0201','one_sentence_summary','据出版社简介，小说以一名逃亡者写下的日记、岛上神秘建筑及他爱上的一位冷漠女子构成叙事前提。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','publisher lines 484–490; synopsis only, not a complete plot.'),
('V1-FCT-1564','WCD10-B07-F103','V1-CARD-0439','V1-ENT-0202','genre_or_form','小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','current publisher page names the book and author; CVC catalogue categorizes under novels.'),
('V1-FCT-1565','WCD10-B07-F104','V1-CARD-0439','V1-ENT-0202','one_sentence_summary','据出版社简介，小说借法国圭亚那监狱群岛的安排及新任军官内韦尔斯的见闻，展开一场由延迟揭示的谜题构成的逃逸叙事。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','current publisher synopsis lines 980–983; descriptive synopsis only.'),
('V1-FCT-1566','WCD10-B07-F105','V1-CARD-0440','V1-ENT-0203','genre_or_form','小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','CVC catalogue novel category; scholarly chapter is work-specific.'),
('V1-FCT-1567','WCD10-B07-F106','V1-CARD-0440','V1-ENT-0203','one_sentence_summary','据作品研究，1954年小说以埃米利亚诺·高纳和一段逐渐被重演的梦境/往事为叙事中心；此处仅作篇章对作品的有限释义。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','direct studies by Javier de Navascués and Paquita Suárez Coalla; summary is deliberately bounded.'),
('V1-FCT-1568','WCD10-B07-F201','V1-CARD-0441','V1-ENT-0204','genre_or_form','长篇小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','Fundación Novelas L129-135明确列Hijo de hombre-1960为novela，并叙及1982法语修订版/1985西语修订版；Zara论文研究采用1983版/1998版，体裁不改变原始出版身份。'),
('V1-FCT-1569','WCD10-B07-F202','V1-CARD-0441','V1-ENT-0204','one_sentence_summary','据Zara对1980年代重写版的研究，小说以Gaspar Mora（木匠、制琴者、麻风病人）及其在Itapé雕刻木制基督像为叙事中心之一，故事把瓜拉尼口传与西语书写、巴拉圭战争史及神话框架交织起来；该概括对应研究所用重写版。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Zara L36-40摘要及L43、L64-69正文直接支持所述人物和结构；研究对象明确采用1983新版，不能视为对1960首版逐字逐章的概括。Fundación L133-138记载修订版与原版有变动。'),
('V1-FCT-1570','WCD10-B07-F203','V1-CARD-0441','V1-ENT-0204','research_note','Juan Manuel Zara在《Gaspar Mora: fundamento mitológico y moral en Hijo de hombre》中以1983版（并参照1998年Sudamericana版）分析Gaspar Mora与木雕基督、历史/神话结构及西语书写和瓜拉尼口传的张力；此释义仅代表该论文的版本和论点。','scholarly_paraphrase','WCD-10-B07','high','research_note_only','具名直接研究：Zara, Cuadernos de Literatura 27 (2025), e2703, DOI 10.30972/clt.278720。原版1960；该研究明确采用1980年代重写文本，结论不向1960版本自动下推。'),
('V1-FCT-1571','WCD10-B07-F204','V1-CARD-0442','V1-ENT-0205','genre_or_form','长篇小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','CVC书目L7明确列Yo el Supremo (1974)；SciELO研究L82-84直接称其为novela。保留旧首发年1974及2017纪念版边界。'),
('V1-FCT-1572','WCD10-B07-F205','V1-CARD-0442','V1-ENT-0205','one_sentence_summary','Aguilera Navarrete区分编纂者叙事层与情节层：虚构的Compilador救出文书后开始编写最高统帅传记，统帅随后质疑这项工作；围绕贴在大教堂门上的告示及作者身份展开的情节，则以最高统帅和秘书Policarpo Patiño为主要对话主角。论文据此讨论口述、书写与权力。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','仅归纳Aguilera Navarrete论文对小说叙事层次的区分，Compilador不等同秘书Policarpo Patiño；源文L103-123还将告示作者搜寻/秘书受刑叙事置于主要情节层。此为小说研究，不是舞台或影视角色说明。'),
('V1-FCT-1573','WCD10-B07-F206','V1-CARD-0442','V1-ENT-0205','research_note','Aguilera Navarrete从瓜拉尼口述与西班牙语书写的权力冲突解读该小说；Lupi将其书写/媒介形式与国家、技术和统治权力并置，但明确不主张控制论影响了小说或控制论是小说主题；Martinez则聚焦手迹、主权及文件/虚构。','scholarly_paraphrase','WCD-10-B07','high','research_note_only','三篇具名直接研究：Aguilera Navarrete, Connotas 22 (2021)；Lupi, Cuadernos de Literatura 26 (2022)；Martinez, América sin Nombre 31 (2024), 76-95。严格保留各论文自己的对象及论点边界。'),
('V1-FCT-1574','WCD10-B07-F207','V1-CARD-0443','V1-ENT-0206','genre_or_form','长篇小说','bibliographic','WCD-10-B07','high','batch_retained_candidate','基金会小说页L267-270明列El Fiscal-1993且称novela；Ravetti文章正文直接称该作小说。'),
('V1-FCT-1575','WCD10-B07-F208','V1-CARD-0443','V1-ENT-0206','one_sentence_summary','小说围绕流亡者Félix Moral返回受独裁统治的巴拉圭并谋划刺杀统治者展开；计划失败后他遭受酷刑，最后由Jimena讲述他的命运和人民起义推翻独裁者。','institutional_paraphrase','WCD-10-B07','high','batch_retained_candidate','Ravetti正确单篇PDF pp.1-7（期刊页102-108）直接叙述欧洲/流亡情节、赴巴拉圭计划、受刑及政权被人民起义推翻；不是短篇或电影简介。'),
('V1-FCT-1576','WCD10-B07-F209','V1-CARD-0443','V1-ENT-0206','research_note','Ravetti将Félix Moral的自我牺牲计划、受刑和独裁者被人民起义推翻的结局放在牺牲、道德/法律、暴力和权力关系中分析。','scholarly_paraphrase','WCD-10-B07','high','research_note_only','Graciela Ravetti, “Escribir la pasión: El fiscal, de Augusto Roa Bastos,” Caligrama 11 (2006), pp.101-109, DOI 10.17851/2238-3824.11..101-109；正确单篇galley的PDF pp.0-7已打开。');

INSERT INTO fact_sources (fact_id,source_id,source_title) VALUES
('V1-FCT-1377','SRC-0148','24 de junio de 1911: nace Ernesto Sábato'),
('V1-FCT-1378','SRC-0148','24 de junio de 1911: nace Ernesto Sábato'),
('V1-FCT-1378','SRC-0459','Uno y el universo'),
('V1-FCT-1379','SRC-0148','24 de junio de 1911: nace Ernesto Sábato'),
('V1-FCT-1379','SRC-0459','Uno y el universo'),
('V1-FCT-1380','SRC-0474','Nociones psicoanalíticas acerca del debate moral en el ensayo de Ernesto Sábato'),
('V1-FCT-1381','SRC-0148','24 de junio de 1911: nace Ernesto Sábato'),
('V1-FCT-1381','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1381','SRC-0460','Hombres y engranajes'),
('V1-FCT-1382','SRC-0148','24 de junio de 1911: nace Ernesto Sábato'),
('V1-FCT-1382','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1382','SRC-0460','Hombres y engranajes'),
('V1-FCT-1383','SRC-0148','24 de junio de 1911: nace Ernesto Sábato'),
('V1-FCT-1383','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1383','SRC-0460','Hombres y engranajes'),
('V1-FCT-1384','SRC-0474','Nociones psicoanalíticas acerca del debate moral en el ensayo de Ernesto Sábato'),
('V1-FCT-1385','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1385','SRC-0461','El escritor y sus fantasmas'),
('V1-FCT-1386','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1386','SRC-0461','El escritor y sus fantasmas'),
('V1-FCT-1387','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1387','SRC-0461','El escritor y sus fantasmas'),
('V1-FCT-1388','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1388','SRC-0462','Apologías y rechazos'),
('V1-FCT-1389','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1389','SRC-0462','Apologías y rechazos'),
('V1-FCT-1390','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1390','SRC-0462','Apologías y rechazos'),
('V1-FCT-1391','SRC-0148','24 de junio de 1911: nace Ernesto Sábato'),
('V1-FCT-1391','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1391','SRC-0463','Antes del fin'),
('V1-FCT-1392','SRC-0148','24 de junio de 1911: nace Ernesto Sábato'),
('V1-FCT-1392','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1392','SRC-0463','Antes del fin'),
('V1-FCT-1393','SRC-0148','24 de junio de 1911: nace Ernesto Sábato'),
('V1-FCT-1393','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1393','SRC-0463','Antes del fin'),
('V1-FCT-1394','SRC-0148','24 de junio de 1911: nace Ernesto Sábato'),
('V1-FCT-1394','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1394','SRC-0464','La resistencia'),
('V1-FCT-1395','SRC-0148','24 de junio de 1911: nace Ernesto Sábato'),
('V1-FCT-1395','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1395','SRC-0464','La resistencia'),
('V1-FCT-1396','SRC-0148','24 de junio de 1911: nace Ernesto Sábato'),
('V1-FCT-1396','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1396','SRC-0464','La resistencia'),
('V1-FCT-1397','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1397','SRC-0465','España en los diarios de mi vejez'),
('V1-FCT-1398','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1398','SRC-0465','España en los diarios de mi vejez'),
('V1-FCT-1399','SRC-0150','Ernesto Sabato – Biografía'),
('V1-FCT-1399','SRC-0465','España en los diarios de mi vejez'),
('V1-FCT-1400','SRC-0473','Ernesto Sabato. Cronología de obras'),
('V1-FCT-1400','SRC-0475','El otro rostro del peronismo : carta abierta a Mario Amadeo'),
('V1-FCT-1401','SRC-0473','Ernesto Sabato. Cronología de obras'),
('V1-FCT-1401','SRC-0475','El otro rostro del peronismo : carta abierta a Mario Amadeo'),
('V1-FCT-1402','SRC-0475','El otro rostro del peronismo : carta abierta a Mario Amadeo'),
('V1-FCT-1402','SRC-0477','Sabato, Ernesto. El otro rostro del peronismo.'),
('V1-FCT-1402','SRC-0474','Nociones psicoanalíticas acerca del debate moral en el ensayo de Ernesto Sábato'),
('V1-FCT-1403','SRC-0474','Nociones psicoanalíticas acerca del debate moral en el ensayo de Ernesto Sábato'),
('V1-FCT-1404','SRC-0473','Ernesto Sabato. Cronología de obras'),
('V1-FCT-1404','SRC-0476','Tres aproximaciones a la literatura de nuestro tiempo : Robbe-Grillet, Borges, Sartre'),
('V1-FCT-1405','SRC-0476','Tres aproximaciones a la literatura de nuestro tiempo : Robbe-Grillet, Borges, Sartre'),
('V1-FCT-1406','SRC-0476','Tres aproximaciones a la literatura de nuestro tiempo : Robbe-Grillet, Borges, Sartre'),
('V1-FCT-1407','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1407','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1407','SRC-0479','Diario de la guerra del cerdo'),
('V1-FCT-1408','SRC-0479','Diario de la guerra del cerdo'),
('V1-FCT-1409','SRC-0479','Diario de la guerra del cerdo'),
('V1-FCT-1410','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1410','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1411','SRC-0480','Dormir al sol'),
('V1-FCT-1412','SRC-0480','Dormir al sol'),
('V1-FCT-1413','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1413','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1414','SRC-0481','La trama celeste'),
('V1-FCT-1415','SRC-0481','La trama celeste'),
('V1-FCT-1416','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1416','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1416','SRC-0482','Historia prodigiosa'),
('V1-FCT-1417','SRC-0482','Historia prodigiosa'),
('V1-FCT-1418','SRC-0482','Historia prodigiosa'),
('V1-FCT-1419','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1419','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1420','SRC-0484','Guirnalda con amores'),
('V1-FCT-1421','SRC-0484','Guirnalda con amores'),
('V1-FCT-1422','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1422','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1423','SRC-0483','El gran Serafín'),
('V1-FCT-1424','SRC-0483','El gran Serafín'),
('V1-FCT-1425','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1425','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1425','SRC-0485','Últimas novelas'),
('V1-FCT-1426','SRC-0485','Últimas novelas'),
('V1-FCT-1427','SRC-0485','Últimas novelas'),
('V1-FCT-1428','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1428','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1428','SRC-0485','Últimas novelas'),
('V1-FCT-1429','SRC-0485','Últimas novelas'),
('V1-FCT-1430','SRC-0485','Últimas novelas'),
('V1-FCT-1431','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1431','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1431','SRC-0485','Últimas novelas'),
('V1-FCT-1432','SRC-0485','Últimas novelas'),
('V1-FCT-1433','SRC-0485','Últimas novelas'),
('V1-FCT-1434','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1434','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1435','SRC-0497','El lado de la sombra'),
('V1-FCT-1436','SRC-0497','El lado de la sombra'),
('V1-FCT-1437','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1437','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1438','SRC-0498','Todo Bioy — Biblioteca Adolfo Bioy Casares (catalogue page)'),
('V1-FCT-1439','SRC-0498','Todo Bioy — Biblioteca Adolfo Bioy Casares (catalogue page)'),
('V1-FCT-1440','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1440','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1441','SRC-0498','Todo Bioy — Biblioteca Adolfo Bioy Casares (catalogue page)'),
('V1-FCT-1442','SRC-0500','Adolfo Bioy Casares o las máscaras de la verdad'),
('V1-FCT-1443','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1443','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1444','SRC-0498','Todo Bioy — Biblioteca Adolfo Bioy Casares (catalogue page)'),
('V1-FCT-1444','SRC-0510','Una muñeca rusa'),
('V1-FCT-1445','SRC-0510','Una muñeca rusa'),
('V1-FCT-1446','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1446','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1447','SRC-0498','Todo Bioy — Biblioteca Adolfo Bioy Casares (catalogue page)'),
('V1-FCT-1448','SRC-0501','Poética de la casa bioycasareana'),
('V1-FCT-1449','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1450','SRC-0502','La otra aventura y otros escritos'),
('V1-FCT-1451','SRC-0502','La otra aventura y otros escritos'),
('V1-FCT-1452','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1452','SRC-0503','Memorias'),
('V1-FCT-1453','SRC-0507','Biografía de Bioy Casares. Biblioteca. Instituto Cervantes de El Cairo'),
('V1-FCT-1453','SRC-0509','Figuraciones autobiográficas de Bioy Casares en el Borges'),
('V1-FCT-1454','SRC-0503','Memorias'),
('V1-FCT-1455','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1455','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo'),
('V1-FCT-1456','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo'),
('V1-FCT-1456','SRC-0507','Biografía de Bioy Casares. Biblioteca. Instituto Cervantes de El Cairo'),
('V1-FCT-1457','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo'),
('V1-FCT-1458','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1459','SRC-0502','La otra aventura y otros escritos'),
('V1-FCT-1459','SRC-0507','Biografía de Bioy Casares. Biblioteca. Instituto Cervantes de El Cairo'),
('V1-FCT-1460','SRC-0502','La otra aventura y otros escritos'),
('V1-FCT-1461','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1461','SRC-0505','Descanso de caminantes: diarios íntimos'),
('V1-FCT-1461','SRC-0509','Figuraciones autobiográficas de Bioy Casares en el Borges'),
('V1-FCT-1462','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo'),
('V1-FCT-1462','SRC-0505','Descanso de caminantes: diarios íntimos'),
('V1-FCT-1462','SRC-0509','Figuraciones autobiográficas de Bioy Casares en el Borges'),
('V1-FCT-1463','SRC-0505','Descanso de caminantes: diarios íntimos'),
('V1-FCT-1463','SRC-0506','Posfacio (Descanso de caminantes)'),
('V1-FCT-1464','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1464','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo'),
('V1-FCT-1464','SRC-0509','Figuraciones autobiográficas de Bioy Casares en el Borges'),
('V1-FCT-1465','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo'),
('V1-FCT-1465','SRC-0509','Figuraciones autobiográficas de Bioy Casares en el Borges'),
('V1-FCT-1466','SRC-0509','Figuraciones autobiográficas de Bioy Casares en el Borges'),
('V1-FCT-1467','SRC-0509','Figuraciones autobiográficas de Bioy Casares en el Borges'),
('V1-FCT-1468','SRC-0507','Biografía de Bioy Casares. Biblioteca. Instituto Cervantes de El Cairo'),
('V1-FCT-1468','SRC-0508','En viaje'),
('V1-FCT-1468','SRC-0509','Figuraciones autobiográficas de Bioy Casares en el Borges'),
('V1-FCT-1469','SRC-0508','En viaje'),
('V1-FCT-1469','SRC-0509','Figuraciones autobiográficas de Bioy Casares en el Borges'),
('V1-FCT-1470','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1471','SRC-0511','Memoria sobre la pampa y los gauchos'),
('V1-FCT-1471','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1472','SRC-0511','Memoria sobre la pampa y los gauchos'),
('V1-FCT-1473','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1474','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo'),
('V1-FCT-1475','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo'),
('V1-FCT-1476','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1476','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo'),
('V1-FCT-1477','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo'),
('V1-FCT-1478','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo'),
('V1-FCT-1479','SRC-0513','El perjurio de la nieve'),
('V1-FCT-1479','SRC-0514','La casa bioycasareana y el mito en “El perjurio de la nieve”'),
('V1-FCT-1479','SRC-0515','Poética de lo siniestro en el relato “El perjurio de la nieve” de Adolfo Bioy Casares'),
('V1-FCT-1480','SRC-0514','La casa bioycasareana y el mito en “El perjurio de la nieve”'),
('V1-FCT-1480','SRC-0515','Poética de lo siniestro en el relato “El perjurio de la nieve” de Adolfo Bioy Casares'),
('V1-FCT-1481','SRC-0514','La casa bioycasareana y el mito en “El perjurio de la nieve”'),
('V1-FCT-1481','SRC-0515','Poética de lo siniestro en el relato “El perjurio de la nieve” de Adolfo Bioy Casares'),
('V1-FCT-1482','SRC-0513','El perjurio de la nieve'),
('V1-FCT-1482','SRC-0514','La casa bioycasareana y el mito en “El perjurio de la nieve”'),
('V1-FCT-1482','SRC-0515','Poética de lo siniestro en el relato “El perjurio de la nieve” de Adolfo Bioy Casares'),
('V1-FCT-1482','SRC-0512','Biografía de Adolfo Bioy Casares'),
('V1-FCT-1483','SRC-0516','Adolfo Bioy Casares (1914-1999)'),
('V1-FCT-1483','SRC-0517','Metamorfosis del mito fáustico en la literatura alemana y en la literatura argentina en la segunda mitad del siglo XX'),
('V1-FCT-1484','SRC-0517','Metamorfosis del mito fáustico en la literatura alemana y en la literatura argentina en la segunda mitad del siglo XX'),
('V1-FCT-1485','SRC-0517','Metamorfosis del mito fáustico en la literatura alemana y en la literatura argentina en la segunda mitad del siglo XX'),
('V1-FCT-1486','SRC-0518','Bioy, Borges y “Sur”: diálogos y duelos'),
('V1-FCT-1486','SRC-0520','Bioy, pasado y presente'),
('V1-FCT-1487','SRC-0518','Bioy, Borges y “Sur”: diálogos y duelos'),
('V1-FCT-1488','SRC-0518','Bioy, Borges y “Sur”: diálogos y duelos'),
('V1-FCT-1489','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1489','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1489','SRC-0521','La novela hispanoamericana en el siglo XXI: la recepción de la obra de Silvina Ocampo en España'),
('V1-FCT-1490','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1490','SRC-0519','Los que aman, odian'),
('V1-FCT-1491','SRC-0519','Los que aman, odian'),
('V1-FCT-1492','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1492','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1492','SRC-0519','Los que aman, odian'),
('V1-FCT-1492','SRC-0521','La novela hispanoamericana en el siglo XXI: la recepción de la obra de Silvina Ocampo en España'),
('V1-FCT-1493','SRC-0512','Biografía de Adolfo Bioy Casares'),
('V1-FCT-1493','SRC-0478','Bibliografía de Adolfo Bioy Casares'),
('V1-FCT-1493','SRC-0154','Adolfo Bioy Casares. Cronología de obras'),
('V1-FCT-1494','SRC-0512','Biografía de Adolfo Bioy Casares'),
('V1-FCT-1495','SRC-0512','Biografía de Adolfo Bioy Casares'),
('V1-FCT-1496','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1496','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1497','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1497','SRC-0524','Antologías de Augusto Roa Bastos – Fundación Augusto Roa Bastos'),
('V1-FCT-1498','SRC-0522','Novelas – Fundación Augusto Roa Bastos'),
('V1-FCT-1498','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1499','SRC-0529','Mundos conflictivos en El trueno entre las hojas, una colección de cuentos integrados de Augusto Roa Bastos'),
('V1-FCT-1500','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1500','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1501','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1501','SRC-0526','Augusto Roa Bastos. Cronología de obras'),
('V1-FCT-1502','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1503','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1503','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1504','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1504','SRC-0526','Augusto Roa Bastos. Cronología de obras'),
('V1-FCT-1505','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1506','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1506','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1507','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1507','SRC-0526','Augusto Roa Bastos. Cronología de obras'),
('V1-FCT-1508','SRC-0522','Novelas – Fundación Augusto Roa Bastos'),
('V1-FCT-1508','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1509','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1509','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1510','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1510','SRC-0526','Augusto Roa Bastos. Cronología de obras'),
('V1-FCT-1511','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1512','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1512','SRC-0527','Bibliografía de Augusto Roa Bastos'),
('V1-FCT-1513','SRC-0526','Augusto Roa Bastos. Cronología de obras'),
('V1-FCT-1513','SRC-0527','Bibliografía de Augusto Roa Bastos'),
('V1-FCT-1514','SRC-0536','Cuerpo presente y otros cuentos / Augusto ROA BASTOS — Catálogo en línea'),
('V1-FCT-1515','SRC-0536','Cuerpo presente y otros cuentos / Augusto ROA BASTOS — Catálogo en línea'),
('V1-FCT-1515','SRC-0524','Antologías de Augusto Roa Bastos – Fundación Augusto Roa Bastos'),
('V1-FCT-1516','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1516','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1517','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1518','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1519','SRC-0522','Novelas – Fundación Augusto Roa Bastos'),
('V1-FCT-1519','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1519','SRC-0526','Augusto Roa Bastos. Cronología de obras'),
('V1-FCT-1520','SRC-0522','Novelas – Fundación Augusto Roa Bastos'),
('V1-FCT-1520','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1521','SRC-0522','Novelas – Fundación Augusto Roa Bastos'),
('V1-FCT-1522','SRC-0528','CONTRAVIDA, 1994 – Novela de Augusto Roa Bastos'),
('V1-FCT-1522','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1522','SRC-0522','Novelas – Fundación Augusto Roa Bastos'),
('V1-FCT-1523','SRC-0528','CONTRAVIDA, 1994 – Novela de Augusto Roa Bastos'),
('V1-FCT-1523','SRC-0522','Novelas – Fundación Augusto Roa Bastos'),
('V1-FCT-1524','SRC-0528','CONTRAVIDA, 1994 – Novela de Augusto Roa Bastos'),
('V1-FCT-1524','SRC-0522','Novelas – Fundación Augusto Roa Bastos'),
('V1-FCT-1525','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1525','SRC-0526','Augusto Roa Bastos. Cronología de obras'),
('V1-FCT-1525','SRC-0160','Biografía – Fundación Augusto Roa Bastos'),
('V1-FCT-1526','SRC-0160','Biografía – Fundación Augusto Roa Bastos'),
('V1-FCT-1526','SRC-0524','Antologías de Augusto Roa Bastos – Fundación Augusto Roa Bastos'),
('V1-FCT-1527','SRC-0160','Biografía – Fundación Augusto Roa Bastos'),
('V1-FCT-1527','SRC-0524','Antologías de Augusto Roa Bastos – Fundación Augusto Roa Bastos'),
('V1-FCT-1528','SRC-0160','Biografía – Fundación Augusto Roa Bastos'),
('V1-FCT-1528','SRC-0524','Antologías de Augusto Roa Bastos – Fundación Augusto Roa Bastos'),
('V1-FCT-1529','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1529','SRC-0538','El ruiseñor de la aurora, y otros poemas — Google Books catalog record'),
('V1-FCT-1529','SRC-0540','Poesía – Fundación Augusto Roa Bastos'),
('V1-FCT-1530','SRC-0160','Biografía – Fundación Augusto Roa Bastos'),
('V1-FCT-1530','SRC-0538','El ruiseñor de la aurora, y otros poemas — Google Books catalog record'),
('V1-FCT-1531','SRC-0538','El ruiseñor de la aurora, y otros poemas — Google Books catalog record'),
('V1-FCT-1531','SRC-0540','Poesía – Fundación Augusto Roa Bastos'),
('V1-FCT-1532','SRC-0159','CVC. Augusto Roa Bastos. Cronología 1947-1988'),
('V1-FCT-1532','SRC-0538','El ruiseñor de la aurora, y otros poemas — Google Books catalog record'),
('V1-FCT-1533','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1533','SRC-0539','Ensayos y Artículos – Fundación Augusto Roa Bastos'),
('V1-FCT-1534','SRC-0539','Ensayos y Artículos – Fundación Augusto Roa Bastos'),
('V1-FCT-1534','SRC-0544','Augusto Roa Bastos — Enciclopedia de la Literatura en México (FLM)'),
('V1-FCT-1535','SRC-0539','Ensayos y Artículos – Fundación Augusto Roa Bastos'),
('V1-FCT-1535','SRC-0544','Augusto Roa Bastos — Enciclopedia de la Literatura en México (FLM)'),
('V1-FCT-1536','SRC-0543','La mujer como objeto de la mirada masculina en Madama Sui de Augusto Roa Bastos'),
('V1-FCT-1537','SRC-0522','Novelas – Fundación Augusto Roa Bastos'),
('V1-FCT-1537','SRC-0543','La mujer como objeto de la mirada masculina en Madama Sui de Augusto Roa Bastos'),
('V1-FCT-1538','SRC-0543','La mujer como objeto de la mirada masculina en Madama Sui de Augusto Roa Bastos'),
('V1-FCT-1539','SRC-0522','Novelas – Fundación Augusto Roa Bastos'),
('V1-FCT-1539','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1539','SRC-0543','La mujer como objeto de la mirada masculina en Madama Sui de Augusto Roa Bastos'),
('V1-FCT-1540','SRC-0543','La mujer como objeto de la mirada masculina en Madama Sui de Augusto Roa Bastos'),
('V1-FCT-1541','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1541','SRC-0160','Biografía – Fundación Augusto Roa Bastos'),
('V1-FCT-1541','SRC-0541','Metaforismos — WorldCat record'),
('V1-FCT-1542','SRC-0541','Metaforismos — WorldCat record'),
('V1-FCT-1542','SRC-0542','Metaforismos — Google Books catalog record'),
('V1-FCT-1543','SRC-0541','Metaforismos — WorldCat record'),
('V1-FCT-1543','SRC-0542','Metaforismos — Google Books catalog record'),
('V1-FCT-1544','SRC-0545','Ediciones – Fundación Augusto Roa Bastos'),
('V1-FCT-1544','SRC-0541','Metaforismos — WorldCat record'),
('V1-FCT-1544','SRC-0542','Metaforismos — Google Books catalog record'),
('V1-FCT-1545','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1545','SRC-0160','Biografía – Fundación Augusto Roa Bastos'),
('V1-FCT-1545','SRC-0159','CVC. Augusto Roa Bastos. Cronología 1947-1988'),
('V1-FCT-1546','SRC-0160','Biografía – Fundación Augusto Roa Bastos'),
('V1-FCT-1546','SRC-0159','CVC. Augusto Roa Bastos. Cronología 1947-1988'),
('V1-FCT-1547','SRC-0523','Cuento – Fundación Augusto Roa Bastos'),
('V1-FCT-1548','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1548','SRC-0537','Las “culturas condenadas”: el mitólogo como compilador'),
('V1-FCT-1548','SRC-0546','Las culturas condenadas – Google Books'),
('V1-FCT-1549','SRC-0537','Las “culturas condenadas”: el mitólogo como compilador'),
('V1-FCT-1549','SRC-0546','Las culturas condenadas – Google Books'),
('V1-FCT-1550','SRC-0537','Las “culturas condenadas”: el mitólogo como compilador'),
('V1-FCT-1550','SRC-0546','Las culturas condenadas – Google Books'),
('V1-FCT-1551','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1551','SRC-0537','Las “culturas condenadas”: el mitólogo como compilador'),
('V1-FCT-1551','SRC-0546','Las culturas condenadas – Google Books'),
('V1-FCT-1552','SRC-0537','Las “culturas condenadas”: el mitólogo como compilador'),
('V1-FCT-1553','SRC-0149','Ernesto Sabato: Obra completa / Narrativa'),
('V1-FCT-1553','SRC-0466','El túnel'),
('V1-FCT-1554','SRC-0466','El túnel'),
('V1-FCT-1554','SRC-0469','La psicosis como mecanismo involuntario de interpretación de la realidad en el protagonista de El túnel'),
('V1-FCT-1555','SRC-0469','La psicosis como mecanismo involuntario de interpretación de la realidad en el protagonista de El túnel'),
('V1-FCT-1556','SRC-0149','Ernesto Sabato: Obra completa / Narrativa'),
('V1-FCT-1556','SRC-0467','Sobre héroes y tumbas'),
('V1-FCT-1557','SRC-0467','Sobre héroes y tumbas'),
('V1-FCT-1558','SRC-0470','El decadentismo bobbiano en Sobre héroes y tumbas'),
('V1-FCT-1558','SRC-0471','El camino americano de Martín en Sobre héroes y tumbas'),
('V1-FCT-1559','SRC-0149','Ernesto Sabato: Obra completa / Narrativa'),
('V1-FCT-1559','SRC-0468','Abaddón el exterminador'),
('V1-FCT-1560','SRC-0468','Abaddón el exterminador'),
('V1-FCT-1561','SRC-0472','Abaddón el exterminador: El Apocalipsis de los desaparecidos'),
('V1-FCT-1562','SRC-0486','La invención de Morel (edición definitiva)'),
('V1-FCT-1563','SRC-0486','La invención de Morel (edición definitiva)'),
('V1-FCT-1564','SRC-0496','Plan de evasión'),
('V1-FCT-1565','SRC-0496','Plan de evasión'),
('V1-FCT-1566','SRC-0155','Novelas de Adolfo Bioy Casares'),
('V1-FCT-1566','SRC-0494','Un conflicto trágico entre dos lealtades: «El sueño de los héroes»'),
('V1-FCT-1567','SRC-0494','Un conflicto trágico entre dos lealtades: «El sueño de los héroes»'),
('V1-FCT-1567','SRC-0495','«El sueño de los héroes»: una novela de transición'),
('V1-FCT-1568','SRC-0522','Novelas – Fundación Augusto Roa Bastos'),
('V1-FCT-1568','SRC-0531','Gaspar Mora: fundamento mitológico y moral en Hijo de hombre, de Augusto Roa Bastos'),
('V1-FCT-1569','SRC-0531','Gaspar Mora: fundamento mitológico y moral en Hijo de hombre, de Augusto Roa Bastos'),
('V1-FCT-1570','SRC-0531','Gaspar Mora: fundamento mitológico y moral en Hijo de hombre, de Augusto Roa Bastos'),
('V1-FCT-1571','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía'),
('V1-FCT-1571','SRC-0532','Entre la oralidad y la escritura: una poética del poder en Yo el Supremo, de Augusto Roa Bastos'),
('V1-FCT-1572','SRC-0532','Entre la oralidad y la escritura: una poética del poder en Yo el Supremo, de Augusto Roa Bastos'),
('V1-FCT-1573','SRC-0532','Entre la oralidad y la escritura: una poética del poder en Yo el Supremo, de Augusto Roa Bastos'),
('V1-FCT-1573','SRC-0533','Yo el Supremo, dictado y cibernética'),
('V1-FCT-1573','SRC-0534','Bajo su mano. Escritura y soberanía en "Yo, el supremo"'),
('V1-FCT-1574','SRC-0522','Novelas – Fundación Augusto Roa Bastos'),
('V1-FCT-1574','SRC-0535','Escribir la pasión: El fiscal, de Augusto Roa Bastos'),
('V1-FCT-1575','SRC-0535','Escribir la pasión: El fiscal, de Augusto Roa Bastos'),
('V1-FCT-1576','SRC-0535','Escribir la pasión: El fiscal, de Augusto Roa Bastos');

INSERT INTO card_facts (card_id,fact_id,admission_status) VALUES
('V1-CARD-0381','V1-FCT-1377','batch_retained_candidate'),
('V1-CARD-0381','V1-FCT-1378','batch_retained_candidate'),
('V1-CARD-0381','V1-FCT-1379','batch_retained_candidate'),
('V1-CARD-0381','V1-FCT-1380','research_note_only'),
('V1-CARD-0382','V1-FCT-1381','batch_retained_candidate'),
('V1-CARD-0382','V1-FCT-1382','batch_retained_candidate'),
('V1-CARD-0382','V1-FCT-1383','batch_retained_candidate'),
('V1-CARD-0382','V1-FCT-1384','research_note_only'),
('V1-CARD-0383','V1-FCT-1385','batch_retained_candidate'),
('V1-CARD-0383','V1-FCT-1386','batch_retained_candidate'),
('V1-CARD-0383','V1-FCT-1387','batch_retained_candidate'),
('V1-CARD-0384','V1-FCT-1388','batch_retained_candidate'),
('V1-CARD-0384','V1-FCT-1389','batch_retained_candidate'),
('V1-CARD-0384','V1-FCT-1390','batch_retained_candidate'),
('V1-CARD-0385','V1-FCT-1391','batch_retained_candidate'),
('V1-CARD-0385','V1-FCT-1392','batch_retained_candidate'),
('V1-CARD-0385','V1-FCT-1393','batch_retained_candidate'),
('V1-CARD-0386','V1-FCT-1394','batch_retained_candidate'),
('V1-CARD-0386','V1-FCT-1395','batch_retained_candidate'),
('V1-CARD-0386','V1-FCT-1396','batch_retained_candidate'),
('V1-CARD-0387','V1-FCT-1397','batch_retained_candidate'),
('V1-CARD-0387','V1-FCT-1398','batch_retained_candidate'),
('V1-CARD-0387','V1-FCT-1399','batch_retained_candidate'),
('V1-CARD-0388','V1-FCT-1400','batch_retained_candidate'),
('V1-CARD-0388','V1-FCT-1401','batch_retained_candidate'),
('V1-CARD-0388','V1-FCT-1402','batch_retained_candidate'),
('V1-CARD-0388','V1-FCT-1403','research_note_only'),
('V1-CARD-0389','V1-FCT-1404','batch_retained_candidate'),
('V1-CARD-0389','V1-FCT-1405','batch_retained_candidate'),
('V1-CARD-0389','V1-FCT-1406','batch_retained_candidate'),
('V1-CARD-0390','V1-FCT-1407','batch_retained_candidate'),
('V1-CARD-0390','V1-FCT-1408','batch_retained_candidate'),
('V1-CARD-0390','V1-FCT-1409','batch_retained_candidate'),
('V1-CARD-0391','V1-FCT-1410','batch_retained_candidate'),
('V1-CARD-0391','V1-FCT-1411','batch_retained_candidate'),
('V1-CARD-0391','V1-FCT-1412','batch_retained_candidate'),
('V1-CARD-0392','V1-FCT-1413','batch_retained_candidate'),
('V1-CARD-0392','V1-FCT-1414','batch_retained_candidate'),
('V1-CARD-0392','V1-FCT-1415','batch_retained_candidate'),
('V1-CARD-0393','V1-FCT-1416','batch_retained_candidate'),
('V1-CARD-0393','V1-FCT-1417','batch_retained_candidate'),
('V1-CARD-0393','V1-FCT-1418','batch_retained_candidate'),
('V1-CARD-0394','V1-FCT-1419','batch_retained_candidate'),
('V1-CARD-0394','V1-FCT-1420','batch_retained_candidate'),
('V1-CARD-0394','V1-FCT-1421','batch_retained_candidate'),
('V1-CARD-0395','V1-FCT-1422','batch_retained_candidate'),
('V1-CARD-0395','V1-FCT-1423','batch_retained_candidate'),
('V1-CARD-0395','V1-FCT-1424','batch_retained_candidate'),
('V1-CARD-0396','V1-FCT-1425','batch_retained_candidate'),
('V1-CARD-0396','V1-FCT-1426','batch_retained_candidate'),
('V1-CARD-0396','V1-FCT-1427','batch_retained_candidate'),
('V1-CARD-0397','V1-FCT-1428','batch_retained_candidate'),
('V1-CARD-0397','V1-FCT-1429','batch_retained_candidate'),
('V1-CARD-0397','V1-FCT-1430','batch_retained_candidate'),
('V1-CARD-0398','V1-FCT-1431','batch_retained_candidate'),
('V1-CARD-0398','V1-FCT-1432','batch_retained_candidate'),
('V1-CARD-0398','V1-FCT-1433','batch_retained_candidate'),
('V1-CARD-0399','V1-FCT-1434','batch_retained_candidate'),
('V1-CARD-0399','V1-FCT-1435','batch_retained_candidate'),
('V1-CARD-0399','V1-FCT-1436','batch_retained_candidate'),
('V1-CARD-0400','V1-FCT-1437','batch_retained_candidate'),
('V1-CARD-0400','V1-FCT-1438','batch_retained_candidate'),
('V1-CARD-0400','V1-FCT-1439','batch_retained_candidate'),
('V1-CARD-0401','V1-FCT-1440','batch_retained_candidate'),
('V1-CARD-0401','V1-FCT-1441','batch_retained_candidate'),
('V1-CARD-0401','V1-FCT-1442','batch_retained_candidate'),
('V1-CARD-0402','V1-FCT-1443','batch_retained_candidate'),
('V1-CARD-0402','V1-FCT-1444','batch_retained_candidate'),
('V1-CARD-0402','V1-FCT-1445','batch_retained_candidate'),
('V1-CARD-0403','V1-FCT-1446','batch_retained_candidate'),
('V1-CARD-0403','V1-FCT-1447','batch_retained_candidate'),
('V1-CARD-0403','V1-FCT-1448','batch_retained_candidate'),
('V1-CARD-0404','V1-FCT-1449','batch_retained_candidate'),
('V1-CARD-0404','V1-FCT-1450','batch_retained_candidate'),
('V1-CARD-0404','V1-FCT-1451','batch_retained_candidate'),
('V1-CARD-0405','V1-FCT-1452','batch_retained_candidate'),
('V1-CARD-0405','V1-FCT-1453','batch_retained_candidate'),
('V1-CARD-0405','V1-FCT-1454','batch_retained_candidate'),
('V1-CARD-0406','V1-FCT-1455','batch_retained_candidate'),
('V1-CARD-0406','V1-FCT-1456','batch_retained_candidate'),
('V1-CARD-0406','V1-FCT-1457','batch_retained_candidate'),
('V1-CARD-0407','V1-FCT-1458','batch_retained_candidate'),
('V1-CARD-0407','V1-FCT-1459','batch_retained_candidate'),
('V1-CARD-0407','V1-FCT-1460','batch_retained_candidate'),
('V1-CARD-0408','V1-FCT-1461','batch_retained_candidate'),
('V1-CARD-0408','V1-FCT-1462','batch_retained_candidate'),
('V1-CARD-0408','V1-FCT-1463','batch_retained_candidate'),
('V1-CARD-0409','V1-FCT-1464','batch_retained_candidate'),
('V1-CARD-0409','V1-FCT-1465','batch_retained_candidate'),
('V1-CARD-0409','V1-FCT-1466','batch_retained_candidate'),
('V1-CARD-0410','V1-FCT-1467','batch_retained_candidate'),
('V1-CARD-0410','V1-FCT-1468','batch_retained_candidate'),
('V1-CARD-0410','V1-FCT-1469','batch_retained_candidate'),
('V1-CARD-0411','V1-FCT-1470','batch_retained_candidate'),
('V1-CARD-0411','V1-FCT-1471','batch_retained_candidate'),
('V1-CARD-0411','V1-FCT-1472','batch_retained_candidate'),
('V1-CARD-0412','V1-FCT-1473','batch_retained_candidate'),
('V1-CARD-0412','V1-FCT-1474','batch_retained_candidate'),
('V1-CARD-0412','V1-FCT-1475','batch_retained_candidate'),
('V1-CARD-0413','V1-FCT-1476','batch_retained_candidate'),
('V1-CARD-0413','V1-FCT-1477','batch_retained_candidate'),
('V1-CARD-0413','V1-FCT-1478','batch_retained_candidate'),
('V1-CARD-0414','V1-FCT-1479','batch_retained_candidate'),
('V1-CARD-0414','V1-FCT-1480','batch_retained_candidate'),
('V1-CARD-0414','V1-FCT-1481','batch_retained_candidate'),
('V1-CARD-0414','V1-FCT-1482','batch_retained_candidate'),
('V1-CARD-0415','V1-FCT-1483','batch_retained_candidate'),
('V1-CARD-0415','V1-FCT-1484','batch_retained_candidate'),
('V1-CARD-0415','V1-FCT-1485','batch_retained_candidate'),
('V1-CARD-0416','V1-FCT-1486','batch_retained_candidate'),
('V1-CARD-0416','V1-FCT-1487','batch_retained_candidate'),
('V1-CARD-0416','V1-FCT-1488','batch_retained_candidate'),
('V1-CARD-0417','V1-FCT-1489','batch_retained_candidate'),
('V1-CARD-0417','V1-FCT-1490','batch_retained_candidate'),
('V1-CARD-0417','V1-FCT-1491','batch_retained_candidate'),
('V1-CARD-0417','V1-FCT-1492','batch_retained_candidate'),
('V1-CARD-0418','V1-FCT-1493','batch_retained_candidate'),
('V1-CARD-0418','V1-FCT-1494','batch_retained_candidate'),
('V1-CARD-0418','V1-FCT-1495','batch_retained_candidate'),
('V1-CARD-0419','V1-FCT-1496','batch_retained_candidate'),
('V1-CARD-0419','V1-FCT-1497','batch_retained_candidate'),
('V1-CARD-0419','V1-FCT-1498','batch_retained_candidate'),
('V1-CARD-0419','V1-FCT-1499','research_note_only'),
('V1-CARD-0420','V1-FCT-1500','batch_retained_candidate'),
('V1-CARD-0420','V1-FCT-1501','batch_retained_candidate'),
('V1-CARD-0420','V1-FCT-1502','batch_retained_candidate'),
('V1-CARD-0421','V1-FCT-1503','batch_retained_candidate'),
('V1-CARD-0421','V1-FCT-1504','batch_retained_candidate'),
('V1-CARD-0421','V1-FCT-1505','batch_retained_candidate'),
('V1-CARD-0422','V1-FCT-1506','batch_retained_candidate'),
('V1-CARD-0422','V1-FCT-1507','batch_retained_candidate'),
('V1-CARD-0422','V1-FCT-1508','batch_retained_candidate'),
('V1-CARD-0423','V1-FCT-1509','batch_retained_candidate'),
('V1-CARD-0423','V1-FCT-1510','batch_retained_candidate'),
('V1-CARD-0423','V1-FCT-1511','batch_retained_candidate'),
('V1-CARD-0424','V1-FCT-1512','batch_retained_candidate'),
('V1-CARD-0424','V1-FCT-1513','batch_retained_candidate'),
('V1-CARD-0424','V1-FCT-1514','batch_retained_candidate'),
('V1-CARD-0424','V1-FCT-1515','batch_retained_candidate'),
('V1-CARD-0425','V1-FCT-1516','batch_retained_candidate'),
('V1-CARD-0425','V1-FCT-1517','batch_retained_candidate'),
('V1-CARD-0425','V1-FCT-1518','batch_retained_candidate'),
('V1-CARD-0426','V1-FCT-1519','batch_retained_candidate'),
('V1-CARD-0426','V1-FCT-1520','batch_retained_candidate'),
('V1-CARD-0426','V1-FCT-1521','batch_retained_candidate'),
('V1-CARD-0427','V1-FCT-1522','batch_retained_candidate'),
('V1-CARD-0427','V1-FCT-1523','batch_retained_candidate'),
('V1-CARD-0427','V1-FCT-1524','batch_retained_candidate'),
('V1-CARD-0428','V1-FCT-1525','batch_retained_candidate'),
('V1-CARD-0428','V1-FCT-1526','batch_retained_candidate'),
('V1-CARD-0428','V1-FCT-1527','batch_retained_candidate'),
('V1-CARD-0428','V1-FCT-1528','batch_retained_candidate'),
('V1-CARD-0429','V1-FCT-1529','batch_retained_candidate'),
('V1-CARD-0429','V1-FCT-1530','batch_retained_candidate'),
('V1-CARD-0429','V1-FCT-1531','batch_retained_candidate'),
('V1-CARD-0429','V1-FCT-1532','batch_retained_candidate'),
('V1-CARD-0430','V1-FCT-1533','batch_retained_candidate'),
('V1-CARD-0430','V1-FCT-1534','batch_retained_candidate'),
('V1-CARD-0430','V1-FCT-1535','batch_retained_candidate'),
('V1-CARD-0431','V1-FCT-1536','batch_retained_candidate'),
('V1-CARD-0431','V1-FCT-1537','batch_retained_candidate'),
('V1-CARD-0431','V1-FCT-1538','batch_retained_candidate'),
('V1-CARD-0431','V1-FCT-1539','batch_retained_candidate'),
('V1-CARD-0431','V1-FCT-1540','research_note_only'),
('V1-CARD-0432','V1-FCT-1541','batch_retained_candidate'),
('V1-CARD-0432','V1-FCT-1542','batch_retained_candidate'),
('V1-CARD-0432','V1-FCT-1543','batch_retained_candidate'),
('V1-CARD-0432','V1-FCT-1544','batch_retained_candidate'),
('V1-CARD-0433','V1-FCT-1545','batch_retained_candidate'),
('V1-CARD-0433','V1-FCT-1546','batch_retained_candidate'),
('V1-CARD-0433','V1-FCT-1547','batch_retained_candidate'),
('V1-CARD-0434','V1-FCT-1548','batch_retained_candidate'),
('V1-CARD-0434','V1-FCT-1549','batch_retained_candidate'),
('V1-CARD-0434','V1-FCT-1550','batch_retained_candidate'),
('V1-CARD-0434','V1-FCT-1551','batch_retained_candidate'),
('V1-CARD-0434','V1-FCT-1552','research_note_only'),
('V1-CARD-0435','V1-FCT-1553','batch_retained_candidate'),
('V1-CARD-0435','V1-FCT-1554','batch_retained_candidate'),
('V1-CARD-0435','V1-FCT-1555','research_note_only'),
('V1-CARD-0436','V1-FCT-1556','batch_retained_candidate'),
('V1-CARD-0436','V1-FCT-1557','batch_retained_candidate'),
('V1-CARD-0436','V1-FCT-1558','research_note_only'),
('V1-CARD-0437','V1-FCT-1559','batch_retained_candidate'),
('V1-CARD-0437','V1-FCT-1560','batch_retained_candidate'),
('V1-CARD-0437','V1-FCT-1561','research_note_only'),
('V1-CARD-0438','V1-FCT-1562','batch_retained_candidate'),
('V1-CARD-0438','V1-FCT-1563','batch_retained_candidate'),
('V1-CARD-0439','V1-FCT-1564','batch_retained_candidate'),
('V1-CARD-0439','V1-FCT-1565','batch_retained_candidate'),
('V1-CARD-0440','V1-FCT-1566','batch_retained_candidate'),
('V1-CARD-0440','V1-FCT-1567','batch_retained_candidate'),
('V1-CARD-0441','V1-FCT-1568','batch_retained_candidate'),
('V1-CARD-0441','V1-FCT-1569','batch_retained_candidate'),
('V1-CARD-0441','V1-FCT-1570','research_note_only'),
('V1-CARD-0442','V1-FCT-1571','batch_retained_candidate'),
('V1-CARD-0442','V1-FCT-1572','batch_retained_candidate'),
('V1-CARD-0442','V1-FCT-1573','research_note_only'),
('V1-CARD-0443','V1-FCT-1574','batch_retained_candidate'),
('V1-CARD-0443','V1-FCT-1575','batch_retained_candidate'),
('V1-CARD-0443','V1-FCT-1576','research_note_only');

INSERT INTO card_sources (card_source_id,origin_matrix_id,card_id,source_id,source_level,source_role,bibliographic_support,research_support,independent_source_key,usage_status,issue_code) VALUES
('V1-CS-0761','WCD10-B07-S001','V1-CARD-0381','SRC-0148','B','bibliography_or_bounded_description','yes','no','SRC-0148','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0762','WCD10-B07-S004','V1-CARD-0381','SRC-0459','B','bibliography_or_bounded_description','yes','no','SRC-0459','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0763','WCD10-B07-S020','V1-CARD-0381','SRC-0474','A','attributed_study','no','yes','SRC-0474','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0764','WCD10-B07-S001','V1-CARD-0382','SRC-0148','B','bibliography_or_bounded_description','yes','no','SRC-0148','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0765','WCD10-B07-S003','V1-CARD-0382','SRC-0150','B','bibliography_or_bounded_description','yes','no','SRC-0150','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0766','WCD10-B07-S005','V1-CARD-0382','SRC-0460','B','bibliography_or_bounded_description','yes','no','SRC-0460','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0767','WCD10-B07-S020','V1-CARD-0382','SRC-0474','A','attributed_study','no','yes','SRC-0474','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0768','WCD10-B07-S003','V1-CARD-0383','SRC-0150','B','bibliography_or_bounded_description','yes','no','SRC-0150','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0769','WCD10-B07-S006','V1-CARD-0383','SRC-0461','B','bibliography_or_bounded_description','yes','no','SRC-0461','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0770','WCD10-B07-S003','V1-CARD-0384','SRC-0150','B','bibliography_or_bounded_description','yes','no','SRC-0150','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0771','WCD10-B07-S007','V1-CARD-0384','SRC-0462','B','bibliography_or_bounded_description','yes','no','SRC-0462','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0772','WCD10-B07-S001','V1-CARD-0385','SRC-0148','B','bibliography_or_bounded_description','yes','no','SRC-0148','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0773','WCD10-B07-S003','V1-CARD-0385','SRC-0150','B','bibliography_or_bounded_description','yes','no','SRC-0150','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0774','WCD10-B07-S008','V1-CARD-0385','SRC-0463','B','bibliography_or_bounded_description','yes','no','SRC-0463','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0775','WCD10-B07-S001','V1-CARD-0386','SRC-0148','B','bibliography_or_bounded_description','yes','no','SRC-0148','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0776','WCD10-B07-S003','V1-CARD-0386','SRC-0150','B','bibliography_or_bounded_description','yes','no','SRC-0150','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0777','WCD10-B07-S009','V1-CARD-0386','SRC-0464','B','bibliography_or_bounded_description','yes','no','SRC-0464','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0778','WCD10-B07-S003','V1-CARD-0387','SRC-0150','B','bibliography_or_bounded_description','yes','no','SRC-0150','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0779','WCD10-B07-S010','V1-CARD-0387','SRC-0465','B','bibliography_or_bounded_description','yes','no','SRC-0465','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0780','WCD10-B07-S019','V1-CARD-0388','SRC-0473','B','bibliography_or_bounded_description','yes','no','SRC-0473','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0781','WCD10-B07-S020','V1-CARD-0388','SRC-0474','A','attributed_study','no','yes','SRC-0474','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0782','WCD10-B07-S021','V1-CARD-0388','SRC-0475','B','bibliography_or_bounded_description','yes','no','SRC-0475','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0783','WCD10-B07-S023','V1-CARD-0388','SRC-0477','B','bibliography_or_bounded_description','no','no','SRC-0477','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0784','WCD10-B07-S019','V1-CARD-0389','SRC-0473','B','bibliography_or_bounded_description','yes','no','SRC-0473','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0785','WCD10-B07-S022','V1-CARD-0389','SRC-0476','B','bibliography_or_bounded_description','yes','no','SRC-0476','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0786','WCD10-B07-S101','V1-CARD-0390','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0787','WCD10-B07-S102','V1-CARD-0390','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0788','WCD10-B07-S105','V1-CARD-0390','SRC-0479','B','bibliography_or_bounded_description','yes','no','SRC-0479','accepted','NONE'),
('V1-CS-0789','WCD10-B07-S101','V1-CARD-0391','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0790','WCD10-B07-S102','V1-CARD-0391','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0791','WCD10-B07-S106','V1-CARD-0391','SRC-0480','B','bibliography_or_bounded_description','yes','no','SRC-0480','accepted','NONE'),
('V1-CS-0792','WCD10-B07-S101','V1-CARD-0392','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0793','WCD10-B07-S102','V1-CARD-0392','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0794','WCD10-B07-S107','V1-CARD-0392','SRC-0481','B','bibliography_or_bounded_description','yes','no','SRC-0481','accepted','NONE'),
('V1-CS-0795','WCD10-B07-S101','V1-CARD-0393','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0796','WCD10-B07-S102','V1-CARD-0393','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0797','WCD10-B07-S108','V1-CARD-0393','SRC-0482','B','bibliography_or_bounded_description','yes','no','SRC-0482','accepted','NONE'),
('V1-CS-0798','WCD10-B07-S101','V1-CARD-0394','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0799','WCD10-B07-S102','V1-CARD-0394','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0800','WCD10-B07-S110','V1-CARD-0394','SRC-0484','B','bibliography_or_bounded_description','yes','no','SRC-0484','accepted','NONE'),
('V1-CS-0801','WCD10-B07-S101','V1-CARD-0395','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0802','WCD10-B07-S102','V1-CARD-0395','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0803','WCD10-B07-S109','V1-CARD-0395','SRC-0483','B','bibliography_or_bounded_description','yes','no','SRC-0483','accepted','NONE'),
('V1-CS-0804','WCD10-B07-S101','V1-CARD-0396','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0805','WCD10-B07-S102','V1-CARD-0396','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0806','WCD10-B07-S111','V1-CARD-0396','SRC-0485','B','bibliography_or_bounded_description','yes','no','SRC-0485','accepted','NONE'),
('V1-CS-0807','WCD10-B07-S101','V1-CARD-0397','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0808','WCD10-B07-S102','V1-CARD-0397','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0809','WCD10-B07-S111','V1-CARD-0397','SRC-0485','B','bibliography_or_bounded_description','yes','no','SRC-0485','accepted','NONE'),
('V1-CS-0810','WCD10-B07-S101','V1-CARD-0398','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0811','WCD10-B07-S102','V1-CARD-0398','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0812','WCD10-B07-S111','V1-CARD-0398','SRC-0485','B','bibliography_or_bounded_description','yes','no','SRC-0485','accepted','NONE'),
('V1-CS-0813','WCD10-B07-S101','V1-CARD-0399','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0814','WCD10-B07-S102','V1-CARD-0399','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0815','WCD10-B07-S123','V1-CARD-0399','SRC-0497','B','bibliography_or_bounded_description','yes','no','SRC-0497','accepted','NONE'),
('V1-CS-0816','WCD10-B07-S101','V1-CARD-0400','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0817','WCD10-B07-S102','V1-CARD-0400','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0818','WCD10-B07-S124','V1-CARD-0400','SRC-0498','B','bibliography_or_bounded_description','yes','no','SRC-0498','accepted','NONE'),
('V1-CS-0819','WCD10-B07-S101','V1-CARD-0401','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0820','WCD10-B07-S102','V1-CARD-0401','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0821','WCD10-B07-S124','V1-CARD-0401','SRC-0498','B','bibliography_or_bounded_description','yes','no','SRC-0498','accepted','NONE'),
('V1-CS-0822','WCD10-B07-S127','V1-CARD-0401','SRC-0500','A','bibliography_or_bounded_description','no','no','SRC-0500','accepted','NONE'),
('V1-CS-0823','WCD10-B07-S101','V1-CARD-0402','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0824','WCD10-B07-S102','V1-CARD-0402','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0825','WCD10-B07-S124','V1-CARD-0402','SRC-0498','B','bibliography_or_bounded_description','yes','no','SRC-0498','accepted','NONE'),
('V1-CS-0826','WCD10-B07-S137','V1-CARD-0402','SRC-0510','B','bibliography_or_bounded_description','yes','no','SRC-0510','accepted','NONE'),
('V1-CS-0827','WCD10-B07-S101','V1-CARD-0403','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0828','WCD10-B07-S102','V1-CARD-0403','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0829','WCD10-B07-S124','V1-CARD-0403','SRC-0498','B','bibliography_or_bounded_description','yes','no','SRC-0498','accepted','NONE'),
('V1-CS-0830','WCD10-B07-S128','V1-CARD-0403','SRC-0501','A','bibliography_or_bounded_description','no','no','SRC-0501','accepted','NONE'),
('V1-CS-0831','WCD10-B07-S101','V1-CARD-0404','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0832','WCD10-B07-S129','V1-CARD-0404','SRC-0502','B','bibliography_or_bounded_description','yes','no','SRC-0502','accepted','NONE'),
('V1-CS-0833','WCD10-B07-S101','V1-CARD-0405','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0834','WCD10-B07-S130','V1-CARD-0405','SRC-0503','B','bibliography_or_bounded_description','yes','no','SRC-0503','accepted','NONE'),
('V1-CS-0835','WCD10-B07-S134','V1-CARD-0405','SRC-0507','B','bibliography_or_bounded_description','yes','no','SRC-0507','accepted','NONE'),
('V1-CS-0836','WCD10-B07-S136','V1-CARD-0405','SRC-0509','A','bibliography_or_bounded_description','yes','no','SRC-0509','accepted','NONE'),
('V1-CS-0837','WCD10-B07-S101','V1-CARD-0406','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0838','WCD10-B07-S131','V1-CARD-0406','SRC-0504','A','bibliography_or_bounded_description','yes','no','SRC-0504','accepted','NONE'),
('V1-CS-0839','WCD10-B07-S134','V1-CARD-0406','SRC-0507','B','bibliography_or_bounded_description','yes','no','SRC-0507','accepted','NONE'),
('V1-CS-0840','WCD10-B07-S101','V1-CARD-0407','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0841','WCD10-B07-S129','V1-CARD-0407','SRC-0502','B','bibliography_or_bounded_description','yes','no','SRC-0502','accepted','NONE'),
('V1-CS-0842','WCD10-B07-S134','V1-CARD-0407','SRC-0507','B','bibliography_or_bounded_description','yes','no','SRC-0507','accepted','NONE'),
('V1-CS-0843','WCD10-B07-S101','V1-CARD-0408','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0844','WCD10-B07-S131','V1-CARD-0408','SRC-0504','A','bibliography_or_bounded_description','yes','no','SRC-0504','accepted','NONE'),
('V1-CS-0845','WCD10-B07-S132','V1-CARD-0408','SRC-0505','B','bibliography_or_bounded_description','yes','no','SRC-0505','accepted','NONE'),
('V1-CS-0846','WCD10-B07-S133','V1-CARD-0408','SRC-0506','B','bibliography_or_bounded_description','no','no','SRC-0506','accepted','NONE'),
('V1-CS-0847','WCD10-B07-S136','V1-CARD-0408','SRC-0509','A','bibliography_or_bounded_description','yes','no','SRC-0509','accepted','NONE'),
('V1-CS-0848','WCD10-B07-S101','V1-CARD-0409','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0849','WCD10-B07-S131','V1-CARD-0409','SRC-0504','A','bibliography_or_bounded_description','yes','no','SRC-0504','accepted','NONE'),
('V1-CS-0850','WCD10-B07-S136','V1-CARD-0409','SRC-0509','A','bibliography_or_bounded_description','yes','no','SRC-0509','accepted','NONE'),
('V1-CS-0851','WCD10-B07-S134','V1-CARD-0410','SRC-0507','B','bibliography_or_bounded_description','yes','no','SRC-0507','accepted','NONE'),
('V1-CS-0852','WCD10-B07-S135','V1-CARD-0410','SRC-0508','B','bibliography_or_bounded_description','yes','no','SRC-0508','accepted','NONE'),
('V1-CS-0853','WCD10-B07-S136','V1-CARD-0410','SRC-0509','A','bibliography_or_bounded_description','yes','no','SRC-0509','accepted','NONE'),
('V1-CS-0854','WCD10-B07-S102','V1-CARD-0411','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0855','WCD10-B07-S138','V1-CARD-0411','SRC-0511','B','bibliography_or_bounded_description','yes','no','SRC-0511','accepted','NONE'),
('V1-CS-0856','WCD10-B07-S102','V1-CARD-0412','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0857','WCD10-B07-S131','V1-CARD-0412','SRC-0504','A','bibliography_or_bounded_description','yes','no','SRC-0504','accepted','NONE'),
('V1-CS-0858','WCD10-B07-S102','V1-CARD-0413','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0859','WCD10-B07-S131','V1-CARD-0413','SRC-0504','A','bibliography_or_bounded_description','yes','no','SRC-0504','accepted','NONE'),
('V1-CS-0860','WCD10-B07-S140','V1-CARD-0414','SRC-0512','B','bibliography_or_bounded_description','yes','no','SRC-0512','accepted','NONE'),
('V1-CS-0861','WCD10-B07-S141','V1-CARD-0414','SRC-0513','B','bibliography_or_bounded_description','yes','no','SRC-0513','accepted','NONE'),
('V1-CS-0862','WCD10-B07-S142','V1-CARD-0414','SRC-0514','A','bibliography_or_bounded_description','yes','no','SRC-0514','accepted','NONE'),
('V1-CS-0863','WCD10-B07-S143','V1-CARD-0414','SRC-0515','A','bibliography_or_bounded_description','yes','no','SRC-0515','accepted','NONE'),
('V1-CS-0864','WCD10-B07-S144','V1-CARD-0415','SRC-0516','B','bibliography_or_bounded_description','yes','no','SRC-0516','accepted','NONE'),
('V1-CS-0865','WCD10-B07-S145','V1-CARD-0415','SRC-0517','A','bibliography_or_bounded_description','yes','no','SRC-0517','accepted','NONE'),
('V1-CS-0866','WCD10-B07-S146','V1-CARD-0416','SRC-0518','A','bibliography_or_bounded_description','yes','no','SRC-0518','accepted','NONE'),
('V1-CS-0867','WCD10-B07-S148','V1-CARD-0416','SRC-0520','A','bibliography_or_bounded_description','yes','no','SRC-0520','accepted','NONE'),
('V1-CS-0868','WCD10-B07-S101','V1-CARD-0417','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0869','WCD10-B07-S102','V1-CARD-0417','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0870','WCD10-B07-S147','V1-CARD-0417','SRC-0519','B','bibliography_or_bounded_description','yes','no','SRC-0519','accepted','NONE'),
('V1-CS-0871','WCD10-B07-S149','V1-CARD-0417','SRC-0521','B','bibliography_or_bounded_description','yes','no','SRC-0521','accepted','NONE'),
('V1-CS-0872','WCD10-B07-S101','V1-CARD-0418','SRC-0478','B','bibliography_or_bounded_description','yes','no','SRC-0478','accepted','NONE'),
('V1-CS-0873','WCD10-B07-S102','V1-CARD-0418','SRC-0154','B','bibliography_or_bounded_description','yes','no','SRC-0154','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0874','WCD10-B07-S140','V1-CARD-0418','SRC-0512','B','bibliography_or_bounded_description','yes','no','SRC-0512','accepted','NONE'),
('V1-CS-0875','WCD10-B07-S201','V1-CARD-0419','SRC-0522','B','bibliography_or_bounded_description','no','no','SRC-0522','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0876','WCD10-B07-S202','V1-CARD-0419','SRC-0523','B','bibliography_or_bounded_description','yes','no','SRC-0523','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0877','WCD10-B07-S203','V1-CARD-0419','SRC-0524','B','bibliography_or_bounded_description','yes','no','SRC-0524','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0878','WCD10-B07-S204','V1-CARD-0419','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0879','WCD10-B07-S208','V1-CARD-0419','SRC-0529','A','attributed_study','no','yes','SRC-0529','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0880','WCD10-B07-S202','V1-CARD-0420','SRC-0523','B','bibliography_or_bounded_description','yes','no','SRC-0523','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0881','WCD10-B07-S204','V1-CARD-0420','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0882','WCD10-B07-S205','V1-CARD-0420','SRC-0526','B','bibliography_or_bounded_description','yes','no','SRC-0526','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0883','WCD10-B07-S202','V1-CARD-0421','SRC-0523','B','bibliography_or_bounded_description','yes','no','SRC-0523','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0884','WCD10-B07-S204','V1-CARD-0421','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0885','WCD10-B07-S205','V1-CARD-0421','SRC-0526','B','bibliography_or_bounded_description','yes','no','SRC-0526','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0886','WCD10-B07-S201','V1-CARD-0422','SRC-0522','B','bibliography_or_bounded_description','no','no','SRC-0522','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0887','WCD10-B07-S202','V1-CARD-0422','SRC-0523','B','bibliography_or_bounded_description','yes','no','SRC-0523','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0888','WCD10-B07-S204','V1-CARD-0422','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0889','WCD10-B07-S205','V1-CARD-0422','SRC-0526','B','bibliography_or_bounded_description','yes','no','SRC-0526','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0890','WCD10-B07-S202','V1-CARD-0423','SRC-0523','B','bibliography_or_bounded_description','yes','no','SRC-0523','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0891','WCD10-B07-S204','V1-CARD-0423','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0892','WCD10-B07-S205','V1-CARD-0423','SRC-0526','B','bibliography_or_bounded_description','yes','no','SRC-0526','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0893','WCD10-B07-S203','V1-CARD-0424','SRC-0524','B','bibliography_or_bounded_description','yes','no','SRC-0524','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0894','WCD10-B07-S204','V1-CARD-0424','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0895','WCD10-B07-S205','V1-CARD-0424','SRC-0526','B','bibliography_or_bounded_description','yes','no','SRC-0526','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0896','WCD10-B07-S206','V1-CARD-0424','SRC-0527','B','bibliography_or_bounded_description','yes','no','SRC-0527','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0897','WCD10-B07-S216','V1-CARD-0424','SRC-0536','B','bibliography_or_bounded_description','yes','no','SRC-0536','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0898','WCD10-B07-S202','V1-CARD-0425','SRC-0523','B','bibliography_or_bounded_description','yes','no','SRC-0523','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0899','WCD10-B07-S204','V1-CARD-0425','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0900','WCD10-B07-S201','V1-CARD-0426','SRC-0522','B','bibliography_or_bounded_description','yes','no','SRC-0522','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0901','WCD10-B07-S204','V1-CARD-0426','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0902','WCD10-B07-S205','V1-CARD-0426','SRC-0526','B','bibliography_or_bounded_description','yes','no','SRC-0526','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0903','WCD10-B07-S201','V1-CARD-0427','SRC-0522','B','bibliography_or_bounded_description','yes','no','SRC-0522','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0904','WCD10-B07-S204','V1-CARD-0427','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0905','WCD10-B07-S207','V1-CARD-0427','SRC-0528','B','bibliography_or_bounded_description','yes','no','SRC-0528','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0906','WCD10-B07-S203','V1-CARD-0428','SRC-0524','B','bibliography_or_bounded_description','yes','no','SRC-0524','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0907','WCD10-B07-S204','V1-CARD-0428','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0908','WCD10-B07-S205','V1-CARD-0428','SRC-0526','B','bibliography_or_bounded_description','yes','no','SRC-0526','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0909','WCD10-B07-S215','V1-CARD-0428','SRC-0160','B','bibliography_or_bounded_description','yes','no','SRC-0160','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0910','WCD10-B07-S204','V1-CARD-0429','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0911','WCD10-B07-S215','V1-CARD-0429','SRC-0160','B','bibliography_or_bounded_description','yes','no','SRC-0160','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0912','WCD10-B07-S219','V1-CARD-0429','SRC-0159','B','bibliography_or_bounded_description','yes','no','SRC-0159','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0913','WCD10-B07-S220','V1-CARD-0429','SRC-0538','B','bibliography_or_bounded_description','yes','no','SRC-0538','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0914','WCD10-B07-S222','V1-CARD-0429','SRC-0540','B','bibliography_or_bounded_description','yes','no','SRC-0540','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0915','WCD10-B07-S204','V1-CARD-0430','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0916','WCD10-B07-S221','V1-CARD-0430','SRC-0539','B','bibliography_or_bounded_description','yes','no','SRC-0539','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0917','WCD10-B07-S226','V1-CARD-0430','SRC-0544','B','bibliography_or_bounded_description','yes','no','SRC-0544','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0918','WCD10-B07-S201','V1-CARD-0431','SRC-0522','B','bibliography_or_bounded_description','yes','no','SRC-0522','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0919','WCD10-B07-S204','V1-CARD-0431','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0920','WCD10-B07-S225','V1-CARD-0431','SRC-0543','A','attributed_study','yes','yes','SRC-0543','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0921','WCD10-B07-S204','V1-CARD-0432','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0922','WCD10-B07-S215','V1-CARD-0432','SRC-0160','B','bibliography_or_bounded_description','yes','no','SRC-0160','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0923','WCD10-B07-S223','V1-CARD-0432','SRC-0541','B','bibliography_or_bounded_description','yes','no','SRC-0541','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0924','WCD10-B07-S224','V1-CARD-0432','SRC-0542','B','bibliography_or_bounded_description','yes','no','SRC-0542','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0925','WCD10-B07-S227','V1-CARD-0432','SRC-0545','B','bibliography_or_bounded_description','yes','no','SRC-0545','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0926','WCD10-B07-S202','V1-CARD-0433','SRC-0523','B','bibliography_or_bounded_description','no','no','SRC-0523','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0927','WCD10-B07-S204','V1-CARD-0433','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0928','WCD10-B07-S215','V1-CARD-0433','SRC-0160','B','bibliography_or_bounded_description','yes','no','SRC-0160','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0929','WCD10-B07-S219','V1-CARD-0433','SRC-0159','B','bibliography_or_bounded_description','yes','no','SRC-0159','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0930','WCD10-B07-S204','V1-CARD-0434','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0931','WCD10-B07-S218','V1-CARD-0434','SRC-0537','A','attributed_study','yes','yes','SRC-0537','accepted','NONE'),
('V1-CS-0932','WCD10-B07-S228','V1-CARD-0434','SRC-0546','B','bibliography_or_bounded_description','yes','no','SRC-0546','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0933','WCD10-B07-S002','V1-CARD-0435','SRC-0149','B','bibliography_or_bounded_description','yes','no','SRC-0149','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0934','WCD10-B07-S011','V1-CARD-0435','SRC-0466','B','bibliography_or_bounded_description','yes','no','SRC-0466','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0935','WCD10-B07-S014','V1-CARD-0435','SRC-0469','A','attributed_study','no','yes','SRC-0469','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0936','WCD10-B07-S002','V1-CARD-0436','SRC-0149','B','bibliography_or_bounded_description','yes','no','SRC-0149','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0937','WCD10-B07-S012','V1-CARD-0436','SRC-0467','B','bibliography_or_bounded_description','yes','no','SRC-0467','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0938','WCD10-B07-S015','V1-CARD-0436','SRC-0470','A','attributed_study','no','yes','SRC-0470','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0939','WCD10-B07-S016','V1-CARD-0436','SRC-0471','A','attributed_study','no','yes','SRC-0471','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0940','WCD10-B07-S002','V1-CARD-0437','SRC-0149','B','bibliography_or_bounded_description','yes','no','SRC-0149','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0941','WCD10-B07-S013','V1-CARD-0437','SRC-0468','B','bibliography_or_bounded_description','yes','no','SRC-0468','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0942','WCD10-B07-S017','V1-CARD-0437','SRC-0472','A','attributed_study','no','yes','SRC-0472','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0943','WCD10-B07-S112','V1-CARD-0438','SRC-0486','B','bibliography_or_bounded_description','yes','no','SRC-0486','accepted','NONE'),
('V1-CS-0944','WCD10-B07-S122','V1-CARD-0439','SRC-0496','B','bibliography_or_bounded_description','yes','no','SRC-0496','accepted','NONE'),
('V1-CS-0945','WCD10-B07-S103','V1-CARD-0440','SRC-0155','B','bibliography_or_bounded_description','yes','no','SRC-0155','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0946','WCD10-B07-S120','V1-CARD-0440','SRC-0494','A','bibliography_or_bounded_description','yes','no','SRC-0494','accepted','NONE'),
('V1-CS-0947','WCD10-B07-S121','V1-CARD-0440','SRC-0495','A','bibliography_or_bounded_description','no','no','SRC-0495','accepted','NONE'),
('V1-CS-0948','WCD10-B07-S201','V1-CARD-0441','SRC-0522','B','bibliography_or_bounded_description','yes','no','SRC-0522','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0949','WCD10-B07-S210','V1-CARD-0441','SRC-0531','A','attributed_study','yes','yes','SRC-0531','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0950','WCD10-B07-S204','V1-CARD-0442','SRC-0525','B','bibliography_or_bounded_description','yes','no','SRC-0525','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0951','WCD10-B07-S211','V1-CARD-0442','SRC-0532','A','attributed_study','yes','yes','SRC-0532','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0952','WCD10-B07-S212','V1-CARD-0442','SRC-0533','A','attributed_study','no','yes','SRC-0533','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0953','WCD10-B07-S213','V1-CARD-0442','SRC-0534','A','attributed_study','no','yes','SRC-0534','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0954','WCD10-B07-S201','V1-CARD-0443','SRC-0522','B','bibliography_or_bounded_description','yes','no','SRC-0522','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT'),
('V1-CS-0955','WCD10-B07-S214','V1-CARD-0443','SRC-0535','A','attributed_study','yes','yes','SRC-0535','accepted','SCOPE-OVERLAP-NOT-INDEPENDENT');

INSERT INTO relationships (relationship_id,origin_layer,origin_relation_group_id,subject_id,relation_type,object_id,description_zh,confidence,review_status,upstream_review_status,evidence_count,issue_code) VALUES
('V1-REL-0426','WCD-10-B07','WCD10-B07-W001-CREATED','V1-ENT-0186','CREATED','V1-ENT-0457','埃内斯托·萨瓦托创作 Uno y el Universo','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0427','WCD-10-B07','WCD10-B07-W002-CREATED','V1-ENT-0186','CREATED','V1-ENT-0458','埃内斯托·萨瓦托创作 Hombres y engranajes','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0428','WCD-10-B07','WCD10-B07-W003-CREATED','V1-ENT-0186','CREATED','V1-ENT-0459','埃内斯托·萨瓦托创作 El escritor y sus fantasmas','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0429','WCD-10-B07','WCD10-B07-W004-CREATED','V1-ENT-0186','CREATED','V1-ENT-0460','埃内斯托·萨瓦托创作 Apologías y rechazos','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0430','WCD-10-B07','WCD10-B07-W005-CREATED','V1-ENT-0186','CREATED','V1-ENT-0461','埃内斯托·萨瓦托创作 Antes del fin','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0431','WCD-10-B07','WCD10-B07-W006-CREATED','V1-ENT-0186','CREATED','V1-ENT-0462','埃内斯托·萨瓦托创作 La resistencia','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0432','WCD-10-B07','WCD10-B07-W007-CREATED','V1-ENT-0186','CREATED','V1-ENT-0463','埃内斯托·萨瓦托创作 España en los diarios de mi vejez','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0433','WCD-10-B07','WCD10-B07-W008-CREATED','V1-ENT-0186','CREATED','V1-ENT-0464','埃内斯托·萨瓦托创作 El otro rostro del peronismo','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0434','WCD-10-B07','WCD10-B07-W009-CREATED','V1-ENT-0186','CREATED','V1-ENT-0465','埃内斯托·萨瓦托创作 Tres aproximaciones a la literatura de nuestro tiempo','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0435','WCD-10-B07','WCD10-B07-W101-CREATED','V1-ENT-0198','CREATED','V1-ENT-0466','阿道夫·比奥伊·卡萨雷斯创作 Diario de la guerra del cerdo','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0436','WCD-10-B07','WCD10-B07-W102-CREATED','V1-ENT-0198','CREATED','V1-ENT-0467','阿道夫·比奥伊·卡萨雷斯创作 Dormir al sol','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0437','WCD-10-B07','WCD10-B07-W103-CREATED','V1-ENT-0198','CREATED','V1-ENT-0468','阿道夫·比奥伊·卡萨雷斯创作 La trama celeste','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0438','WCD-10-B07','WCD10-B07-W104-CREATED','V1-ENT-0198','CREATED','V1-ENT-0469','阿道夫·比奥伊·卡萨雷斯创作 Historia prodigiosa','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0439','WCD-10-B07','WCD10-B07-W105-CREATED','V1-ENT-0198','CREATED','V1-ENT-0470','阿道夫·比奥伊·卡萨雷斯创作 Guirnalda con amores','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0440','WCD-10-B07','WCD10-B07-W106-CREATED','V1-ENT-0198','CREATED','V1-ENT-0471','阿道夫·比奥伊·卡萨雷斯创作 El gran Serafín','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0441','WCD-10-B07','WCD10-B07-W107-CREATED','V1-ENT-0198','CREATED','V1-ENT-0472','阿道夫·比奥伊·卡萨雷斯创作 La aventura de un fotógrafo en La Plata','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0442','WCD-10-B07','WCD10-B07-W108-CREATED','V1-ENT-0198','CREATED','V1-ENT-0473','阿道夫·比奥伊·卡萨雷斯创作 Un campeón desparejo','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0443','WCD-10-B07','WCD10-B07-W109-CREATED','V1-ENT-0198','CREATED','V1-ENT-0474','阿道夫·比奥伊·卡萨雷斯创作 De un mundo a otro','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0444','WCD-10-B07','WCD10-B07-W110-CREATED','V1-ENT-0198','CREATED','V1-ENT-0475','阿道夫·比奥伊·卡萨雷斯创作 El lado de la sombra','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0445','WCD-10-B07','WCD10-B07-W111-CREATED','V1-ENT-0198','CREATED','V1-ENT-0476','阿道夫·比奥伊·卡萨雷斯创作 El héroe de las mujeres','high','accepted','Codex-parent-independent-review:PASS','4','NONE'),
('V1-REL-0446','WCD-10-B07','WCD10-B07-W112-CREATED','V1-ENT-0198','CREATED','V1-ENT-0477','阿道夫·比奥伊·卡萨雷斯创作 Historias desaforadas','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0447','WCD-10-B07','WCD10-B07-W113-CREATED','V1-ENT-0198','CREATED','V1-ENT-0478','阿道夫·比奥伊·卡萨雷斯创作 Una muñeca rusa','high','accepted','Codex-parent-independent-review:PASS','4','NONE'),
('V1-REL-0448','WCD-10-B07','WCD10-B07-W114-CREATED','V1-ENT-0198','CREATED','V1-ENT-0479','阿道夫·比奥伊·卡萨雷斯创作 Una magia modesta','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0449','WCD-10-B07','WCD10-B07-W115-CREATED','V1-ENT-0198','CREATED','V1-ENT-0480','阿道夫·比奥伊·卡萨雷斯创作 La otra aventura','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0450','WCD-10-B07','WCD10-B07-W116-CREATED','V1-ENT-0198','CREATED','V1-ENT-0481','阿道夫·比奥伊·卡萨雷斯创作 Memorias','high','accepted','Codex-parent-independent-review:PASS','4','NONE'),
('V1-REL-0451','WCD-10-B07','WCD10-B07-W117-CREATED','V1-ENT-0198','CREATED','V1-ENT-0482','阿道夫·比奥伊·卡萨雷斯编选《De jardines ajenos》','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0452','WCD-10-B07','WCD10-B07-W118-CREATED','V1-ENT-0198','CREATED','V1-ENT-0483','阿道夫·比奥伊·卡萨雷斯创作 De las cosas maravillosas','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0453','WCD-10-B07','WCD10-B07-W119-CREATED','V1-ENT-0198','CREATED','V1-ENT-0484','阿道夫·比奥伊·卡萨雷斯撰写日记/笔记，Daniel Martino 编选《Descanso de caminantes, Diarios íntimos》','high','accepted','Codex-parent-independent-review:PASS','5','NONE'),
('V1-REL-0454','WCD-10-B07','WCD10-B07-W120-CREATED','V1-ENT-0198','CREATED','V1-ENT-0485','《Borges》选编自阿道夫·比奥伊·卡萨雷斯的日记，由 Daniel Martino 编选；Borges 是被记录者。','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0455','WCD-10-B07','WCD10-B07-W121-CREATED','V1-ENT-0198','CREATED','V1-ENT-0486','阿道夫·比奥伊·卡萨雷斯创作 En viaje (1967)','high','accepted','Codex-parent-independent-review:PASS','1','NONE'),
('V1-REL-0456','WCD-10-B07','WCD10-B07-W122-CREATED','V1-ENT-0198','CREATED','V1-ENT-0487','阿道夫·比奥伊·卡萨雷斯创作 Memoria sobre la pampa y los gauchos','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0457','WCD-10-B07','WCD10-B07-W123-CREATED','V1-ENT-0198','CREATED','V1-ENT-0488','阿道夫·比奥伊·卡萨雷斯创作 Breve diccionario del argentino exquisito','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0458','WCD-10-B07','WCD10-B07-W124-CREATED','V1-ENT-0198','CREATED','V1-ENT-0489','阿道夫·比奥伊·卡萨雷斯创作 La estatua casera','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0459','WCD-10-B07','WCD10-B07-W125-CREATED','V1-ENT-0198','CREATED','V1-ENT-0490','阿道夫·比奥伊·卡萨雷斯创作 El perjurio de la nieve','high','accepted','Codex-parent-independent-review:PASS','4','NONE'),
('V1-REL-0460','WCD-10-B07','WCD10-B07-W126-CREATED','V1-ENT-0198','CREATED','V1-ENT-0491','阿道夫·比奥伊·卡萨雷斯创作 Las vísperas de Fausto','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0461','WCD-10-B07','WCD10-B07-W127-CREATED','V1-ENT-0198','CREATED','V1-ENT-0492','阿道夫·比奥伊·卡萨雷斯创作 Homenaje a Francisco Almeyra','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0462','WCD-10-B07','WCD10-B07-W128-CREATED','V1-ENT-0198','CREATED','V1-ENT-0493','与西尔维娜·奥坎波（Silvina Ocampo）合著；此 CREATED 关系记录 Bioy Casares 的共同创作身份，不表示其为独著作者。','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0463','WCD-10-B07','WCD10-B07-W129-CREATED','V1-ENT-0198','CREATED','V1-ENT-0494','与Jorge Luis Borges及Silvina Ocampo共同编选/翻译；Bioy另撰序。此 CREATED 表示编者、译者与序作者贡献，不表示独著。','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0464','WCD-10-B07','WCD10-B07-W201-CREATED','V1-ENT-0199','CREATED','V1-ENT-0495','奥古斯托·罗亚·巴斯托斯创作 El trueno entre las hojas','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0465','WCD-10-B07','WCD10-B07-W202-CREATED','V1-ENT-0199','CREATED','V1-ENT-0496','奥古斯托·罗亚·巴斯托斯创作 El baldío','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0466','WCD-10-B07','WCD10-B07-W203-CREATED','V1-ENT-0199','CREATED','V1-ENT-0497','奥古斯托·罗亚·巴斯托斯创作 Los pies sobre el agua','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0467','WCD-10-B07','WCD10-B07-W204-CREATED','V1-ENT-0199','CREATED','V1-ENT-0498','奥古斯托·罗亚·巴斯托斯创作 Madera quemada','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0468','WCD-10-B07','WCD10-B07-W205-CREATED','V1-ENT-0199','CREATED','V1-ENT-0499','奥古斯托·罗亚·巴斯托斯创作 Moriencia','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0469','WCD-10-B07','WCD10-B07-W206-CREATED','V1-ENT-0199','CREATED','V1-ENT-0500','奥古斯托·罗亚·巴斯托斯创作 Cuerpo presente y otros cuentos','high','accepted','Codex-parent-independent-review:PASS','4','NONE'),
('V1-REL-0470','WCD-10-B07','WCD10-B07-W207-CREATED','V1-ENT-0199','CREATED','V1-ENT-0501','奥古斯托·罗亚·巴斯托斯创作 El pollito de fuego','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0471','WCD-10-B07','WCD10-B07-W208-CREATED','V1-ENT-0199','CREATED','V1-ENT-0502','奥古斯托·罗亚·巴斯托斯创作 Vigilia del Almirante','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0472','WCD-10-B07','WCD10-B07-W209-CREATED','V1-ENT-0199','CREATED','V1-ENT-0503','奥古斯托·罗亚·巴斯托斯创作 Contravida','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0473','WCD-10-B07','WCD10-B07-W210-CREATED','V1-ENT-0199','CREATED','V1-ENT-0504','奥古斯托·罗亚·巴斯托斯创作 El naranjal ardiente','high','accepted','Codex-parent-independent-review:PASS','3','NONE'),
('V1-REL-0474','WCD-10-B07','WCD10-B07-W212-CREATED','V1-ENT-0199','CREATED','V1-ENT-0505','奥古斯托·罗亚·巴斯托斯创作 El ruiseñor de la aurora y otros poemas','high','accepted','Codex-parent-independent-review:PASS','5','NONE'),
('V1-REL-0475','WCD-10-B07','WCD10-B07-W213-CREATED','V1-ENT-0199','CREATED','V1-ENT-0506','奥古斯托·罗亚·巴斯托斯创作 La Inglaterra que yo vi','high','accepted','Codex-parent-independent-review:PASS','4','NONE'),
('V1-REL-0476','WCD-10-B07','WCD10-B07-W214-CREATED','V1-ENT-0199','CREATED','V1-ENT-0507','奥古斯托·罗亚·巴斯托斯创作 Madama Sui','high','accepted','Codex-parent-independent-review:PASS','2','NONE'),
('V1-REL-0477','WCD-10-B07','WCD10-B07-W215-CREATED','V1-ENT-0199','CREATED','V1-ENT-0508','奥古斯托·罗亚·巴斯托斯创作 Metaforismos','high','accepted','Codex-parent-independent-review:PASS','5','NONE'),
('V1-REL-0478','WCD-10-B07','WCD10-B07-W216-CREATED','V1-ENT-0199','CREATED','V1-ENT-0509','奥古斯托·罗亚·巴斯托斯创作 Los Juegos 1: Carolina y Gaspar','high','accepted','Codex-parent-independent-review:PASS','4','NONE'),
('V1-REL-0479','WCD-10-B07','WCD10-B07-W217-CREATED','V1-ENT-0199','CREATED','V1-ENT-0510','奥古斯托·罗亚·巴斯托斯编纂《Las culturas condenadas》','high','accepted','Codex-parent-independent-review:PASS','3','NONE');

INSERT INTO relationship_sources (relationship_id,source_id) VALUES
('V1-REL-0426','SRC-0148'),
('V1-REL-0426','SRC-0459'),
('V1-REL-0427','SRC-0148'),
('V1-REL-0427','SRC-0150'),
('V1-REL-0427','SRC-0460'),
('V1-REL-0428','SRC-0150'),
('V1-REL-0428','SRC-0461'),
('V1-REL-0429','SRC-0150'),
('V1-REL-0429','SRC-0462'),
('V1-REL-0430','SRC-0148'),
('V1-REL-0430','SRC-0150'),
('V1-REL-0430','SRC-0463'),
('V1-REL-0431','SRC-0148'),
('V1-REL-0431','SRC-0150'),
('V1-REL-0431','SRC-0464'),
('V1-REL-0432','SRC-0150'),
('V1-REL-0432','SRC-0465'),
('V1-REL-0433','SRC-0473'),
('V1-REL-0433','SRC-0475'),
('V1-REL-0434','SRC-0473'),
('V1-REL-0434','SRC-0476'),
('V1-REL-0435','SRC-0478'),
('V1-REL-0435','SRC-0154'),
('V1-REL-0435','SRC-0479'),
('V1-REL-0436','SRC-0478'),
('V1-REL-0436','SRC-0154'),
('V1-REL-0436','SRC-0480'),
('V1-REL-0437','SRC-0478'),
('V1-REL-0437','SRC-0154'),
('V1-REL-0437','SRC-0481'),
('V1-REL-0438','SRC-0478'),
('V1-REL-0438','SRC-0154'),
('V1-REL-0438','SRC-0482'),
('V1-REL-0439','SRC-0478'),
('V1-REL-0439','SRC-0154'),
('V1-REL-0439','SRC-0484'),
('V1-REL-0440','SRC-0478'),
('V1-REL-0440','SRC-0154'),
('V1-REL-0440','SRC-0483'),
('V1-REL-0441','SRC-0478'),
('V1-REL-0441','SRC-0154'),
('V1-REL-0441','SRC-0485'),
('V1-REL-0442','SRC-0478'),
('V1-REL-0442','SRC-0154'),
('V1-REL-0442','SRC-0485'),
('V1-REL-0443','SRC-0478'),
('V1-REL-0443','SRC-0154'),
('V1-REL-0443','SRC-0485'),
('V1-REL-0444','SRC-0478'),
('V1-REL-0444','SRC-0154'),
('V1-REL-0444','SRC-0497'),
('V1-REL-0445','SRC-0478'),
('V1-REL-0445','SRC-0154'),
('V1-REL-0445','SRC-0498'),
('V1-REL-0445','SRC-0499'),
('V1-REL-0446','SRC-0478'),
('V1-REL-0446','SRC-0154'),
('V1-REL-0446','SRC-0498'),
('V1-REL-0447','SRC-0478'),
('V1-REL-0447','SRC-0154'),
('V1-REL-0447','SRC-0498'),
('V1-REL-0447','SRC-0510'),
('V1-REL-0448','SRC-0478'),
('V1-REL-0448','SRC-0154'),
('V1-REL-0448','SRC-0498'),
('V1-REL-0449','SRC-0478'),
('V1-REL-0449','SRC-0502'),
('V1-REL-0450','SRC-0478'),
('V1-REL-0450','SRC-0154'),
('V1-REL-0450','SRC-0503'),
('V1-REL-0450','SRC-0509'),
('V1-REL-0451','SRC-0478'),
('V1-REL-0451','SRC-0504'),
('V1-REL-0452','SRC-0478'),
('V1-REL-0452','SRC-0502'),
('V1-REL-0453','SRC-0478'),
('V1-REL-0453','SRC-0504'),
('V1-REL-0453','SRC-0505'),
('V1-REL-0453','SRC-0506'),
('V1-REL-0453','SRC-0509'),
('V1-REL-0454','SRC-0478'),
('V1-REL-0454','SRC-0504'),
('V1-REL-0454','SRC-0509'),
('V1-REL-0455','SRC-0509'),
('V1-REL-0456','SRC-0154'),
('V1-REL-0456','SRC-0511'),
('V1-REL-0457','SRC-0154'),
('V1-REL-0457','SRC-0504'),
('V1-REL-0458','SRC-0154'),
('V1-REL-0458','SRC-0504'),
('V1-REL-0459','SRC-0513'),
('V1-REL-0459','SRC-0514'),
('V1-REL-0459','SRC-0515'),
('V1-REL-0459','SRC-0512'),
('V1-REL-0460','SRC-0516'),
('V1-REL-0460','SRC-0517'),
('V1-REL-0461','SRC-0518'),
('V1-REL-0461','SRC-0520'),
('V1-REL-0462','SRC-0154'),
('V1-REL-0462','SRC-0519'),
('V1-REL-0463','SRC-0512'),
('V1-REL-0463','SRC-0478'),
('V1-REL-0463','SRC-0154'),
('V1-REL-0464','SRC-0525'),
('V1-REL-0464','SRC-0523'),
('V1-REL-0465','SRC-0525'),
('V1-REL-0465','SRC-0523'),
('V1-REL-0466','SRC-0525'),
('V1-REL-0466','SRC-0523'),
('V1-REL-0467','SRC-0525'),
('V1-REL-0467','SRC-0523'),
('V1-REL-0467','SRC-0522'),
('V1-REL-0468','SRC-0525'),
('V1-REL-0468','SRC-0523'),
('V1-REL-0469','SRC-0525'),
('V1-REL-0469','SRC-0527'),
('V1-REL-0469','SRC-0524'),
('V1-REL-0469','SRC-0536'),
('V1-REL-0470','SRC-0525'),
('V1-REL-0470','SRC-0523'),
('V1-REL-0471','SRC-0522'),
('V1-REL-0471','SRC-0525'),
('V1-REL-0471','SRC-0526'),
('V1-REL-0472','SRC-0528'),
('V1-REL-0472','SRC-0525'),
('V1-REL-0472','SRC-0522'),
('V1-REL-0473','SRC-0525'),
('V1-REL-0473','SRC-0526'),
('V1-REL-0473','SRC-0160'),
('V1-REL-0474','SRC-0525'),
('V1-REL-0474','SRC-0160'),
('V1-REL-0474','SRC-0159'),
('V1-REL-0474','SRC-0538'),
('V1-REL-0474','SRC-0540'),
('V1-REL-0475','SRC-0525'),
('V1-REL-0475','SRC-0160'),
('V1-REL-0475','SRC-0539'),
('V1-REL-0475','SRC-0544'),
('V1-REL-0476','SRC-0522'),
('V1-REL-0476','SRC-0543'),
('V1-REL-0477','SRC-0525'),
('V1-REL-0477','SRC-0160'),
('V1-REL-0477','SRC-0541'),
('V1-REL-0477','SRC-0542'),
('V1-REL-0477','SRC-0545'),
('V1-REL-0478','SRC-0523'),
('V1-REL-0478','SRC-0525'),
('V1-REL-0478','SRC-0160'),
('V1-REL-0478','SRC-0159'),
('V1-REL-0479','SRC-0525'),
('V1-REL-0479','SRC-0537'),
('V1-REL-0479','SRC-0546');

INSERT INTO relationship_evidence (evidence_id,relationship_id,origin_evidence_id,source_id,source_title,locator,evidence_note,confidence,evidence_status,evidence_origin) VALUES
('V1-EV-0522','V1-REL-0426','WCD10-B07-S001','SRC-0148','24 de junio de 1911: nace Ernesto Sábato','网页实读：正文第39–44行；作品书目/说明边界见RESEARCH_NOTES。','埃内斯托·萨瓦托创作 Uno y el Universo','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0523','V1-REL-0426','WCD10-B07-S004','SRC-0459','Uno y el universo','出版社作品页实读：第14–21行；版次日期在第51–57行。','埃内斯托·萨瓦托创作 Uno y el Universo','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0524','V1-REL-0427','WCD10-B07-S001','SRC-0148','24 de junio de 1911: nace Ernesto Sábato','网页实读：正文第39–44行；作品书目/说明边界见RESEARCH_NOTES。','埃内斯托·萨瓦托创作 Hombres y engranajes','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0525','V1-REL-0427','WCD10-B07-S003','SRC-0150','Ernesto Sabato – Biografía','网页实读：第49–57行；更新日期第61行。','埃内斯托·萨瓦托创作 Hombres y engranajes','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0526','V1-REL-0427','WCD10-B07-S005','SRC-0460','Hombres y engranajes','出版社新闻稿PDF实读：第5–28行；第0–3行标出的2011是版次。','埃内斯托·萨瓦托创作 Hombres y engranajes','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0527','V1-REL-0428','WCD10-B07-S003','SRC-0150','Ernesto Sabato – Biografía','网页实读：第49–57行；更新日期第61行。','埃内斯托·萨瓦托创作 El escritor y sus fantasmas','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0528','V1-REL-0428','WCD10-B07-S006','SRC-0461','El escritor y sus fantasmas','出版社作品页实读：第16–23行；2002版次信息第54–67行。','埃内斯托·萨瓦托创作 El escritor y sus fantasmas','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0529','V1-REL-0429','WCD10-B07-S003','SRC-0150','Ernesto Sabato – Biografía','网页实读：第49–57行；更新日期第61行。','埃内斯托·萨瓦托创作 Apologías y rechazos','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0530','V1-REL-0429','WCD10-B07-S007','SRC-0462','Apologías y rechazos','出版社作品页实读：第14–22、50–63行。','埃内斯托·萨瓦托创作 Apologías y rechazos','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0531','V1-REL-0430','WCD10-B07-S001','SRC-0148','24 de junio de 1911: nace Ernesto Sábato','网页实读：正文第39–44行；作品书目/说明边界见RESEARCH_NOTES。','埃内斯托·萨瓦托创作 Antes del fin','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0532','V1-REL-0430','WCD10-B07-S003','SRC-0150','Ernesto Sabato – Biografía','网页实读：第49–57行；更新日期第61行。','埃内斯托·萨瓦托创作 Antes del fin','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0533','V1-REL-0430','WCD10-B07-S008','SRC-0463','Antes del fin','出版社作品页实读：第16–23、54–68行。','埃内斯托·萨瓦托创作 Antes del fin','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0534','V1-REL-0431','WCD10-B07-S001','SRC-0148','24 de junio de 1911: nace Ernesto Sábato','网页实读：正文第39–44行；作品书目/说明边界见RESEARCH_NOTES。','埃内斯托·萨瓦托创作 La resistencia','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0535','V1-REL-0431','WCD10-B07-S003','SRC-0150','Ernesto Sabato – Biografía','网页实读：第49–57行；更新日期第61行。','埃内斯托·萨瓦托创作 La resistencia','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0536','V1-REL-0431','WCD10-B07-S009','SRC-0464','La resistencia','出版社作品页实读：第16–25、57–70行。','埃内斯托·萨瓦托创作 La resistencia','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0537','V1-REL-0432','WCD10-B07-S003','SRC-0150','Ernesto Sabato – Biografía','网页实读：第49–57行；更新日期第61行。','埃内斯托·萨瓦托创作 España en los diarios de mi vejez','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0538','V1-REL-0432','WCD10-B07-S010','SRC-0465','España en los diarios de mi vejez','出版社作品页实读：第16–23、50–63行。','埃内斯托·萨瓦托创作 España en los diarios de mi vejez','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0539','V1-REL-0433','WCD10-B07-S019','SRC-0473','Ernesto Sabato. Cronología de obras','Instituto Cervantes chronology opened lines 47–145; novels 47–55, essays 56–97, anthologies 98–125, complete works 126–134, conferences 138–145.','埃内斯托·萨瓦托创作 El otro rostro del peronismo','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0540','V1-REL-0433','WCD10-B07-S021','SRC-0475','El otro rostro del peronismo : carta abierta a Mario Amadeo','UNNE catalog opened lines 14–21, 59–63: author, title/subtitle, Buenos Aires, López, 1956; library subject indexing marks CARTA.','埃内斯托·萨瓦托创作 El otro rostro del peronismo','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0541','V1-REL-0434','WCD10-B07-S019','SRC-0473','Ernesto Sabato. Cronología de obras','Instituto Cervantes chronology opened lines 47–145; novels 47–55, essays 56–97, anthologies 98–125, complete works 126–134, conferences 138–145.','埃内斯托·萨瓦托创作 Tres aproximaciones a la literatura de nuestro tiempo','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0542','V1-REL-0434','WCD10-B07-S022','SRC-0476','Tres aproximaciones a la literatura de nuestro tiempo : Robbe-Grillet, Borges, Sartre','UNC library catalog opened lines 57–79: title, author, book format, Spanish, published 1968, series Letras de América and subjects including essays and literary criticism.','埃内斯托·萨瓦托创作 Tres aproximaciones a la literatura de nuestro tiempo','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0543','V1-REL-0435','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 Diario de la guerra del cerdo','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0544','V1-REL-0435','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 Diario de la guerra del cerdo','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0545','V1-REL-0435','WCD10-B07-S105','SRC-0479','Diario de la guerra del cerdo','Title/author and description lines 975–991; publisher says published in 1969 and describes a youth/old-age conflict in Palermo.','阿道夫·比奥伊·卡萨雷斯创作 Diario de la guerra del cerdo','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0546','V1-REL-0436','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 Dormir al sol','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0547','V1-REL-0436','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 Dormir al sol','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0548','V1-REL-0436','WCD10-B07-S106','SRC-0480','Dormir al sol','Title/author lines 882–884; epistolary novel and Lucio/Félix/Standle lines 937–980.','阿道夫·比奥伊·卡萨雷斯创作 Dormir al sol','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0549','V1-REL-0437','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 La trama celeste','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0550','V1-REL-0437','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 La trama celeste','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0551','V1-REL-0437','WCD10-B07-S107','SRC-0481','La trama celeste','Title/author lines 340–342; book of stories, 1948, appearance/reality, parallel worlds and spatial/temporal games lines 392–425.','阿道夫·比奥伊·卡萨雷斯创作 La trama celeste','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0552','V1-REL-0438','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 Historia prodigiosa','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0553','V1-REL-0438','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 Historia prodigiosa','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0554','V1-REL-0438','WCD10-B07-S108','SRC-0482','Historia prodigiosa','Page gives Alfaguara November 2022 current edition at lines 849/878; title/author lines 879–881; collection description lines 976–984.','阿道夫·比奥伊·卡萨雷斯创作 Historia prodigiosa','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0555','V1-REL-0439','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 Guirnalda con amores','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0556','V1-REL-0439','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 Guirnalda con amores','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0557','V1-REL-0439','WCD10-B07-S110','SRC-0484','Guirnalda con amores','Alfaguara November 2022 at lines 844/873; title/author lines 874–876; description lines 967–977.','阿道夫·比奥伊·卡萨雷斯创作 Guirnalda con amores','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0558','V1-REL-0440','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 El gran Serafín','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0559','V1-REL-0440','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 El gran Serafín','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0560','V1-REL-0440','WCD10-B07-S109','SRC-0483','El gran Serafín','Page gives Alfaguara November 2022 at lines 814/842; title/author lines 843–845; collection description lines 936 and 946.','阿道夫·比奥伊·卡萨雷斯创作 El gran Serafín','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0561','V1-REL-0441','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 La aventura de un fotógrafo en La Plata','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0562','V1-REL-0441','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 La aventura de un fotógrafo en La Plata','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0563','V1-REL-0441','WCD10-B07-S111','SRC-0485','Últimas novelas','Current Debolsillo compilation edition November 2024 lines 345–365; title/author lines 370–372; individual summaries lines 424–431.','阿道夫·比奥伊·卡萨雷斯创作 La aventura de un fotógrafo en La Plata','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0564','V1-REL-0442','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 Un campeón desparejo','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0565','V1-REL-0442','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 Un campeón desparejo','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0566','V1-REL-0442','WCD10-B07-S111','SRC-0485','Últimas novelas','Current Debolsillo compilation edition November 2024 lines 345–365; title/author lines 370–372; individual summaries lines 424–431.','阿道夫·比奥伊·卡萨雷斯创作 Un campeón desparejo','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0567','V1-REL-0443','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 De un mundo a otro','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0568','V1-REL-0443','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 De un mundo a otro','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0569','V1-REL-0443','WCD10-B07-S111','SRC-0485','Últimas novelas','Current Debolsillo compilation edition November 2024 lines 345–365; title/author lines 370–372; individual summaries lines 424–431.','阿道夫·比奥伊·卡萨雷斯创作 De un mundo a otro','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0570','V1-REL-0444','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 El lado de la sombra','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0571','V1-REL-0444','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 El lado de la sombra','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0572','V1-REL-0444','WCD10-B07-S123','SRC-0497','El lado de la sombra','publisher page lines 814–816 (title/byline), 884–890 (ten stories and 1962 publication), 909–936 (2022 edition metadata)','阿道夫·比奥伊·卡萨雷斯创作 El lado de la sombra','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0573','V1-REL-0445','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 El héroe de las mujeres','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0574','V1-REL-0445','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 El héroe de las mujeres','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0575','V1-REL-0445','WCD10-B07-S124','SRC-0498','Todo Bioy — Biblioteca Adolfo Bioy Casares (catalogue page)','publisher catalogue lines 565–591','阿道夫·比奥伊·卡萨雷斯创作 El héroe de las mujeres','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0576','V1-REL-0445','WCD10-B07-S125','SRC-0499','Hipótesis del tigre: sobre un relato de Bioy Casares','PDF full run, printed pp.193–204 (12 physical PDF pages); opening page identifies Lexis vol. V no. 1, July 1981, author/title; pp.193–194 introduce the collection and title story.','阿道夫·比奥伊·卡萨雷斯创作 El héroe de las mujeres','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0577','V1-REL-0446','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 Historias desaforadas','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0578','V1-REL-0446','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 Historias desaforadas','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0579','V1-REL-0446','WCD10-B07-S124','SRC-0498','Todo Bioy — Biblioteca Adolfo Bioy Casares (catalogue page)','publisher catalogue lines 565–591','阿道夫·比奥伊·卡萨雷斯创作 Historias desaforadas','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0580','V1-REL-0447','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 Una muñeca rusa','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0581','V1-REL-0447','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 Una muñeca rusa','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0582','V1-REL-0447','WCD10-B07-S124','SRC-0498','Todo Bioy — Biblioteca Adolfo Bioy Casares (catalogue page)','publisher catalogue lines 565–591','阿道夫·比奥伊·卡萨雷斯创作 Una muñeca rusa','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0583','V1-REL-0447','WCD10-B07-S137','SRC-0510','Una muñeca rusa','PlanetadeLibros lines 16–23 (byline and collection-level description), 51–63 (category/date/imprint).','阿道夫·比奥伊·卡萨雷斯创作 Una muñeca rusa','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0584','V1-REL-0448','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 Una magia modesta','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0585','V1-REL-0448','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 Una magia modesta','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0586','V1-REL-0448','WCD10-B07-S124','SRC-0498','Todo Bioy — Biblioteca Adolfo Bioy Casares (catalogue page)','publisher catalogue lines 565–591','阿道夫·比奥伊·卡萨雷斯创作 Una magia modesta','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0587','V1-REL-0449','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 La otra aventura','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0588','V1-REL-0449','WCD10-B07-S129','SRC-0502','La otra aventura y otros escritos','Publisher product page lines 408–416; current edition information around lines 390–407.','阿道夫·比奥伊·卡萨雷斯创作 La otra aventura','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0589','V1-REL-0450','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 Memorias','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0590','V1-REL-0450','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 Memorias','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0591','V1-REL-0450','WCD10-B07-S130','SRC-0503','Memorias','Official publisher press PDF, p.1 lines 0–19.','阿道夫·比奥伊·卡萨雷斯创作 Memorias','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0592','V1-REL-0450','WCD10-B07-S136','SRC-0509','Figuraciones autobiográficas de Bioy Casares en el Borges','VI Congreso Internacional de Letras proceedings, printed pp.137–146; PDF p.0 author/title/abstract; printed pp.137–138 on private writings and En viaje; pp.141–145 on Descanso and Borges.','阿道夫·比奥伊·卡萨雷斯创作 Memorias','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0593','V1-REL-0451','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯编选《De jardines ajenos》','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0594','V1-REL-0451','WCD10-B07-S131','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo','Texturas 14, printed pp.79–90; PDF p.0 identifies author/title/journal and pp.79–90. Direct object discussions at printed pp.80, 87–89.','阿道夫·比奥伊·卡萨雷斯编选《De jardines ajenos》','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0595','V1-REL-0452','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯创作 De las cosas maravillosas','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0596','V1-REL-0452','WCD10-B07-S129','SRC-0502','La otra aventura y otros escritos','Publisher product page lines 408–416; current edition information around lines 390–407.','阿道夫·比奥伊·卡萨雷斯创作 De las cosas maravillosas','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0597','V1-REL-0453','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','阿道夫·比奥伊·卡萨雷斯撰写日记/笔记，Daniel Martino 编选《Descanso de caminantes, Diarios íntimos》','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0598','V1-REL-0453','WCD10-B07-S131','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo','Texturas 14, printed pp.79–90; PDF p.0 identifies author/title/journal and pp.79–90. Direct object discussions at printed pp.80, 87–89.','阿道夫·比奥伊·卡萨雷斯撰写日记/笔记，Daniel Martino 编选《Descanso de caminantes, Diarios íntimos》','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0599','V1-REL-0453','WCD10-B07-S132','SRC-0505','Descanso de caminantes: diarios íntimos','Google Books lines 16–19 and bibliographic information lines 42–52.','阿道夫·比奥伊·卡萨雷斯撰写日记/笔记，Daniel Martino 编选《Descanso de caminantes, Diarios íntimos》','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0600','V1-REL-0453','WCD10-B07-S133','SRC-0506','Posfacio (Descanso de caminantes)','La Nación page lines 87–100; published 5 September 2001, updated 14 June 2020.','阿道夫·比奥伊·卡萨雷斯撰写日记/笔记，Daniel Martino 编选《Descanso de caminantes, Diarios íntimos》','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0601','V1-REL-0453','WCD10-B07-S136','SRC-0509','Figuraciones autobiográficas de Bioy Casares en el Borges','VI Congreso Internacional de Letras proceedings, printed pp.137–146; PDF p.0 author/title/abstract; printed pp.137–138 on private writings and En viaje; pp.141–145 on Descanso and Borges.','阿道夫·比奥伊·卡萨雷斯撰写日记/笔记，Daniel Martino 编选《Descanso de caminantes, Diarios íntimos》','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0602','V1-REL-0454','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','《Borges》选编自阿道夫·比奥伊·卡萨雷斯的日记，由 Daniel Martino 编选；Borges 是被记录者。','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0603','V1-REL-0454','WCD10-B07-S131','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo','Texturas 14, printed pp.79–90; PDF p.0 identifies author/title/journal and pp.79–90. Direct object discussions at printed pp.80, 87–89.','《Borges》选编自阿道夫·比奥伊·卡萨雷斯的日记，由 Daniel Martino 编选；Borges 是被记录者。','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0604','V1-REL-0454','WCD10-B07-S136','SRC-0509','Figuraciones autobiográficas de Bioy Casares en el Borges','VI Congreso Internacional de Letras proceedings, printed pp.137–146; PDF p.0 author/title/abstract; printed pp.137–138 on private writings and En viaje; pp.141–145 on Descanso and Borges.','《Borges》选编自阿道夫·比奥伊·卡萨雷斯的日记，由 Daniel Martino 编选；Borges 是被记录者。','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0605','V1-REL-0455','WCD10-B07-S136','SRC-0509','Figuraciones autobiográficas de Bioy Casares en el Borges','VI Congreso Internacional de Letras proceedings, printed pp.137–146; PDF p.0 author/title/abstract; printed pp.137–138 on private writings and En viaje; pp.141–145 on Descanso and Borges.','阿道夫·比奥伊·卡萨雷斯创作 En viaje (1967)','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0606','V1-REL-0456','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 Memoria sobre la pampa y los gauchos','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0607','V1-REL-0456','WCD10-B07-S138','SRC-0511','Memoria sobre la pampa y los gauchos','Balcells work page lines 12–17, 81–88, 106–116.','阿道夫·比奥伊·卡萨雷斯创作 Memoria sobre la pampa y los gauchos','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0608','V1-REL-0457','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 Breve diccionario del argentino exquisito','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0609','V1-REL-0457','WCD10-B07-S131','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo','Texturas 14, printed pp.79–90; PDF p.0 identifies author/title/journal and pp.79–90. Direct object discussions at printed pp.80, 87–89.','阿道夫·比奥伊·卡萨雷斯创作 Breve diccionario del argentino exquisito','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0610','V1-REL-0458','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','阿道夫·比奥伊·卡萨雷斯创作 La estatua casera','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0611','V1-REL-0458','WCD10-B07-S131','SRC-0504','La voz ajena. Bioy Casares como lexicógrafo y antólogo','Texturas 14, printed pp.79–90; PDF p.0 identifies author/title/journal and pp.79–90. Direct object discussions at printed pp.80, 87–89.','阿道夫·比奥伊·卡萨雷斯创作 La estatua casera','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0612','V1-REL-0459','WCD10-B07-S141','SRC-0513','El perjurio de la nieve','Google Books目录页L13–20、L33–40列作者、Emecé Editores、1944、64页','阿道夫·比奥伊·卡萨雷斯创作 El perjurio de la nieve','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0613','V1-REL-0459','WCD10-B07-S142','SRC-0514','La casa bioycasareana y el mito en “El perjurio de la nieve”','Title page PDF physical page 0 / printed p.429 for byline; printed p.431 / PDF index page 2, lines 82–96 for year, cuento form and synopsis.','阿道夫·比奥伊·卡萨雷斯创作 El perjurio de la nieve','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0614','V1-REL-0459','WCD10-B07-S143','SRC-0515','Poética de lo siniestro en el relato “El perjurio de la nieve” de Adolfo Bioy Casares','Page lines 30 and 40 for abstract/year; lines 88–91 for story analysis.','阿道夫·比奥伊·卡萨雷斯创作 El perjurio de la nieve','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0615','V1-REL-0459','WCD10-B07-S140','SRC-0512','Biografía de Adolfo Bioy Casares','L34–38署名Carlos Dámaso Martínez','阿道夫·比奥伊·卡萨雷斯创作 El perjurio de la nieve','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0616','V1-REL-0460','WCD10-B07-S144','SRC-0516','Adolfo Bioy Casares (1914-1999)','Page heading “Adolfo Bioy Casares (1914-1999)”; line 73 lists the Las vísperas de Fausto (1949) limited edition.','阿道夫·比奥伊·卡萨雷斯创作 Las vísperas de Fausto','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0617','V1-REL-0460','WCD10-B07-S145','SRC-0517','Metamorfosis del mito fáustico en la literatura alemana y en la literatura argentina en la segunda mitad del siglo XX','Metadata: PDF index pages 2–3; printed p.208 (PDF index page 209), §4.4/note 307 for 1949/form; printed pp.208–210 (PDF index pages 209–211) for plot.','阿道夫·比奥伊·卡萨雷斯创作 Las vísperas de Fausto','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0618','V1-REL-0461','WCD10-B07-S146','SRC-0518','Bioy, Borges y “Sur”: diálogos y duelos','Full text lines 97–99 for Homenaje publication year/story scope; record lines 8–23 for author and 2012 digital page metadata.','阿道夫·比奥伊·卡萨雷斯创作 Homenaje a Francisco Almeyra','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0619','V1-REL-0461','WCD10-B07-S148','SRC-0520','Bioy, pasado y presente','CVC record L13–23, L33; full text indexed note 8; body L110 for written 1952/published 1954.','阿道夫·比奥伊·卡萨雷斯创作 Homenaje a Francisco Almeyra','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0620','V1-REL-0462','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','与西尔维娜·奥坎波（Silvina Ocampo）合著；此 CREATED 关系记录 Bioy Casares 的共同创作身份，不表示其为独著作者。','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0621','V1-REL-0462','WCD10-B07-S147','SRC-0519','Los que aman, odian','Press sheet physical p.0: “Fecha de publicación: 01/07/2016” (book-edition date); L5–24 for genre, joint authorship and synopsis.','与西尔维娜·奥坎波（Silvina Ocampo）合著；此 CREATED 关系记录 Bioy Casares 的共同创作身份，不表示其为独著作者。','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0622','V1-REL-0463','WCD10-B07-S140','SRC-0512','Biografía de Adolfo Bioy Casares','L34–38署名Carlos Dámaso Martínez','与Jorge Luis Borges及Silvina Ocampo共同编选/翻译；Bioy另撰序。此 CREATED 表示编者、译者与序作者贡献，不表示独著。','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0623','V1-REL-0463','WCD10-B07-S101','SRC-0478','Bibliografía de Adolfo Bioy Casares','47–68: libros and antologías; 80–100: Borges collaborations and pseudonym titles; 37–39 page byline.','与Jorge Luis Borges及Silvina Ocampo共同编选/翻译；Bioy另撰序。此 CREATED 表示编者、译者与序作者贡献，不表示独著。','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0624','V1-REL-0463','WCD10-B07-S102','SRC-0154','Adolfo Bioy Casares. Cronología de obras','37–39 signed byline; 175–205 for 1940–1948; other title years checked at matching annual entries.','与Jorge Luis Borges及Silvina Ocampo共同编选/翻译；Bioy另撰序。此 CREATED 表示编者、译者与序作者贡献，不表示独著。','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0625','V1-REL-0464','WCD10-B07-S204','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía','书目区L6-9逐项列出小说、短篇集及其他著作版本；影视改编分项L15-17；作品研究书目L33-41。','奥古斯托·罗亚·巴斯托斯创作 El trueno entre las hojas','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0626','V1-REL-0464','WCD10-B07-S202','SRC-0523','Cuento – Fundación Augusto Roa Bastos','页面实读：El baldío L45-48；El trueno L50-60；Los pies L63-66；Madera quemada L68-85及后续说明；Moriencia L100-102；El pollito de fuego L104-165。','奥古斯托·罗亚·巴斯托斯创作 El trueno entre las hojas','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0627','V1-REL-0465','WCD10-B07-S204','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía','书目区L6-9逐项列出小说、短篇集及其他著作版本；影视改编分项L15-17；作品研究书目L33-41。','奥古斯托·罗亚·巴斯托斯创作 El baldío','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0628','V1-REL-0465','WCD10-B07-S202','SRC-0523','Cuento – Fundación Augusto Roa Bastos','页面实读：El baldío L45-48；El trueno L50-60；Los pies L63-66；Madera quemada L68-85及后续说明；Moriencia L100-102；El pollito de fuego L104-165。','奥古斯托·罗亚·巴斯托斯创作 El baldío','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0629','V1-REL-0466','WCD10-B07-S204','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía','书目区L6-9逐项列出小说、短篇集及其他著作版本；影视改编分项L15-17；作品研究书目L33-41。','奥古斯托·罗亚·巴斯托斯创作 Los pies sobre el agua','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0630','V1-REL-0466','WCD10-B07-S202','SRC-0523','Cuento – Fundación Augusto Roa Bastos','页面实读：El baldío L45-48；El trueno L50-60；Los pies L63-66；Madera quemada L68-85及后续说明；Moriencia L100-102；El pollito de fuego L104-165。','奥古斯托·罗亚·巴斯托斯创作 Los pies sobre el agua','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0631','V1-REL-0467','WCD10-B07-S204','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía','书目区L6-9逐项列出小说、短篇集及其他著作版本；影视改编分项L15-17；作品研究书目L33-41。','奥古斯托·罗亚·巴斯托斯创作 Madera quemada','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0632','V1-REL-0467','WCD10-B07-S202','SRC-0523','Cuento – Fundación Augusto Roa Bastos','页面实读：El baldío L45-48；El trueno L50-60；Los pies L63-66；Madera quemada L68-85及后续说明；Moriencia L100-102；El pollito de fuego L104-165。','奥古斯托·罗亚·巴斯托斯创作 Madera quemada','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0633','V1-REL-0467','WCD10-B07-S201','SRC-0522','Novelas – Fundación Augusto Roa Bastos','页面实读：Hijo de hombre 章节L129-138；Vigilia del Almirante L255-261；Contravida L180-183；El fiscal L267-270。页面含多处作者原话及基金会作品评论；未将站点host当作文章作者。','奥古斯托·罗亚·巴斯托斯创作 Madera quemada','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0634','V1-REL-0468','WCD10-B07-S204','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía','书目区L6-9逐项列出小说、短篇集及其他著作版本；影视改编分项L15-17；作品研究书目L33-41。','奥古斯托·罗亚·巴斯托斯创作 Moriencia','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0635','V1-REL-0468','WCD10-B07-S202','SRC-0523','Cuento – Fundación Augusto Roa Bastos','页面实读：El baldío L45-48；El trueno L50-60；Los pies L63-66；Madera quemada L68-85及后续说明；Moriencia L100-102；El pollito de fuego L104-165。','奥古斯托·罗亚·巴斯托斯创作 Moriencia','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0636','V1-REL-0469','WCD10-B07-S204','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía','书目区L6-9逐项列出小说、短篇集及其他著作版本；影视改编分项L15-17；作品研究书目L33-41。','奥古斯托·罗亚·巴斯托斯创作 Cuerpo presente y otros cuentos','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0637','V1-REL-0469','WCD10-B07-S206','SRC-0527','Bibliografía de Augusto Roa Bastos','PDF p.0-1 monographs bibliography L0-54；该书目包含多个再版/重印与译本，不据后版年推首发年。','奥古斯托·罗亚·巴斯托斯创作 Cuerpo presente y otros cuentos','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0638','V1-REL-0469','WCD10-B07-S203','SRC-0524','Antologías de Augusto Roa Bastos – Fundación Augusto Roa Bastos','页面实读：代表作定位L46-51；Cuentos completos 2008及故事集范围L157-168；El trueno开合故事结构L133-150。','奥古斯托·罗亚·巴斯托斯创作 Cuerpo presente y otros cuentos','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0639','V1-REL-0469','WCD10-B07-S216','SRC-0536','Cuerpo presente y otros cuentos / Augusto ROA BASTOS — Catálogo en línea','Catálogo de Monografía L13-33: título, autor, CELA c1971, colección Biblioteca Básica Universal 137, 127 p. y tabla de contenido (Nonato, Cuando un pájaro entierra sus plumas, Función, Moriencia, Bajo el puente, Macario, Borrador de un informe, Hogar, La excavación).','奥古斯托·罗亚·巴斯托斯创作 Cuerpo presente y otros cuentos','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0640','V1-REL-0470','WCD10-B07-S204','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía','书目区L6-9逐项列出小说、短篇集及其他著作版本；影视改编分项L15-17；作品研究书目L33-41。','奥古斯托·罗亚·巴斯托斯创作 El pollito de fuego','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0641','V1-REL-0470','WCD10-B07-S202','SRC-0523','Cuento – Fundación Augusto Roa Bastos','页面实读：El baldío L45-48；El trueno L50-60；Los pies L63-66；Madera quemada L68-85及后续说明；Moriencia L100-102；El pollito de fuego L104-165。','奥古斯托·罗亚·巴斯托斯创作 El pollito de fuego','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0642','V1-REL-0471','WCD10-B07-S201','SRC-0522','Novelas – Fundación Augusto Roa Bastos','页面实读：Hijo de hombre 章节L129-138；Vigilia del Almirante L255-261；Contravida L180-183；El fiscal L267-270。页面含多处作者原话及基金会作品评论；未将站点host当作文章作者。','奥古斯托·罗亚·巴斯托斯创作 Vigilia del Almirante','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0643','V1-REL-0471','WCD10-B07-S204','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía','书目区L6-9逐项列出小说、短篇集及其他著作版本；影视改编分项L15-17；作品研究书目L33-41。','奥古斯托·罗亚·巴斯托斯创作 Vigilia del Almirante','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0644','V1-REL-0471','WCD10-B07-S205','SRC-0526','Augusto Roa Bastos. Cronología de obras','Instituto Cervantes author chronology, work entries L44–139. The page explicitly states “Fecha de actualización: julio de 2022” at L139; this is update metadata, not the page publication date. The chronology page contains no 1971 El génesis / Apapokura entry; do not cite it for W211. Film/script sections are separately labeled.','奥古斯托·罗亚·巴斯托斯创作 Vigilia del Almirante','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0645','V1-REL-0472','WCD10-B07-S207','SRC-0528','CONTRAVIDA, 1994 – Novela de Augusto Roa Bastos','页面L31-47标注小说、作者及该版1994 Editorial El Lector；L76-80为作者书衣/原版说明，涉及越狱屠杀后唯一幸存者、与《La excavación》关系及巴拉圭初版。','奥古斯托·罗亚·巴斯托斯创作 Contravida','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0646','V1-REL-0472','WCD10-B07-S204','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía','书目区L6-9逐项列出小说、短篇集及其他著作版本；影视改编分项L15-17；作品研究书目L33-41。','奥古斯托·罗亚·巴斯托斯创作 Contravida','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0647','V1-REL-0472','WCD10-B07-S201','SRC-0522','Novelas – Fundación Augusto Roa Bastos','页面实读：Hijo de hombre 章节L129-138；Vigilia del Almirante L255-261；Contravida L180-183；El fiscal L267-270。页面含多处作者原话及基金会作品评论；未将站点host当作文章作者。','奥古斯托·罗亚·巴斯托斯创作 Contravida','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0648','V1-REL-0473','WCD10-B07-S204','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía','书目区L6-9逐项列出小说、短篇集及其他著作版本；影视改编分项L15-17；作品研究书目L33-41。','奥古斯托·罗亚·巴斯托斯创作 El naranjal ardiente','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0649','V1-REL-0473','WCD10-B07-S205','SRC-0526','Augusto Roa Bastos. Cronología de obras','Instituto Cervantes author chronology, work entries L44–139. The page explicitly states “Fecha de actualización: julio de 2022” at L139; this is update metadata, not the page publication date. The chronology page contains no 1971 El génesis / Apapokura entry; do not cite it for W211. Film/script sections are separately labeled.','奥古斯托·罗亚·巴斯托斯创作 El naranjal ardiente','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0650','V1-REL-0473','WCD10-B07-S215','SRC-0160','Biografía – Fundación Augusto Roa Bastos','Exact canonical URL reuses SRC-0160. Fundación biography lines 82–83 identifies El ruiseñor de la aurora y otros poemas (1942) as first poetry collection; lines 90–92 describe La Inglaterra que yo vi (Asunción, El País, 1946) as a pamphlet of reporting; lines 105–107 place complete El ruiseñor version in Buenos Aires 1952; lines 160–161 identify Los Juegos 1 (1979) and Los Juegos 2 (1981) as children’s books; lines 212–214 date Metaforismos to 1996. For Antologías (different page S203): L53 title Poesías Reunidas (1998), L56 the 1960 first El naranjal selection, L57 the near-complete 1983 second edition, and L59–60 the early/new poems and Silenciario in the 1998 current volume. Keep those edition/content layers separate.','奥古斯托·罗亚·巴斯托斯创作 El naranjal ardiente','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0651','V1-REL-0474','WCD10-B07-S204','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía','书目区L6-9逐项列出小说、短篇集及其他著作版本；影视改编分项L15-17；作品研究书目L33-41。','奥古斯托·罗亚·巴斯托斯创作 El ruiseñor de la aurora y otros poemas','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0652','V1-REL-0474','WCD10-B07-S215','SRC-0160','Biografía – Fundación Augusto Roa Bastos','Exact canonical URL reuses SRC-0160. Fundación biography lines 82–83 identifies El ruiseñor de la aurora y otros poemas (1942) as first poetry collection; lines 90–92 describe La Inglaterra que yo vi (Asunción, El País, 1946) as a pamphlet of reporting; lines 105–107 place complete El ruiseñor version in Buenos Aires 1952; lines 160–161 identify Los Juegos 1 (1979) and Los Juegos 2 (1981) as children’s books; lines 212–214 date Metaforismos to 1996. For Antologías (different page S203): L53 title Poesías Reunidas (1998), L56 the 1960 first El naranjal selection, L57 the near-complete 1983 second edition, and L59–60 the early/new poems and Silenciario in the 1998 current volume. Keep those edition/content layers separate.','奥古斯托·罗亚·巴斯托斯创作 El ruiseñor de la aurora y otros poemas','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0653','V1-REL-0474','WCD10-B07-S219','SRC-0159','CVC. Augusto Roa Bastos. Cronología 1947-1988','Reuse exact canonical URL as baseline SRC-0159, retaining its B identity/metadata. Actual chronology page opened at L17 (1952 El ruiseñor complete version), L25 (1971 Apapokura title), and L28 (1979 Los Juegos 1; 1981 Los Juegos 2). Baseline SRC-0159 publication_year metadata is retained; no new page publication date is asserted.','奥古斯托·罗亚·巴斯托斯创作 El ruiseñor de la aurora y otros poemas','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0654','V1-REL-0474','WCD10-B07-S220','SRC-0538','El ruiseñor de la aurora, y otros poemas — Google Books catalog record','L38–61: title, author, Imprenta Nacional 1942, 146 pages, contents preview lists Pórtico, ¿Quién?, En la callada noche and 15 further unseen sections. A catalog preview, not full-text examination.','奥古斯托·罗亚·巴斯托斯创作 El ruiseñor de la aurora y otros poemas','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0655','V1-REL-0474','WCD10-B07-S222','SRC-0540','Poesía – Fundación Augusto Roa Bastos','Fundación Poesía L45–48: 1942 section heading; discusses the poem “Si alguna vez…”, describes the period’s poetry as not yet aesthetically homogeneous, and names “Voz menor para el oratorio de Romain Rolland” as an example of epic-lyric expression. It is the Foundation’s commentary on the 1942 poetry, not a full-book reading.','奥古斯托·罗亚·巴斯托斯创作 El ruiseñor de la aurora y otros poemas','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0656','V1-REL-0475','WCD10-B07-S204','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía','书目区L6-9逐项列出小说、短篇集及其他著作版本；影视改编分项L15-17；作品研究书目L33-41。','奥古斯托·罗亚·巴斯托斯创作 La Inglaterra que yo vi','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0657','V1-REL-0475','WCD10-B07-S215','SRC-0160','Biografía – Fundación Augusto Roa Bastos','Exact canonical URL reuses SRC-0160. Fundación biography lines 82–83 identifies El ruiseñor de la aurora y otros poemas (1942) as first poetry collection; lines 90–92 describe La Inglaterra que yo vi (Asunción, El País, 1946) as a pamphlet of reporting; lines 105–107 place complete El ruiseñor version in Buenos Aires 1952; lines 160–161 identify Los Juegos 1 (1979) and Los Juegos 2 (1981) as children’s books; lines 212–214 date Metaforismos to 1996. For Antologías (different page S203): L53 title Poesías Reunidas (1998), L56 the 1960 first El naranjal selection, L57 the near-complete 1983 second edition, and L59–60 the early/new poems and Silenciario in the 1998 current volume. Keep those edition/content layers separate.','奥古斯托·罗亚·巴斯托斯创作 La Inglaterra que yo vi','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0658','V1-REL-0475','WCD10-B07-S221','SRC-0539','Ensayos y Artículos – Fundación Augusto Roa Bastos','L45–47 says La Inglaterra que yo vi (1946) collects part of his journalistic articles and resulted from his first Europe trip. No explicit publication date for webpage.','奥古斯托·罗亚·巴斯托斯创作 La Inglaterra que yo vi','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0659','V1-REL-0475','WCD10-B07-S226','SRC-0544','Augusto Roa Bastos — Enciclopedia de la Literatura en México (FLM)','L124–125 identify La Inglaterra que yo vi as a set of travel observations and interviews (Luis Cernuda, André Malraux, Charles de Gaulle) published by El País as a pamphlet. This is an institutional author entry; no explicit page publication date.','奥古斯托·罗亚·巴斯托斯创作 La Inglaterra que yo vi','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0660','V1-REL-0476','WCD10-B07-S201','SRC-0522','Novelas – Fundación Augusto Roa Bastos','页面实读：Hijo de hombre 章节L129-138；Vigilia del Almirante L255-261；Contravida L180-183；El fiscal L267-270。页面含多处作者原话及基金会作品评论；未将站点host当作文章作者。','奥古斯托·罗亚·巴斯托斯创作 Madama Sui','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0661','V1-REL-0476','WCD10-B07-S225','SRC-0543','La mujer como objeto de la mirada masculina en Madama Sui de Augusto Roa Bastos','PDF p.0 title/author/affiliation/journal 23 (2023), no.82, pp.217–235; p.1 L30–38 explicitly frames study; p.2 L67–83 analyzes nested narration and reconstruction; PDF physical p.17 (18th PDF page; journal printed p.234), L586–590 concludes Sui is an object of male narrators’ gaze. DOI 10.18441/ibam.23.2023.82.217-235.','奥古斯托·罗亚·巴斯托斯创作 Madama Sui','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0662','V1-REL-0477','WCD10-B07-S204','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía','书目区L6-9逐项列出小说、短篇集及其他著作版本；影视改编分项L15-17；作品研究书目L33-41。','奥古斯托·罗亚·巴斯托斯创作 Metaforismos','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0663','V1-REL-0477','WCD10-B07-S215','SRC-0160','Biografía – Fundación Augusto Roa Bastos','Exact canonical URL reuses SRC-0160. Fundación biography lines 82–83 identifies El ruiseñor de la aurora y otros poemas (1942) as first poetry collection; lines 90–92 describe La Inglaterra que yo vi (Asunción, El País, 1946) as a pamphlet of reporting; lines 105–107 place complete El ruiseñor version in Buenos Aires 1952; lines 160–161 identify Los Juegos 1 (1979) and Los Juegos 2 (1981) as children’s books; lines 212–214 date Metaforismos to 1996. For Antologías (different page S203): L53 title Poesías Reunidas (1998), L56 the 1960 first El naranjal selection, L57 the near-complete 1983 second edition, and L59–60 the early/new poems and Silenciario in the 1998 current volume. Keep those edition/content layers separate.','奥古斯托·罗亚·巴斯托斯创作 Metaforismos','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0664','V1-REL-0477','WCD10-B07-S223','SRC-0541','Metaforismos — WorldCat record','L39–58 identifies author, 1996 Spanish print book, 1st edition, Seix Barral/Buenos Aires, 151 pages, and HLAS v.58 summary: collection of maxims, proverbs, paradoxes, parables, epigrams, thoughts and digressions selected from published and unpublished material, predominantly fragments from Yo el Supremo.','奥古斯托·罗亚·巴斯托斯创作 Metaforismos','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0665','V1-REL-0477','WCD10-B07-S224','SRC-0542','Metaforismos — Google Books catalog record','Google Books opened page L16–18 identifies title, author, Edhasa 1996, 142 pages and quotes the author’s prefatory description of source materials/aphorism form; L32–39 gives catalog metadata. Catalog preview, not the whole book.','奥古斯托·罗亚·巴斯托斯创作 Metaforismos','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0666','V1-REL-0477','WCD10-B07-S227','SRC-0545','Ediciones – Fundación Augusto Roa Bastos','Fundación Ediciones page actually opened: Metaforismos L109–121 identifies 1996, Editorial El Lector, primera edición, printed August 1996; separately lists selected editions of other books.','奥古斯托·罗亚·巴斯托斯创作 Metaforismos','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0667','V1-REL-0478','WCD10-B07-S202','SRC-0523','Cuento – Fundación Augusto Roa Bastos','页面实读：El baldío L45-48；El trueno L50-60；Los pies L63-66；Madera quemada L68-85及后续说明；Moriencia L100-102；El pollito de fuego L104-165。','奥古斯托·罗亚·巴斯托斯创作 Los Juegos 1: Carolina y Gaspar','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0668','V1-REL-0478','WCD10-B07-S204','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía','书目区L6-9逐项列出小说、短篇集及其他著作版本；影视改编分项L15-17；作品研究书目L33-41。','奥古斯托·罗亚·巴斯托斯创作 Los Juegos 1: Carolina y Gaspar','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0669','V1-REL-0478','WCD10-B07-S215','SRC-0160','Biografía – Fundación Augusto Roa Bastos','Exact canonical URL reuses SRC-0160. Fundación biography lines 82–83 identifies El ruiseñor de la aurora y otros poemas (1942) as first poetry collection; lines 90–92 describe La Inglaterra que yo vi (Asunción, El País, 1946) as a pamphlet of reporting; lines 105–107 place complete El ruiseñor version in Buenos Aires 1952; lines 160–161 identify Los Juegos 1 (1979) and Los Juegos 2 (1981) as children’s books; lines 212–214 date Metaforismos to 1996. For Antologías (different page S203): L53 title Poesías Reunidas (1998), L56 the 1960 first El naranjal selection, L57 the near-complete 1983 second edition, and L59–60 the early/new poems and Silenciario in the 1998 current volume. Keep those edition/content layers separate.','奥古斯托·罗亚·巴斯托斯创作 Los Juegos 1: Carolina y Gaspar','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0670','V1-REL-0478','WCD10-B07-S219','SRC-0159','CVC. Augusto Roa Bastos. Cronología 1947-1988','Reuse exact canonical URL as baseline SRC-0159, retaining its B identity/metadata. Actual chronology page opened at L17 (1952 El ruiseñor complete version), L25 (1971 Apapokura title), and L28 (1979 Los Juegos 1; 1981 Los Juegos 2). Baseline SRC-0159 publication_year metadata is retained; no new page publication date is asserted.','奥古斯托·罗亚·巴斯托斯创作 Los Juegos 1: Carolina y Gaspar','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0671','V1-REL-0479','WCD10-B07-S204','SRC-0525','CVC. Augusto Roa Bastos. Bibliografía','书目区L6-9逐项列出小说、短篇集及其他著作版本；影视改编分项L15-17；作品研究书目L33-41。','奥古斯托·罗亚·巴斯托斯编纂《Las culturas condenadas》','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0672','V1-REL-0479','WCD10-B07-S218','SRC-0537','Las “culturas condenadas”: el mitólogo como compilador','Official Revista Telar article landing page identifies Enrique Flores and Revista Telar 27 (2021), pp.323–346; Published 2021-12-27. Exact article-specific PDF actually opened from https://dialnet.unirioja.es/descarga/articulo/8238912.pdf (24 physical pages; Telar download endpoint timed out). Directly analyzes Las culturas condenadas (1978) and Roa as compiler; PDF p.1 L31–49 describes plural ethnographic, poetic and ritual sources; p.4–5 L114–135 discusses the anthology; p.6 L174–179 and p.7 L185–206 examine the compiler role. It also states the 1948 text derives from Nimuendajú (p.2 L55–79), note 18 calls the 1971 item a re-edition (p.10 L283–284), and bibliography lists 1948/1971/1978a comp. separately (p.23 L571–575).','奥古斯托·罗亚·巴斯托斯编纂《Las culturas condenadas》','high','eligible_evidence','WCD-10-B07'),
('V1-EV-0673','V1-REL-0479','WCD10-B07-S228','SRC-0546','Las culturas condenadas – Google Books','Google Books page actually opened: L39–65 title, Siglo Veintiuno 1978, 349 pages, displayed contents show Roa introduction and a separately attributed M. Chase-Sardi contribution; L106–118 bibliographic information says Editor Augusto Roa Bastos, Compiled by Augusto Roa Bastos, publisher Siglo Veintiuno 1978. Catalog/partial preview, not full book.','奥古斯托·罗亚·巴斯托斯编纂《Las culturas condenadas》','high','eligible_evidence','WCD-10-B07');

INSERT INTO gaps (gap_id,origin_gap_id,gap_type,gap_key,current_status,evidence_basis,attempts_or_count,owner_decision,downstream_effect,issue_code) VALUES
('V1-GAP-0195','WCD-10-B07-G01','research_gap','WCD10:B07:V1-ENT-0186:Heterodoxia','open','Opened Instituto Cervantes chronology lists Heterodoxia as an essay in 1952 (S019, lines 56–63, especially line 62); the separately opened Cervantes biography lists it under 1953 (S003, lines 49–57). The opened 2022 Cervantes bibliography (S018, p.2, lines 42–43) records only a 2000 combined edition of Hombres y engranajes and Heterodoxia, not a first-publication year. Exact-title catalog/publisher snippets also indicated 1953, but direct page opens failed (503/cache miss) and are not used as opened evidence. Defer the whole object; no first year chosen.','','Independent Reviewer: preserve deferred_year_conflict','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0196','WCD-10-B07-G02','research_gap','WCD10:B07:V1-ENT-0186:El-drag-n-y-la-princesa','open','Cervantes chronology lists the title; opened Casa de la Cultura Ecuatoriana MARC record identifies the 1995 catalogued item as the author-adapted first part of Sobre héroes y tumbas (lines 107–135). This is an edition/extract, not a separate work entity.','','Independent Reviewer: preserve edition_or_extract_not_separate_work','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0197','WCD-10-B07-G03','research_gap','WCD10:B07:V1-ENT-0186:Obras-completas-Narrativa-1996','open','CONICET page identifies a revised/corrected complete-narrative volume containing the 3 separate novels, unpublished excerpts and a 1994 essay. This is a collective edition, not a single novel entity or a basis for new first-publication years.','','Independent Reviewer: preserve collection_or_edition','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0198','WCD-10-B07-G04','research_gap','WCD10:B07:V1-ENT-0186:Informe-sobre-ciegos','open','CONICET identifies an essay about Informe sobre ciegos at the end of the complete-narrative volume; publisher describes the title as a metaphor developed in Abaddón. No independent first-publication object was established in this review.','','Independent Reviewer: preserve subordinate_text_not_separate_work','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0199','WCD-10-B07-G05','research_gap','WCD10:B07:V1-ENT-0186:Additional-essay-titles-including-Sartre-contra-Sartre-1968-Heterodoxia-and-works-in-the-Cervantes-bibliography','open','Listed in opened institutional bibliography/chronology, but not all individual pages and first-publication evidence were accessed in this pass. Heterodoxia is separately deferred because of date conflict; remaining titles are explicit additional catalog-scan gaps, not claims of exhaustive author bibliography. Exact-title search for “Sartre contra Sartre” did not yield an opened primary catalog/publisher object page in this pass; search results were bibliographic/secondary references only. Other titles were checked against the opened Cervantes scan and remain item-level source gaps.','','Independent Reviewer: preserve inventory_gap_not_asserted_complete','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0200','WCD-10-B07-G06','research_gap','WCD10:B07:V1-ENT-0186:Itinerario-Narrativa-completa-P-ginas-vivas-compilations','open','The Cervantes bibliography lists aggregate/selected-volume titles; no individual title is normalized as an authored original work without object-level edition evidence and deduplication. Record as collection/version scan gap. Exact-title grouped searches for Itinerario and Páginas vivas returned only bibliography/navigation hits, not opened individual catalog records; collection/edition status is retained from the opened Cervantes chronology/bibliography scan.','','Independent Reviewer: preserve collection_or_edition','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0201','WCD-10-B07-G07','research_gap','WCD10:B07:V1-ENT-0186:El-caso-S-bato-torturas-y-libertad-de-prensa-Carta-abierta-al-general-Aramburu','open','Listed as an essay in institutional chronology, but no separately opened primary catalog/publisher object record, direct object description, or direct work-specific research was obtained in this pass; keep as an explicit inventory gap rather than infer genre/description from title alone. Exact-title search run 2026-10-10 found a 15.8 MB Biblioteca Nacional PDF with a matching cover/1956 date, but direct open failed with HTTP content-length error; WorldCat direct open failed with cache miss. The institutional chronology lists 1956, but no fully opened object record was available, so first year and description are not promoted.','','Independent Reviewer: preserve not_added_scope_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0202','WCD-10-B07-G08','research_gap','WCD10:B07:V1-ENT-0186:Tango-discusi-n-y-clave','open','Cervantes chronology lists 1963; CEDINPE author bibliography lists Tango. Discusión y clave (Losada) 1965. Losada page was opened and confirms Sábato/title/content about tango but does not state original publication year. Defer whole object pending original-year resolution. Prior opened Losada publisher page supports author/title/content but gives no first year; prior opened CEDINPE bibliography gives a 1965 Losada entry, versus Cervantes 1963. No resolution in exact-title search, so defer whole object.','','Independent Reviewer: preserve deferred_year_conflict','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0203','WCD-10-B07-G09','research_gap','WCD10:B07:V1-ENT-0186:Pedro-Henr-quez-Ure-a-1967','open','Cervantes chronology lists 1967; opened CEDINPE record (lines 30–41) instead describes a 1966 Ediciones Culturales Argentinas selection/notes volume by Carmelina and Luis Alberto Castellanos, with a Sábato contribution titled “Significado de Pedro Henríquez Ureña.” Defer the whole object because the book-level work form/first year is unresolved.','','Independent Reviewer: preserve not_added_scope_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0204','WCD-10-B07-G10','research_gap','WCD10:B07:V1-ENT-0186:Entre-la-letra-y-la-sangre-1988','open','Opened St George’s College catalog (lines 17–28) records “conversaciones con Carlos Catania” and a Seix Barral 1988 edition; this supports a joint conversation book, not sole authorship. No independent first-edition record was established.','','Independent Reviewer: preserve collaboration_form_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0205','WCD-10-B07-G11','research_gap','WCD10:B07:V1-ENT-0186:Querido-y-remoto-muchacho-1990','open','Opened Biblioteca Padre Juan Alberto Sancho catalog (lines 123–143) records a 1990, 70-page Losada edition and explicitly calls it a chapter extracted from Abaddón el exterminador. Treat as a separately issued excerpt/edition, not a new independent work; separate catalog results show later 1998 edition data, which is not first-publication evidence.','','Independent Reviewer: preserve not_added_scope_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0206','WCD-10-B07-G12','research_gap','WCD10:B07:V1-ENT-0186:La-cultura-en-la-encrucijada-nacional-1973-anthology-1976-essay-chronology','open','Cervantes classifies a 1976 title under essays and a 1973 title under anthologies with the same name; CEDINPE lists a 1982 fourth edition. No content-level item/edition comparison was obtained; defer instead of conflating entries. The opened Cervantes chronology and CEDINPE bibliography/catalog cross-check report distinct 1973 anthology, 1976 essay listing and a later 1982 edition; no contents-level edition comparison was established.','','Independent Reviewer: preserve edition_or_form_conflict','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0207','WCD-10-B07-G13','research_gap','WCD10:B07:V1-ENT-0186:Di-logos-S-bato-and-Jorge-Luis-Borges-1976','open','Chronology explicitly lists a joint dialogue; no directly opened joint-work object record or description; do not silently normalize as sole-authored Sábato work.','','Independent Reviewer: preserve coauthored_form_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0208','WCD-10-B07-G14','research_gap','WCD10:B07:V1-ENT-0186:Other-Cervantes-chronology-essays-anthologies-complete-works-and-conferences-not-separately-listed-above','open','Full exact source list retained in author_context.bibliographic_scan.institutional_chronology_all_titles. Anthologies and complete works are collections/editions; remaining individual essays/conference items lack opened object-level sources supporting a bounded candidate in this pass. No exhaustiveness claim. Searches for additional listed items (including Carta a un joven escritor, Eduardo Falú, Los libros y su misión, Itinerario and Páginas vivas) were navigational only unless an opened source is listed above; no title is elevated from a search snippet. The 1965 Juan Lavalle result is a joint musical/disc item, not a sole-authored book.','','Independent Reviewer: preserve collection_or_unresearched_scan_items','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0209','WCD-10-B07-G15','research_gap','WCD10:B07:V1-ENT-0186:Los-libros-y-su-misi-n-en-la-liberaci-n-e-integraci-n-de-la-Am-rica-Latina-1978-1979','open','Cervantes chronology lists an essay under 1979. Exact-title search on 2026-10-10 found the Buenos Aires municipal catalog author index snippet listing a 1978 Embassy publication, but the catalog page direct open failed with cache miss. Conflicting years and absence of an opened object page mean the whole object is deferred; no first year or description is asserted.','','Independent Reviewer: preserve deferred_year_conflict','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0210','WCD-10-B07-G16','research_gap','WCD10:B07:Bioy:Historias-fantasticas','open','Actual screening: CVC bibliography line 71 calls the 1972 volume a selection of stories from prior books; Oviedo’s opened Lexis article pp.193–194 also identifies the 1976 anthology and the earlier source books. Anthology identity/reprint boundary; do not create a duplicate original-work object.','','Independent Reviewer: preserve excluded_later_anthology_or_recompilation','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0211','WCD-10-B07-G17','research_gap','WCD10:B07:Bioy:Historias-de-amor','open','Actual screening: CVC bibliography line 72 says the 1972 book selects previously published stories; Oviedo’s opened Lexis article p.193 identifies it as a personal selection and pp.193–194 traces source collections. Later anthology; keep distinct from first-publication story collections.','','Independent Reviewer: preserve excluded_later_anthology_or_recompilation','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0212','WCD-10-B07-G18','research_gap','WCD10:B07:Bioy:La-trama-celeste-y-otros-relatos','open','Actual screening: CVC bibliography line 73 identifies the 1981 book as an anthology with Carlos Dámaso Martínez’s prologue; the original La trama celeste (1948) is separately catalogued. This is a later anthology/version, not the same object as the 1948 collection.','','Independent Reviewer: preserve excluded_later_anthology_or_recompilation','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0213','WCD-10-B07-G19','research_gap','WCD10:B07:Bioy:Borges-collaborations-pseudonyms','open','Actual screening: CVC bibliography lines 80–100 lists Borges collaborations and pseudonym-branded works, while S140 (L59–63) now supports the 1940 Antología as a jointly selected/translated anthology with Bioy’s preface and the 1965 expanded edition. Los que aman, odian is separately proposed as W128 with a bounded Bioy coauthor role. Remaining Borges/pseudonym titles are deferred for title-by-title cross-author work deduplication and evidence of exact byline/role, first edition year, form, and object-level description; collaboration itself is not a reason for exclusion. Do not propagate CVC chronology’s ambiguous 1946 parenthetical author attribution without corroboration.','','Independent Reviewer: preserve deferred_cross_author_title_level_attribution_review','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0214','WCD-10-B07-G20','research_gap','WCD10:B07:Bioy:Early-books-1933-1937','open','R5/R6 title-specific correction: La estatua casera is W124; El perjurio de la nieve is W125 (1944 book/story identity; CVC author-biography 1945 discrepancy retained); Las vísperas de Fausto is W126 (1949 independent story edition, later included in Historia prodigiosa); Homenaje a Francisco Almeyra is W127 (1954 Sur story, later collection reuse). These no longer belong to this residual. Remaining exact-title early items need separate title-level first-edition/book-vs-story verification and adequate object description; no blanket statement that direct discussions are unavailable.','','Independent Reviewer: preserve deferred_early_work_canonical_and_scope_review','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0215','WCD-10-B07-G21','research_gap','WCD10:B07:Bioy:Additional-stories-articles-editor-led-editions','open','CVC bibliography/chronology and opened publisher/catalogue pages establish many additional titles, but this residual remains for title-by-title authorship/edition/role and object-description review of items not represented by the current candidates. It is not a policy exclusion of collaborations; cross-author deduplication and evidence for each object’s year, form, and bounded contents remain to be done. This package does not claim a complete individual short-work inventory. Siete soñadores is now specifically verified in S102 lines 267–270 as a 1968 Sur comedy; only an object-level synopsis is missing.','','Independent Reviewer: preserve deferred_unreviewed_individual_titles','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0216','WCD-10-B07-G22','research_gap','WCD10:B07:Bioy:Unos-dias-en-el-Brasil-edition-boundary','open','Targeted search and direct opens: CVC chronology (S102, lines 370–373) and Balcells work page (S138, lines 93–98) identify a 1991 special-edition travel diary. Penguin’s opened La otra aventura y otros escritos page (S129, lines 408–416) places Unos días en el Brasil among five distinct nonfiction originals and calls it a diary of a 1960 PEN Club trip, while Barral’s 2014 proceedings article (S136, printed p.137 / PDF p.1, lines 31–36) explicitly labels it a posthumous 2010 travel diary. Páginas de Espuma’s official product page (S139, lines 10–36) describes its 112-page first-edition product as an almost-unpublished diary of that 1960 trip but gives no publication year. The 1991, posthumous 2010, and current publisher-product records therefore establish a real edition/selection identity boundary; keep the whole object deferred until those editions can be reconciled. Do not infer the first publication year from a later compilation or product page.','','Independent Reviewer: preserve deferred_same_title_distinct_edition_boundary','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0217','WCD-10-B07-G23','research_gap','WCD10-B07:roa:Fulgencio-Miranda','open','CVC Bibliografía L6明确称 novela inédita（未出版）；Cervantes Chronología只列1941作品名。未获底本/正式出版物，且不能把提交奖项年份当出版首年。暂不建published-work实体。','','Independent Reviewer: preserve deferred_unpublished_manuscript','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0218','WCD-10-B07-G24','research_gap','WCD10-B07:roa:El-genesis-de-los-guaranies','open','CVC Bibliografía L6 lists “El génesis de los guaraníes. Leyenda de la creación y destrucción del mundo” in Revista del Ateneo Paraguayo (1948). Enrique Flores, “Las ‘culturas condenadas’: el mitólogo como compilador,” Revista Telar 27 (2021), directly states that the 1948 text was taken/translated from Nimuendajú’s original (Dialnet article PDF physical p.2 L55–79), and its note 18 calls the 1971 El génesis de los Apapokuva-guaraní a “reedición” (PDF physical p.10 L283–284). The same five song titles listed for the 1948 text at PDF p.2 L78–79 correspond to the five poems in the near-contemporary 1971 Alcor issue review (S217, Caravelle 18, pp.173–196; title at p.22 and poem listings from p.25; also S219/CVC chronology L25 spells Apapokura). These records establish a 1971 bibliographic item but conflict with treating it as a distinct first-publication-year 1971 work. No physical 1971 Alcor/book artifact or full contents/title-page collation has been obtained. Therefore work identity, 1948-versus-1971 first-publication year, title/spelling relation (Apapokuva/Apapokura), and exact re-edition scope remain unresolved; W211 is deferred, not admitted as an independent 1971 work. The 1948 attribution/translation formulation is reported as Flores’ bibliography/analysis and does not determine sole authorship of a later edition.','','Independent Reviewer: preserve deferred_work_identity_and_description_gap','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0219','WCD-10-B07-G25','research_gap','WCD10-B07:roa:Contar-un-cuento-y-otros-relatos','open','CVC机构书目列1984年Kapelusz选集，CVC作品年表却列1948；目前无法区分早期单篇/合集、首版与选集版，不能把选集年认作首发年。','','Independent Reviewer: preserve deferred_first-publication-year-and-version-conflict','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0220','WCD-10-B07-G26','research_gap','WCD10-B07:roa:Lucha-hasta-el-alba','open','CVC列1979独立书名；基金会称为作者最早文本，选集页也列单篇。当前未取得独立篇目首次发表证据与原书目录，暂不将单篇和后来的同名书/重收版本合并为作品。','','Independent Reviewer: preserve deferred_single-story-versus-book-version-boundary','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0221','WCD-10-B07-G27','research_gap','WCD10-B07:roa:Antologia-personal','open','1980作者自选选集，基金会页说明其为代表性选录；本轮不把每一选集版本当作独立创作作品，也未逐项核对新增/异名内容。','','Independent Reviewer: preserve deferred_selected-anthology-not-independent-work-description','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0222','WCD-10-B07-G28','research_gap','WCD10-B07:roa:Cuentos-completos','open','基金会和CVC把2003/2008 Cuentos completos作为合集版次，包含多本既有集与较少流传篇目；它是后期合集而非单一原创书集，需另行核对版本及内容，不在本轮新增。','','Independent Reviewer: preserve deferred_collected-edition-boundary','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0223','WCD-10-B07-G29','research_gap','WCD10-B07:roa:other-poetry-essays-theatre','open','CVC全书目另列诗集、散文/随笔、戏剧、合作编著及影视剧本；本轮逐类登记为待查范围，不将合作序跋、改编剧本、歌曲与原创小说/短篇合集混并。需未来任务逐对象核验。','','Independent Reviewer: preserve deferred_scope_and_object_review','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0224','WCD-10-B07-G30','research_gap','WCD10-B07:roa:Los-juegos-2-La-casa-de-invierno-verano','open','已针对完整书名、替代空格/连字符标题及Roa Bastos + “1981”执行检索，打开CVC chronology L28和基金会生平L160–161，仅确认1981儿童读物身份及与第一册相同的插图者/出版社；搜索未返回单书目录或可读片段，未声称检查到其内容，因此仍留对象简介缺口。','','Independent Reviewer: preserve deferred_corpus_inventory_item','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0225','WCD-10-B07-G31','research_gap','WCD10-B07:roa:Candido-Lopez-1984','open','CVC Bibliografía列1984年Franco Maria Ricci出版物，但仅列题名与出版项，未核其属于作者独立文学作品、艺术专著或其他文本形态；身份/类型/内容未清。','','Independent Reviewer: preserve deferred_corpus_inventory_item','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0226','WCD-10-B07-G32','research_gap','WCD10-B07:roa:Los-dilemas-de-la-integracion-iberoamericana','open','CVC Bibliografía列1986年出版项，未有直接作品页/对象说明，故不据题名推断散文论点或内容。','','Independent Reviewer: preserve deferred_corpus_inventory_item','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0227','WCD-10-B07-G33','research_gap','WCD10-B07:roa:Carlos-Colombino-1990','open','CVC Bibliografía列1990年Imprenta Comuneros出版项，但无法由该书目行确认其是艺术家专著、合作或其他文本；对象身份/体裁待查。','','Independent Reviewer: preserve deferred_corpus_inventory_item','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0228','WCD-10-B07-G34','research_gap','WCD10-B07:roa:El-texto-cautivo','open','CVC Bibliografía列1990 Fundación del Rey出版，CVC chronology也含90年代出版记录；未核原版体裁、选文边界与内容，不把合集/文章集误作单一小说。','','Independent Reviewer: preserve deferred_corpus_inventory_item','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0229','WCD-10-B07-G35','research_gap','WCD10-B07:roa:Poesia-Colihue-1999','open','CVC Bibliografía列1999《Poesía》选集及Jorge Boccanera序；未核其收录作品、是否与前述单诗集有版本合并关系，不能将汇编年当作早期诗作首发年。','','Independent Reviewer: preserve deferred_corpus_inventory_item','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0230','WCD-10-B07-G36','research_gap','WCD10-B07:roa:Un-pais-detras-de-la-lluvia','open','基金会传记L222-223称作者生前称已完成小说、但作品仍失落；缺可访问底本/正式出版物，不建已出版作品。','','Independent Reviewer: preserve deferred_corpus_inventory_item','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0231','WCD-10-B07-G37','research_gap','WCD10-B07:roa:Yo-el-Supremo-teatro','open','CVC Bibliografía列1985年戏剧文本；基金会传记L179称1986年戏剧作品。另属小说的舞台版本，不与1974小说合并；未获取剧本/舞台版本和首演/出版证据，整对象延期。','','Independent Reviewer: preserve deferred_corpus_inventory_item','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0232','WCD-10-B07-G38','research_gap','WCD10-B07:roa:early-theater-plays','open','CVC Bibliografía teatro栏目列 Alma de tradición（多位合作者）、El niño del rocío (1945演出)、Mientras llega el día（1946演出）；基金会另称La Residenta/版本题名与年份。均属舞台/合著层次，缺原剧本与出版/演出版本核实，故整类待查，不归入小说或单篇小说集。','','Independent Reviewer: preserve deferred_corpus_inventory_item','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0233','WCD-10-B07-G39','research_gap','WCD10-B07:roa:coauthored-edited-and-preface-books','open','CVC Bibliografía L10-14列共同创作、编选/编纂、序言/呈献、合作著作与艺术册等角色，包括 Amérikka..., Novelistas criollistas latinoamericanos, Culturas condenadas, Los conjurados del quilombo del Gran Chaco, Polisapo 等。尚未逐本核实作者角色、合作者、编辑角色和书内原文，作为角色盘点延期项而非单作者原创作品列表。','','Independent Reviewer: preserve deferred_corpus_inventory_item','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0234','WCD-10-B07-G40','research_gap','WCD10-B07:roa:films-screenplays-and-adaptations','open','CVC Bibliografía L15-16区分改编他人小说/故事、Roa原作 La madre María、Castigo al traidor（基于其单篇 Encuentro）及Hijo de hombre故事章节电影Hijo de hombre/La sed/Chóferes del Chaco；CVC chronology L19也单列Armando Bo 1956电影。影视剧本、原作、底层小说和单篇均不同层级。本轮不创建电影实体或把影视演员/角色并入书籍对象。','','Independent Reviewer: preserve deferred_corpus_inventory_item','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0235','WCD-10-B07-G41','research_gap','WCD10-B07:roa:song-lyrics-and-periodical-work','open','CVC Bibliografía L18-31逐列歌曲歌词及报刊文章/专栏。它们是歌曲、期刊文章、评论/政论/访谈等形态，不等同于小说/短篇集。本轮将CVC各目录节作为已盘点但尚未按作品逐件核对的待查群组。','','Independent Reviewer: preserve deferred_corpus_inventory_item','No confirmed relation, edition or public admission generated.','WCD10-DEFERRED'),
('V1-GAP-0236','WCD-10-B07:WCD10-B07-W003','research_gap','WCD10:work_level_research:V1-ENT-0459','open','No direct work-specific A-level study located/opened for this title.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0237','WCD-10-B07:WCD10-B07-W004','research_gap','WCD10:work_level_research:V1-ENT-0460','open','No direct work-specific A-level study located/opened for this title.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0238','WCD-10-B07:WCD10-B07-W005','research_gap','WCD10:work_level_research:V1-ENT-0461','open','No direct work-specific A-level study located/opened for this title.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0239','WCD-10-B07:WCD10-B07-W006','research_gap','WCD10:work_level_research:V1-ENT-0462','open','No direct work-specific A-level study located/opened for this title.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0240','WCD-10-B07:WCD10-B07-W007','research_gap','WCD10:work_level_research:V1-ENT-0463','open','No direct work-specific A-level study located/opened for this title.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0241','WCD-10-B07:WCD10-B07-W009','research_gap','WCD10:work_level_research:V1-ENT-0465','open','No directly opened A-level research article specifically treating this book was verified; remains institutional_commentary. Full text and publisher object page not read.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0242','WCD-10-B07:WCD10-B07-W104','research_gap','WCD10:work_level_research:V1-ENT-0469','open','No directly retrieved A-level work study found in this pass; object-specific A-level scholarship is a documented gap.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0243','WCD-10-B07:WCD10-B07-W105','research_gap','WCD10:work_level_research:V1-ENT-0470','open','No directly retrieved A-level work study found in this pass; object-specific A-level scholarship is a documented gap.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0244','WCD-10-B07:WCD10-B07-W106','research_gap','WCD10:work_level_research:V1-ENT-0471','open','No directly retrieved A-level work study found in this pass; object-specific A-level scholarship is a documented gap.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0245','WCD-10-B07:WCD10-B07-W107','research_gap','WCD10:work_level_research:V1-ENT-0472','open','No directly retrieved A-level work study found in this pass; object-specific A-level scholarship is a documented gap.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0246','WCD-10-B07:WCD10-B07-W108','research_gap','WCD10:work_level_research:V1-ENT-0473','open','No directly retrieved A-level work study found in this pass; object-specific A-level scholarship is a documented gap.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0247','WCD-10-B07:WCD10-B07-W109','research_gap','WCD10:work_level_research:V1-ENT-0474','open','No directly retrieved A-level work study found in this pass; object-specific A-level scholarship is a documented gap.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0248','WCD-10-B07:WCD10-B07-W110','research_gap','WCD10:work_level_research:V1-ENT-0475','open','[''No claim that the publisher synopsis is exhaustive.'']','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0249','WCD-10-B07:WCD10-B07-W112','research_gap','WCD10:work_level_research:V1-ENT-0477','open','[''No claim that the publisher synopsis is exhaustive.'']','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0250','WCD-10-B07:WCD10-B07-W113','research_gap','WCD10:work_level_research:V1-ENT-0478','open','[''No claim that the publisher synopsis is exhaustive.'']','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0251','WCD-10-B07:WCD10-B07-W114','research_gap','WCD10:work_level_research:V1-ENT-0479','open','[''No claim that the publisher synopsis is exhaustive.'']','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0252','WCD-10-B07:WCD10-B07-W115','research_gap','WCD10:work_level_research:V1-ENT-0480','open','[''摘要按来源能支持的范围限定；不声称目录或内容完整。'']','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0253','WCD-10-B07:WCD10-B07-W116','research_gap','WCD10:work_level_research:V1-ENT-0481','open','[''摘要按来源能支持的范围限定；不声称目录或内容完整。'']','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0254','WCD-10-B07:WCD10-B07-W118','research_gap','WCD10:work_level_research:V1-ENT-0483','open','[''摘要按来源能支持的范围限定；不声称目录或内容完整。'']','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0255','WCD-10-B07:WCD10-B07-W122','research_gap','WCD10:work_level_research:V1-ENT-0487','open','[''无来源支持的其他内容未扩写。'']','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0256','WCD-10-B07:WCD10-B07-W128','research_gap','WCD10:work_level_research:V1-ENT-0493','open','CVC bibliography/chronology and the Universidad de Extremadura thesis support 1946; the Emecé press-sheet biography gives 1945. W128-F04 preserves that source-specific conflict and notes 2016 only as the current book-edition date.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0257','WCD-10-B07:WCD10-B07-W129','research_gap','WCD10:work_level_research:V1-ENT-0494','open','1965 is treated as an expanded edition of the same anthology; no individual included texts are separately proposed here.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0258','WCD-10-B07:WCD10-B07-W202','research_gap','WCD10:work_level_research:V1-ENT-0496','open','Institutional object commentary only; no direct A-level study or full first edition was read.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0259','WCD-10-B07:WCD10-B07-W203','research_gap','WCD10:work_level_research:V1-ENT-0497','open','Institutional collection/contents commentary only; 1977 is a later edition and was not used as first-publication year.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0260','WCD-10-B07:WCD10-B07-W204','research_gap','WCD10:work_level_research:V1-ENT-0498','open','Institutional material documents collection and its text’s later movement into Hijo de hombre; no independent direct A study or full volume was read.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0261','WCD-10-B07:WCD10-B07-W205','research_gap','WCD10:work_level_research:V1-ENT-0499','open','Institutional collection commentary only; no complete first edition or direct A-level study was read.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0262','WCD-10-B07:WCD10-B07-W206','research_gap','WCD10:work_level_research:V1-ENT-0500','open','Library catalogue identifies 1971 contents; Fundación lists a 1972 differently titled anthology. Relation between items remains unresolved from consulted sources; no complete volume or independent direct academic article was read.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0263','WCD-10-B07:WCD10-B07-W207','research_gap','WCD10:work_level_research:V1-ENT-0501','open','Institutional story text/description only; no direct A-level study was read.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0264','WCD-10-B07:WCD10-B07-W208','research_gap','WCD10:work_level_research:V1-ENT-0502','open','Author/foundation self-description and institutional bibliography only; no direct A-level study or full first edition was read.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0265','WCD-10-B07:WCD10-B07-W209','research_gap','WCD10:work_level_research:V1-ENT-0503','open','First-edition jacket paratext is reproduced by Portal Guaraní and institution lists corroborate; Fundación biography has 1995 discrepancy. No direct A-level study was read.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0266','WCD-10-B07:WCD10-B07-W210','research_gap','WCD10:work_level_research:V1-ENT-0504','open','Institutional chronology/anthology evidence only; no physical edition was read. Publication date (1960) is distinct from the 1983 second edition and 1998 collected volume.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0267','WCD-10-B07:WCD10-B07-W212','research_gap','WCD10:work_level_research:V1-ENT-0505','open','1952 “versión completa” is separately listed; the composition relation between 1942 and 1952 editions and all contents beyond catalog preview are not verified.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0268','WCD-10-B07:WCD10-B07-W213','research_gap','WCD10:work_level_research:V1-ENT-0506','open','The source supports a pamphlet of some journalistic articles and named travel observations/interviews only; the complete contents and individual first-publication dates are not checked.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0269','WCD-10-B07:WCD10-B07-W215','research_gap','WCD10:work_level_research:V1-ENT-0508','open','1996 editions are cataloged by El Lector, Seix Barral and Edhasa; their edition/translation/printing relationship is unresolved.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP'),
('V1-GAP-0270','WCD-10-B07:WCD10-B07-W216','research_gap','WCD10:work_level_research:V1-ENT-0509','open','Only the Foundation’s excerpt is directly available; no whole-book contents list or full text found. W216 description is limited to the displayed excerpt.','not_claimed_exhaustive','CODEX-REVIEW: preserve object-level scholarly gap; bibliography/description only','No inferred literary interpretation or public scope expansion.','WCD10-WORK-RESEARCH-GAP');

UPDATE metadata SET value='WCD-10-B07' WHERE key='last_change_set';

UPDATE metadata SET value='2026-10-10' WHERE key='generated_at';

UPDATE metadata SET value=(SELECT COUNT(*) FROM entities) WHERE key='entity_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM facts) WHERE key='fact_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM sources) WHERE key='source_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM content_cards) WHERE key='card_count';

UPDATE metadata SET value=(SELECT COUNT(*) FROM relationships) WHERE key='eligible_relationship_count';

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "sources") = 544 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entities") = 508 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "entity_id_map") = 506 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "content_cards") = 443 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "facts") = 1570 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "fact_sources") = 1878 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_facts") = 1549 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "card_sources") = 947 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationships") = 477 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_sources") = 702 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "relationship_evidence") = 673 THEN 1 ELSE 0 END);

INSERT INTO wcd10_guard VALUES (CASE WHEN (SELECT COUNT(*) FROM "gaps") = 270 THEN 1 ELSE 0 END);

DROP TABLE wcd10_guard;
