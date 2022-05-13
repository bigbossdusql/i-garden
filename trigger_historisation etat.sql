USE `i-garden`;

DELIMITER |
DROP TRIGGER IF EXISTS `historisation_etat`|
CREATE TRIGGER `historisation_etat`
BEFORE UPDATE ON `etat_plante`
FOR EACH ROW
IF 1 THEN
	IF(SELECT COUNT(*) FROM `historique_etat` WHERE `id_etat_archive` = OLD.id_etat AND `id_plante_archive` = OLD.id_plante) = 1 THEN
    	DELETE FROM `historique_etat` WHERE `id_etat_archive` = OLD.id_etat AND `id_plante_archive` = OLD.id_plante;
    END IF;
	INSERT INTO historique_etat (`id_etat_archive`, `id_plante_archive`, `date_changement`, `nom`, `date`, `status`)
	VALUES (OLD.id_etat, OLD.id_plante, CURRENT_TIMESTAMP(), (SELECT etat.nom FROM etat WHERE etat.id_etat = OLD.id_etat),
           (SELECT etat_plante.date FROM etat_plante WHERE `id_etat` = OLD.id_etat AND `id_plante` = OLD.id_plante),
           (SELECT etat_plante.status FROM etat_plante WHERE `id_etat` = OLD.id_etat AND `id_plante` = OLD.id_plante)
    );
END IF;
|
DELIMITER ;

UPDATE etat_plante SET etat_plante.id_etat = 2 WHERE etat_plante.id_plante = 4;
SELECT * FROM etat_plante;
SELECT * FROM historique_etat;