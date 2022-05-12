USE `i-garden`;
CREATE VIEW plantes_recap 
AS

SELECT 
graine.nom AS 'nom', graine.classification AS 'class', graine.nom_latin AS 'nom_lat'
FROM graine
INNER JOIN graine ON FAMILLE.id_famille = graine.id_famille;