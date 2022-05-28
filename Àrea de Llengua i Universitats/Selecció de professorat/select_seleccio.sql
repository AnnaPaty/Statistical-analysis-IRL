--Creem una vista amb el següent select:
select sp_enunciat_form.id_formulari AS id_formulari,
sp_enunciat_conv.id_enunciat AS id_enunciat,sp_enunciat_conv.puntuacio1 AS puntuacio
from (sp_enunciat_form 
join sp_enunciat_conv on(sp_enunciat_conv.id_enunciat = sp_enunciat_form.id_enunciat 
and sp_enunciat_conv.id_convocatoria = sp_enunciat_form.id_convocatoria));




--Creem una segona vista amb el següent select:
select spvco.puntuacio1 AS puntuacio1,spvc.opcio_select AS opcio_select,
spvf.id_formulari AS id_formulari,spvc.id_combo AS id_combo 
from ((sp_valor_form spvf 
join sp_valor_combo spvc on(spvc.id_valor_combo = spvf.id_valor_combo))
join sp_valor_conv spvco on(spvf.id_valor_combo = spvco.id_valor_combo 
and spvco.id_convocatoria = spvf.id_convocatoria));



-- Creació de la taula intermitja
CREATE TABLE sp_super_combo AS
select form.id_formulari,
combo1.opcio_select primera_titulacio, combo1.puntuacio1 punt_primera_titulacio, 
combo2.opcio_select segona_titulacio, combo2.puntuacio1 punt_segona_titulacio, 
combo3.opcio_select exper_uni_exterior, combo3.puntuacio1 punt_exper_uni_exterior, 
combo4.opcio_select exper_uni_dins_domini, combo4.puntuacio1 punt_exper_uni_dins_domini, 
combo5.opcio_select exper_adults_nouni, combo5.puntuacio1 punt_exper_adults_nouni, 
combo6.opcio_select exper_estrangeres, combo6.puntuacio1 punt_exper_estrangeres, 
combo7.opcio_select titulacio_requerida, combo7.puntuacio1 punt_titulacio_requerida, 
combo9.opcio_select llicenciatura, combo9.puntuacio1 punt_llicenciatura, 
combo12.opcio_select postgrau, combo12.puntuacio1 punt_postgrau, 
combo13.opcio_select master, combo13.puntuacio1 punt_master, 
combo14.opcio_select doctorat, combo14.puntuacio1 punt_doctorat, 
combo18.opcio_select llicen_o_grau, combo18.puntuacio1 punt_llicen_o_grau, 
combo19.opcio_select altres_llicen_o_grau, combo19.puntuacio1 punt_altres_llicen_o_grau
from sp_formulari form
left join (select puntuacio1, opcio_select, id_formulari from sp_v_combos_proj where id_combo = 1) combo1
on combo1.id_formulari = form.id_formulari
left join (select puntuacio1, opcio_select, id_formulari from sp_v_combos_proj where id_combo = 2) combo2
on combo2.id_formulari = form.id_formulari
left join (select puntuacio1, opcio_select, id_formulari from sp_v_combos_proj where id_combo = 3) combo3
on combo3.id_formulari = form.id_formulari
left join (select puntuacio1, opcio_select, id_formulari from sp_v_combos_proj where id_combo = 4) combo4
on combo4.id_formulari = form.id_formulari
left join (select puntuacio1, opcio_select, id_formulari from sp_v_combos_proj where id_combo = 5) combo5
on combo5.id_formulari = form.id_formulari
left join (select puntuacio1, opcio_select, id_formulari from sp_v_combos_proj where id_combo = 6) combo6
on combo6.id_formulari = form.id_formulari
left join (select puntuacio1, opcio_select, id_formulari from sp_v_combos_proj where id_combo = 7) combo7
on combo7.id_formulari = form.id_formulari
left join (select puntuacio1, opcio_select, id_formulari from sp_v_combos_proj where id_combo = 9) combo9
on combo9.id_formulari = form.id_formulari
left join (select puntuacio1, opcio_select, id_formulari from sp_v_combos_proj where id_combo = 12) combo12
on combo12.id_formulari = form.id_formulari
left join (select puntuacio1, opcio_select, id_formulari from sp_v_combos_proj where id_combo = 13) combo13
on combo13.id_formulari = form.id_formulari
left join (select puntuacio1, opcio_select, id_formulari from sp_v_combos_proj where id_combo = 14) combo14
on combo14.id_formulari = form.id_formulari
left join (select puntuacio1, opcio_select, id_formulari from sp_v_combos_proj where id_combo = 18) combo18
on combo18.id_formulari = form.id_formulari
left join (select puntuacio1, opcio_select, id_formulari from sp_v_combos_proj where id_combo = 19) combo19
on combo19.id_formulari = form.id_formulari
where form.id_formulari > 201;




-- Select final
select form.id_formulari, concat(form.nom, ' ', form.cognom1 , ' ' ,form.cognom2) nom,form.sexe,
form.poblacio, form.any_naixement, form.pais, form.any_estudis, form.any_estudis2,
form.any_doctorat, form.any_master, form.any_postgrau, 
form.universitat_master, form.admes, form.exclos, form.reserva, form.seleccionat,
form.unitat_puntuacio, form.motiu_exclusio, form.professor_nomcomplert, form.professor_si,
form.acabat, form.paper, form.universitat1, form.idLlicenciatura, form.idAltres, form.idPostGrau,
form.idMaster, form.idDoctorat, form.data_creacio,
convocatoria.id_convocatoria, convocatoria.any_academic, convocatoria.data_inici data_inici_conv,
convocatoria.data_fi data_fi_conv, convocatoria.descripcio descripcio_conv,
universitats_paisos.universitats, universitats_paisos.paisos paisos_unis,
idiomes_nivells.idiomes, idiomes_nivells.puntuacions puntuacions_idiomes, idiomes_nivells.nivells nivells_idiomes,
enunciat1.puntuacio punt_cert_aptitud_pedagogica,
enunciat2.puntuacio punt_cert_correccio_textos,
enunciat3.puntuacio punt_postgraus,
enunciat4.puntuacio punt_masters,
enunciat5.puntuacio punt_doctor,
enunciat17.puntuacio punt_experiencia_cat_esobatx,
enunciat18.puntuacio punt_admin_proves_oficials_cat,
enunciat19.puntuacio punt_mat_docent_publicacio,
enunciat20.puntuacio punt_experiencia_trad_correccio,
enunciat23.puntuacio punt_cursos_altres_institucions,
enunciat24.puntuacio punt_curs_extensio_uni,
enunciat45.puntuacio punt_cert_apt_pedag_sinopostgrau,
enunciat46.puntuacio punt_cert_correc_text_sinopostgrau,
enunciat47.puntuacio punt_cert_altres_institucions,
enunciat48.puntuacio punt_cert_extensio_uni,
enunciat49.puntuacio punt_cert_assis_introdidactica,
combo.primera_titulacio, combo.punt_primera_titulacio, 
combo.segona_titulacio, combo.punt_segona_titulacio, 
combo.exper_uni_exterior, combo.punt_exper_uni_exterior, 
combo.exper_uni_dins_domini, combo.punt_exper_uni_dins_domini, 
combo.exper_adults_nouni, combo.punt_exper_adults_nouni, 
combo.exper_estrangeres, combo.punt_exper_estrangeres, 
combo.titulacio_requerida, combo.punt_titulacio_requerida, 
combo.llicenciatura, combo.punt_llicenciatura, 
combo.postgrau, combo.punt_postgrau, 
combo.master, combo.punt_master, 
combo.doctorat, combo.punt_doctorat, 
combo.llicen_o_grau, combo.punt_llicen_o_grau, 
combo.altres_llicen_o_grau, combo.punt_altres_llicen_o_grau
from sp_formulari form
inner join sp_convocatoria convocatoria on convocatoria.id_convocatoria = form.id_convocatoria
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 1) enunciat1
on enunciat1.id_formulari = form.id_formulari
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 2) enunciat2
on enunciat2.id_formulari = form.id_formulari
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 3) enunciat3
on enunciat3.id_formulari = form.id_formulari
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 4) enunciat4
on enunciat4.id_formulari = form.id_formulari
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 5) enunciat5
on enunciat5.id_formulari = form.id_formulari
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 17) enunciat17
on enunciat17.id_formulari = form.id_formulari
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 18) enunciat18
on enunciat18.id_formulari = form.id_formulari
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 19) enunciat19
on enunciat19.id_formulari = form.id_formulari
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 20) enunciat20
on enunciat20.id_formulari = form.id_formulari
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 23) enunciat23
on enunciat23.id_formulari = form.id_formulari
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 24) enunciat24
on enunciat24.id_formulari = form.id_formulari
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 45) enunciat45
on enunciat45.id_formulari = form.id_formulari
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 46) enunciat46
on enunciat46.id_formulari = form.id_formulari
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 47) enunciat47
on enunciat47.id_formulari = form.id_formulari
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 48) enunciat48
on enunciat48.id_formulari = form.id_formulari
left join (select puntuacio, id_formulari from sp_v_enunciats_proj where id_enunciat = 49) enunciat49
on enunciat49.id_formulari = form.id_formulari
left join (select group_concat(sp_universitat.universitat ORDER BY sp_universitat_form.ordre separator '#') as universitats,
        group_concat(sp_pais.pais ORDER BY sp_universitat_form.ordre separator '/') as paisos,
        sp_universitat_form.id_formulari as id_formulari
        from (sp_universitat_form 
        join sp_universitat on sp_universitat.id_universitat = sp_universitat_form.id_universitat
        left join sp_pais on sp_pais.id_pais = sp_universitat.id_pais)
        group by sp_universitat_form.id_formulari) universitats_paisos on universitats_paisos.id_formulari = form.id_formulari 
left join (select group_concat(sp_v_idioma.idioma order by sp_v_idioma.nivell, sp_v_idioma.puntuacio separator '/') as idiomes,
      group_concat(sp_v_idioma.nivell order by sp_v_idioma.nivell, sp_v_idioma.puntuacio separator '/') as nivells,
      group_concat(sp_v_idioma.puntuacio order by sp_v_idioma.nivell, sp_v_idioma.puntuacio separator '/') as puntuacions,
      sp_v_idioma.id_formulari as id_formulari
      from sp_v_idioma group by sp_v_idioma.id_formulari) idiomes_nivells on idiomes_nivells.id_formulari = form.id_formulari
left join sp_super_combo combo on combo.id_formulari = form.id_formulari
where form.id_formulari > 201 -- De 200 cap a baix eren proves
and invalid = 0; -- No extraiem totes les tuples que desde un inici sabem que no són valides


