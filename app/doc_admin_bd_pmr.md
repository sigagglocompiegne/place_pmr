![picto](https://github.com/sigagglocompiegne/orga_gest_igeo/blob/master/doc/img/geocompiegnois_2020_reduit_v2.png)

# Documentation d'administration de la base de données des places PMR (Personnes à Mobilité Réduite) #

## Principes
  * **généralité** :

Cette application a été conçue pour le service "Voirie" de la ville de Compiègne afin de localiser et de gérer les places de stationnement des Personnes à Mobilité Réduite (PMR).
 
 * **résumé fonctionnel** :

Pour rappel des grands principes :

* le service "Voirie" peut insérer, mettre à jour et supprimer des places PMR
* la conformité est déduite des informations réglementaires saisies
* pour la localisation, aucun élément n'est requis, si la saisie de l'adresse est indiquée, la voie n'est pas nécessaire et inversement

## Schéma fonctionnel

(à faire)

## Modèle relationel simplifié

(à intégrer)

## Dépendances

Cette base de donnnées est dépendante de la Base Adresse Locale.

`[x_apps].[x_apps_geo_vmr_adresse]` : table géographique partagé des adresses

## Classes d'objets

L'ensemble des classes d'objets de gestion sont stockés dans le schéma `m_voirie`.

### Classes d'objets de la primitive graphique :

`[m_voirie].[geo_voirie_statio_pmr]` : Classe d'objets géographique permettant la saisie et le maintien des informations des places PMR

|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idpmr|Identifiant de la place de parking pmr|integer|nextval('m_voirie.geo_voirie_statio_pmr_idpmr_seq'::regclass)|
|libelle|Nom de la place ou alias|character varying(50)| |
|statut|Statut de la place PMR|character varying(2)|'00'::character varying|
|typstatio|Type de stationnement de la place PMR sur la voirie|character varying(2)| |
|loca|Localisation de la place PMR|character varying(2)| |
|long_m|Longueur de la place PMR|numeric| |
|larg_m|Largeur de la placer PMR|numeric| |
|reg_marq|Présence du marquage réglementaire|character varying(1)|'0'::character varying|
|reg_trot|Présence d'un abaissé de trottoir (si présence de marche ou trottoir)|character varying(1)|'0'::character varying|
|reg_signa|Présence de la signalisation réglementaire|character varying(1)|'0'::character varying|
|reg_dim|Dimension règlementaire de la place PMR|character varying(1)|'0'::character varying|
|reg_sol|Présence d'un sol stable et non meuble|character varying(1)|'0'::character varying|
|reg_chem|Présence d'un cheminement|character varying(1)|'0'::character varying|
|reg_acces|Absence d'obstacles|character varying(1)|'0'::character varying|
|conform|Conformité règlementaire de la place PMR|character varying(2)|'00'::character varying|
|pratica|Praticabilité de la place PMR|character varying(1)|'00'::character varying|
|d_impl|Date d'implantation de la place PMR|timestamp without time zone| |
|gest|Gestionnaire de la place PMR|character varying(2)|'00'::character varying|
|demand|Place PMR issue d'une demande|character varying(2)|'0'::character varying|
|date_demand|Date de la demande de la place PMR|timestamp without time zone| |
|dem_devers|Impossibilité technique lié à un devers|character varying(2)|'0'::character varying|
|dem_sol|Impossibilité technique lié au sol|character varying(2)|'0'::character varying|
|dem_acces|Impossibilité technique lié au cheminement, accès|character varying(2)|'0'::character varying|
|observ|Commentaire(s)|character varying(1000)| |
|insee|Code Insee de la commune d'implantation|character varying(5)| |
|commune|Libellé de la commune d'implantation|character varying(80)| |
|idquartier|Identifiant du quartier|character varying(10)| |
|quartier|Libellé du quartier|character varying(80)| |
|lieu|Lieu de la place si pas d'adrese ou de voie|character varying(80)| |
|src_geom|Code du référentiel géographique utilisé pour la saisie|character varying(2)|'00'::character varying|
|src_date|Date du référentiel géographique|smallint| |
|x_wgs84|Coordonnées en longitude (WGS84)|numeric| |
|y_wgs84|Coordonnées en latitude (WGS84)|numeric| |
|x_l93|Coordonnées X en lambert 93 arrondie au cm|numeric| |
|y_l93|Coordonnées Y en lambert 93 arrondie au cm|numeric| |
|op_sai|Opérateur de la saisie de la donnée|character varying(80)| |
|op_maj|Opérateur de la dernière mise à jour de la donnée|character varying(80)| |
|date_sai|Date de saisie de la donnée|timestamp without time zone| |
|date_maj|Date de mise à jour de la donnée|timestamp without time zone| |
|geom|Géométrie des objets|geometry(point,2154)| |

Particularité(s) à noter :
* L'attribut `idpmr` sert de référence unique 
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_chem_fkey` (lien vers la liste de valeurs sur le type de documents `r_objet.lt_booleen`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_conform_fkey` (lien vers la liste de valeurs sur le type de documents `lt_pmr_conform`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_demaacces_fkey` (lien vers la liste de valeurs sur le type de documents `r_objet.lt_booleen`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_demand_fkey` (lien vers la liste de valeurs sur le type de documents `r_objet.lt_booleen`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_demsol_fkey` (lien vers la liste de valeurs sur le type de documents `r_objet.lt_booleen`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_devers_fkey` (lien vers la liste de valeurs sur le type de documents `r_objet.lt_booleen`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_dim_fkey` (lien vers la liste de valeurs sur le type de documents `r_objet.lt_booleen`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_gest_fkey` (lien vers la liste de valeurs sur le type de documents `lt_gestion`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_loca_fkey` (lien vers la liste de valeurs sur le type de documents `lt_pmr_loca`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_marq_fkey` (lien vers la liste de valeurs sur le type de documents `r_objet.lt_booleen`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_pratica_fkey` (lien vers la liste de valeurs sur le type de documents `r_objet.lt_booleen`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_regacces_fkey` (lien vers la liste de valeurs sur le type de documents `r_objet.lt_booleen`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_regsol_fkey` (lien vers la liste de valeurs sur le type de documents `r_objet.lt_booleen`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_signa_fkey` (lien vers la liste de valeurs sur le type de documents `r_objet.lt_booleen`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_srcgeom_fkey` (lien vers la liste de valeurs sur le type de documents `r_objet.lt_src_geom`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_statut_fkey` (lien vers la liste de valeurs sur le type de documents `lt_pmr_statut`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_trot_fkey` (lien vers la liste de valeurs sur le type de documents `r_objet.lt_booleen`)
* Une clé étrangère existe sur la table de valeur `geo_voirie_statio_typstatio_fkey` (lien vers la liste de valeurs sur le type de documents `lt_pmr_typstatio`)

* 10 triggers :
  * `t_t1_100_log` : trigger permettant d'insérer toutes les modifications dans la table des logs
  * `t_t100_log_before` : trigger permettant d'insérer toutes les modifications dans la table des logs avant la suppression
  * `t_t1_date_sai` : trigger permettant d'insérer la date de saisie
  * `t_t2_date_maj` : trigger permettant d'insérer la date de mise à jour
  * `t_t3_geo_voirie_statio_pmr_xy_wgs84` : trigger permettant d'insérer ou de mettre jour les coordonnées du point dans le système de projection EPSG:4326
  * `t_t4_geo_voirie_statio_pmr_xy_l93` : trigger permettant d'insérer ou de mettre jour les coordonnées du point dans le système de projection EPSG:2154
  * `t_t5_geo_voirie_statio_pmr_insee` : trigger permettant d'insérer ou de mettre jour le code insee et le nom de la commune
  * `t_t6_geo_voirie_statio_pmr_quartier` : trigger permettant d'insérer ou de mettre jour l'identifiant et le nom du quartier de la ville
  * `t_t7_geo_voirie_statio_pmr_controle` : trigger permettant de la réaliser les automatismes ou les contrôles de saisies
  * `t_t8_geo_voirie_statio_pmr_controle_after` : trigger permettant de gérer la suppression des dépandences à la suppression de la place sans empêcher la suppression effective dans la classe géographiques
  
### Classes d'objets attributaire :

`[m_voirie].[an_voirie_statio_pmr_media]` : table alphanumérique contenant le dictionnaire des documents joints à une place PMR
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|gid|Compteur (identifiant interne)|integer|nextval('m_voirie.an_voirie_statio_pmr_media_seq'::regclass)|
|id|Identifiant interne non signifiant de l'objet saisi|integer| |
|media|Champ Média de GEO|text| |
|miniature|Champ miniature de GEO|bytea| |
|n_fichier|Nom du fichier|text| |
|t_fichier|Type de média dans GEO|text| |
|op_sai|Opérateur de saisie (par défaut login de connexion à GEO)|character varying(20)| |
|op_maj|Opérateur de mise à jour|character varying(20)| |
|date_sai|Date de la saisie du document|timestamp without time zone| |
|date_maj|Date de mise à jour du document|timestamp without time zone| |
|t_doc|Type de documents|character varying(2)|'00'::character varying|
|d_photo|Date de la prise de vue|timestamp without time zone| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ `gid` l'attribution automatique de la référence unique s'effectue via une séquence. 
* Une clé étrangère existe sur la table de valeur `an_voirie_statio_pmr_media_tdoc_fkey` (lien vers la liste de valeurs sur le type de documents `lt_voirie_tdocmedia`)

---

`[m_voirie].[an_voirie_statio_pmr_log]` : table alphanumérique contenant les opérations effectuées par l'utilisateur (table des logs)
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|idlog|Identifiant unique|integer| |
|tablename|Nom de la classe concernée par une opération|character varying(80)| |
|type_ope|Type d'opération|text| |
|dataold|Anciennes données|character varying(50000)| |
|datanew|Nouvelles données|character varying(50000)| |
|date_maj|Date d'exécution de l'opération|timestamp without time zone|now()|

Particularité(s) à noter :
* Une clé primaire existe sur le champ `idlog` l'attribution automatique de la référence unique s'effectue via une séquence. 

---


#### Liste de valeurs

`[m_voirie].[lt_pmr_conform]` : Liste de valeurs des conformités de la place PMR

|Nom attribut | Définition |
|:---|:---|
|code|Code des conformités des places PMR|character varying(2)| |
|valeur|Valeur des conformités des places PMR|varchar(100)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code 

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|00|Non renseigné (non attribuée)|
|10|Conforme|
|20|Non conforme|

---

`[m_voirie].[lt_pmr_loca]` : Liste de valeurs des localisations des places PMR

|Nom attribut | Définition |
|:---|:---|
|code|Code de la localisation des places PMR|character varying(2)| |
|valeur|Libellé de la localisation des places PMR|varchar(100)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code 

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|00|Non renseigné|
|10|Sur voirie|
|20|Parking|
|30|Enceinte privative|


---

`[m_voirie].[lt_pmr_statut]` : Liste de valeurs des statuts des places PMR

|Nom attribut | Définition |
|:---|:---|
|code|Code du statut de la place PMR|character varying(2)| |
|valeur|Libellé du statut de la place PMR|varchar(100)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code 

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|10|En projet|
|20|Non réalisée|
|30|Existe|
|40|Supprimée|


---

`[m_voirie].[lt_pmr_typstatio]` : Liste de valeurs des types de stationnements PMR

|Nom attribut | Définition |
|:---|:---|
|code|Code du type de stationnement PMR|character varying(2)| |
|valeur|Libellé du type de stationnement PMR|varchar(100)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code 

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|00|Non renseigné|
|10|Bataille|
|20|Longitudinal|
|30|Epi|
|40|Autre|

---

`[m_voirie].[lt_voirie_tdocmedia]` : Liste de valeurs des types de médias

|Nom attribut | Définition |
|:---|:---|
|code|Code du type de média|character varying(2)| |
|valeur|Libellé du type de média|text| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code 

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|00|Non renseigné|
|10|Photographie|
|20|Carte, plan|
|30|Présentation|
|40|Compte-rendu|
|60|Actes administratifs divers|
|61|Délibération|
|62|Règlement|
|99|Autre document|

---

`[r_objet].[lt_booleen]` : Liste de faux booléen pour un oui, non ou autre chose

|Nom attribut | Définition |
|:---|:---|
|code|Code du faux booléen|character varying(2)| |
|valeur|Libellé du faux booléen|varchar(50)| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ code 

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|0|Non renseigné|
|f|Non|
|t|Oui|
|z|Non concerné|

---

### Classes d'objets attributaire gérant les associations (ou relation d'appartenance des objets entre eux) :

`[m_voirie].[lk_pmr_adresse]` : table alphanumérique contenant les relations entre les places PMR et l'adresse
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|id|Identifiant interne non signifiant|bigint|nextval('m_voirie.lk_pmr_adresse_seq'::regclass)|
|idpmr|Identifiant de l'installation|bigint| |
|idadresse|Identifiant interne Grand Compiégnois de l'adresse|bigint| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ `id` l'attribution automatique de la référence unique s'effectue via une séquence. 

* 2 triggers :
  * `t_t1_100_log` : trigger permettant d'insérer toutes les modifications dans la table des logs
  * `t_t1_lk_pmr_adresse` : trigger permettant de contrôler que seule l'adresse peut-être saisie et pas une voie
 
---

`[m_voirie].[lk_pmr_voie]` :  table alphanumérique contenant les relations entre les places PMR et les voies
   
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|id|Identifiant interne non signifiant|bigint|nextval('m_voirie.lk_pmr_voie_seq'::regclass)|
|idpmr|Identifiant de l'installation|bigint| |
|idvoie|Identifiant interne Grand Compiégnois de la voie|bigint| |

Particularité(s) à noter :
* Une clé primaire existe sur le champ `id` l'attribution automatique de la référence unique s'effectue via une séquence. 

* 2 triggers :
  * `t_t1_100_log` : trigger permettant d'insérer toutes les modifications dans la table des logs
  * `t_t1_lk_pmr_voie` : trigger permettant de contrôler que seule voie peut-être saisie et pas une adresse
 
---

### classes d'objets applicatives métiers (vue) :

  * geo_v_voirie_statio_pmr_nonpratica : Vue applicative localisant les places PMR non praticables (place existante conforme ou non)
  * geo_v_voirie_statio_pmr_quartier : Vue applicative localisant les places PMR par quartier
  * geo_v_voirie_statio_pmr_tab1 : Vue applicative tableau de bord n°1 pour les chiffres clés des places PMR
  * geo_v_voirie_statio_pmr_tab3 : Vue applicative tableau de bord n°3 pour les chiffres clés des places PMR par quartier


### classes d'objets applicatives grands publics sont classés dans le schéma x_apps_public :

Sans objet

### classes d'objets opendata sont classés dans le schéma x_opendata :

Sans objet

## Projet QGIS pour la gestion

Sans objet

## Traitement automatisé mis en place (Workflow de l'ETL FME)

Sans objet

## Export Open Data

Sans objet


---

