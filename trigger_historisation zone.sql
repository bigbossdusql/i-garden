DELIMITER |
DROP TRIGGER IF EXISTS `historisation_zone`|
CREATE TRIGGER `historisation_zone`
BEFORE UPDATE ON `plante`
FOR EACH ROW
IF OLD.id_zone IS NOT NULL THEN
	INSERT INTO `historique_zone` (`id_plante_zone`, `id_zone_histo`, `date_changement`)
	VALUES (OLD.id_plante, OLD.id_zone, CURRENT_TIMESTAMP());
END IF;
|
DELIMITER ;
UPDATE plante SET plante.id_zone = 1 WHERE plante.id_plante = 1;
SELECT * FROM plante;
SELECT * FROM historique_zone;
