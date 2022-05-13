USE `i-garden`;

DELIMITER |
DROP TRIGGER IF EXISTS `historisation_cycle`|
CREATE TRIGGER `historisation_cycle`
BEFORE UPDATE ON `plante`
FOR EACH ROW
IF OLD.id_zone IS NOT NULL THEN
	IF(SELECT COUNT(*) FROM `historique_cycle` WHERE `id_cycle_vegetatif_archive` = OLD.id_cycle_vegetatif AND `id_plante_histo_cycle` = OLD.id_plante) = 1 THEN
    	DELETE FROM `historique_cycle` WHERE `id_cycle_vegetatif_archive` = OLD.id_cycle_vegetatif AND `id_plante_histo_cycle` = OLD.id_plante;
    END IF;
	INSERT INTO historique_cycle (`id_cycle_vegetatif_archive`, `id_plante_histo_cycle`, `date_changement`, `nom`)
	VALUES (OLD.id_cycle_vegetatif, OLD.id_plante, CURRENT_TIMESTAMP(), (SELECT cycle_vegetatif.nom FROM cycle_vegetatif WHERE cycle_vegetatif.id_cycle_vegetatif = OLD.id_cycle_vegetatif));
END IF;
|
DELIMITER ;

UPDATE plante SET plante.id_cycle_vegetatif = 2 WHERE plante.id_plante = 1;
SELECT * FROM plante;
SELECT * FROM historique_cycle;
