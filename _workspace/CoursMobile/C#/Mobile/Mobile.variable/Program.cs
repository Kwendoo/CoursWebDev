using System;
using System.Text;

namespace Mobile.variable
{
    class Program
    {
        static void Main(string[] args)
        {
            //Déclaration de variable
            int i;
            //ou déclaration multiple
            int j, k;
            //ne pas déclarer différents type de variable sur une meme ligne : int i, bool j est une délcaration incorrect

            //Affection d'une variable :
            i = 5;

            //Déclaration et affectation simltanée :
            int entier1 = 2, entier2 = 3;

            //Toujours déclarer et initialiser une variable avant de l'utiliser.
            //Une variable déclarée dans une class est disponible dans cette class et dans tous les niveau inférieur de cette class. Elle est globale.
            //Une variable déclarée dans une méthode n'est utilisable que dans cette méthode et ses enfants.

            //Constante prend une valeur et ne peux être modifiée qu'a la déclaration. Elle peut être mnipulée mais pas modifiée. Elle doit IMP2RATIVEMENT etre déclarée lors de sa création.
            //On les notes en majuscule. NOM_CONSTANTE
            const int EXEMPLE = 5;

            //Variable NULLABLE
            Nullable<int> l = null;
            //ou
            int? m = null;

            //Types de données prédéfinies

            //CTS : Common Type System -> 5 catégories : Class, Structures, Enumération, Interface, Délégué. 14 types prédéfini et 3 type référence
            int a = 5; //déclaration en C#
            Int32 b = 5; //déclaration en CTS

            //Récupérer un type pour une variable : nomVariable.GetType()

            Console.WriteLine(a.GetType());

            //Possible de rendre lisible les entier ou les réel avec _ tous les " chiffre. Le compileur les ignorera
            int c = 1_258_368;
            Console.WriteLine(c);

            Console.Clear();

            //Concaténation :

            //L'opérateur +
            String Query = "Bonjour" + " Mobile !";

            //StringBuilder
            StringBuilder sb1 = new StringBuilder();
            sb1.Append("Le texte");
            sb1.Append(" construit.");

            StringBuilder sb2 = new StringBuilder();
            sb2.AppendLine("Le texte");
            sb2.AppendLine(" construit.");

            string s_1 = sb1.ToString();
            string s_2 = sb2.ToString();

            Console.WriteLine(sb1);
            Console.WriteLine(sb2);

            //String.Format

            string Prenom = "Antoine";

            string Message = string.Format("Bonjour {0}, il est {1} !", Prenom, DateTime.Now.ToShortTimeString());

            Console.WriteLine(Message);
                       
        }
    }
}
