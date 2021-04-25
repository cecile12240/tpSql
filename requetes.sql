-- je définis les informations que je veux récupérer dans ma table chien
select 
    c.idchien,    
    c.nomchien,
    c.age,
    g.nomgroupe
 
    
-- j'attribue l'alllias c à ma table
from chien as c

-- j'attribue l'allias g à ma table groupe et je fais une jointure qui affichera les informations et pas simplement les id (groupe= chien courant)
INNER JOIN groupe as g on

    g.idgroupe = c.fk_idgroupe

where c.idchien = 3