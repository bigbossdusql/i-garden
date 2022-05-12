USE `i-garden`;

INSERT INTO `rusticite` (`code_rusticite`, `temp_min`, `temp_max`) 
VALUES 
('1', -99, -45),
('2', -45, -40),
('3', -40, -34),
('4', -34, -29),
('5', -29, -23),
('6', -23, -18),
('7', -18, -12),
('8', -12, -7),
('8a', -12.2, -9.4),
('8b', -9.4, -6.7),
('9', -7, -1),
('9a', -6.7, -3.9),
('9b', -3.9, -1.1),
('10', -1, 4),
('11', 4, 50);

INSERT INTO `famille` (`id_famille`, `id_famille_parente`, `nom_famille`) 
VALUES
(1, NULL, 'Acanthaceae'),
(2, NULL, 'Achariaceae'),
(3, NULL, 'Achatocarpaceae'),
(4, NULL, 'Acoraceae'),
(5, NULL, 'Acrobolbaceae'),
(6, NULL, 'Actinidiaceae'),
(7, NULL, 'Adelanthaceae'),
(8, NULL, 'Adiantaceae'),
(9, NULL, 'Adoxaceae'),
(10, NULL, 'Aextoxicaceae'),
(11, NULL, 'Aizoaceae'),
(12, NULL, 'Akaniaceae'),
(13, NULL, 'Alismataceae'),
(14, NULL, 'Allisoniaceae'),
(15, NULL, 'Alseuosmiaceae'),
(16, NULL, 'Alstroemeriaceae'),
(17, NULL, 'Altingiaceae'),
(18, NULL, 'Alzateaceae'),
(19, NULL, 'Amaranthaceae'),
(20, NULL, 'Amaryllidaceae'),
(21, NULL, 'Amblystegiaceae'),
(22, NULL, 'Amborellaceae'),
(23, NULL, 'Anacardiaceae'),
(24, NULL, 'Anarthriaceae'),
(25, NULL, 'Anastrophyllaceae'),
(26, NULL, 'Ancistrocladaceae'),
(27, NULL, 'Andreaeaceae'),
(28, NULL, 'Aneuraceae'),
(29, NULL, 'Anisophylleaceae'),
(30, NULL, 'Annonaceae'),
(31, NULL, 'Antheliaceae'),
(32, NULL, 'Anthocerotaceae'),
(33, NULL, 'Aphanopetalaceae'),
(34, NULL, 'Aphloiaceae'),
(35, NULL, 'Apiaceae'),
(36, NULL, 'Apocynaceae'),
(37, NULL, 'Apodanthaceae'),
(38, 13, 'Aponogetonaceae'),
(39, 12, 'Aquifoliaceae'),
(40, 11, 'Araceae'),
(41, 10, 'Araliaceae'),
(42, 9, 'Araucariaceae'),
(43, 8, 'Archidiaceae'),
(44, 7, 'Arecaceae'),
(45, 6, 'Argophyllaceae'),
(46, 5, 'Aristolochiaceae'),
(47, 4, 'Arnelliaceae'),
(48, 3, 'Asparagaceae'),
(49, 2, 'Aspleniaceae'),
(50, 1, 'Asteliaceae');

INSERT INTO `graine` (`id_famille`, `nom`, `nom_latin`, `classification`, `hauteur_max`, `photo`, `icone`, `description`)
VALUES
(1, 'graine 1', 'grenus latinus 1', 'Vivace', 5, 'https://picsum.photos/200/300', 'https://picsum.photos/200/300', 'description stylée'),
(1, 'graine 2', 'grenus latinus 2', 'Vivace', 6, 'https://picsum.photos/200/300', 'https://picsum.photos/200/300', null),
(2, 'graine 3', 'grenus latinus 3', 'Vivace', 7, 'https://picsum.photos/200/300', 'https://picsum.photos/200/300', null),
(3, 'graine 4', 'grenus latinus 4', 'Vivace', 8, 'https://picsum.photos/200/300', 'https://picsum.photos/200/300', 'description stylée'),
(4, 'graine 5', 'grenus latinus 5', 'Annuelle', 9, 'https://picsum.photos/200/300', 'https://picsum.photos/200/300', null),
(4, 'graine 6', 'grenus latinus 6', 'Annuelle', 10, 'https://picsum.photos/200/300', 'https://picsum.photos/200/300', 'description stylée'),
(6, 'graine 7', 'grenus latinus 7', 'Annuelle', 11, null, 'https://picsum.photos/200/300', null),
(7, 'graine 8', 'grenus latinus 8', 'Annuelle', 12 , null, 'https://picsum.photos/200/300', null),
(8, 'graine 9', 'grenus latinus 9', 'Bisannuelle', 13 , null, 'https://picsum.photos/200/300', null),
(9, 'graine 10', 'grenus latinus 10', 'Bisannuelle', 14, null, 'https://picsum.photos/200/300', 'description stylée'),
(10, 'graine 11', 'grenus latinus 11', 'Vivace', 15, null, null, null),
(11, 'graine 12', 'grenus latinus 12', 'Vivace', 16, null, null, null),
(11, 'graine 13', 'grenus latinus 13', 'Vivace', 17, 'https://picsum.photos/200/300', null, null),
(13, 'graine 14', 'grenus latinus 14', 'Vivace', 18, 'https://picsum.photos/200/300', null, 'description stylée');

INSERT INTO `utilisateur` (`pseudo`, `mail`, `mot_de_passe`)
VALUES 
('Orane' , 'mail.@gmail.com', '123'),
('Mickaëlle' , 'mail.@gmail.com', '123'),
('Pseudo' , 'mail.@gmail.com', '123');

INSERT INTO `jardin` (`id_rusticite`, `nom_jardin`, `code_postal`)
VALUES
(7, 'jardin 1', 35730),
(8, 'jardin 2', 35420);

INSERT INTO `etat` (`nom`)
VALUES
('assoifée'),
('malade');

INSERT INTO `caracteristique` (`nom`, `type_sol`, `description`)
VALUES
('sous-serre', 'humide', null),
('hors-sol', 'sec', null),
('aquaponique', 'humide', null),
('argilo-calcaire', 'argileux', null);

INSERT INTO `cycle_vegetatif` (`nom`)
VALUES 
('germination'),
( 'croissance'),
('floraison'),
('fructification'),
('mort');

INSERT INTO `zone` (`id_jardin_zone`, `id_caracteristique`, `id_rusticite_zone`, `nom`)
VALUES
(1, 1, 10, 'ma zone aromatique'),
(1, 2, 6, 'les légumes racines'),
(1, 3, 8, 'les légumes feuille'),
(2, 4, null, 'les vieux légumes'),
(2, 1, null, 'les petits fruits');

INSERT INTO `jardin_utilisateur` (`id_utilisateur`, `id_jardin`)
VALUES
(1, 1),
(2, 1),
(3, 2);

INSERT INTO `plante` (`id_graine`, `id_jardin_pousser`, `id_zone`, `id_cycle_vegetatif`, `date_semis`, `date_repiquage`, `date_floraison`, `date_recolte`, `quantite_recolte`)
VALUES
(1, 1, null, 1, null, null, null, null, null),
(2, 1, null, 2, null, null, null, null, null),
(3, 1, 1, 3, null, null, null, null, null),
(4, 1, 2, 3, null, null, null, null, null),
(5, 1, 3, 4, null, null, null, null, null),
(6, 2, null, 5, null, null, null, null, null),
(7, 2, null, 1, null, null, null, null, null),
(8, 2, null, 2, null, null, null, null, null);

INSERT INTO `etat_plante` (`id_plante`, `id_etat`, `date`, `status`)
VALUES
(1, 1, '2022-05-12', 'Traité'),
(1, 2, '2022-06-12', 'Actif'),
(6, 1, '2022-05-18', 'Traité'),
(3, 2, '2022-08-12', 'Passé'),
(8, 1, '2022-05-22', 'Actif'),
(2, 2, '2022-05-12', 'Traité');