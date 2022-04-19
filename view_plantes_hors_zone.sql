USE `i-garden`;

CREATE VIEW `plantes_hors_zone` 
AS

SELECT
-- nom de plante qui n'a pas de zone -> Outer join ?
PLANTE.nom
FROM PLANTE
OUTER JOIN ZONE ON PLANTE.id_zone = ZONE.id_zone;
UNION ALL

SELECT
-- propriétaire de la plante si existe
JARDIN_UTILISATEUR.id_utilisateur
FROM JARDIN_UTILISATEUR
INNER JOIN JARDIN_UTILISATEUR ON JARDIN.id_jardin = JARDIN_UTILISATEUR.id_jardin
INNER JOIN PLANTE ON JARDIN.id_jardin = PLANTE.id_jardin;
