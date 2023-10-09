![picto](https://github.com/sigagglocompiegne/orga_gest_igeo/blob/master/doc/img/geocompiegnois_2020_reduit_v2.png)

# Prescriptions spécifiques (locales) pour le suivi et la gestion des places de stationnement pour les Personnes à Mobilité Réduite (PMR)

[x] à rédiger [ ] en cours de rédaction [ ] finaliser

Ensemble des éléments constituant la mise en oeuvre de la base de données pour le suivi des places de stationnements PMR sur la ville de Compiègne :

- Script d'initialisation de la base de données
  * [Suivi des modifications](bdd/pmr_00_trace.sql)
  * [Création de la structure des données](bdd/pmr_10_squelette.sql)
  * [Création des vues applicatives](bdd/pmr_21_vues_xapps.sql)
  * [Création des privilèges](bdd/pmr_99_grant.sql)  
- [Documentation d'administration de la base de données](app/doc_pmr_bd_pmr.md)
- Documentation des utilisateurs de l'application (authentification nécessaire)



## Contexte

L’ARC est engagée dans un plan de modernisation numérique pour l’exercice de ses missions de services publics. L’objectif poursuivi vise à permettre à la collectivité de se doter d’outil d’aide à la décision et d’optimiser l’organisation de ses services. Ces objectifs se déclinent avec la mise en place d’outils informatiques adaptés au quotidien des services et le nécessaire retour auprès de la collectivité, des informations (données) produites et gérées par ses prestataires. 

L’ARC privilégie donc une organisation dans laquelle l’Interface Homme Machine (IHM) du métier assure l’alimentation d’un entrepôt de données territoriales. Cette stratégie « agile » permet de répondre au plus près des besoins des services dans une trajectoire soutenable assurant à la fois une bonne maitrise des flux d’information et un temps d’acculturation au sein de l’organisation.

## Voir aussi

* [Schéma national des stationnements PMR en voirie (en cours)](https://github.com/etalab/schema.data.gouv.fr/issues/190)
* [Schéma sur le stationnement en voirie (en cours)](https://github.com/macaron-ai/onstreet-parking-schema)

## Jeu de données consolidé

Aucun jeu de données consolidé n'est disponible.
