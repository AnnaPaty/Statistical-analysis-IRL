select s.idsubvencio||'|'|| s.idpersona||'|'|| s.pers_objecte||'|'|| s.importsolicitat||'|'||
s.importsubvencionable||'|'|| s.importatorgat||'|'|| s.datasolicitud||'|'|| s.datamaxjustificacio||'|'|| s.dataatorgament||'|'||
s.datarevocacio||'|'|| s.idestatsubvencio||'|'|| s.importrevocat||'|'|| 
s.idprefix||'|'|| s.concurrent||'|'|| s.cobrament||'|'|| s.ajutviatge||'|'|| s.importjustificat||'|'|| s.any_directe||'|'||
s.pax||'|'|| s.idtermini||'|'|| s.datainici||'|'|| s.ordre_pagament||'|'|| s.prorroga||'|'||
s.carrer||'|'|| s.titelles||'|'|| s.infantil||'|'|| s.en_requeriment||'|'|| s.en_recurs||'|'|| s.datafi||'|'||
s.datafullpagament||'|'|| s.datajustificacio||'|'|| s.importapagar||'|'||
case when s.idformulari is null then 'Paper' else 'Online' end || '|' ||
case when p.idtipuspersona=1 then p.nom || ' ' || p.cognom1 || ' ' || p.cognom2 else p.nom end || '|' ||
case when p.idambit=1 then 'Catala' when p.idambit=2 then 'Espanyol' when p.idambit=3 then 'Internacional' else NULL end||'|'||
case when p.idtipuspersona=1 then 'Fisica' else 'Juridica' end||'|'|| p.idprovincia||'|'|| 
p.datacreacio||'|'|| p.sexe||'|'||p.codipais||'|'|| p.robinson||'|'|| p.tipus_identificacio||'|'||
case when pobjecte.idtipuspersona=1 then pobjecte.nom || ' ' || pobjecte.cognom1 || ' ' || pobjecte.cognom2 else pobjecte.nom end || '|' ||
case when pobjecte.idambit=1 then 'Catala' when pobjecte.idambit=2 then 'Espanyol' when p.idambit=3 then 'Internacional' else NULL end||'|'||
case when pobjecte.idtipuspersona=1 then 'Fisica' else 'Juridica' end||'|'|| pobjecte.idprovincia||'|'|| 
pobjecte.sexe||'|'|| pobjecte.codipais||'|'|| pobjecte.robinson||'|'|| pobjecte.tipus_identificacio||'|'||
e.estat||'|'||ps.prefix||'|'|| ps.iddisciplina||'|'||
t.datainici||'|'|| t.datafi||'|'|| t.dataresolucio||'|'|| t.datajustificaciomax||'|'|| t.num_termini||'|'||
t.actiu||'|'||t.idconvocatoria||'|'||prov_p.provincia||'|'||pais_p.pais||'|'|| pais_p.idzona||'|'||
prov_pobjecte.provincia||'|'||pais_pobjecte.pais||'|'|| pais_pobjecte.idzona||'|'||
disc.disciplina||'|'||c_t."ANY"||'|'||s.idlinia||'|'|| l_c_t.codiexpedient || ' ' || l_c_t.descripcio||'|'||
l_c_t.any_inici||'|'|| l_c_t.tipus||'|'||
z_pais_p.zona||'|'||z_pais_pobjecte.zona||'|'|| s.objecte ||'|'||
(select string_agg(distinct vnf.pais) from v_nom_festival vnf where vnf.idsubvencio = s.idsubvencio group by vnf.idsubvencio)
||'|'||
(select string_agg(to_char(vnf3.nom)) from v_nom_festival vnf3 where vnf3.idsubvencio = s.idsubvencio group by vnf3.idsubvencio)
||'|'|| 
(select string_agg(distinct vnf2.poblacio)
	from v_nom_festival vnf2 
	where vnf2.idsubvencio = s.idsubvencio  and vnf2.pais = 'Espanya' 
	group by vnf2.idsubvencio)
from tsubvencions s
inner join testatsubvencio e on e.idestatsubvencio = s.idestatsubvencio
left join tprefixsubvencio ps on ps.idprefix = s.idprefix
left join tdisciplines disc on disc.iddisciplina = ps.iddisciplina
left join tterminis t on t.idtermini = s.idtermini
left join tconvocatories c_t on c_t.idconvocatoria = t.idconvocatoria
left join tliniessubvencio l_c_t on l_c_t.idlinia = s.idlinia
inner join tpersones p on p.idpersona = s.idpersona
left join tprovincies prov_p on prov_p.idprovincia = p.idprovincia
left join tpaisos pais_p on pais_p.idpais = p.idpais
left join tzones z_pais_p on z_pais_p.idzona = pais_p.idzona
inner join tpersones pobjecte on pobjecte.idpersona = s.pers_objecte
left join tprovincies prov_pobjecte on prov_pobjecte.idprovincia = pobjecte.idprovincia
left join tpaisos pais_pobjecte on pais_pobjecte.idpais = pobjecte.idpais
left join tzones z_pais_pobjecte on z_pais_pobjecte.idzona = pais_pobjecte.idzona
where s.seguretat = 1;

-- idsubvencio|idpersona|pers_objecte|importsolicitat|importsubvencionable|importatorgat|datasolicitud|datamaxjustificacio|dataatorgament|datarevocacio|idestatsubvencio|importrevocat|idprefix|concurrent|cobrament|ajutviatge|importjustificat|any_directe|pax|idtermini|datainici|ordre_pagament|prorroga|carrer|titelles|infantil|en_requeriment|en_recurs|datafi|datafullpagament|datajustificacio|importapagar|paper_online|nom_p|ambit_p|tipuspersona_p|idprovincia_p|datacreacio_p|sexe_p|codipais_p|robinson_p|tipus_identificacio_p|nom_pobjecte|ambit_pobjecte|tipuspersona_pobjecte|idprovincia_pobjecte|sexe_pobjecte|codipais_pobjecte|robinson_pobjecte|tipus_identificacio_pobjecte|estat|prefix|iddisciplina|datainici_termini|datafi_termini|dataresolucio_termini|datajustificaciomax_termini|num_termini|actiu_termini|idconvocatoria|provincia_p|pais_p|idzona_p|provincia_pobjecte|pais_pobjecte|idzona_pobjecte|disciplina|any_conv|idlinia_conv|descripcio_linia_subv|any_inici_linia_subv|tipus_linia_subv|zona_p|zona_pobjecte|objecte|paisos_festivals|noms_festivals|poblacions_Espanya_festivals