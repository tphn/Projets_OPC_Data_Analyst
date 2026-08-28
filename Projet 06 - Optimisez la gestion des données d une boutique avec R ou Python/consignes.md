## Scénario

Aujourd’hui est un grand jour : vous commencez votre mission en tant qu’analyste chez **BottleNeck**, un marchand de vin prestigieux.

Nicolas, votre manager, vous accueille chaleureusement et vous intègre rapidement à l’équipe. L’ambiance est détendue mais professionnelle.

---

### Message de votre manager

**De** : Nicolas
**À** : Moi
**Objet** : Rapprochement et analyse de nos bouteilles de vin

---

Hello,

Suite à notre discussion de tout à l’heure, je souhaite te briefer sur la mission.

Nos outils étant encore artisanaux, nous rencontrons des difficultés pour analyser nos données et la gestion des stocks est complexe.

---

### Organisation de la mission

Ta mission se découpe en deux phases :

#### Phase 1 : préparation des données
- Agréger les différents fichiers pour exploiter les données
- Rapprocher l’extraction de la base de données avec l’ERP via la table de liaison
- Identifier au moins **8 erreurs de données** (saisie, type, calcul, jointure, etc.)
- Proposer des pistes d’amélioration de la qualité des données

#### Phase 2 : analyse des données
Tu devras réaliser les analyses suivantes :

- Calcul du **chiffre d’affaires** :
  - par produit
  - total global

- Analyse des **top références** et du principe **80/20 (Pareto)**

- Détection des **valeurs aberrantes** :
  - Z-score ou écart interquartile (IQR)
  - boxplot pour visualisation
  - analyse des prix et identification d’erreurs potentielles

- Analyse des performances :
  - état des stocks
  - taux de marge
  - rotation des stocks
  - nombre de mois de stock

- Analyse de **corrélations** entre variables quantitatives :
  - prix
  - prix d’achat
  - ventes
  - stock
  - prix HT
  - taux de marge

---

### Consignes complémentaires

- Utiliser un notebook Python ou R
- Vous pouvez enrichir l’analyse avec des pistes supplémentaires pertinentes
- Produire une synthèse des erreurs détectées et des corrections à appliquer
- Formaliser la démarche d’analyse et justifier les choix
- Vérifier la conformité RGPD si nécessaire

---

### Pièces jointes

- Données BottleNeck (octobre) : https://s3-eu-west-1.amazonaws.com/course.oc-static.com/projects/805_Business_Intelligence+_Analyst_V2/P6_BIA_V2/Data+Bottleneck.rar
- Modèle de présentation : https://s3-eu-west-1.amazonaws.com/course.oc-static.com/projects/805_Business_Intelligence+_Analyst_V2/P6_BIA_V2/ModeE%CC%88le_pree%CC%88sentation-Bottleneck.pptx
- Notebook : https://s3-eu-west-1.amazonaws.com/course.oc-static.com/projects/805_Business_Intelligence+_Analyst_V2/P6_BIA_V2/Template-Notebook-Bottleneck.ipynb

---

### Informations importantes

- Les données correspondent à une extraction au **31 octobre**
- Les ventes couvrent la période du **1er au 31 octobre**