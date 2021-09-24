using System;
using System.Collections.Generic;


namespace Mobile.Strucutre
{
    class Program
    {
        static void Main(string[] args)
        {
            //PhoneNumber pn;

            //pn.nationalNumber = "+32";
            //pn.indicatif = 800;
            //pn.number = 336521;

            //Console.WriteLine($"{pn.nationalNumber}(0)");

            Dictionary<string, Contact> maListeDeContact = new Dictionary<string, Contact>();

            Contact c1;
            c1.Surnom = "Papa";
            c1.Nom = "Lagna";
            c1.Prenom = "Jean";
            c1.AdresseMail = "papa@csharp.be";

            Contact c2;
            c2.Surnom = "Maman";
            c2.Nom = "Ducarme";
            c2.Prenom = "Michèle";
            c2.AdresseMail = "maman@csharp.be";

            maListeDeContact.Add(c1.AdresseMail, c1);
            maListeDeContact.Add(c2.AdresseMail, c2);

            //foreach (KeyValuePair<string, Contact> contact in maListeDeContact)
            //{
            //    Console.WriteLine($"{contact.Value.Nom} {contact.Value.Prenom} {contact.Value.Surnom} {contact.Value.AdresseMail} ");
            //}

            Message message;
            message.Objet = "Coucou maman";
            message.Destiantaire = maListeDeContact[c2.AdresseMail];
            message.Expéditeur = maListeDeContact[c1.AdresseMail];
            message.Contenu = "";
            message.HeureEnvoie = DateTime.Now;
            message.AccuseReception = false;

            Console.WriteLine();
        }
    }
}
