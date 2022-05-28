select i.idestada|| '|'|| i.idpersona||'|'|| i.hores_catala||'|'|| i.universitat ||'|'||
i.data_inscripcio||'|'|| i.beques_1||'|'||i.beques_2||'|'|| i.campus_1||'|'|| i.campus_2||'|'|| i.irl_basic||'|'|| i.irl_elemental||'|'||
i.irl_intermedi||'|'|| i.irl_suficiencia||'|'|| i.irl_superior||'|'||i.andorra_a||'|'|| i.andorra_b||'|'|| i.andorra_c||'|'||
i.universitat_p||'|'|| i.contacte||'|'||
i.missatges||'|'|| i.puntuacio_anterior||'|'|| i.puntuacio_certificat||'|'|| i.puntuacio_motiu||'|'|| i.puntuacio_professor||'|'||
i.puntuacio_total||'|'|| i.estada_1a||'|'|| i.estada_1b||'|'|| i.estada_2a||'|'|| i.estada_2b||'|'|| i.a2||'|'|| i.b1||'|'|| i.b2||'|'||
i.c1||'|'|| i.c2||'|'|| i.llengua||'|'||
i.altres_llengues||'|'||e.idlinia||'|'|| e.any_estada||'|'|| e.descripcio||'|'|| 
e.data_inici_estada||'|'||
e.data_fi_estada||'|'||
l.codiexpedient||'|'|| l.descripcio||'|'|| l.codiconveni||'|'|| l.any_inici||'|'|| l.any_fi||'|'|| l.alfresco||'|'||
case when usuari.idambit=1 then 'Catala' when usuari.idambit=2 then 'Espanyol' else 'Internacional' end ||'|'||
case when usuari.idtipuspersona=1 then 'Fisica' else 'Juridica' end || '|'||
usuari.idprovincia ||'|'|| p.provincia ||'|'|| usuari.idpais ||'|'|| pais.pais ||'|'||pais.idzona ||'|'|| z.zona ||'|'|| 
usuari.ididioma ||'|'|| id.idioma ||'|'|| usuari.dataentrada ||'|'||
usuari.sexe ||'|'|| usuari.robinson
from tinscripcions i
inner join testades e on e.idestada = i.idestada
inner join tliniessubvencio l on l.idlinia = e.idlinia
inner join tpersones usuari on usuari.idpersona = i.idpersona
left join tprovincies p on p.idprovincia = usuari.idprovincia
left join tpaisos pais on pais.idpais = usuari.idpais
left join tzones z on z.idzona = pais.idzona
left join tidiomes id on id.ididioma = usuari.ididioma
where l.alfresco = 'campus' or l.alfresco = 'estada';

--idestada|idpersona|hores_catala|universitat|data_inscripcio|beques_1|beques_2|campus_1|campus_2|irl_basic|irl_elemental|irl_intermedi|irl_suficiencia|irl_superior|andorra_a|andorra_b|andorra_c|universitat_p|contacte|missatges|puntuacio_anterior|puntuacio_certificat|puntuacio_motiu|puntuacio_professor|puntuacio_total|estada_1a|estada_1b|estada_2a|estada_2b|a2|b1|b2|c1|c2|llengua|altres_llengues|idlinia|any_estada|descripcio|data_inici_estada|data_fi_estada|codiexpedient|descripcio_ECCS|codiconveni|any_inici|any_fi|alfresco|ambit|tipuspersona|idprovincia|provincia|idpais|pais|idzona|zona|ididioma|idioma|dataentrada|sexe|robinson
