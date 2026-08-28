## Étape 1 - Découvrez les différents types de données

Dans cet exercice, vous allez aider une entreprise de l'assurance à mieux accompagner ses clients en analysant le marché des assurances habitation.

Cette étape a pour but de vous familiariser avec les différents types de données.

---

### Instructions

Consultez les différents fichiers afin de comprendre vos données :

- Données de [contrats clients](https://s3.eu-west-1.amazonaws.com/course.oc-static.com/projects/804_Data-analyst_V3/804_P3/Contrat+(4).csv)
- Données du [référentiel géographique](https://s3.eu-west-1.amazonaws.com/course.oc-static.com/projects/804_Data-analyst_V3/804_P3/Region+(7).csv) des régions françaises (extrait du [site de data.gouv.fr](https://www.data.gouv.fr/fr/datasets/referentiel-geographique-francais-communes-unites-urbaines-aires-urbaines-departements-academies-regions-1/#resources))

---

### Tâche à réaliser

Remplissez le [dictionnaire des données](https://s3.eu-west-1.amazonaws.com/course.oc-static.com/projects/805_Business_Intelligence+_Analyst_V2/P3_+BIA_DA_804_805/dictionnaire_donne%CC%81es_etudiant+(2).xlsx) afin de faire correspondre :

- Le **nom de chaque colonne** entre le dictionnaire des données et les fichiers CSV
- Les **types de variables** (colonne "type de données") et les **contraintes** (taille) à appliquer dans votre modèle de données
  - Exemple : une variable numérique → `integer`
  - Une variable avec une seule lettre → `varchar(1)`
- La **description des données** pour chaque ligne

---

### Recommandations

- Prenez le temps de **comprendre les données**
- Utilisez des filtres dans Excel pour explorer les valeurs
- Utilisez des tableaux croisés dynamiques si nécessaire

---

### Résultat attendu

- Un dictionnaire des données explorées **complet**

---

### Ressource

- Cours : [Requêtez une base de données avec SQL](https://openclassrooms.com/fr/courses/7818671-requetez-une-base-de-donnees-avec-sql)

---

## Étape 2 - Découvrez la conception de schéma relationnel

Cette étape a pour but de vous familiariser avec la conception de schéma relationnel.

---

### Instructions

- Prenez connaissance de l’ébauche du **schéma relationnel normalisé**
  - Fichier : [Schéma relationnel (SQL Power Architect)](https://s3.eu-west-1.amazonaws.com/course.oc-static.com/projects/804_Data-analyst_V3/804_P3/Sche%CC%81ma+-+Etudiant+(2).architect)
  - Version image : disponible plus bas si nécessaire

- Faites correspondre le schéma relationnel avec le dictionnaire des données :
  - Ajoutez les **colonnes manquantes**
  - Modifiez les **types de données**
  - Ajoutez les **contraintes**

- Générez le code SQL permettant de créer la base de données dans SQL Power Architects

---

### Recommandations

- Toutes les variables présentes dans le dictionnaire des données doivent être intégrées dans le schéma relationnel normalisé

---

### Ressources

- Outil SQL Power Architect :
  https://bestofbi.com/products/sql-power-architect-data-modeling/

- Démonstration SQL Power Architect :
  https://bestofbi.com/demos-tutorials-2/

- Schéma en format JPG :
  https://s3-eu-west-1.amazonaws.com/course.oc-static.com/projects/805_Business_Intelligence+_Analyst_V2/P3_+BIA_DA_804_805/Sche%CC%81ma+e%CC%81tudiant.jpg

- Cours recommandés :
  - Modélisation de bases de données : https://openclassrooms.com/courses/6938711-modelisez-vos-bases-de-donnees/7501478-decomposez-la-modelisation-de-votre-bdd-en-trois-etapes-cles
  - Modèle relationnel et clés : http://www.monlyceenumerique.fr/nsi_terminale/bdd/bdd1.php
  - Normalisation des bases de données : https://openclassrooms.com/courses/6938711-modelisez-vos-bases-de-donnees/7561516-ameliorez-votre-modelisation-grace-aux-formes-normales

---

### Résultats attendus

- Un **schéma relationnel** (format JPG)
- Un **script SQL** générant les tables (format texte)

---

## Étape 3 - Découvrez la création et le chargement d'une base de données

Cette étape a pour but de vous familiariser avec la création et le chargement de votre future base de données.

---

### Instructions

- Sélectionnez un système de gestion de base de données parmi les trois proposés :
  - **SQLite** — système le plus accessible
  - **MySQL** — système le plus utilisé dans le monde
  - **PostgreSQL** — solution open source complète avec architecture client/serveur

- Installez le logiciel et réalisez les paramétrages nécessaires
- Créez les tables dans la base de données
- Chargez les données issues des deux fichiers dans le SGBD
  *(les données sont déjà nettoyées et formatées)*
- Vérifiez la cohérence des données en comparant le nombre de lignes entre les fichiers CSV et la base de données

---

### Ressources

- SQLite : https://www.sqlitetutorial.net/download-install-sqlite/
- MySQL : https://openclassrooms.com/courses/6971126-implementez-vos-bases-de-donnees-relationnelles-avec-sql/7152681-installez-le-sgbd-mysql
- PostgreSQL : https://www.postgresql.org/

---

### Résultats attendus

- Une **base de données fonctionnelle** créée dans un SGBD avec données chargées
- Une **capture d’écran de la base de données** montrant :
  - les deux tables créées
  - le volume de données chargé (nombre de lignes dans chaque table)

---

