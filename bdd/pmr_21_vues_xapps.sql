/*PMR V1.0*/
/*Creation du squelette de la structure des données (view) */
/* pmr_21_vues_xapps.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                VUES                                                                          ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################   

-- ########################################################## geo_v_voirie_statio_pmr_nonpratica #################################################################

-- m_voirie.geo_v_voirie_statio_pmr_nonpratica source

CREATE OR REPLACE VIEW m_voirie.geo_v_voirie_statio_pmr_nonpratica
AS SELECT
    idpmr,
    geom
   FROM 
   	m_voirie.geo_voirie_statio_pmr
   	WHERE statut = '30' AND pratica = 'f'
;

COMMENT ON VIEW m_voirie.geo_v_voirie_statio_pmr_nonpratica IS 'Vue applicative localisant les places PMR non praticables (place existante conforme ou non)';



-- ########################################################## geo_v_voirie_statio_pmr_tab1 #################################################################

-- m_voirie.geo_v_voirie_statio_pmr_tab1 source

CREATE OR REPLACE VIEW m_voirie.geo_v_voirie_statio_pmr_tab1
AS WITH req_nbpmr AS (
         SELECT 1 AS id,
            count(*) AS nb_pmr
           FROM m_voirie.geo_voirie_statio_pmr
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text
        ), req_nbpmr_projet AS (
         SELECT 1 AS id,
            count(*) AS nb_pmr_projet
           FROM m_voirie.geo_voirie_statio_pmr
          WHERE geo_voirie_statio_pmr.statut::text = '10'::text
        ),
        req_nbpmr_c AS (
         SELECT 1 AS id,
            count(*) AS nb_pmr_c
           FROM m_voirie.geo_voirie_statio_pmr
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '10'::text
        ), req_nbpmr_nc AS (
         SELECT 1 AS id,
            count(*) AS nb_pmr_nc
           FROM m_voirie.geo_voirie_statio_pmr
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text
        ), req_nbpmr_nr AS (
         SELECT 1 AS id,
            count(*) AS nb_pmr_nr
           FROM m_voirie.geo_voirie_statio_pmr
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '00'::text
        ), req_nbpmr_nc_reg_marq AS (
         SELECT 1 AS id,
            count(*) AS nb_pmr_nc_marq
           FROM m_voirie.geo_voirie_statio_pmr
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text AND geo_voirie_statio_pmr.reg_marq::text = 'f'::text
        ), req_nbpmr_nc_reg_trot AS (
         SELECT 1 AS id,
            count(*) AS nb_pmr_nc_trot
           FROM m_voirie.geo_voirie_statio_pmr
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text AND geo_voirie_statio_pmr.reg_trot::text = 'f'::text
        ), req_nbpmr_nc_reg_signa AS (
         SELECT 1 AS id,
            count(*) AS nb_pmr_nc_signa
           FROM m_voirie.geo_voirie_statio_pmr
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text AND geo_voirie_statio_pmr.reg_signa::text = 'f'::text
        ), req_nbpmr_nc_reg_dim AS (
         SELECT 1 AS id,
            count(*) AS nb_pmr_nc_dim
           FROM m_voirie.geo_voirie_statio_pmr
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text AND geo_voirie_statio_pmr.reg_dim::text = 'f'::text
        ), req_nbpmr_nc_reg_sol AS (
         SELECT 1 AS id,
            count(*) AS nb_pmr_nc_sol
           FROM m_voirie.geo_voirie_statio_pmr
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text AND geo_voirie_statio_pmr.reg_sol::text = 'f'::text
        ), req_nbpmr_nc_reg_chem AS (
         SELECT 1 AS id,
            count(*) AS nb_pmr_nc_chem
           FROM m_voirie.geo_voirie_statio_pmr
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text AND geo_voirie_statio_pmr.reg_chem::text = 'f'::text
        ), req_nbpmr_nc_reg_acces AS (
         SELECT 1 AS id,
            count(*) AS nb_pmr_nc_acces
           FROM m_voirie.geo_voirie_statio_pmr
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text AND geo_voirie_statio_pmr.reg_acces::text = 'f'::text
        )
 SELECT req_nbpmr.id,
    req_nbpmr.nb_pmr,
    req_nbpmr_projet.nb_pmr_projet,
    req_nbpmr_c.nb_pmr_c,
    req_nbpmr_nc.nb_pmr_nc,
    req_nbpmr_nr.nb_pmr_nr,
    req_nbpmr_nc_reg_marq.nb_pmr_nc_marq,
    req_nbpmr_nc_reg_trot.nb_pmr_nc_trot,
    req_nbpmr_nc_reg_signa.nb_pmr_nc_signa,
    req_nbpmr_nc_reg_dim.nb_pmr_nc_dim,
    req_nbpmr_nc_reg_sol.nb_pmr_nc_sol,
    req_nbpmr_nc_reg_chem.nb_pmr_nc_chem,
    req_nbpmr_nc_reg_acces.nb_pmr_nc_acces
   FROM req_nbpmr
     JOIN req_nbpmr_c ON req_nbpmr.id = req_nbpmr_c.id
     JOIN req_nbpmr_projet ON req_nbpmr.id = req_nbpmr_projet.id
     JOIN req_nbpmr_nc ON req_nbpmr.id = req_nbpmr_nc.id
     JOIN req_nbpmr_nr ON req_nbpmr.id = req_nbpmr_nr.id
     JOIN req_nbpmr_nc_reg_marq ON req_nbpmr.id = req_nbpmr_nc_reg_marq.id
     JOIN req_nbpmr_nc_reg_trot ON req_nbpmr.id = req_nbpmr_nc_reg_trot.id
     JOIN req_nbpmr_nc_reg_signa ON req_nbpmr.id = req_nbpmr_nc_reg_signa.id
     JOIN req_nbpmr_nc_reg_dim ON req_nbpmr.id = req_nbpmr_nc_reg_dim.id
     JOIN req_nbpmr_nc_reg_sol ON req_nbpmr.id = req_nbpmr_nc_reg_sol.id
     JOIN req_nbpmr_nc_reg_chem ON req_nbpmr.id = req_nbpmr_nc_reg_chem.id
     JOIN req_nbpmr_nc_reg_acces ON req_nbpmr.id = req_nbpmr_nc_reg_acces.id;

COMMENT ON VIEW m_voirie.geo_v_voirie_statio_pmr_tab1 IS 'Vue applicative tableau de bord n°1 pour les chiffres clés des places PMR';



-- ########################################################## geo_v_voirie_statio_pmr_tab3 #################################################################

-- m_voirie.geo_v_place_pmr_tab3 source

CREATE OR REPLACE VIEW m_voirie.geo_v_voirie_statio_pmr_tab3
AS WITH req_nbpmr AS (
         SELECT 1 AS id,
         idquartier,
    	 quartier,
         count(*) AS nb_pmr
           FROM m_voirie.geo_voirie_statio_pmr, r_administratif.geo_adm_quartier q
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text and idquartier = q.id GROUP BY idquartier,quartier
        ), req_nbpmr_c AS (
         SELECT 1 AS id,
            idquartier,
    	    quartier,
    	    count(*) AS nb_pmr_c
           FROM m_voirie.geo_voirie_statio_pmr, r_administratif.geo_adm_quartier q
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '10'::text and idquartier = q.id GROUP BY idquartier,quartier
        ), req_nbpmr_nc AS (
         SELECT 1 AS id,
            idquartier,
    	    quartier,
            count(*) AS nb_pmr_nc
           FROM m_voirie.geo_voirie_statio_pmr, r_administratif.geo_adm_quartier q
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text and idquartier = q.id GROUP BY idquartier,quartier
        ), req_nbpmr_nr AS (
         SELECT 1 AS id,
            idquartier,
    	    quartier,         
            count(*) AS nb_pmr_nr
           FROM m_voirie.geo_voirie_statio_pmr, r_administratif.geo_adm_quartier q
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '00'::text and idquartier = q.id GROUP BY idquartier,quartier
        ), req_nbpmr_nc_reg_marq AS (
         SELECT 1 AS id,
            idquartier,
    	    quartier,  
            count(*) AS nb_pmr_nc_marq
           FROM m_voirie.geo_voirie_statio_pmr, r_administratif.geo_adm_quartier q
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text AND geo_voirie_statio_pmr.reg_marq::text = 'f'::text and idquartier = q.id GROUP BY idquartier,quartier
        ), req_nbpmr_nc_reg_trot AS (
         SELECT 1 AS id,
            idquartier,
    	    quartier,  
            count(*) AS nb_pmr_nc_trot
           FROM m_voirie.geo_voirie_statio_pmr, r_administratif.geo_adm_quartier q
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text AND geo_voirie_statio_pmr.reg_trot::text = 'f'::text and idquartier = q.id GROUP BY idquartier,quartier
        ), req_nbpmr_nc_reg_signa AS (
         SELECT 1 AS id,
            idquartier,
    	    quartier, 
            count(*) AS nb_pmr_nc_signa
           FROM m_voirie.geo_voirie_statio_pmr, r_administratif.geo_adm_quartier q
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text AND geo_voirie_statio_pmr.reg_signa::text = 'f'::text and idquartier = q.id GROUP BY idquartier,quartier
        ), req_nbpmr_nc_reg_dim AS (
         SELECT 1 AS id,
            idquartier,
    	    quartier, 
            count(*) AS nb_pmr_nc_dim
           FROM m_voirie.geo_voirie_statio_pmr, r_administratif.geo_adm_quartier q
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text AND geo_voirie_statio_pmr.reg_dim::text = 'f'::text and idquartier = q.id GROUP BY idquartier,quartier
        ), req_nbpmr_nc_reg_sol AS (
         SELECT 1 AS id,
            idquartier,
    	    quartier,          
            count(*) AS nb_pmr_nc_sol
           FROM m_voirie.geo_voirie_statio_pmr, r_administratif.geo_adm_quartier q
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text AND geo_voirie_statio_pmr.reg_sol::text = 'f'::text and idquartier = q.id GROUP BY idquartier,quartier
        ), req_nbpmr_nc_reg_chem AS (
         SELECT 1 AS id,
            idquartier,
    	    quartier, 
            count(*) AS nb_pmr_nc_chem
           FROM m_voirie.geo_voirie_statio_pmr, r_administratif.geo_adm_quartier q
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text AND geo_voirie_statio_pmr.reg_chem::text = 'f'::text and idquartier = q.id GROUP BY idquartier,quartier
        ), req_nbpmr_nc_reg_acces AS (
         SELECT 1 AS id,
            idquartier,
    	    quartier, 
            count(*) AS nb_pmr_nc_acces
           FROM m_voirie.geo_voirie_statio_pmr, r_administratif.geo_adm_quartier q
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text AND geo_voirie_statio_pmr.reg_acces::text = 'f'::text and idquartier = q.id GROUP BY idquartier,quartier
        )
 SELECT q.id,
    case when q.nom is not null then q.nom else 'Hors quartier' end as quartier,
    case when req_nbpmr.nb_pmr is not null then req_nbpmr.nb_pmr else 0 end as nb_pmr,
    case when req_nbpmr_c.nb_pmr_c is not null then req_nbpmr_c.nb_pmr_c else 0 end as nb_pmr_c,
    case when req_nbpmr_nc.nb_pmr_nc is not null then req_nbpmr_nc.nb_pmr_nc else 0 end nb_pmr_nc,
    case when req_nbpmr_nr.nb_pmr_nr is not null then req_nbpmr_nr.nb_pmr_nr else 0 end nb_pmr_nr,
    case when req_nbpmr_nc_reg_marq.nb_pmr_nc_marq is not null then req_nbpmr_nc_reg_marq.nb_pmr_nc_marq else 0 end nb_pmr_nc_marq,
    case when req_nbpmr_nc_reg_trot.nb_pmr_nc_trot is not null then req_nbpmr_nc_reg_trot.nb_pmr_nc_trot else 0 end nb_pmr_nc_trot,
    case when req_nbpmr_nc_reg_signa.nb_pmr_nc_signa is not null then req_nbpmr_nc_reg_signa.nb_pmr_nc_signa else 0 end nb_pmr_nc_signa,
    case when req_nbpmr_nc_reg_dim.nb_pmr_nc_dim is not null then req_nbpmr_nc_reg_dim.nb_pmr_nc_dim else 0 end nb_pmr_nc_dim,
    case when req_nbpmr_nc_reg_sol.nb_pmr_nc_sol is not null then req_nbpmr_nc_reg_sol.nb_pmr_nc_sol else 0 end nb_pmr_nc_sol,
    case when req_nbpmr_nc_reg_chem.nb_pmr_nc_chem is not null then req_nbpmr_nc_reg_chem.nb_pmr_nc_chem else 0 end nb_pmr_nc_chem,
    case when req_nbpmr_nc_reg_acces.nb_pmr_nc_acces is not null then req_nbpmr_nc_reg_acces.nb_pmr_nc_acces else 0 end nb_pmr_nc_acces
   FROM r_administratif.geo_adm_quartier q
     left join req_nbpmr on req_nbpmr.idquartier = q.id
     left JOIN req_nbpmr_c ON req_nbpmr_c.idquartier = q.id
     left JOIN req_nbpmr_nc ON req_nbpmr_nc.idquartier = q.id
     left JOIN req_nbpmr_nr ON req_nbpmr_nr.idquartier = q.id
     left JOIN req_nbpmr_nc_reg_marq ON req_nbpmr_nc_reg_marq.idquartier = q.id
     left JOIN req_nbpmr_nc_reg_trot ON req_nbpmr_nc_reg_trot.idquartier = q.id
     left JOIN req_nbpmr_nc_reg_signa ON req_nbpmr_nc_reg_signa.idquartier = q.id
     left JOIN req_nbpmr_nc_reg_dim ON req_nbpmr_nc_reg_dim.idquartier = q.id
     left JOIN req_nbpmr_nc_reg_sol ON req_nbpmr_nc_reg_sol.idquartier = q.id
     left JOIN req_nbpmr_nc_reg_chem ON req_nbpmr_nc_reg_chem.idquartier = q.id
     left JOIN req_nbpmr_nc_reg_acces ON req_nbpmr_nc_reg_acces.idquartier = q.id
    WHERE q.insee = '60159' order by q.nom
     ;

COMMENT ON VIEW m_voirie.geo_v_voirie_statio_pmr_tab3 IS 'Vue applicative tableau de bord n°3 pour les chiffres clés des places PMR par quartier';



-- ########################################################## geo_v_voirie_statio_pmr_quartier #################################################################

-- m_voirie.geo_v_voirie_satio_pmr_quartier source
CREATE OR REPLACE VIEW m_voirie.geo_v_voirie_statio_pmr_quartier
AS 
with 
req_compte as
(
SELECT
    count(*) AS nb_pmr,
    idquartier,
    quartier
   FROM 
   	m_voirie.geo_voirie_statio_pmr, r_administratif.geo_adm_quartier q
   	WHERE statut = '30' and quartier = q.nom GROUP BY idquartier,quartier
 ),
  req_nbpmr_c AS (
         SELECT 1 AS id,
            count(*) AS nb_pmr_c,
    		idquartier,
    		quartier
           FROM m_voirie.geo_voirie_statio_pmr, r_administratif.geo_adm_quartier q
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '10'::text and idquartier = q.id GROUP BY idquartier,quartier
 ), req_nbpmr_nc AS (
         SELECT 1 AS id,
            count(*) AS nb_pmr_nc,
            idquartier,
    		quartier
           FROM m_voirie.geo_voirie_statio_pmr, r_administratif.geo_adm_quartier q
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '20'::text and idquartier = q.id GROUP BY idquartier,quartier
 ), req_nbpmr_nr AS (
         SELECT 1 AS id,
            count(*) AS nb_pmr_nr,
            idquartier,
    		quartier
           FROM m_voirie.geo_voirie_statio_pmr, r_administratif.geo_adm_quartier q
          WHERE geo_voirie_statio_pmr.statut::text = '30'::text AND geo_voirie_statio_pmr.conform::text = '00'::text and idquartier = q.id GROUP BY idquartier,quartier
 )
 select 
q.id as idquartier,
q.nom as quartier,
case when co.nb_pmr is null then 0 else co.nb_pmr end as nb_pmr,
case when c.nb_pmr_c is null then 0 else c.nb_pmr_c end as nb_pmr_c,
case when nc.nb_pmr_nc is null then 0 else nc.nb_pmr_nc end as nb_pmr_nc,
case when nr.nb_pmr_nr is null then 0 else nr.nb_pmr_nr end as nb_pmr_nr,
q.geom
from r_administratif.geo_adm_quartier q 
left join req_compte co on co.idquartier = q.id 
left join req_nbpmr_c c on c.idquartier = q.id   
left join req_nbpmr_nc nc on nc.idquartier = q.id
left join req_nbpmr_nr nr on nr.idquartier = q.id
where q.insee = '60159' and co.nb_pmr > 0;


COMMENT ON VIEW m_voirie.geo_v_voirie_statio_pmr_quartier IS 'Vue applicative localisant les places PMR par quartier';

