USE `i-garden`;

CREATE VIEW `liste_des_plantes` 
AS 
SELECT 
-- jointure nom de la plante sur l'id de la variété Graine de l'instance de Plante
GRAINE.nom
FROM GRAINE 
INNER JOIN PLANTE ON GRAINE.id_graine = PLANTE.id_graine
UNION ALL

SELECT
-- jointure nom de la zone via id clé étrangère de Zone
ZONE.nom
FROM ZONE
INNER JOIN PLANTE ON ZONE.id_zone = PLANTE.id_zone
UNION ALL

SELECT
-- jointure nom du cycle avec clé sur l'id du Cycle
CYCLE_VEGETATIF.nom
FROM CYCLE_VEGETATIF
INNER JOIN PLANTE ON CYCLE_VEGETATIF.id_cycle_vegetatiff = PLANTE.id_cycle_vegetatif