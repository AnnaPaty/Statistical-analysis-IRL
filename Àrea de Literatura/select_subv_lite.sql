select s.idsubvencio||'|'|| s.idpersona||'|'|| s.pers_objecte||'|'|| s.importsolicitat||'|'||
s.importsubvencionable||'|'|| s.importatorgat||'|'|| s.datasolicitud||'|'|| s.datamaxjustificacio||'|'|| s.dataatorgament||'|'||
s.datarevocacio||'|'|| s.idcontacte||'|'|| s.idestatsubvencio||'|'|| s.importrevocat||'|'|| s.idtipusresolucio||'|'|| 
s.idprefix||'|'|| s.idtraduccions||'|'|| s.concurrent||'|'|| s.cobrament||'|'|| s.ajutviatge||'|'|| s.importjustificat||'|'|| s.any_directe||'|'||
s.ididioma||'|'|| s.pax||'|'||  s.idtermini||'|'|| 
case when form_promo.tipus=1 then 'Activitats' when form_promo.tipus=2 then 'Fragments' when form_promo.tipus=3 then 'Revistes' when form_promo.tipus=4 then 'ActLIJ'  else NULL end||'|'||
s.datainici||'|'|| s.ordre_pagament||'|'||  s.prorroga||'|'||
s.en_requeriment||'|'|| s.en_recurs||'|'|| s.datafi||'|'|| s.datafullpagament||'|'|| s.datajustificacio||'|'|| s.importapagar||'|'||
e.estat||'|'||
case when s.idformulari is null then 'Paper' else 'Online' end || '|' ||
ps.prefix||'|'|| ps.iddisciplina||'|'||disc.disciplina||'|'||i.idioma||'|'||c_t."ANY"||'|'|| 
l_c_t.idlinia||'|'||l_c_t.codiexpedient || ' ' || l_c_t.descripcio||'|'|| l_c_t.any_inici||'|'||
t.datainici||'|'|| t.datafi||'|'|| t.dataresolucio||'|'|| t.datajustificaciomax||'|'|| t.num_termini||'|'|| 
t.actiu||'|'||t.idconvocatoria||'|'||
trad.ideditorial||'|'|| trad.idgenere||'|'|| trad.idobra||'|'|| trad.idpersona||'|'|| trad.ididioma||'|'|| trad.titoltraduccio||'|'|| trad.anytraduccio||'|'||trad.stock||'|'||
trad.update_stock||'|'|| trad.import||'|'|| trad.data_solicitud||'|'|| 
autor_obra.nom ||' '|| autor_obra.cognom1 ||' '|| autor_obra.cognom2 || '|' ||
g_trad.genere||'|'||id_trad.idioma||'|'||
o_trad.idpersona||'|'|| o_trad.idgenere||'|'|| o_trad.titolobra||'|'|| o_trad.anypublicacio||'|'|| o_trad.iddisciplina||'|'||
g_o_trad.genere||'|'||disc_o_trad.disciplina||'|'||
case when p.idtipuspersona=1 then p.nom || ' ' || p.cognom1 || ' ' || p.cognom2 else p.nom end || '|' ||
case when p.idambit=1 then 'Catala' when p.idambit=2 then 'Espanyol' when p.idambit=3 then 'Internacional' else NULL end||'|'||
case when p.idtipuspersona=1 then 'Fisica' else 'Juridica' end||'|'|| p.idprovincia||'|'|| p.idpais||'|'|| 
p.datacreacio||'|'|| p.sexe||'|'|| p.codipais||'|'|| p.robinson||'|'|| p.tipus_identificacio||'|'||
prov_p.provincia||'|'||pais_p.pais||'|'|| pais_p.idzona||'|'||z_pais_p.zona||'|'||
case when pobjecte.idtipuspersona=1 then pobjecte.nom || ' ' || pobjecte.cognom1 || ' ' || pobjecte.cognom2 else pobjecte.nom end || '|' ||
case when pobjecte.idambit=1 then 'Catala' when pobjecte.idambit=2 then 'Espanyol' when p.idambit=3 then 'Internacional' else NULL end||'|'||
case when pobjecte.idtipuspersona=1 then 'Fisica' else 'Juridica' end||'|'|| pobjecte.idprovincia||'|'|| pobjecte.idpais||'|'|| 
pobjecte.datacreacio||'|'|| pobjecte.sexe||'|'|| pobjecte.codipais||'|'|| pobjecte.robinson||'|'|| pobjecte.tipus_identificacio||'|'||
prov_pobjecte.provincia||'|'||pais_pobjecte.pais||'|'|| pais_pobjecte.idzona||'|'||z_pais_pobjecte.zona||'|'|| s.objecte 
from tsubvencions s
inner join testatsubvencio e on e.idestatsubvencio = s.idestatsubvencio
left join tprefixsubvencio ps on ps.idprefix = s.idprefix
left join tdisciplines disc on disc.iddisciplina = ps.iddisciplina
left join tidiomes i on i.ididioma = s.ididioma
left join tterminis t on t.idtermini = s.idtermini
left join tconvocatories c_t on c_t.idconvocatoria = t.idconvocatoria
left join tliniessubvencio l_c_t on l_c_t.idlinia = s.idlinia
left join tformularis_promocio form_promo on form_promo.idexpedient = s.idformulari
left join ttraduccions trad on trad.idtraduccions = s.idtraduccions
left join tgeneres g_trad on g_trad.idgenere = trad.idgenere
left join tidiomes id_trad on id_trad.ididioma = trad.ididioma
left join tobres o_trad on o_trad.idobra = trad.idobra
left join trel_autor_obra rel_autor_obra on rel_autor_obra.idobra = o_trad.idobra
left join tautor autor_obra on autor_obra.idautor = rel_autor_obra.idautor
left join tdisciplines disc_o_trad on disc_o_trad.iddisciplina = o_trad.iddisciplina
left join tgeneres g_o_trad on g_o_trad.idgenere = o_trad.idgenere
inner join tpersones p on p.idpersona = s.idpersona
left join tprovincies prov_p on prov_p.idprovincia = p.idprovincia
left join tpaisos pais_p on pais_p.idpais = p.idpais
left join tzones z_pais_p on z_pais_p.idzona = pais_p.idzona
inner join tpersones pobjecte on pobjecte.idpersona = s.pers_objecte
left join tprovincies prov_pobjecte on prov_pobjecte.idprovincia = pobjecte.idprovincia
left join tpaisos pais_pobjecte on pais_pobjecte.idpais = pobjecte.idpais
left join tzones z_pais_pobjecte on z_pais_pobjecte.idzona = pais_pobjecte.idzona
where s.seguretat = 5;

-- idsubvencio|idpersona|pers_objecte|importsolicitat|importsubvencionable|importatorgat|datasolicitud|datamaxjustificacio|dataatorgament|datarevocacio|idcontacte|idestatsubvencio|importrevocat|idtipusresolucio|idprefix|idtraduccions|concurrent|cobrament|ajutviatge|importjustificat|any_directe|ididioma|pax|idtermini|tipus_promocio|datainici|ordre_pagament|prorroga|en_requeriment|en_recurs|datafi|datafullpagament|datajustificacio|importapagar|estat|paper_online|prefix|iddisciplina|disciplina|idioma|ANY_conv|idlinia|descripcio_linia|any_inici_linia|datainici_termini|datafi_termini|dataresolucio_termini|datajustificaciomax_termini|num_termini|actiu_termini|idconvocatoria|ideditorial_trad|idgenere_trad|idobra_trad|idpersona_trad|ididioma_trad|titoltraduccio_trad|anytraduccio_trad|stock_trad|update_stock_trad|import_trad|data_solicitud_trad|autor_obra_original|genere_trad|idioma_trad|idpersona_o_trad|idgenere_o_trad|titolobra|anypublicacio_trad|iddisciplina_trad|genere_o_trad|disciplina_trad|nom_p|ambit_p|tipuspersona_p|idprovincia_p|idpais_p|datacreacio_p|sexe_p|codipais_p|robinson_p|tipus_identificacio_p|provincia_p|pais_p|idzona_p|zona_p|nom_pobjecte|ambit_pobjecte|tipuspersona_pobjecte|idprovincia_pobjecte|idpais_pobjecte|datacreacio_pobjecte|sexe_pobjecte|codipais_pobjecte|robinson_pobjecte|tipus_identificacio_pobjecte|provincia_pobjecte|pais_pobjecte|idzona_pobjecte|zona_pobjecte|objecte
