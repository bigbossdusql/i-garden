USE `i-garden`;

DROP VIEW IF EXISTS `zones_recap`;
CREATE VIEW `zones_recap` 
AS 
SELECT zone.nom, rusticite.code_rusticite, COUNT(plante.id_plante)
FROM zone
INNER JOIN rusticite ON zone.id_rusticite_zone = rusticite.id_rusticite
LEFT JOIN plante on plante.id_zone = zone.id_zone
GROUP BY plante.id_plante;

SELECT * FROM `zones_recap`;