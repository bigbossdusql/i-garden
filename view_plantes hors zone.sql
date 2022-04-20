USE `i-garden`;

DROP VIEW IF EXISTS `plantes_hors_zone`;
CREATE VIEW `plantes_hors_zone` 
AS 
SELECT graine.nom AS 'graine', GROUP_CONCAT(utilisateur.pseudo) AS 'utilsateur'
FROM graine
INNER JOIN plante ON graine.id_graine = plante.id_graine
LEFT JOIN zone on plante.id_zone = zone.id_zone
INNER JOIN jardin ON jardin.id_jardin = plante.id_jardin_pousser
INNER JOIN jardin_utilisateur on jardin.id_jardin = jardin_utilisateur.id_jardin
INNER JOIN utilisateur ON utilisateur.id_utilisateur = jardin_utilisateur.id_utilisateur
WHERE plante.id_zone IS NULL
GROUP BY graine.id_graine;

SELECT * FROM `plantes_hors_zone`;