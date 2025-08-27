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
    nom varchar(100) NOT NULL
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
        FOREIGN key (idproduit)
        REFERENCES produit(id)
);

