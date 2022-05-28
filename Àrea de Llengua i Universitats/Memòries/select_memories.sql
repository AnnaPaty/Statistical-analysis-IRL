select m.id, m.id_persona, m.any_academic, m.universitat_confirmada,
m.universitat, m.poblacio, m.codi_pais, m.professor, m.responsable_academic,
m.situacio_estudis_catalans_estudis_de_grau,
m.situacio_estudis_catalans_estudis_de_postgrau, m.situacio_estudis_catalans_estudis_de_master,
m.situacio_estudis_catalans_centre_de_llengues, m.situacio_estudis_catalans_especialitzacio_catala,
m.situacio_estudis_catalans_especialitzacio_catala_quina, 
m.situacio_estudis_catalans_especialitzacio_catala_credits,
m.situacio_estudis_catalans_especialitzacio_catala_graduats,
m.dades_docencia_data_inici_curs, m.dades_docencia_data_final_curs,
m.dades_docencia_nombre_estudiants_amb_estudis_catalans,
m.dades_docencia_nombre_estudiants_nivell_a2_endavant, m.dades_docencia_filologies,
m.dades_docencia_arts_humanitats, m.dades_docencia_altres_disciplines, m.metodologia_canvis,
m.formacio, m.recerca, m.produccio_academica, m.proves_certificacio_estudiant_presentat_examen,
m.proves_certificacio_universitat_seu_examen, m.proves_certificacio_nombre_inscrits_basic,
m.proves_certificacio_nombre_presentats_basic, m.proves_certificacio_nombre_inscrits_elemental,
m.proves_certificacio_nombre_presentats_elemental, 
m.proves_certificacio_nombre_inscrits_intermedi, 
m.proves_certificacio_nombre_presentats_intermedi, 
m.proves_certificacio_nombre_inscrits_suficiencia, 
m.proves_certificacio_nombre_presentats_suficiencia, 
m.proves_certificacio_nombre_inscrits_superior, 
m.proves_certificacio_nombre_presentats_superior, m.programes_estudiants_nombre_solicituts,
m.programes_estudiants_nombre_persones_beneficiaries, m.programes_estudiants_conveni,
m.programes_estudiants_conveni_quins_estudiants, m.programes_estudiants_tercer_cicle,
m.activitat, m.valoracio_suggeriments,
a.id id_activitat, a.titol titol_activitat, a.tipus tipus_activitat, a.participants participants_activitat, a.assistents assistents_activitat, a.difusio difusio_activitat, 
s.id id_assignatura, s.lector lector_assignatura, s.estudis_catalans estudis_catalans_assignatura, s.assignatura, s.compartida compartida_assignatura, s.tipus tipus_assignatura, s.llengua llengua_assignatura,
s.periode periode_assignatura, s.curricular curricular_assignatura, s.credits credits_assignatura, s.hores hores_assignatura, s.estudiants estudiants_assignatura, s.impartida impartida_assignatura,
p.id id_produccio, p.tipus tipus_titol, p.autor autor_titol, p.tipus_autor tipus_autor_titol,
curr.valor valor_puntuacio_curr, curr.puntuacio puntuacio_curr,
cast(e_assignatures.valor AS DECIMAL(10,2)) valor_puntuacio_e_assignatures, e_assignatures.puntuacio puntuacio_e_assignatures,
ranking.valor valor_puntuacio_ranking, ranking.puntuacio puntuacio_ranking,
geo.valor valor_puntuacio_geo, geo.puntuacio puntuacio_geo,
produccio.valor valor_puntuacio_produccio, produccio.puntuacio puntuacio_produccio,
activitats.valor valor_puntuacio_activitats, activitats.puntuacio puntuacio_activitats,
cast(e_examens.valor AS DECIMAL(10,2)) valor_puntuacio_e_examens, e_examens.puntuacio puntuacio_e_examens,
formacio.valor valor_puntuacio_formacio, formacio.puntuacio puntuacio_formacio,
jornades.valor valor_puntuacio_jornades, jornades.puntuacio puntuacio_jornades,
finan.puntuacio puntuacio_finan,
aportacio_irl_prof.valor valor_puntuacio_aportacio_irl_prof, 
aportacio_univ_prof.puntuacio puntuacio_aportacio_univ_prof,
aportacio_programes.valor valor_puntuacio_aportacio_programes, 
aportacio_irl_inc.valor valor_puntuacio_aportacio_irl_inc, 
aportacio_preacollida.valor valor_puntuacio_aportacio_preacollida, 
conveni.valor valor_puntuacio_conveni,
incidencies.valor valor_puntuacio_incidencies, 
futur.valor valor_puntuacio_futur,
resum_p.total puntuacio_total
from xov_memoria m 
left join xov_produccio p on p.memoria_id = m.id
left join xov_activitat a on a.memoria_id = m.id
left join xov_assignatura s on s.memoria_id = m.id
left join xov_puntuacio curr on curr.memoria_id = m.id
left join xov_puntuacio e_assignatures on e_assignatures.memoria_id = m.id
left join xov_puntuacio ranking on ranking.memoria_id = m.id
left join xov_puntuacio geo on geo.memoria_id = m.id
left join xov_puntuacio produccio on produccio.memoria_id = m.id
left join xov_puntuacio activitats on activitats.memoria_id = m.id
left join xov_puntuacio e_examens on e_examens.memoria_id = m.id
left join xov_puntuacio formacio on formacio.memoria_id = m.id
left join xov_puntuacio jornades on jornades.memoria_id = m.id
left join xov_puntuacio finan on finan.memoria_id = m.id
left join xov_puntuacio aportacio_irl_prof on aportacio_irl_prof.memoria_id = m.id
left join xov_puntuacio aportacio_univ_prof on aportacio_univ_prof.memoria_id = m.id
left join xov_puntuacio aportacio_programes on aportacio_programes.memoria_id = m.id
left join xov_puntuacio aportacio_irl_inc on aportacio_irl_inc.memoria_id = m.id
left join xov_puntuacio aportacio_preacollida on aportacio_preacollida.memoria_id = m.id
left join xov_puntuacio conveni on conveni.memoria_id = m.id
left join xov_puntuacio incidencies on incidencies.memoria_id = m.id
left join xov_puntuacio futur on futur.memoria_id = m.id
inner join xov_resum_puntuacio resum_p on resum_p.memoria_id = m.id
where m.universitat not like '%contracte%'
and m.any_academic <> 1000 -- lectors que han de pujar contracte però no memoria 
and curr.concepte = 'CURR'
and e_assignatures.concepte = 'E/ASSIGNATURES'
and ranking.concepte = 'RANKING'
and geo.concepte = 'GEO'
and produccio.concepte = 'PRODUCCIO'
and activitats.concepte = 'ACTIVITATS'
and e_examens.concepte = 'E/EXAMENS'
and formacio.concepte = 'FORMACIO'
and jornades.concepte = 'JORNADES'
and finan.concepte = 'FINAN'
and aportacio_irl_prof.concepte = 'APORTACIO_IRL_PROF'
and aportacio_univ_prof.concepte = 'APORTACIO_UNIV_PROF'
and aportacio_programes.concepte = 'APORTACIO_PROGRAMES'
and aportacio_irl_inc.concepte = 'APORTACIO_IRL_INC'
and aportacio_preacollida.concepte = 'APORTACIO_PREACOLLIDA'
and conveni.concepte = 'CONVENI'
and incidencies.concepte = 'INCIDENCIES'
and futur.concepte = 'FUTUR';
