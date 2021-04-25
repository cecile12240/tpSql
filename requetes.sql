-- je définis les informations que je veux récupérer dans ma table chien
select 
    c.idchien,    
    c.nomchien,
    c.age,
    g.nomgroupe
    morphologie.poids,
    morphologie.taille,
    r.fk_idcouleur,
    color.nomcouleur
    
-- j'attribue l'alllias c à ma table
from chien as c

-- j'attribue l'allias g à ma table groupe et je fais une jointure qui affichera les informations et pas simplement les id (groupe= chien courant)
INNER JOIN groupe as g on

    g.idgroupe = c.fk_idgroupe

INNER JOIN morphologie on
    
    morphologie.idmorphologie = c.fk_idmorphologie
    
-- je veux récupérer la couleur de la robe, je fais une jointure de la table chien à la robe 
INNER JOIN robe as r on

    r.idrobe = c.fk_idrobe

-- puis de la robe à la couleur (double jointure)
INNER JOIN couleur as color on

    color.idcouleur = r.fk_idcouleur

-- je lui dit de de faire tout ça dans la table.colonne chien.idchien = 3 
where c.idchien = 3

-- je récupère tous les chiens de la table don le nom se termine par e (%e)
where c.nomchien LIKE "%e"

