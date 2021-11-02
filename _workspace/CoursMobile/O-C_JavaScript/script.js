//création de class et attribution de nouvelels valeur : 
/* class Episode {
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
                                false); */
//Utilisation d'un objet class : 
        //nomDelObjet.nomDelAttributàExploiter 

//Déclaration de tableau de variables 

//let episodes = [firstpisode, secondEpisode, thirdEpisode] 

//Affichage du tableau dans la console 

//console.log(episodes) 

//Affichage des éléments dans le document !!! affichera le type de l'élément !!! 

//document.write(episodes); 

/* Les manipulation de tableau :
    .length() : permet de retourner la longueur du tableau ciblé
    .push() : permet d'jouter une nouvelle valeur à la fin du tableau ciblé
    .unshift() : permet d'ajouter une nouvelle valeur au début du tableau
    .pop() : supprime le dernier élément du tableau
*/

//Les instructions conditionnelles 
//IF and ELSE 
 /* if(CONDITION(s)){
    si condition(s) vraie
} else{
    si condition(s) fausse
} */

/* let UserLogIn = true;

if (UserLogIn) {
    console.log("Utilisateur connecté !")
} else {
    console.log("Alert, intrus !")
} */

/* const numberOfSeats = 30;
const numberOfGuests = 25;
if (numberOfGuests < numberOfSeats) {
    console.log("Nous pouvons accepter plus d'invités")
}else {
    console.log("Nous sommes complet !")
} */

/* const numberOfSeats = 30;
const numberOfGuests = 25;

if(numberOfGuests == numberOfSeats){
    console.log("Tous les sièges sont occupé !")
} else if (numberOfGuests < numberOfSeats){
    console.log("Nous pouvons accepter plus d'invités !")
} else {
    console.log("Nous sommes complet !")
} */

/* let userLoggedIn = true;
let userHasPremiumAccount = true;
let userHasMegaPremiumAccount = false;

userLoggedIn && userHasPremiumAccount; //true
userLoggedIn && userHasMegaPremiumAccount; //false

userLoggedIn || userHasPremiumAccount; //true
userLoggedIn || userHasMegaPremiumAccount; //true

!userLoggedIn; //false
!userHasMegaPremiumAccount; //true */

/* let firstUser = {
    name: "Will Alexander",
    age: 33,
    accountLevel: "normal"
    };
    
    let secondUser = {
    name: "Sarah Kate",
    age: 21,
    accountLevel: "premium"
    };
    
    let thirdUser = {
    name: "Audrey Simon",
    age: 27,
    accountLevel: "mega-premium"
    };

switch(firstUser.accountLevel){
    case 'normal':
        console.log("Vous avez un compte normal !");

    break;

    case 'premium':
        console.log("Vous avez un compte premium !");

    break;

    case 'Mega-premium':
        console.log("Vous avez un compte méga premium !");

    break;

    default:
        console.log("Votre compte n'est pas spécifié !")
} */

//Les boucles 
//Les boucles 
//Les boucles 

//Boucle for => quand le nombre d'itération est fixe

/* const numberOfPassengers = 10;
for (let i=0; i < numberOfPassengers; i++){
    console.log("Passagé n° ",i+1," embarqué !");
}

console.log("Tous les passagers ont été embarqué !"); */

//Boucle for....in est utilisé lorsqu'on a besoin de connaitre l'indice de l'objet

/* const passengers = [
    "Will Alexander",
    "Lagna Antoine",
    "Primogallo Alicia",
    "Lagna Liam"
]

for (let i in passengers) {
    console.log("Embarquement du passager "+passengers[i]);
} */

//Bouble for .... off utilisé lorsque l'indice n'est pas nécessaire

/* const passengers = [
    "Will Alexander",
    "Lagna Antoine",
    "Primogallo Alicia",
    "Lagna Liam"
]

for (let passenger of passengers) {
    console.log("Embarquement du passager "+ passengers);
} */

/* const passengers = [
    {
        name : "Wil Andersson",
        ticketNumber : 204689
    },
    {
        name : "Lagna Antoine",
        ticketNumber : 548769
    },
    {
        name : "Primogallo Alicia",
        ticketNumber : 987526
    },
    {
        name : "Lagna Lima",
        ticketNumber : 126574
    }
]

for (let passenger of passengers) {
    console.log("Embarquement du passager "+passenger.name+" avec le ticket numero "+passenger.ticketNumber);
} */

//Boucle While exécute une boucle TANT QUE => quand le nombre d'itérations est inconnu

/* let seatsLeft = 10;
let passengersStillToBoard = 8;
let passengersBoarded = 0;

while(seatsLeft > 0 && passengersStillToBoard > 0){
    passengersBoarded++; //un passager embarque
    passengersStillToBoard--; //donc il y a un passager en moins à embarquer
    seatsLeft--; //et un siège de moins
}

console.log(passengersBoarded); //imprime 8 car il y a 8 passagers pour 10 sièges */

//Les fonctions 
//Les fonctions 
//Les fonctions 

//Exemple d'un fonction 

/* function afficherDeuxValeurs(v1,v2){
    console.log("Première valeur : " + v1);
    console.log("Deuxième valeur : " + v2);
}

afficherDeuxValeurs(12, "Bonjour"); */


//Création de class avec fonction 
//Création de class avec fonction 
//Création de class avec fonction 

/* // Class 
class BankAccount {
    // contruction de l'objet/class 
    constructor(owner, balance){
        this.owner = owner;
        this.balance = balance;
    }

    // Ajout de la l'affichage du compte 
    showBalance(){
        console.log("Solde : "+ this.balance +" EUR");
    }

    // Ajout du dépot bancaire 
    deposit(amount){
        console.log("Dépot de "+ amount +" EUR");
        this.balance += amount;
        this.showBalance();
    }

    // Ajout du retrait bancaire avec condition 
    withdraw(amount){
        if(amount > this.balance){
            console.log("Retrait refusé, solde inssufisant !");
            this.showBalance();
        } else {
            console.log("Retrait de "+ amount +" EUR");
            this.balance -= amount;
            this.showBalance();
        }
    }
}

// Création du nouveau compte 
const newAccount = new BankAccount("Lagna Antoine", 500);

// Manipulation bancaire 
newAccount.showBalance();
newAccount.deposit(500);
newAccount.withdraw(1000);
newAccount.withdraw(1); */

// Les méthodes statiques

// Math.**********();
/* let randomNumber = (Math.random()*10);

console.log(randomNumber);

let roundMeDown = Math.floor(randomNumber);

console.log(roundMeDown); */

// Création de méthode statique, le mot "static"

/* class BePolite {
    static sayHello(){
        console.log("Hello !");
    }

    static sayHelloTo(name){
        console.log("Hello " + name + " !");
    }

    static add(firstNumber, secondNumber){
        return firstNumber + secondNumber;
    }
}

BePolite.sayHello();
BePolite.sayHelloTo("Antoine");

const sum = BePolite.add(2, 3);
console.log(sum); */

//Quelques conventions

/* 
- nom de fonction en camel case minuscule : jeSuisUneFonction
- nom de class en camel case majuscule : JeSuisUneClass
- commenter son code
- choisir des noms de variables / fonctions / class explicite
- indenter son code
- faire des espacements logiques et améliorant la lisibilité
*/

// Effectuer des test de différents types sur le code
// Exemples:
// test simple (demander une réponse dont on connais déjà la solution)
// test limite (faire une demande pour vérifier la compréhenssion du code)

/* const getWordCount = (stringToTest) => {
    // compte le nombres de mots donné dans une chaine de caratères
    const wordArray = stringToTest.split(' ');
    // Ici on affiche un test de comptage de mot
    console.log("Word array in getWordCount : ");
    console.log(wordArray);
    // on retourne la valeur à afficher / concerver
   return wordArray.length;
   };

 getWordCount("I am a fish"); */

// Les fonctions récursives

// On regarde si un éléments est bien présent dans le tableau approche 1

/* const findElement = (array, thingToFind) => {
    for (let element of array) {
        if(element === thingToFind){
            return true;
        }
    }
    return false;
} */

// Approche 2

/* const binarySearch = (array, thingToFind, start, end) => {
    // on vérifie s'il sagit du dernière appel
    if (start > end) {
        return false;
    }

    let mid = Math.floor((start + end)/2);

    if(array[mid] === thingToFind) {
        return true;
    }

    if(thingToFind < array[mid]){
        //on cherche dans la première moitié
        return binarySearch(array, thingToFind, start, mid - 1);
        //on utilise mid-1 car on sait déjà qu'on a pas besoin de mid, il a déjà été vérifié !
    }

    else {
        //il faut rechercher dans la deuxième moitié
        return binarySearch(array, thingToFind, mid + 1, end);
    }
} */

