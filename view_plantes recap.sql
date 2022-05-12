USE `i-garden`;

DROP VIEW IF EXISTS `plantes_recap`;
CREATE VIEW `plantes_recap` 
AS 
SELECT 
graine.nom, graine.nom_latin, 
CONCAT(UCASE(SUBSTRING(f1.nom_famille, 1, 1)), LCASE(SUBSTRING(f1.nom_famille, 2))) AS 'Espece', 
f2.nom_famille AS 'Genre'
FROM graine
INNER JOIN famille AS f1 ON f1.id_famille = graine.id_famille
LEFT OUTER JOIN famille AS f2 ON f2.id_famille_parente = f1.id_famille;

SELECT * FROM `plantes_recap`;