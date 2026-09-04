Projet 11 - Produisez une étude de marché avec r ou python

Etudier la possibilité de s'exporter à l'international pour une entreprise d'élevage et de ventes de poulet
→ Proposer des groupements de pays pertinents

Méthodologie de préparation des données
    - Analyse PESTEL (analyse stratégique : Politique, Economique, Sociologique, Technologique, Environnementale, Légale)
    - Choix de variables pertinentes pour conduire l'analyse
    - Recherche des données sur le site de la FAO et la banque mondiale
    - Structuration, nettoyage et croisement des données
    - Feature Engineering : variables composites pour enrichir les analyses

Analyses exploratoires
- Distribution générale des variables (boxplot)
- Distribution des variables par région du monde (boxplot)
- Analyse multivariée des données (matrice de corrélation)

Analyses en composantes principales (ACP) et clustering
- Normalisation des données
- ACP
- Cercles des corrélations
- Clustering par classification ascendante hiérarchique (CAH)
- Clustering par KMeans + méthode du coude
- Projection des individus selon les clusters
- Métriques de qualité des clusters (Silhouette, Davies-Bouldin, Calinski-Harabasz)

Outils :
- VS Code
- Extension Jupyter Notebook
- Python 3.12
- Librairies ->
pandas as pd
matplotlib.pyplot as plt
seaborn as sns
plotly.express as px
numpy as np
sklearn