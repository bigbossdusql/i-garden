USE i-garden;

CREATE TABLE note_zone (
id_note_zone int NOT NULL,
id_zone int NOT NULL,
type_note enum('texte', 'audio'),
date_note datetime DEFAULT NULL,
description varchar(255),
lien_audio varchar(255),
PRIMARY KEY(id_note_zone),
FOREIGN KEY (id_zone) REFERENCES zone (id_zone) ON DELETE CASCADE);

SET type_note = (
CASE
    WHEN type_note = 'texte' THEN description IS NOT NULL
    WHEN type_note= 'audio' THEN lien_audio IS NOT NULL
END);
