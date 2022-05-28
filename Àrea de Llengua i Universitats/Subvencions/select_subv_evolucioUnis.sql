select a.idany_activitat|| '|' || a.idpersona|| '|' || a.anyacademic|| '|' || 
t.subtipuscentre|| '|' ||tc.tipuscentre|| '|' ||p.nom|| '|' || pais_p.pais|| '|' || zona_p.zona
from tany_activitat a
left join tsubtipuscentre t on t.idsubtipuscentre = a.idsubtipuscentre
left join ttipuscentre tc on tc.idtipuscentre = t.idtipuscentre
inner join tpersones p on p.idpersona = a.idpersona
left join tpaisos pais_p on pais_p.idpais = p.idpais
left join tzones zona_p on zona_p.idzona = pais_p.idzona;

--idany_activitat|idpersona|anyacademic|subtipuscentre|tipuscentre|nom|pais|zona