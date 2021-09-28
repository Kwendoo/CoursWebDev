using System;
using System.Collections.Generic;
using ConsommationAPI.Model;
using ConsommationAPI.Utilities;

namespace ConsommationAPI
{
    class Program
    {
        static void Main(string[] args)
        {

            ContactForm newContact = new ContactForm
            {
                LastName = "DuJardin",
                FirstName = "Jean",
                Email = "jeanDuJardin@gmail.com",
                Telephone = "0474/639061",
                IsFavorite = true
            };

            APIRequester requester = new APIRequester();

            //requester.Post(newContact);
            //requester.Delete(3);
            requester.UpDate(1, newContact);

            IEnumerable<Contact> listeContact = requester.Get<IEnumerable<Contact>>("Contact");

            foreach (Contact item in listeContact)
            {
                Console.WriteLine($"Nom : {item.Nom}");
                Console.WriteLine($"Prenom : {item.Prenom}");
                Console.WriteLine($"Email : {item.Email}");
                Console.WriteLine($"--------------------------");
                Console.WriteLine();
            }

            Contact c = requester.Get<Contact>("contact/1");

            Console.WriteLine("Contact avec l'Id 1");
            Console.WriteLine(c.Prenom + " " + c.Nom);
        }
    }
}
