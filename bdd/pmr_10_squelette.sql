/*PMR V1.0*/
/*Creation du squelette de la structure des données (table, séquence, trigger,...) */
/* pmr_10_squelette.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                      SUPPRESSION                                                             ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################
/*
drop view if exists m_voirie.geo_v_voirie_statio_pmr_nonpratica;
drop view if exists m_voirie.geo_v_voirie_statio_pmr_quartier;
drop view if exists m_voirie.geo_v_voirie_statio_pmr_tab3;
drop view if exists m_voirie.geo_v_voirie_statio_pmr_tab1;
 
-- clé étrangères
ALTER table IF EXISTS m_voirie.an_voirie_statio_pmr_media DROP CONSTRAINT IF EXISTS an_voirie_statio_pmr_media_tdoc_fkey;
ALTER table IF EXISTS m_voirie.geo_voirie_statio_pmr DROP CONSTRAINT IF EXISTS geo_voirie_statio_marq_fkey;
ALTER table IF EXISTS m_voirie.geo_voirie_statio_pmr DROP CONSTRAINT IF EXISTS geo_voirie_statio_trot_fkey;  
ALTER table IF EXISTS m_voirie.geo_voirie_statio_pmr DROP CONSTRAINT IF EXISTS geo_voirie_statio_signa_fkey;  
ALTER table IF EXISTS m_voirie.geo_voirie_statio_pmr DROP CONSTRAINT IF EXISTS geo_voirie_statio_dim_fkey;  
ALTER table IF EXISTS m_voirie.geo_voirie_statio_pmr DROP CONSTRAINT IF EXISTS geo_voirie_statio_chem_fkey;  
ALTER table IF EXISTS m_voirie.geo_voirie_statio_pmr DROP CONSTRAINT IF EXISTS geo_voirie_statio_regacces_fkey;
ALTER table IF EXISTS m_voirie.geo_voirie_statio_pmr DROP CONSTRAINT IF EXISTS geo_voirie_statio_pratica_fkey;
ALTER table IF EXISTS m_voirie.geo_voirie_statio_pmr DROP CONSTRAINT IF EXISTS geo_voirie_statio_gest_fkey;  
ALTER table IF EXISTS m_voirie.geo_voirie_statio_pmr DROP CONSTRAINT IF EXISTS geo_voirie_statio_demand_fkey;
ALTER table IF EXISTS m_voirie.geo_voirie_statio_pmr DROP CONSTRAINT IF EXISTS geo_voirie_statio_devers_fkey;
ALTER table IF EXISTS m_voirie.geo_voirie_statio_pmr DROP CONSTRAINT IF EXISTS geo_voirie_statio_demsol_fkey;
ALTER table IF EXISTS m_voirie.geo_voirie_statio_pmr DROP CONSTRAINT IF EXISTS geo_voirie_statio_regsol_fkey;
ALTER table IF EXISTS m_voirie.geo_voirie_statio_pmr DROP CONSTRAINT IF EXISTS geo_voirie_statio_demacces_fkey;
ALTER table IF EXISTS m_voirie.geo_voirie_statio_pmr DROP CONSTRAINT IF EXISTS geo_voirie_statio_srcgeom_fkey;



-- classe
DROP TABLE IF EXISTS m_voirie.geo_voirie_statio_pmr;
DROP TABLE IF EXISTS m_voirie.lt_voirie_tdocmedia;
DROP TABLE IF EXISTS m_voirie.an_voirie_statio_pmr_media;
DROP TABLE IF EXISTS m_voirie.lt_pmr_statut;
DROP TABLE IF EXISTS m_voirie.an_voirie_statio_pmr_log;
DROP TABLE IF EXISTS m_voirie.lt_pmr_typstatio;
DROP TABLE IF EXISTS m_voirie.lt_pmr_loca;
DROP TABLE IF EXISTS m_voirie.lt_pmr_conform;
DROP TABLE IF EXISTS m_voirie.lk_pmr_adresse;
DROP TABLE IF EXISTS m_voirie.lk_pmr_voie;


-- sequence
DROP SEQUENCE IF EXISTS m_voirie.geo_voirie_statio_pmr_idpmr_seq;
DROP SEQUENCE IF EXISTS m_voirie.an_voirie_statio_pmr_media_seq;
DROP SEQUENCE IF EXISTS m_voirie.an_voirie_statio_pmr_log_seq;
DROP SEQUENCE IF EXISTS m_voirie.lk_pmr_adresse_seq;
DROP SEQUENCE IF EXISTS m_voirie.lk_pmr_voie_seq;
*/


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                     SEQUENCE                                                                 ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- Sequence : m_voirie.geo_voirie_statio_pmr_gid_seq;
-- DROP SEQUENCE m_voirie.geo_voirie_statio_pmr_gid_seq;

CREATE SEQUENCE m_voirie.geo_voirie_statio_pmr_idpmr_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
 
 -- Sequence : m_voirie.an_voirie_statio_pmr_media_seq;
-- DROP SEQUENCE m_voirie.an_voirie_statio_pmr_media_seq;

CREATE SEQUENCE m_voirie.an_voirie_statio_pmr_media_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
 
  -- Sequence : m_voirie.lk_pmr_adresse_seq;
-- DROP SEQUENCE m_voirie.lk_pmr_adresse_seq;

CREATE SEQUENCE m_voirie.lk_pmr_adresse_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
  
   -- Sequence : m_voirie.lk_pmr_voie_seq;
-- DROP SEQUENCE m_voirie.lk_pmr_voie_seq;

CREATE SEQUENCE m_voirie.lk_pmr_voie_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
 
    -- Sequence : m_voirie.an_voirie_statio_pmr_log_seq;
-- DROP SEQUENCE m_voirie.an_voirie_statio_pmr_log_seq;

CREATE SEQUENCE m_voirie.an_voirie_statio_pmr_log_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
 
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                              DOMAINE DE VALEURS                                                              ###
-- ###                                                                                                                                              ###
-- #################################################################################################################################################### 


-- ################################################################# Domaine valeur - lt_voirie_tdocmedia ############################################
    
-- m_voirie.lt_voirie_tdocmedia definition

-- Drop table

-- DROP TABLE m_voirie.lt_voirie_tdocmedia;

CREATE TABLE m_voirie.lt_voirie_tdocmedia (
	code varchar(2) NOT NULL, -- Code du type de média
	valeur varchar(100) NULL, -- Libellé du type de média
	CONSTRAINT lt_voirie_tdocmedia_pkey PRIMARY KEY (code)
);
CREATE INDEX lt_voirie_tdocmedia_code_idx ON m_voirie.lt_voirie_tdocmedia USING btree (code);
COMMENT ON TABLE m_voirie.lt_voirie_tdocmedia IS 'Liste de valeurs des types de médias';

-- Column comments

COMMENT ON COLUMN m_voirie.lt_voirie_tdocmedia.code IS 'Code du type de média';
COMMENT ON COLUMN m_voirie.lt_voirie_tdocmedia.valeur IS 'Libellé du type de média';

-- valeur

INSERT INTO m_voirie.lt_voirie_tdocmedia(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Photographie'),
    ('20','Carte, plan'),
    ('30','Présentation'),
    ('40','Compte-rendu'),
    ('60','Actes administratifs divers'),
    ('61','Délibération'),
    ('62','Règlement'),
    ('99','Autre document')
     ;

-- Permissions

ALTER TABLE m_voirie.lt_voirie_tdocmedia OWNER TO create_sig;
GRANT ALL ON TABLE m_voirie.lt_voirie_tdocmedia TO create_sig;
GRANT DELETE, SELECT, INSERT, UPDATE ON TABLE m_voirie.lt_voirie_tdocmedia TO sig_edit;
GRANT SELECT ON TABLE m_voirie.lt_voirie_tdocmedia TO sig_read;
   

-- ################################################################# Domaine valeur - lt_pmr_statut ############################################
    
-- m_voirie.lt_pmr_statut definition

-- Drop table

-- DROP TABLE m_voirie.lt_pmr_statut;

CREATE TABLE m_voirie.lt_pmr_statut (
	code varchar(2) NOT NULL, -- Code du type de média
	valeur varchar(100) NULL, -- Libellé du type de média
	CONSTRAINT lt_pmr_statut_pkey PRIMARY KEY (code)
);
CREATE INDEX lt_pmr_statut_code_idx ON m_voirie.lt_pmr_statut USING btree (code);
COMMENT ON TABLE m_voirie.lt_pmr_statut IS 'Liste de valeurs des statuts des places PMR';

-- Column comments

COMMENT ON COLUMN m_voirie.lt_pmr_statut.code IS 'Code du statut de la place PMR';
COMMENT ON COLUMN m_voirie.lt_pmr_statut.valeur IS 'Libellé du statut de la place PMR';

-- valeur

INSERT INTO m_voirie.lt_pmr_statut(
            code, valeur)
    VALUES
    ('10','En projet'),
    ('20','Non réalisée'),
    ('30','Existe'),
    ('40','Supprimée');

-- Permissions

ALTER TABLE m_voirie.lt_pmr_statut OWNER TO create_sig;
GRANT ALL ON TABLE m_voirie.lt_pmr_statut TO create_sig;
GRANT DELETE, SELECT, INSERT, UPDATE ON TABLE m_voirie.lt_pmr_statut TO sig_edit;
GRANT SELECT ON TABLE m_voirie.lt_pmr_statut TO sig_read;

-- ################################################################# Domaine valeur - lt_pmr_typstatio ############################################
    
-- m_voirie.lt_pmr_typstatio definition

-- Drop table

-- DROP TABLE m_voirie.lt_pmr_typstatio;

CREATE TABLE m_voirie.lt_pmr_typstatio (
	code varchar(2) NOT NULL, -- Code du type de média
	valeur varchar(100) NULL, -- Libellé du type de média
	CONSTRAINT lt_pmr_typstatio_pkey PRIMARY KEY (code)
);
CREATE INDEX lt_pmr_typstatio_code_idx ON m_voirie.lt_pmr_typstatio USING btree (code);
COMMENT ON TABLE m_voirie.lt_pmr_typstatio IS 'Liste de valeurs des types de stationnements PMR';

-- Column comments

COMMENT ON COLUMN m_voirie.lt_pmr_typstatio.code IS 'Code du type de stationnement PMR';
COMMENT ON COLUMN m_voirie.lt_pmr_typstatio.valeur IS 'Libellé du type de stationnement PMR';

-- valeur

INSERT INTO m_voirie.lt_pmr_typstatio(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Bataille'),
    ('20','Longitudinal'),
    ('30','Epi'),
    ('40','Autre')
   ;

-- Permissions

ALTER TABLE m_voirie.lt_pmr_typstatio OWNER TO create_sig;
GRANT ALL ON TABLE m_voirie.lt_pmr_typstatio TO create_sig;
GRANT DELETE, SELECT, INSERT, UPDATE ON TABLE m_voirie.lt_pmr_typstatio TO sig_edit;
GRANT SELECT ON TABLE m_voirie.lt_pmr_typstatio TO sig_read;

-- ################################################################# Domaine valeur - lt_pmr_loca ############################################
    
-- m_voirie.lt_pmr_loca definition

-- Drop table

-- DROP TABLE m_voirie.lt_pmr_loca;

CREATE TABLE m_voirie.lt_pmr_loca (
	code varchar(2) NOT NULL, -- Code du type de média
	valeur varchar(100) NULL, -- Libellé du type de média
	CONSTRAINT lt_pmr_loca_pkey PRIMARY KEY (code)
);
CREATE INDEX lt_pmr_loca_code_idx ON m_voirie.lt_pmr_loca USING btree (code);
COMMENT ON TABLE m_voirie.lt_pmr_loca IS 'Liste de valeurs des localisations des places PMR';

-- Column comments

COMMENT ON COLUMN m_voirie.lt_pmr_loca.code IS 'Code de la localisation des places PMR';
COMMENT ON COLUMN m_voirie.lt_pmr_loca.valeur IS 'Libellé de la localisation des places PMR';

-- valeur

INSERT INTO m_voirie.lt_pmr_loca(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Sur voirie'),
    ('20','Parking'),
    ('30','Enceinte privative')
    ;

-- Permissions

ALTER TABLE m_voirie.lt_pmr_loca OWNER TO create_sig;
GRANT ALL ON TABLE m_voirie.lt_pmr_loca TO create_sig;
GRANT DELETE, SELECT, INSERT, UPDATE ON TABLE m_voirie.lt_pmr_loca TO sig_edit;
GRANT SELECT ON TABLE m_voirie.lt_pmr_loca TO sig_read;


-- ################################################################# Domaine valeur - lt_pmr_conform ############################################
    
-- m_voirie.lt_pmr_conform definition

-- Drop table

-- DROP TABLE m_voirie.lt_pmr_conform;

CREATE TABLE m_voirie.lt_pmr_conform (
	code varchar(2) NOT NULL, -- Code du type de média
	valeur varchar(100) NULL, -- Libellé du type de média
	CONSTRAINT lt_pmr_conform_pkey PRIMARY KEY (code)
);
CREATE INDEX lt_pmr_conform_code_idx ON m_voirie.lt_pmr_conform USING btree (code);
COMMENT ON TABLE m_voirie.lt_pmr_conform IS 'Liste de valeurs des conformités déduites des places PMR';

-- Column comments

COMMENT ON COLUMN m_voirie.lt_pmr_conform.code IS 'Code de la conformité déduite des places PMR';
COMMENT ON COLUMN m_voirie.lt_pmr_conform.valeur IS 'Libellé de la conformité déduite des places PMR';

-- valeur

INSERT INTO m_voirie.lt_pmr_conform(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Conforme'),
    ('20','Non conforme')
    ;

-- Permissions

ALTER TABLE m_voirie.lt_pmr_conform OWNER TO create_sig;
GRANT ALL ON TABLE m_voirie.lt_pmr_conform TO create_sig;
GRANT DELETE, SELECT, INSERT, UPDATE ON TABLE m_voirie.lt_pmr_conform TO sig_edit;
GRANT SELECT ON TABLE m_voirie.lt_pmr_conform TO sig_read;


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                      FUNCTION                                                                ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ################################################################# ft_m_voirie_statio_pmr_controle ################################################################

CREATE OR REPLACE FUNCTION m_voirie.ft_m_voirie_statio_pmr_controle()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$

BEGIN

if TG_OP = 'INSERT' then


-- automatisation de la conformité
if new.statut = '30' and new.reg_marq = 't' and new.reg_trot = 't' and new.reg_signa = 't' and new.reg_dim = 't' and new.reg_sol = 't' and new.reg_chem = 't' and new.reg_acces = 't' then 
   new.conform = '10';
elseif new.statut = '30' and (new.reg_marq = 'f' or new.reg_trot = 'f' or new.reg_signa = 'f' or new.reg_dim = 'f' or new.reg_sol = 'f' or new.reg_chem = 'f' or new.reg_acces = 'f') then 
   new.conform = '20';
else if new.statut = '30' and (new.reg_marq = '0' or new.reg_trot = '0' or new.reg_signa = '0' or new.reg_dim = '0' or new.reg_sol = '0' or new.reg_chem = '0' or new.reg_acces = '0') then 
   new.conform = '00';
end if;
end if;

-- controle de saisie uniquement sur compiègne
IF (SELECT st_intersects(NEW.geom,geom) FROM r_osm.geo_vm_osm_commune_arcba WHERE insee = '60159') IS FALSE THEN
RAISE EXCEPTION 'Vous ne pouvez pas saisir une place PMR en dehors de la ville de Compiègne';
END IF;



elseif TG_OP = 'UPDATE' then

-- automatisation de la conformité
if new.statut = '30' and new.reg_marq = 't' and new.reg_trot = 't' and new.reg_signa = 't' and new.reg_dim = 't' and new.reg_sol = 't' and new.reg_chem = 't' and new.reg_acces = 't' then 
   new.conform = '10';
elseif new.statut = '30' and (new.reg_marq = 'f' or new.reg_trot = 'f' or new.reg_signa = 'f' or new.reg_dim = 'f' or new.reg_sol = 'f' or new.reg_chem = 'f' or new.reg_acces = 'f') then 
   new.conform = '20';
else if new.statut = '30' and (new.reg_marq = '0' or new.reg_trot = '0' or new.reg_signa = '0' or new.reg_dim = '0' or new.reg_sol = '0' or new.reg_chem = '0' or new.reg_acces = '0') then 
   new.conform = '00';
end if;
end if;

-- controle de saisie uniquement sur compiègne (déplacement hors de Compiégne impossible)
IF st_equals(new.geom, old.geom) is false and (SELECT st_intersects(NEW.geom,geom) FROM r_osm.geo_vm_osm_commune_arcba WHERE insee = '60159') IS FALSE THEN
RAISE EXCEPTION 'Vous ne pouvez pas déplacer une place PMR en dehors de la ville de Compiègne';
END IF;


elseif TG_OP = 'DELETE' then


delete from m_voirie.lk_pmr_adresse where idpmr = old.idpmr;
delete from m_voirie.lk_pmr_voie where idpmr = old.idpmr;
delete from m_voirie.an_voirie_statio_pmr_media where id = old.idpmr;



end if;

return new;

END;
$function$
;

COMMENT ON FUNCTION m_voirie.ft_m_voirie_statio_pmr_controle() IS 'Fonction trigger réalisant la saisie automatique des données des PMR et des contrôles de saisies';

-- Permissions

ALTER FUNCTION m_voirie.ft_m_voirie_statio_pmr_controle() OWNER TO create_sig;
GRANT ALL ON FUNCTION m_voirie.ft_m_voirie_statio_pmr_controle() TO public;
GRANT ALL ON FUNCTION m_voirie.ft_m_voirie_statio_pmr_controle() TO create_sig;

-- ################################################################# ft_m_voirie_statio_pmr_controle_after ################################################################

CREATE OR REPLACE FUNCTION m_voirie.ft_m_voirie_statio_pmr_controle_after()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$

BEGIN

delete from m_voirie.lk_pmr_adresse where idpmr = old.idpmr;
delete from m_voirie.lk_pmr_voie where idpmr = old.idpmr;
delete from m_voirie.an_voirie_statio_pmr_media where id = old.idpmr;

return new;

END;
$function$
;

COMMENT ON FUNCTION m_voirie.ft_m_voirie_statio_pmr_controle_after() IS 'Fonction trigger réalisant la suppression des objets présents dans les classes liées à la suppression d'' une place PMR';

-- Permissions

ALTER FUNCTION m_voirie.ft_m_voirie_statio_pmr_controle_after() OWNER TO create_sig;
GRANT ALL ON FUNCTION m_voirie.ft_m_voirie_statio_pmr_controle_after() TO public;
GRANT ALL ON FUNCTION m_voirie.ft_m_voirie_statio_pmr_controle_after() TO create_sig;

-- ################################################################# ft_m_voirie_statio_pmr_adresse ################################################################

CREATE OR REPLACE FUNCTION m_voirie.ft_m_voirie_statio_pmr_adresse()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$

BEGIN

-- à l'insertion si une voie est saisie message. Supprimer la voie avant
IF (SELECT count(*) FROM m_voirie.lk_pmr_voie WHERE idpmr = NEW.idpmr) = 1 THEN
RAISE EXCEPTION 'Seules l''adresse ou la voie sont à saisir. Vous ne pouvez pas saisir une adresse si une voie est déjà saisie. Supprimer d''abord la voie puis s"lectionner l''adresse.';
END IF;

return new;

END;
$function$
;

COMMENT ON FUNCTION m_voirie.ft_m_voirie_statio_pmr_adresse() IS 'Fonction trigger empêchant la saisie de la voie si une adresse est saisie';

-- Permissions

ALTER FUNCTION m_voirie.ft_m_voirie_statio_pmr_adresse() OWNER TO create_sig;
GRANT ALL ON FUNCTION m_voirie.ft_m_voirie_statio_pmr_adresse() TO public;
GRANT ALL ON FUNCTION m_voirie.ft_m_voirie_statio_pmr_adresse() TO create_sig;

-- ################################################################# ft_m_voirie_statio_pmr_voie ################################################################

CREATE OR REPLACE FUNCTION m_voirie.ft_m_voirie_statio_pmr_voie()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$

BEGIN

-- à l'insertion si une voie est saisie message. Supprimer la voie avant
IF (SELECT count(*) FROM m_voirie.lk_pmr_adresse WHERE idpmr = NEW.idpmr) = 1 THEN
RAISE EXCEPTION 'Seules l''adresse ou la voie sont à saisir. Vous ne pouvez pas saisir une voie si une adresse est déjà saisie. Supprimer d''abord l''adresse puis s"lectionner la voie.';
END IF;


return new;

END;
$function$
;

COMMENT ON FUNCTION m_voirie.ft_m_voirie_statio_pmr_voie() IS 'Fonction trigger empêchant la saisie d''une adresse si la voie est saisie';

-- Permissions

ALTER FUNCTION m_voirie.ft_m_voirie_statio_pmr_voie() OWNER TO create_sig;
GRANT ALL ON FUNCTION m_voirie.ft_m_voirie_statio_pmr_voie() TO public;
GRANT ALL ON FUNCTION m_voirie.ft_m_voirie_statio_pmr_voie() TO create_sig;

-- ################################################################# ft_m_voirie_statio_pmr_log ################################################################

CREATE OR REPLACE FUNCTION m_voirie.ft_m_voirie_statio_pmr_log()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$

DECLARE v_idlog integer;
DECLARE v_dataold character varying(50000);
DECLARE v_datanew character varying(50000);
DECLARE v_name_table character varying(254);

BEGIN

-- INSERT
IF (TG_OP = 'INSERT') THEN

  v_idlog := nextval('m_voirie.an_voirie_statio_pmr_log_seq'::regclass);
  v_datanew := ROW(NEW.*); ------------------------------------ On concatène tous les attributs dans un seul

  ---
  INSERT INTO m_voirie.an_voirie_statio_pmr_log (idlog, tablename,type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  TG_TABLE_NAME,
  'INSERT',
  NULL,
  v_datanew,
  now();

  ---
  
  RETURN NEW;
  

-- UPDATE
ELSIF (TG_OP = 'UPDATE') THEN 
  ---
  
   v_idlog := nextval('m_voirie.an_voirie_statio_pmr_log_seq'::regclass);
  v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
  v_datanew := ROW(NEW.*);------------------------------------ On concatène tous les nouveaux attributs dans un seul	
  v_name_table := TG_TABLE_NAME;

  ---
  
  INSERT INTO m_voirie.an_voirie_statio_pmr_log (idlog, tablename,type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  v_name_table,
  'UPDATE',
  v_dataold,
  v_datanew,
  now();
  RETURN NEW;

-- DELETE
ELSIF (TG_OP = 'DELETE') THEN 
  ---
  
  v_idlog := nextval('m_voirie.an_voirie_statio_pmr_log_seq'::regclass);
  v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
  v_name_table := TG_TABLE_NAME;

  ---
  
  INSERT INTO m_voirie.an_voirie_statio_pmr_log (idlog, tablename,type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  v_name_table,
  'DELETE',
  v_dataold,
  NULL,
  now();
  RETURN OLD;
  

END IF;

end;

$function$
;

COMMENT ON FUNCTION m_voirie.ft_m_voirie_statio_pmr_log() IS 'Fonction gérant l''insertion d''une opération effectuée sur les données des places PMR dans la table des logs';

-- Permissions

ALTER FUNCTION m_voirie.ft_m_voirie_statio_pmr_log() OWNER TO create_sig;
GRANT ALL ON FUNCTION m_voirie.ft_m_voirie_statio_pmr_log() TO public;
GRANT ALL ON FUNCTION m_voirie.ft_m_voirie_statio_pmr_log() TO create_sig;



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                  CLASSE D'OBJET                                                              ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- ##################################################################### geo_voirie_statio_pmr #####################################################
    
CREATE TABLE m_voirie.geo_voirie_statio_pmr
(
	idpmr int4 NOT NULL DEFAULT nextval('m_voirie.geo_voirie_statio_pmr_idpmr_seq'::regclass),
	libelle varchar(50),
	statut varchar(2) NOT NULL DEFAULT '00',
	typstatio varchar(2),
	loca varchar(2),
	long_m numeric(4,2),
	larg_m numeric(4,2),
	reg_marq varchar(1) NOT NULL DEFAULT '0',
	reg_trot varchar(1) NOT null DEFAULT '0',
	reg_signa varchar(1) NOT NULL DEFAULT '0',
	reg_dim varchar(1) NOT NULL DEFAULT '0',
	reg_sol varchar(1) NOT NULL DEFAULT '0',
	reg_chem varchar(1) NOT NULL DEFAULT '0',
	reg_acces varchar(1) NOT NULL DEFAULT '0',
	conform varchar(2) NOT NULL DEFAULT '00',
	pratica varchar(1) NOT NULL DEFAULT '00',
	d_impl timestamp without time ZONE,
    gest varchar(2) NOT NULL DEFAULT '00',
	demand varchar(2) NOT NULL DEFAULT '0',
	date_demand timestamp without time ZONE,
	dem_devers varchar(2) NOT NULL DEFAULT '0',
	dem_sol varchar(2) NOT NULL DEFAULT '0',
	dem_acces varchar(2) NOT NULL DEFAULT '0',
	observ character varying(1000),
	insee character varying(5) NOT NULL,
	commune character varying(80) NOT NULL,
	idquartier character varying(10),
	quartier character varying(80),
	lieu character varying(80),
	src_geom character varying(2) NOT NULL DEFAULT '00',
	src_date int2,
	x_wgs84 numeric(8,7) NOT NULL,
	y_wgs84 numeric(9,7) NOT NULL,
	x_l93 numeric(9,2) NOT NULL,
	y_l93 numeric(10,2) NOT NULL,
	op_sai character varying(80) NOT NULL,
	op_maj character varying(80),
	date_sai timestamp without time ZONE NOT NULL,
	date_maj timestamp without time zone,
	geom geometry(Point,2154) NOT NULL,
	CONSTRAINT geo_voirie_statio_pmr_pkey PRIMARY KEY (idpmr),
	CONSTRAINT geo_voirie_statio_statut_fkey FOREIGN KEY (statut) REFERENCES m_voirie.lt_pmr_statut(code),
	CONSTRAINT geo_voirie_statio_typstatio_fkey FOREIGN KEY (typstatio) REFERENCES m_voirie.lt_pmr_typstatio(code),
	CONSTRAINT geo_voirie_statio_loca_fkey FOREIGN KEY (loca) REFERENCES m_voirie.lt_pmr_loca(code),
	CONSTRAINT geo_voirie_statio_marq_fkey FOREIGN KEY (reg_marq) REFERENCES r_objet.lt_booleen(code),
	CONSTRAINT geo_voirie_statio_trot_fkey FOREIGN KEY (reg_trot) REFERENCES r_objet.lt_booleen(code),
	CONSTRAINT geo_voirie_statio_signa_fkey FOREIGN KEY (reg_signa) REFERENCES r_objet.lt_booleen(code),
	CONSTRAINT geo_voirie_statio_dim_fkey FOREIGN KEY (reg_dim) REFERENCES r_objet.lt_booleen(code),
	CONSTRAINT geo_voirie_statio_regsol_fkey FOREIGN KEY (reg_sol) REFERENCES r_objet.lt_booleen(code),
	CONSTRAINT geo_voirie_statio_chem_fkey FOREIGN KEY (reg_chem) REFERENCES r_objet.lt_booleen(code),
	CONSTRAINT geo_voirie_statio_regacces_fkey FOREIGN KEY (reg_acces) REFERENCES r_objet.lt_booleen(code),
	CONSTRAINT geo_voirie_statio_conform_fkey FOREIGN KEY (conform) REFERENCES m_voirie.lt_pmr_conform(code),
	CONSTRAINT geo_voirie_statio_pratica_fkey FOREIGN KEY (pratica) REFERENCES r_objet.lt_booleen(code),
	CONSTRAINT geo_voirie_statio_gest_fkey FOREIGN KEY (gest) REFERENCES m_voirie.lt_gestion(code),
    CONSTRAINT geo_voirie_statio_demand_fkey FOREIGN KEY (demand) REFERENCES r_objet.lt_booleen(code),
    CONSTRAINT geo_voirie_statio_devers_fkey FOREIGN KEY (dem_devers) REFERENCES r_objet.lt_booleen(code),
    CONSTRAINT geo_voirie_statio_demsol_fkey FOREIGN KEY (dem_sol) REFERENCES r_objet.lt_booleen(code),
    CONSTRAINT geo_voirie_statio_demacces_fkey FOREIGN KEY (dem_acces) REFERENCES r_objet.lt_booleen(code),
    CONSTRAINT geo_voirie_statio_srcgeom_fkey FOREIGN KEY (src_geom) REFERENCES r_objet.lt_src_geom(code)
	)
WITH (
	OIDS=FALSE
);

COMMENT ON TABLE m_voirie.geo_voirie_statio_pmr
	IS 'Classe d''objets de la localisation des places de parking pour les personnes à mobilité réduite (PMR)';

COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.idpmr IS 'Identifiant de la place de parking pmr';

COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.libelle IS 'Nom de la place ou alias';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.statut IS 'Statut de la place PMR';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.typstatio IS 'Type de stationnement de la place PMR sur la voirie';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.loca IS 'Localisation de la place PMR';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.long_m IS 'Longueur de la place PMR';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.larg_m IS 'Largeur de la placer PMR';

COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.reg_marq IS 'Présence du marquage réglementaire';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.reg_trot IS 'Présence d''un abaissé de trottoir (si présence de marche ou trottoir)';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.reg_signa IS 'Présence de la signalisation réglementaire';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.reg_dim IS 'Dimension règlementaire de la place PMR';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.reg_sol IS 'Présence d''un sol stable et non meuble';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.reg_chem IS 'Présence d''un cheminement';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.reg_acces IS 'Absence d''obstacles';

COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.conform IS 'Conformité règlementaire de la place PMR';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.pratica IS 'Praticabilité de la place PMR';

COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.d_impl IS 'Date d''implantation de la place PMR';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.gest IS 'Gestionnaire de la place PMR';

COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.demand IS 'Place PMR issue d''une demande';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.date_demand IS 'Date de la demande de la place PMR';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.dem_devers IS 'Impossibilité technique lié à un devers';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.dem_sol IS 'Impossibilité technique lié au sol';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.dem_acces IS 'Impossibilité technique lié au cheminement, accès';

COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.observ IS 'Commentaire(s)';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.insee IS 'Code Insee de la commune d''implantation';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.commune IS 'Libellé de la commune d''implantation';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.quartier IS 'Libellé du quartier';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.idquartier IS 'Identifiant du quartier';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.lieu IS 'Lieu de la place si pas d''adrese ou de voie';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.src_geom IS 'Code du référentiel géographique utilisé pour la saisie';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.src_date IS 'Date du référentiel géographique';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.x_wgs84 IS 'Coordonnées en longitude (WGS84)';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.y_wgs84 IS 'Coordonnées en latitude (WGS84)';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.x_l93 IS 'Coordonnées X en lambert 93 arrondie au cm';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.y_l93 IS 'Coordonnées Y en lambert 93 arrondie au cm';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.op_sai IS 'Opérateur de la saisie de la donnée';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.op_maj IS 'Opérateur de la dernière mise à jour de la donnée';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.date_sai IS 'Date de saisie de la donnée';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.date_maj IS 'Date de mise à jour de la donnée';
COMMENT ON COLUMN m_voirie.geo_voirie_statio_pmr.geom IS 'Géométrie des objetss';

-- ##################################################################### an_voirie_statio_pmr_media #####################################################

-- m_voirie.an_voirie_statio_pmr_media definition

-- Drop table

-- DROP TABLE m_voirie.an_voirie_statio_pmr_media;

CREATE TABLE m_voirie.an_voirie_statio_pmr_media (
	gid int4 NOT NULL DEFAULT nextval('m_voirie.an_voirie_statio_pmr_media_seq'::regclass), -- Compteur (identifiant interne)
	id int4 NULL, -- Identifiant interne non signifiant de l'objet saisi
	media text NULL, -- Champ Média de GEO
	miniature bytea NULL, -- Champ miniature de GEO
	n_fichier text NULL, -- Nom du fichier
	t_fichier text NULL, -- Type de média dans GEO
	op_sai varchar(20) NULL, -- Opérateur de saisie (par défaut login de connexion à GEO)
	op_maj varchar(20) NULL, -- Opérateur de mise à jour
	date_sai timestamp NULL, -- Date de la saisie du document
	date_maj timestamp NULL,
	t_doc varchar(2) NULL DEFAULT '00'::character varying, -- Type de documents
	d_photo timestamp NULL, -- Date de la prise de vue
	CONSTRAINT an_voirie_statio_pmr_media_pkey PRIMARY KEY (gid),
	CONSTRAINT an_voirie_statio_pmr_media_tdoc_fkey FOREIGN KEY (t_doc) REFERENCES m_voirie.lt_voirie_tdocmedia(code)
);
CREATE INDEX an_voirie_statio_pmr_media_gid_idx ON m_voirie.an_voirie_statio_pmr_media USING btree (gid);
CREATE INDEX an_voirie_statio_pmr_media_id_idx ON m_voirie.an_voirie_statio_pmr_media USING btree (id);
COMMENT ON TABLE m_voirie.an_voirie_statio_pmr_media IS 'Table gérant les documents intégrés pour la gestion des places  PMR';

-- Column comments

COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_media.gid IS 'Compteur (identifiant interne)';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_media.id IS 'Identifiant interne non signifiant de l''objet saisi';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_media.media IS 'Champ Média de GEO';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_media.miniature IS 'Champ miniature de GEO';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_media.n_fichier IS 'Nom du fichier';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_media.t_fichier IS 'Type de média dans GEO';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_media.op_sai IS 'Opérateur de saisie (par défaut login de connexion à GEO)';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_media.op_maj IS 'Opérateur de mise à jour';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_media.date_sai IS 'Date de la saisie du document';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_media.date_maj IS 'Date de mise à jour du document';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_media.t_doc IS 'Type de documents';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_media.d_photo IS 'Date de la prise de vue';

-- Permissions

ALTER TABLE m_voirie.an_voirie_statio_pmr_media OWNER TO create_sig;
GRANT ALL ON TABLE m_voirie.an_voirie_statio_pmr_media TO create_sig;
GRANT ALL ON TABLE m_voirie.an_voirie_statio_pmr_media TO sig_create;
GRANT DELETE, SELECT, INSERT, UPDATE ON TABLE m_voirie.an_voirie_statio_pmr_media TO sig_edit;
GRANT SELECT ON TABLE m_voirie.an_voirie_statio_pmr_media TO sig_read;
GRANT ALL ON TABLE m_voirie.an_voirie_statio_pmr_media TO sig_stage;

-- ################################################# Classe des objets des contacts des installations : lk_pmr_adresse ##################################

CREATE TABLE m_voirie.lk_pmr_adresse
(
    id bigint NOT NULL DEFAULT nextval('m_voirie.lk_pmr_adresse_seq'::regclass),
    idpmr bigint NOT NULL,
    idadresse bigint NOT NULL,
    CONSTRAINT lk_pmr_adresse_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_voirie.lk_pmr_adresse
    IS 'Classe d''objets d''association d''une place PMR à une adresse';   

COMMENT ON COLUMN m_voirie.lk_pmr_adresse.id
    IS 'Identifiant interne non signifiant';
COMMENT ON COLUMN m_voirie.lk_pmr_adresse.idpmr
    IS 'Identifiant de l''installation'; 
COMMENT ON COLUMN m_voirie.lk_pmr_adresse.idadresse
    IS 'Identifiant interne Grand Compiégnois de l''adresse';
  
   
-- Index: lk_pmr_adresse_id_idx
-- DROP INDEX m_voirie.lk_pmr_adresse_id_idx;

CREATE INDEX lk_pmr_adresse_id_idx
    ON m_voirie.lk_pmr_adresse USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;
   
-- ################################################# Classe des objets des contacts des installations : lk_pmr_voie ##################################

CREATE TABLE m_voirie.lk_pmr_voie
(
    id bigint NOT NULL DEFAULT nextval('m_voirie.lk_pmr_voie_seq'::regclass),
    idpmr bigint NOT NULL,
    idvoie bigint NOT NULL,
    CONSTRAINT lk_pmr_voie_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_voirie.lk_pmr_voie
    IS 'Classe d''objets d''association d''une place PMR à une voie';   

COMMENT ON COLUMN m_voirie.lk_pmr_voie.id
    IS 'Identifiant interne non signifiant';
COMMENT ON COLUMN m_voirie.lk_pmr_voie.idpmr
    IS 'Identifiant de l''installation'; 
COMMENT ON COLUMN m_voirie.lk_pmr_voie.idvoie
    IS 'Identifiant interne Grand Compiégnois de la voie';
  
   
-- Index: lk_pmr_voie_id_idx
-- DROP INDEX m_voirie.lk_pmr_voie_id_idx;

CREATE INDEX lk_pmr_voie_id_idx
    ON m_voirie.lk_pmr_voie USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;  

-- ##################################################################### an_voirie_statio_pmr_log #####################################################

   -- m_voirie.an_voirie_statio_pmr_log definition

-- Drop table

-- DROP TABLE m_voirie.an_voirie_statio_pmr_log;

CREATE TABLE m_voirie.an_voirie_statio_pmr_log (
	idlog int4 NOT NULL, -- Identifiant unique
	tablename varchar(80) NOT NULL, -- Nom de la classe concernée par une opération
	type_ope text NOT NULL, -- Type d'opération
	dataold varchar(50000) NULL, -- Anciennes données
	datanew varchar(50000) NULL, -- Nouvelles données
	date_maj timestamp NULL DEFAULT now(), -- Date d'exécution de l'opération
	CONSTRAINT an_voirie_statio_pmr_log_pkey PRIMARY KEY (idlog)
);
COMMENT ON TABLE m_voirie.an_voirie_statio_pmr_log IS 'Table des opérations effectuées sur les données PMR à l''insert, update et delete';

-- Column comments

COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_log.idlog IS 'Identifiant unique';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_log.tablename IS 'Nom de la classe concernée par une opération';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_log.type_ope IS 'Type d''opération';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_log.dataold IS 'Anciennes données';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_log.datanew IS 'Nouvelles données';
COMMENT ON COLUMN m_voirie.an_voirie_statio_pmr_log.date_maj IS 'Date d''exécution de l''opération';

-- Permissions

ALTER TABLE m_spanc.an_spanc_log OWNER TO create_sig;
   
   
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        INDEX                                                               ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


CREATE INDEX geo_voirie_statio_pmr_geom_idx
    ON m_voirie.geo_voirie_statio_pmr USING gist
    (geom)
    TABLESPACE pg_default;

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        TRIGGER                                                               ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

CREATE TRIGGER t_t1_date_sai
    BEFORE INSERT
    ON m_voirie.geo_voirie_statio_pmr
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

CREATE TRIGGER t_t2_date_maj
    BEFORE UPDATE 
    ON m_voirie.geo_voirie_statio_pmr
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

CREATE TRIGGER t_t3_geo_voirie_statio_pmr_xy_wgs84
BEFORE INSERT OR UPDATE OF geom
    ON m_voirie.geo_voirie_statio_pmr
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_xy_wgs84();
   
CREATE TRIGGER t_t4_geo_voirie_statio_pmr_xy_l93
    BEFORE INSERT OR UPDATE OF geom
    ON m_voirie.geo_voirie_statio_pmr
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_xy_l93();

CREATE TRIGGER t_t5_geo_voirie_statio_pmr_insee
	BEFORE INSERT OR UPDATE OF geom
	ON m_voirie.geo_voirie_statio_pmr
	FOR EACH ROW
	EXECUTE PROCEDURE public.ft_r_commune_pl();

CREATE TRIGGER t_t6_geo_voirie_statio_pmr_quartier
	BEFORE INSERT OR UPDATE OF geom
	ON m_voirie.geo_voirie_statio_pmr
	FOR EACH ROW
	EXECUTE PROCEDURE public.ft_r_quartier_idnom();

CREATE TRIGGER t_t7_geo_voirie_statio_pmr_controle
	BEFORE INSERT OR UPDATE
	ON m_voirie.geo_voirie_statio_pmr
	FOR EACH ROW
	EXECUTE PROCEDURE m_voirie.ft_m_voirie_statio_pmr_controle();

CREATE TRIGGER t_t8_geo_voirie_statio_pmr_controle_after
	AFTER DELETE
	ON m_voirie.geo_voirie_statio_pmr
	FOR EACH ROW
	EXECUTE PROCEDURE m_voirie.ft_m_voirie_statio_pmr_controle_after();


CREATE TRIGGER t_t1_lk_pmr_adresse
	BEFORE insert
	ON m_voirie.lk_pmr_adresse
	FOR EACH ROW
	EXECUTE PROCEDURE m_voirie.ft_m_voirie_statio_pmr_adresse();

CREATE TRIGGER t_t1_lk_pmr_voie
	BEFORE insert
	ON m_voirie.lk_pmr_voie
	FOR EACH ROW
	EXECUTE PROCEDURE m_voirie.ft_m_voirie_statio_pmr_voie();


create trigger t_t100_log 
after insert or delete or update
on m_voirie.geo_voirie_statio_pmr 
for each row execute procedure m_voirie.ft_m_voirie_statio_pmr_log();
    
create trigger t_t100_log_before 
before delete 
on m_voirie.geo_voirie_statio_pmr 
for each row execute procedure m_voirie.ft_m_voirie_statio_pmr_log()    ;

create trigger t_t100_log 
after insert or delete or update
on m_voirie.lk_pmr_voie 
for each row execute procedure m_voirie.ft_m_voirie_statio_pmr_log()   ; 
    
create trigger t_t100_log 
after insert or delete or update
on m_voirie.lk_pmr_adresse 
for each row execute procedure m_voirie.ft_m_voirie_statio_pmr_log()   ; 




-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        DROITS                                                                ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

ALTER TABLE m_voirie.geo_voirie_statio_pmr
  OWNER TO sig_create;
GRANT ALL ON TABLE m_voirie.geo_voirie_statio_pmr TO sig_create;
GRANT SELECT ON TABLE m_voirie.geo_voirie_statio_pmr TO sig_read;
GRANT ALL ON TABLE m_voirie.geo_voirie_statio_pmr TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_voirie.geo_voirie_statio_pmr TO sig_edit;

ALTER TABLE m_voirie.an_voirie_statio_pmr_media
  OWNER TO sig_create;
GRANT ALL ON TABLE m_voirie.an_voirie_statio_pmr_media TO sig_create;
GRANT SELECT ON TABLE m_voirie.an_voirie_statio_pmr_media TO sig_read;
GRANT ALL ON TABLE m_voirie.an_voirie_statio_pmr_media TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_voirie.an_voirie_statio_pmr_media TO sig_edit;

ALTER TABLE m_voirie.an_voirie_statio_pmr_log
  OWNER TO sig_create;
GRANT ALL ON TABLE m_voirie.an_voirie_statio_pmr_log TO sig_create;
GRANT SELECT ON TABLE m_voirie.an_voirie_statio_pmr_log TO sig_read;
GRANT ALL ON TABLE m_voirie.an_voirie_statio_pmr_log TO create_sig;
GRANT SELECT ON TABLE m_voirie.an_voirie_statio_pmr_log TO sig_edit;


ALTER TABLE m_voirie.lk_pmr_adresse
  OWNER TO sig_create;
GRANT ALL ON TABLE m_voirie.lk_pmr_adresse TO sig_create;
GRANT SELECT ON TABLE m_voirie.lk_pmr_adresse TO sig_read;
GRANT ALL ON TABLE m_voirie.lk_pmr_adresse TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_voirie.lk_pmr_adresse TO sig_edit;

ALTER TABLE m_voirie.lt_voirie_tdocmedia
  OWNER TO sig_create;
GRANT ALL ON TABLE m_voirie.lt_voirie_tdocmedia TO sig_create;
GRANT SELECT ON TABLE m_voirie.lt_voirie_tdocmedia TO sig_read;
GRANT ALL ON TABLE m_voirie.lt_voirie_tdocmedia TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_voirie.lt_voirie_tdocmedia TO sig_edit;

ALTER TABLE m_voirie.lt_pmr_statut
  OWNER TO sig_create;
GRANT ALL ON TABLE m_voirie.lt_pmr_statut TO sig_create;
GRANT SELECT ON TABLE m_voirie.lt_pmr_statut TO sig_read;
GRANT ALL ON TABLE m_voirie.lt_pmr_statut TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_voirie.lt_pmr_statut TO sig_edit;

ALTER TABLE m_voirie.lt_pmr_typstatio
  OWNER TO sig_create;
GRANT ALL ON TABLE m_voirie.lt_pmr_typstatio TO sig_create;
GRANT SELECT ON TABLE m_voirie.lt_pmr_typstatio TO sig_read;
GRANT ALL ON TABLE m_voirie.lt_pmr_typstatio TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_voirie.lt_pmr_typstatio TO sig_edit;

ALTER TABLE m_voirie.lt_pmr_loca
  OWNER TO sig_create;
GRANT ALL ON TABLE m_voirie.lt_pmr_loca TO sig_create;
GRANT SELECT ON TABLE m_voirie.lt_pmr_loca TO sig_read;
GRANT ALL ON TABLE m_voirie.lt_pmr_loca TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_voirie.lt_pmr_loca TO sig_edit;

ALTER TABLE m_voirie.lt_pmr_conform
  OWNER TO sig_create;
GRANT ALL ON TABLE m_voirie.lt_pmr_conform TO sig_create;
GRANT SELECT ON TABLE m_voirie.lt_pmr_conform TO sig_read;
GRANT ALL ON TABLE m_voirie.lt_pmr_conform TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_voirie.lt_pmr_conform TO sig_edit;

ALTER TABLE m_voirie.lk_pmr_voie
  OWNER TO sig_create;
GRANT ALL ON TABLE m_voirie.lk_pmr_voie TO sig_create;
GRANT SELECT ON TABLE m_voirie.lk_pmr_voie TO sig_read;
GRANT ALL ON TABLE m_voirie.lk_pmr_voie TO create_sig;
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_voirie.lk_pmr_voie TO sig_edit;

ALTER TABLE m_voirie.geo_v_voirie_statio_pmr_quartier OWNER TO create_sig;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_quartier TO create_sig;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_quartier TO sig_read;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_quartier TO sig_create;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_quartier TO sig_edit;


ALTER TABLE m_voirie.geo_v_voirie_statio_pmr_tab3 OWNER TO create_sig;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_tab3 TO create_sig;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_tab3 TO sig_read;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_tab3 TO sig_create;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_tab3 TO sig_edit;

ALTER TABLE m_voirie.geo_v_voirie_statio_pmr_tab1 OWNER TO create_sig;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_tab1 TO create_sig;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_tab1 TO sig_read;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_tab1 TO sig_create;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_tab1 TO sig_edit;


ALTER TABLE m_voirie.geo_v_voirie_statio_pmr_nonpratica OWNER TO create_sig;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_nonpratica TO create_sig;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_nonpratica TO sig_read;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_nonpratica TO sig_create;
GRANT SELECT ON TABLE m_voirie.geo_v_voirie_statio_pmr_nonpratica TO sig_edit;

