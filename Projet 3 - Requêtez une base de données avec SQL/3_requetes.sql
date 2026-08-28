-- RONEL, projet 3

-- Requete 1: Lister les numéros de contrats (contrat_ID) avec leur surface pour la commune de Caen.

SELECT 
	c.contrat_id, 
	c.surface,
	r.com_nom_maj_court
FROM p3_assurance.contrat AS c
JOIN p3_assurance.region AS r 
ON c.code_dep_code_commune=r.code_dep_code_commune
WHERE r.com_nom_maj_court='CAEN';

-- Requete 2: Lister les numéros de contrats avec le type de contrat et leur formule pour les maisons du département 71

SELECT
	c.contrat_id,
	c.type_contrat,
	c.formule,
	c.type_local,
	r.dep_code
FROM p3_assurance.contrat AS c
JOIN p3_assurance.region AS r 
ON c.code_dep_code_commune=r.code_dep_code_commune
WHERE
	c.type_local='Maison'
	AND r.dep_code='71';


-- Requete 3: Lister le nom des régions de France.

SELECT DISTINCT reg_nom
FROM p3_assurance.region;

-- Requete 4: les 5 contrats qui ont les surfaces les plus élevées

SELECT
	contrat_id,
	surface
FROM p3_assurance.contrat
ORDER BY surface DESC
LIMIT 5;

-- Requete 5: prix moyen de la cotisation mensuelle

SELECT ROUND(AVG(prix_cotisation_mensuel),2) AS prix_moyen_cotisation_mensuel
FROM p3_assurance.contrat;

-- Requete 6: Nombre de contrats pour chaque catégorie de prix de la valeur déclarée des biens?

SELECT 
	valeur_declaree_biens,
	COUNT (*) AS nombre_de_contrat
FROM p3_assurance.contrat
GROUP BY valeur_declaree_biens
ORDER BY valeur_declaree_biens;


-- Requete 7 : Nombre de formules integral sur la région Pays de la Loire?
SELECT 
	r.reg_nom,
	COUNT(*) AS nombre_formule_integral
FROM p3_assurance.contrat AS c
JOIN p3_assurance.region AS r
ON c.code_dep_code_commune=r.code_dep_code_commune
WHERE
	c.formule ='Integral'
	AND r.reg_nom = 'Pays de la Loire'
GROUP BY r.reg_nom;

-- Requête 8 : Lister les numéros de contrats avec le type de contrat et leur formule pour les maisons du département 71 (voir requete 2)

SELECT 
	c.contrat_id,
	c.type_contrat,
	c.formule,
	c.type_local,
	r.dep_code
FROM p3_assurance.contrat AS c
JOIN p3_assurance.region AS r
ON c.code_dep_code_commune=r.code_dep_code_commune
WHERE
	c.type_local='Maison'
	AND r.dep_code='71';

-- Requête 9 : Quelle est la surface moyenne des contrats à Paris ?

SELECT 
	ROUND(AVG(c.surface),2) AS surface_moyenne,
	r.dep_code
FROM p3_assurance.contrat AS c
JOIN p3_assurance.region AS r
ON c.code_dep_code_commune=r.code_dep_code_commune
WHERE r.dep_code='75'
GROUP BY r.dep_code;

-- Requête 10 : Classement des 10 départements où le prix moyen de la cotisation est le plus élevé. 

SELECT
	r.dep_code,
	ROUND(AVG(c.prix_cotisation_mensuel),2) AS prix_moyen
FROM p3_assurance.contrat AS c
JOIN p3_assurance.region AS r
ON c.code_dep_code_commune=r.code_dep_code_commune
GROUP BY r.dep_code
ORDER BY prix_moyen DESC
LIMIT 10;

-- Requête 11 : Liste des communes ayant eu au moins 150 contrats

SELECT
	r.com_nom_maj_court AS commune,
	COUNT(*) AS nombre_contrat
FROM p3_assurance.contrat AS c
JOIN p3_assurance.region AS r
ON c.code_dep_code_commune=r.code_dep_code_commune
GROUP BY commune
HAVING COUNT(*)>=150 -- on ne peut pas mettre un WHERE après une aggrégation.
ORDER BY COUNT(*) DESC; -- optionnel

-- Requête 12: Quel est le nombre de contrats pour chaque région ?

SELECT
	r.reg_nom,
	COUNT(*) AS nombre_de_contrat
FROM p3_assurance.contrat AS c
JOIN p3_assurance.region AS r
ON c.code_dep_code_commune=r.code_dep_code_commune
GROUP BY r.reg_nom
ORDER BY reg_nom;



-- Autres requêtes:

--13)Lister les numéros de contrats (contrat_id) avec leur surface pour le code postal 92100 (req1)
SELECT
	contrat_id,
	surface,
	code_postal
FROM p3_assurance.contrat AS c
JOIN p3_assurance.region AS r
ON c.code_dep_code_commune=r.code_dep_code_commune
WHERE code_postal='92100'
ORDER BY surface DESC;

--14)Combien existe-t-il de contrats sur les résidences principales? (req3)
SELECT
	COUNT(*) AS nombre_de_contrat
	type_contrat
FROM p3_assurance.contrat AS c
WHERE type_contrat='Residence principale'
GROUP BY type_contrat;

