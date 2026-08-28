## Scénario

Vous êtes embauché chez Laplace Immo, un réseau national d’agences immobilières. Le directeur général est sensible à l’importance des données et souhaite différencier l’agence en développant un modèle de prévision des prix de vente immobiliers.

Ce projet stratégique est nommé en interne **DATAImmo**. La CTO, Clara Daucourt, pilote le projet.

Dans ce cadre, vous êtes chargé de la modification de la base de données regroupant les transactions immobilières et foncières en France. Cette base servira ensuite à analyser le marché et à améliorer l’accompagnement des agences régionales.

---

### Message de la CTO

**Objet** : Réunion de validation – Modification de la base de données
**De** : Clara
**À** : Moi

---

Hello,

Afin d’avancer sur le projet DATAImmo, je prévois une première réunion pour valider la modification de la base de données.

Tu trouveras en pièce jointe un fichier ZIP contenant :

- Des données issues des Demandes de Valeurs Foncières (DVF) en open data
- Des données INSEE issues des recensements de la population
- Des données data.gouv relatives au référentiel géographique français (communes, unités urbaines, aires urbaines, départements, académies, régions)

---

### Travaux à réaliser avant la réunion

1. **Dictionnaire des données**
   - Compléter le dictionnaire des données à partir du template fourni
   - Répertorier et décrire les données à stocker pour les trois fichiers

2. **Schéma relationnel**
   - Modifier le schéma relationnel existant pour intégrer les données régionales et démographiques
   - Mettre à jour les entités, associations et cardinalités
   - Présenter un schéma relationnel normalisé conforme à la **3NF**
   - Ce schéma servira de base à la création des nouvelles tables

3. **Conformité RGPD**
   - Vérifier que les données respectent les exigences du RGPD

---

### Objectif de la réunion

Préparer une présentation permettant de valider :
- Le dictionnaire des données
- Le schéma relationnel mis à jour
- La conformité RGPD

Cette validation permettra ensuite de lancer la création et l’hébergement en ligne de la base de données.

---

### Pièces jointes

- Template dictionnaire des données : https://s3-eu-west-1.amazonaws.com/course.oc-static.com/projects/DAN_V2_P3/Template_dico_donne%CC%81es.xlsx
- Données immobilières : https://s3-eu-west-1.amazonaws.com/course.oc-static.com/projects/804_Data-analyst_V3/804_P5/Donne%CC%81es-immo.zip
- Schéma relationnel à compléter : https://s3-eu-west-1.amazonaws.com/course.oc-static.com/projects/DAN_V2_P3/Sche%CC%81ma_a%CC%80_comple%CC%80ter.jpg

---

## Étape 1 - Comprenez les données initiales

---

### Prérequis

- Avoir téléchargé et analysé les données
  → identifier les données manquantes, leur type et leur signification

- Avoir identifié :
  - les colonnes à conserver impérativement
  - les colonnes à supprimer pour répondre aux besoins métiers et aux contraintes RGPD

⚠️ Attention : le nom de l’acquéreur est présent dans les données et doit être traité (suppression ou pseudonymisation) avant tout envoi sur le cloud

---

### Résultats attendus

- Un **dictionnaire de données conforme RGPD**, contenant les données essentielles
- Des fichiers CSV **nettoyés et prêts à être téléversés** vers un espace de stockage en ligne

---

### Recommandations

Chaque ligne du dictionnaire de données doit contenir :

- un **code**
- une **signification**
- un **type**
- une **longueur**
- une **nature**
- une **règle de gestion**
- une **règle de calcul** (si nécessaire)

---

### Ressources

- Dictionnaire de données :
  https://www.limpida.com/blog/dictionnaire-donnees

- Notice descriptive des fichiers « Demande de valeurs foncières » :
  https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/parcours-data-analyst/DAN-P3-notice-descriptive-du-fichier-dvf.pdf

---

## Étape 2 - Modifiez le schéma relationnel

---

### Prérequis

- Comprendre la **3e forme normale (3NF)**
- Savoir définir :
  - une **clé primaire**
  - une **clé étrangère**
  - une **contrainte**
- Pour chaque table du schéma relationnel, identifier :
  - la clé primaire
  - les clés étrangères
  - la nature des relations entre les tables

---

### Résultats attendus

- Un **schéma relationnel mis à jour**, intégrant les nouvelles informations
  *(outil libre : SQL Power Architect, Draw.io, Looping, etc.)*

---

### Recommandations

- Le choix des clés primaires et étrangères doit être **justifié**, car il conditionne la cohérence de la base
- Toutes les données doivent être représentées dans le modèle final

---

### Points de vigilance

- Éviter les **redondances de données**
  (ex. : voie vs code_voie, département vs code_département)

- Certaines clés peuvent être des **concaténations de champs**
  Exemple : `id_code_dept_code_commune = 34172` pour Montpellier :
  - Code département : 34
  - Code commune : 172

- Ce choix est justifié par :
  1. L’absence du code département dans certaines sources (data.gouv / INSEE)
  2. Le fait qu’un code département peut contenir plusieurs communes → non unique

---

### Exigence de modélisation

Le modèle doit respecter strictement la **3NF (troisième forme normale)** afin d’assurer :
- cohérence des données
- absence de redondance
- performance en environnement cloud

---

### Ressource

- Comprendre le MPD :
  https://www.base-de-donnees.com/mpd/