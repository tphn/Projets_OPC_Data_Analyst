## Scénario

Votre entreprise vient de décrocher un contrat avec l’**Organisation nationale de lutte contre le faux-monnayage (ONCFM)**. Vous êtes envoyé en mission en tant que senior Data Analyst.

---

### Message de la responsable de mission

**De** : Marie
**À** : Moi
**Objet** : Bienvenue à l’ONCFM !

---

Bonjour,

L’ONCFM met en place des méthodes d’identification des faux billets en euros afin de lutter contre la contrefaçon.

Dans ce cadre, l’organisation souhaite développer une **application de machine learning** permettant, à partir des caractéristiques d’un billet (longueur, hauteur, largeur, etc.), de prédire s’il s’agit d’un billet authentique ou d’un faux.

---

### Objectif du projet

Tu es chargé de concevoir une application capable de :

- analyser les caractéristiques des billets
- prédire la classe : **vrai billet / faux billet**

---

### Données disponibles

- 1500 billets déjà scannés
  - 1000 billets authentiques
  - 500 faux billets

---

### Contraintes techniques

L’agence européenne EMV recommande de tester les algorithmes suivants :

- K-means
- Régression logistique
- KNN (k-nearest neighbors)
- Random Forest

Tu peux également tester d’autres modèles si pertinent.

---

### Organisation du travail

#### 1. Notebook d’analyse
- Analyse exploratoire des données
- Prétraitement
- Tests des différents algorithmes

#### 2. Script applicatif
- Mise en production d’une application fonctionnelle
- Entrée : caractéristiques d’un billet
- Sortie : prédiction (vrai / faux)

#### 3. Support de présentation

Tu devras présenter :

- Les traitements et analyses réalisés
- Les modèles testés et leurs performances
- Le modèle final retenu et sa justification
- L’application de prédiction

---

### Validation

L’application sera testée conjointement avec l’équipe ONCFM.

---

### Pièces jointes

- Cahier des charges : https://s3-eu-west-1.amazonaws.com/course.oc-static.com/projects/804_Data-analyst_V3/804_P12/Cahier+des+charges+detection+faux+billets_P12_DAS.pdf
- Dataset billets : https://s3-eu-west-1.amazonaws.com/static.oc-static.com/prod/courses/files/parcours-data-analyst/billets.csv