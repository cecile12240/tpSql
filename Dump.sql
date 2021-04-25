-- je crée les tables sans clé étrangère en premier pour éviter les problèmes
CREATE TABLE "utilite"
(
    [idutilite] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [nomutilite] VARCHAR(50) NOT NULL

);

-- je lui donne la/les colonnes (column1,column2 ,..)
INSERT INTO utilite (nomutilite) 
-- je lui donnne des valeurs (value1,value2 ,...) la valeur 1 ira dans la colonne 1, la 2 dans la colonne 2 etc... je ne m'occupe pas de l'id (autoincrement)
VALUES
-- je lui donne une valeur pour chaque ligne
( "berger" ), 
( "défence" ),
( "chasse" ),
( "compagnie" ),
( "rapport" );

CREATE TABLE "couleur"
(
    [idcouleur] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [nomcouleur] VARCHAR(50) NOT NULL,
    [is_simple] BOOLEAN NOT NULL,
    [is_modifiegenetiquement] BOOLEAN NOT NULL

);

INSERT INTO couleur (nomcouleur, is_simple, is_modifiegenetiquement)
VALUES
("noire", "TRUE", "FALSE"), 
("fauve", "TRUE", "FALSE"),
("fauve charbonné", "FALSE", "FALSE"),
("bringé", "FALSE", "FALSE"),
("bigarrée", "FALSE", "TRUE");

CREATE TABLE "taillepelage"
(
    [idtaillepelage] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [nomtailepelage] VARCHAR(50) NOT NULL
    
);

INSERT INTO taillepelage (nomtailepelage)
VALUES
("nue"),
("ras"),
("court"),
("mi-long"),
("long");


CREATE TABLE "texture"
(
    [idtexture] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [nometexture] VARCHAR(50) NOT NULL,
    [is_densiteforte] BOOLEAN NOT NULL
    
);

INSERT INTO texture (nometexture, is_densiteforte)
VALUES
("poil dur", 0),
("poil frisé", 0), 
("poil cordé", 1),
("poil soyeux", 1);

CREATE TABLE "morphologie"
(
    [idmorphologie] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [poids] DOUBLE NOT NULL,
    [taille] INTEGER NOT NULL

);

INSERT INTO morphologie (poids, taille)
VALUES
(30.5, 62),
(45, 60), 
(26, 45),
(6.6, 10),
(18, 25);


CREATE TABLE "groupe"
(
    [idgroupe] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [nomgroupe] VARCHAR(50) NOT NULL,
    [fk_idutilite] INTEGER NOT NULL, -- ici je déclare ma clé

    FOREIGN KEY ([fk_idutilite]) REFERENCES "utilite" ([idutilite]) -- ici je lui dis que c'est une clé étrangère

);

INSERT INTO groupe (nomgroupe, fk_idutilite)
VALUES
("chiens de berger", 1),
("chiens molossoide", 2),
("chiens courant", 3),
("chiens d'agrément", 4),
("chiens d'eau", 5);

CREATE TABLE "robe"
(
    [idrobe] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [fk_idcouleur] INTEGER NOT NULL,
    [fk_idtexture] INTEGER NOT NULL,
    [fk_idtaillepelage] INTEGER NOT NULL,

    FOREIGN KEY ([fk_idcouleur]) REFERENCES "couleur" ([idcouleur]),
    FOREIGN KEY ([fk_idtexture]) REFERENCES "texture" ([idtexture]),
    FOREIGN KEY ([fk_idtaillepelage]) REFERENCES "taillepelage" ([idtaillepelage])

);

INSERT INTO robe (fk_idcouleur, fk_idtexture, fk_idtaillepelage)
VALUES
(3, 1, 4),
(4, 1, 3),
(1, 4, 4),
(1, 3, 5),
(5, 3, 2);

CREATE TABLE "chien"
(
    [idchien] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [nomchien] VARCHAR(50) NOT NULL,
    [age] INTEGER NOT NULL,
    [fk_idgroupe] INTEGER NOT NULL,
    [fk_idrobe] INTEGER NOT NULL,
    [fk_idmorphologie] INTEGER NOT NULL,

    FOREIGN KEY ([fk_idgroupe]) REFERENCES "groupe" ([idgroupe]),
    FOREIGN KEY ([fk_idrobe]) REFERENCES "robe" ([idrobe]),
    FOREIGN KEY ([fk_idmorphologie]) REFERENCES "morphologie" ([idmorphologie])
);

INSERT INTO chien (nomchien, age, fk_idgroupe, fk_idrobe, fk_idmorphologie)
VALUES
("Ulysse", 13, 1, 1, 1),
("Féroce", 9, 2, 2, 2),
("Kayla", 6, 3, 3, 3),
("Canaille", 3, 4, 4, 4),
("Isis", 8, 5, 5, 5);



.save chien.db
-- .read 'C:\Users\Cecil\Desktop\Dump.sql'