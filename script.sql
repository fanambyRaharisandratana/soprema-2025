create table categorie (
    id SERIAL PRIMARY key,
    nom varchar(100) NOT NULL
);

create table Famille (
    id SERIAL PRIMARY key,
    nom varchar(100) NOT NULL
);

create table sousfamille (
    id SERIAL PRIMARY key,
    nom varchar(100) NOT NULL
);

create table caracteristique (
    id SERIAL PRIMARY key,
    nom varchar(100) NOT NULL
);

create table produit (
    id SERIAL PRIMARY key,
    nom varchar(100) NOT NULL,
    description text,
    avantage text
);

create table photo (
    id SERIAL PRIMARY key,
    idproduit bigint,
    nom varchar(100) NOT NULL,

    CONSTRAINT fk_photo
        FOREIGN key (idproduit)
        REFERENCES photo(id),
);

create table pdf (
    id SERIAL PRIMARY key,
    idproduit bigint,
    nom varchar(100) NOT NULL
);

create table sousreferences (
    id SERIAL PRIMARY key,
    idproduit bigint,
    codeproduit varchar(300),
    impactcarbone varchar(300),
    couleur varchar(300),
    diametre varchar(300),
    epaisseur varchar(300),
    largeur varchar(300),
    longueur varchar(300),
    poids varchar(300),
    volume varchar(300),
    selection varchar(300),
    Conditionnement varchar(300),

    CONSTRAINT fk_sousproduit
        FOREIGN key (idproduit)
        REFERENCES produit(id)
);


create table avantage (
    id SERIAL PRIMARY key,
    nom text NOT NULL
);

create table l_catfam (
    id SERIAL PRIMARY key,
    idcategorie bigint,
    idfamille bigint,

    CONSTRAINT fk_categorie
        FOREIGN key (idcategorie)
        REFERENCES categorie(id),

    CONSTRAINT fk_famille
        FOREIGN key (idfamille)
        REFERENCES famille(id)
);

create table l_famsousfam (
    id SERIAL PRIMARY key,
    idfamille bigint,
    idsousfamille bigint,

    CONSTRAINT fk_famille_2
        FOREIGN key (idfamille)
        REFERENCES famille(id),

    CONSTRAINT fk_sous
        FOREIGN key (idsousfamille)
        REFERENCES sousfamille(id)
);

create table produit_complementaires (
    id SERIAL PRIMARY key,
    idproduit bigint,
    idproduitcomp bigint null,

    CONSTRAINT fk_produit_comp1
        FOREIGN key (idproduit)
        REFERENCES produit(id),

    CONSTRAINT fk_produit_comp2
        FOREIGN key (idproduitcomp)
        REFERENCES produit(id)
);

create table l_sousfamcara (
    id SERIAL PRIMARY key,
    idsousfamille bigint,
    idcaracteristique bigint,

    CONSTRAINT fk_sous_2
        FOREIGN key (idsousfamille)
        REFERENCES sousfamille(id),

    CONSTRAINT fk_cara
        FOREIGN key (idcaracteristique)
        REFERENCES caracteristique(id)
);

create table l_produit (
    id SERIAL PRIMARY key,
    idproduit bigint,
    idavantage bigint,
    idproduitcomp bigint,
    idphoto bigint,
    idpdf bigint,
    idcaracteristique bigint,

    CONSTRAINT fk_produit
        FOREIGN key (idproduit)
        REFERENCES produit(id),
    
    CONSTRAINT fk_avantage
        FOREIGN key (idavantage)
        REFERENCES avantage(id),

    CONSTRAINT fk_produitcomp
        FOREIGN key (idproduitcomp)
        REFERENCES produit(id),

    CONSTRAINT fk_photo
        FOREIGN key (idphoto)
        REFERENCES photo(id),

    CONSTRAINT fk_pdf
        FOREIGN key (idpdf)
        REFERENCES pdf(id),

    CONSTRAINT fk_cara_2
        FOREIGN key (idcaracteristique)
        REFERENCES caracteristique(id)
);

COPY produit_complementaires(idproduit, idproduitcomp)
FROM '/home/mgbi/dev/elixir/soprema_nmc/csv/produit_comp.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';

COPY produit(nom, description)
FROM '/home/mgbi/dev/elixir/soprema_nmc/csv/produit.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';

COPY avantage(nom)
FROM '/home/mgbi/dev/elixir/soprema_nmc/csv/avantage.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';

COPY caracteristique(nom,type)
FROM '/home/mgbi/dev/elixir/soprema_nmc/csv/caracteristique.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';

COPY categorie(nom)
FROM '/home/mgbi/dev/elixir/soprema_nmc/csv/categorie.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';

COPY famille(nom)
FROM '/home/mgbi/dev/elixir/soprema_nmc/csv/Famille.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';

COPY photo(idproduit, nom)
FROM '/home/mgbi/dev/elixir/soprema_nmc/csv/photo.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';

COPY pdf(idproduit, nom, type)
FROM '/home/mgbi/dev/elixir/soprema_nmc/csv/pdf.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';

COPY sousfamille(nom)
FROM '/home/mgbi/dev/elixir/soprema_nmc/csv/sousfamille.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';

COPY l_produit(idproduit, idavantage, idproduitcomp, idphoto, idpdf, idcaracteristique)
FROM '/home/mgbi/dev/elixir/soprema_nmc/csv/l_produit.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';

COPY l_sousfamcara(idsousfamille, idcaracteristique)
FROM '/home/mgbi/dev/elixir/soprema_nmc/csv/l_sousfamcara.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';

COPY sousreferences(idproduit,codeProduit,impactCarbone,Couleur,Diametre,Epaisseur,Largeur,Longueur,Poids,Volume,Selection,Conditionnement)
FROM '/home/mgbi/dev/elixir/soprema_nmc/csv/sousreferences.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';

WITH renum AS (
  SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS new_id
  FROM caracteristique
)
UPDATE caracteristique a
SET id = r.new_id
FROM renum r
WHERE a.id = r.id;

select idproduit, photo.nom, produit.nom from photo join produit on photo.idproduit = produit.id group by produit.id;

SELECT p1.idproduit,p1.idproduitcomp,p2.nom,p3.nom AS photo 
FROM Produit_Complementaires p1
JOIN Produit p2 ON p2.id = p1.idproduitcomp
JOIN Photo p3 ON p3.idproduit = p1.idproduitcomp
WHERE p1.idproduit = 30
GROUP BY p2.id, p1.idproduit, p2.nom, p1.idproduitcomp;

SELECT 
    p1.idproduit,
    p1.idproduitcomp,
    p2.nom,
    MIN(p3.nom) AS photo
FROM Produit_Complementaires p1
JOIN Produit p2 ON p2.id = p1.idproduitcomp
JOIN Photo p3 ON p3.idproduit = p1.idproduitcomp
WHERE p1.idproduit = 30
GROUP BY p1.idproduit, p1.idproduitcomp, p2.nom;

insert into produit (nom, description, avantage) values ('ELASTOPHENE 25 sable', 'pas en stock','');
insert into produit (nom, description, avantage) values ('COLPHENE CERADER', 'pas en stock','');
insert into produit (nom, description, avantage) values ('BANDALU', 'Permet de réaliser des réparations d''étanchéité ou de créer en un rien de temps une étanchéité à l''air et à l''eau','');
insert into produit (nom, description, avantage) values ('SOPRASTICK', '','');
insert into produit (nom, description, avantage) values ('ALSAN TOILE', 'Permet de renforcer toutes les surfaces susceptibles de se fissurer (angle, jonction des parois, liaisons entre matériaux,…)','');
insert into produit (nom, description, avantage) values ('MAMMOUTH  ALU FLAM', '','');
insert into produit (nom, description, avantage) values ('SOPRALAST TV 50 ALU FLAM', '','');
insert into produit (nom, description, avantage) values ('AQUASAFE', '','');
insert into produit (nom, description, avantage) values ('EP PLOMB 85/90', 'Un système d''évacuation des eaux pluviales préfabriqué pour toiture-terrasse inaccessible. Il est constitué d''un moignon rigide 23mm et d''une platine rigide avec une ','');
insert into produit (nom, description, avantage) values ('MOIGNON RN PLOMB 110/115', 'Se présente sous la forme d''une platine et d''un moignon tronconique ou cylindrique assemblés par une double soudure étanche. Les platines, moignons et soudures sont en  plomb pur à 98% d''une épaisseur minimale de 25mm. Les soudures sont réalisés recto-verso sans apport d''étain.','');
insert into produit (nom, description, avantage) values ('EP PLOM 150/155', 'Une évacuation pluviale en plomb, permet de raccorder des revêtements imperméables de couverture avec des tubes de descentes d''eau pluviales situés contre les murs. Cette évacuation peut se placer à la verticale mais également à l''horizontale, afin de garantir un collage parfait sur différentes surfaces.','');
insert into produit (nom, description, avantage) values ('DRAINI DEPCO', '','');
insert into produit (nom, description, avantage) values ('CHALUMEAU COMPLET 400', 'Utiliser pour chauffer les membranes d''étanchéités.','');
insert into produit (nom, description, avantage) values ('CHALUMEAU COMPLET 700', 'Utiliser pour chauffer les membranes d''étanchéités.','');
insert into produit (nom, description, avantage) values ('PINCEAUX', '','');
insert into produit (nom, description, avantage) values ('CUTTERS', 'Lames extrêmement tranchante pour des coups de précision, même des bandes fines','');
insert into produit (nom, description, avantage) values ('LANGUES DE CHAT', 'Pose et lissage du mortier ou du plâtre.','');
insert into produit (nom, description, avantage) values ('MASTIC NESTACOLL', '','');
insert into produit (nom, description, avantage) values ('SOLECO 15/40', 'Assure la protection des relevés d''étanchéités en toitures terrasses. Accessoires : jonction (40) et angle rentrant (6) ou sortant (7)','');
insert into produit (nom, description, avantage) values ('POLYSET', '','');
insert into produit (nom, description, avantage) values ('POLYDRAIN', '','');
insert into produit (nom, description, avantage) values ('BLUESTEEL PASS acce toiture terrasse', 'Bluesteel Pass est un lanterneau avec costière acier standard pour toiture étanchée utilisé pour l''accès en toiture et l''éclairement zénithal. Divers accessoires et options sont disponibles comme les remplissages en PCA, le barreaudage, la crosse accès toiture et la barre accroche échelle. 01. 02. 03.','');
insert into produit (nom, description, avantage) values ('BLUESTEEL FIX', 'Le Bluesteel RPT Fix est un lanterneau à rupture de pont thermique pour les toitures étanchées de type Fix pour l''éclairement zénithal. Idéal pour des économies d''énergie grâce à l''apport de lumière naturelle en toiture. Gamme de produits à rupture de pont thermique avec protection solaire.','');

insert into photo (idproduit, nom) values(37, 'images/34-ALSAN TOILE/image_2.png');
insert into photo (idproduit, nom) values(41, 'images/35-EP PLOMB 8590/image_3.png');
insert into photo (idproduit, nom) values(42, 'images/36-MOIGNON RN PLOMB 110115/image_8.png');
insert into photo (idproduit, nom) values(43, 'images/37-EP PLOM 150155/image_4.png');
insert into photo (idproduit, nom) values(45, 'images/38-CHALUMEAU COMPLET 400/image_5.png');
insert into photo (idproduit, nom) values(46, 'images/39-CHALUMEAU COMPLET 700/image_6.png');
insert into photo (idproduit, nom) values(48, 'images/40-CUTTERS/image_12.png');
insert into photo (idproduit, nom) values(49, 'images/41-LANGUES DE CHAT/image_11.png');
insert into photo (idproduit, nom) values(51, 'images/42-SOLECO 1540/image_7.png');
insert into photo (idproduit, nom) values(54, 'images/43-BLUESTEEL PASS acce toiture terrasse/image_9.png');
insert into photo (idproduit, nom) values(55, 'images/44-BLUESTEEL FIX/image_10.png');
insert into photo (idproduit, nom) values(35, 'images/45-BANDALU/image_1.png');

insert into photo (idproduit, nom) values(33, 'images/23-ALSAN SCREED 412/soprema-logo_symbol-colors-rgb.webp');
insert into photo (idproduit, nom) values(34, 'images/23-ALSAN SCREED 412/soprema-logo_symbol-colors-rgb.webp');
insert into photo (idproduit, nom) values(36, 'images/23-ALSAN SCREED 412/soprema-logo_symbol-colors-rgb.webp');
insert into photo (idproduit, nom) values(38, 'images/23-ALSAN SCREED 412/soprema-logo_symbol-colors-rgb.webp');
insert into photo (idproduit, nom) values(39, 'images/23-ALSAN SCREED 412/soprema-logo_symbol-colors-rgb.webp');
insert into photo (idproduit, nom) values(40, 'images/23-ALSAN SCREED 412/soprema-logo_symbol-colors-rgb.webp');
insert into photo (idproduit, nom) values(44, 'images/23-ALSAN SCREED 412/soprema-logo_symbol-colors-rgb.webp');
insert into photo (idproduit, nom) values(47, 'images/23-ALSAN SCREED 412/soprema-logo_symbol-colors-rgb.webp');
insert into photo (idproduit, nom) values(50, 'images/23-ALSAN SCREED 412/soprema-logo_symbol-colors-rgb.webp');
insert into photo (idproduit, nom) values(52, 'images/23-ALSAN SCREED 412/soprema-logo_symbol-colors-rgb.webp');
insert into photo (idproduit, nom) values(53, 'images/23-ALSAN SCREED 412/soprema-logo_symbol-colors-rgb.webp');

insert into pdf (idproduit, nom) values(40, '\PDF\40-AQUASAFE\FT-AQUASAFE.pdf');
insert into pdf (idproduit, nom) values(34, '\PDF\34-COLPHENE CERADER\FT COLPHENE-CERADER.pdf');
insert into pdf (idproduit, nom) values(38, '\PDF\38-MAMMOUTH ALU SBS\FT MAMMOUTH ALU SBS.pdf');
insert into pdf (idproduit, nom) values(52, '\PDF\52-POLYSET\FT POLYSET.pdf');

update pdf set type = 'Fiche technique' where idproduit = 40;
update pdf set type = 'Fiche technique' where idproduit = 34;
update pdf set type = 'Fiche technique' where idproduit = 40;
update pdf set idproduit = 38 where id = 159;
update pdf set idproduit = 52 where id = 160;