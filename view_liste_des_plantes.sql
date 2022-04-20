USE `i-garden`;

DROP VIEW IF EXISTS `liste_des_plantes`;
CREATE VIEW `liste_des_plantes` 
AS 
SELECT graine.nom AS 'graine', zone.nom AS 'zone', cycle_vegetatif.nom AS 'cycle végétatif'
FROM graine
INNER JOIN plante ON graine.id_graine = plante.id_graine
LEFT JOIN zone on plante.id_zone = zone.id_zone
INNER JOIN cycle_vegetatif on plante.id_cycle_vegetatif = cycle_vegetatif.id_cycle_vegetatif;

SELECT * FROM `liste_des_plantes`;
