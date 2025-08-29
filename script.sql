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
    nom varchar(100) NOT NULL
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

WITH renum AS (
  SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS new_id
  FROM caracteristique
)
UPDATE caracteristique a
SET id = r.new_id
FROM renum r
WHERE a.id = r.id;

select idproduit, photo.nom, produit.nom from photo join produit on photo.idproduit = produit.id group by produit.id;