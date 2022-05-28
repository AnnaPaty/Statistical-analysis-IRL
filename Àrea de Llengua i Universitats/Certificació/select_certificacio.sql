select e.id id_examen, e.informe_avaluacio, e.certificat_mobilitat_creat,
e.preu, e.import_pagat, e.data_pagament, e.presentat, e.resultat,
e.canvi_pendent, 
csn.id id_conv_seus_nivells, csn.actiu actiu_conv_seus_nivells, csn.preu preu_conv_seus_nivells,
csn.sequencial sequencial_conv_seus_nivells,
n.id id_nivell, n.nivell, n.codi codi_nivell, n.preu preu_nivell, n.num_clausus num_clausus_nivell, 
cs.id id_conv_seus, cs.institucio_examen institucio_examen_conv_seus, cs.poblacio_examen poblacio_examen_conv_seus,
cs.format_electronic format_electronic_conv_seus,
cs.enregistradora enregistradora_conv_seus,
c.id id_convocatoria, c.nom nom_convocatoria, c.any any_convocatoria, c.codi codi_convocatoria,
c.actiu actiu_convocatoria, 
c.pagament_transferencia_actiu pagament_transferencia_actiu_convocatoria,
c.descarrega_proves_activa descarrega_proves_activa_convocatoria, c.certificat_mobilitat_actiu certificat_mobilitat_actiu_convocatoria,
c.data_obertura_liquidacio data_obertura_liquidacio_convocatoria, c.data_tancament_liquidacio data_tancament_liquidacio_convocatoria,
case when n.id=1 then c.data_examen1 when n.id=2 then c.data_examen2 when n.id=3 then c.data_examen3
when n.id=4 then c.data_examen4 when n.id=5 then c.data_examen5 end data_examen, 
c.data_consulta_resultats_examens data_consulta_resultats_examens_convocatoria,
c.data_obertura_inscripcio data_obertura_inscripcio_convocatoria, c.data_tancament_inscripcio data_tancament_inscripcio_convocatoria,
s.id id_seus, s.nom nom_seus, s.sigles sigles_seus, s.codi codi_seus, s.gratuita gratuita_seus,
p.id id_pais, p.pais, p.num num_pais, p.irpf1 irpf1_pais, p.irpf2 irpf2_pais,
a.id id_alumnes, 
a.data_naixement data_naixement_alumne, 
a.sexe sexe_alumne, a.inscripcio_previa_cert inscripcio_previa_cert_alumne, a.nivell_estudis nivell_estudis_alumne,
a.ocupacio ocupacio_alumne, a.llengua_materna llengua_materna_alumne, a.codi_postal codi_postal_alumne,
a.altres_llengues altres_llengues_alumne, a.hores_catala hores_catala_alumne, a.motiu_prova motiu_prova_alumne,
a.centre_hores_catala centre_catala_ultim_any, a.centre_hores_catala_info_addicional uni_catala_ultim_any,
pais_alumnes.id id_pais_alumnes, pais_alumnes.pais pais_alumne, pais_alumnes.num num_pais_alumne,
pais_alumnes.irpf1 irpf1_pais_alumne, pais_alumnes.irpf2 irpf2_pais_alumne
from clc_examens e 
inner join clc_conv_seus_nivells csn on csn.id = e.conv_seus_nivell_id
inner join clc_nivells n on n.id = csn.nivell_id
inner join clc_conv_seus cs on cs.id = csn.conv_seus_id 
inner join clc_convocatories c on c.id = cs.convocatoria_id 
inner join clc_seus s on s.id = cs.seu_id 
inner join clc_paisos p on p.id = s.pais_id 
inner join clc_alumnes a on a.id = e.alumne_id
inner join clc_paisos pais_alumnes on pais_alumnes.id = a.pais_id
where e.pagat = 1 -- Només els que han pagat (1) són els realment inscrits. Els preinscrits no ens importen.
and c.any < 2022; -- No agafem les dades de 2022 perquè només esbiaixerien les gràfiques al no haver-se completat encara (demanat per l'àrea) 
