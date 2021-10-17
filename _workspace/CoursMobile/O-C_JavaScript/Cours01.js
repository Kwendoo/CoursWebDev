/* création de class et attribution de nouvelels valeur : */
class Episode {
    constructor (
      title,
      duration,
      hasBeenWatched
    ){
        this.title = title;
        this.duration = duration;
        this.hasBeenWatched = hasBeenWatched;
      }
  };
  
  let firstEpisode = new Episode("La guerre des étoiles",
                                236,
                                false);
  let secondEpisode = new Episode("La menace fantôme",
                                198,
                                true);
  let thirdEpisode = new Episode("Le retour du Jedi",
                                442,
                                false);
/* Utilisation d'un objet class : */
        /* nomDelObjet.nomDelAttributàExploiter */

/* Déclaration de tableau de variables */

let episodes = [firstEpisode, secondEpisode, thirdEpisode]

/* Les manipulation de tableau :
    .length() : permet de retourner la longueur du tableau ciblé
    .push() : permet d'jouter une nouvelle valeur à la fin du tableau ciblé
    .unshift() : permet d'ajouter une nouvelle valeur au début du tableau
    .pop() : supprime le dernier élément du tableau
*/

/* Les instructions conditionnelles */
/* IF and ELSE */
 /* if(CONDITION(s)){
    si condition(s) vraie
} else{
    si condition(s) fausse
} */

