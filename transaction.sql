USE `i-garden`;

-- Changements de structure --
START TRANSACTION;

-- Ajout latitude et longitude
ALTER TABLE zone
ADD COLUMN latitude DECIMAL(10,6),
ADD COLUMN longitude DECIMAL(10,6);

-- Ajout table Note
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
	id_note INT NOT NULL AUTO_INCREMENT,
	id_zone INT NOT NULL,
	type_note enum('texte', 'audio'),
	date_note DATETIME DEFAULT NULL,
	description VARCHAR(255),
	lien_audio VARCHAR(255) CHECK (lien_audio IS NOT NULL AND type_note = 'audio'),
	PRIMARY KEY(id_note),
	FOREIGN KEY (id_zone) REFERENCES zone (id_zone) ON DELETE CASCADE
);

ALTER TABLE plante
ADD COLUMN temp_min DECIMAL(3, 1);

DROP TABLE IF EXISTS `nom`;
CREATE TABLE `nom` (
    id_nom INT NOT NULL AUTO_INCREMENT,
	nom VARCHAR(50) NOT NULL,
	PRIMARY KEY(id_nom)
);

DROP TABLE IF EXISTS `nom_graine`;
CREATE TABLE `nom_graine` (
  `id_nom` INT NOT NULL,
  `id_graine` INT NOT NULL,
  PRIMARY KEY (`id_nom`, `id_graine`),
  CONSTRAINT `id_nom`
    FOREIGN KEY (`id_nom`)
    REFERENCES `i-garden`.`nom` (`id_nom`)
    ON DELETE CASCADE,
  CONSTRAINT `id_graine`
    FOREIGN KEY (`id_graine`)
    REFERENCES `i-garden`.`graine` (`id_graine`)
    ON DELETE CASCADE
);

-- Marche pas --
/*
CREATE PROCEDURE migrate_data()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE id INT;
  DECLARE nom VARCHAR(50);
  DECLARE c CURSOR FOR SELECT graine.id_graine, graine.nom FROM graine;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN c;

  read_loop: LOOP
    FETCH c INTO id, nom;
    IF done THEN
      LEAVE read_loop;
    END IF;
    INSERT INTO nom(nom) VALUES (nom);
    INSERT INTO nom_graine(id_nom, id_graine) VALUES ((SELECT nom.id_nom FROM nom WHERE nom.nom = nom), id);
  END LOOP;

  CLOSE cur1;
  CLOSE cur2;
END;
*/

COMMIT;