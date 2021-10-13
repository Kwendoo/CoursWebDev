using ConsommationAPI.Models;
using ConsommationAPI.Utils;
using DataAccessLayer.Interfaces;
using DataAccessLayer.Services;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;

namespace ConsommationAPI
{
    class Program
    {

        static void Main(string[] args)
        {

        
            ContactForm newContact = new ContactForm
            {
                LastName = "De Carmélide",
                FirstName = "Léodagan",
                Email = "danseur@catapulte.com",
                Telephone = "0321/456.987",
                IsFavorite = true
            };

            ApiRequester requester = new ApiRequester();

            User currentUser = requester.Login("test@test.com", "test1234");

            JwtSecurityToken jwt = new JwtSecurityToken(currentUser.Token);

            IEnumerable<Claim> claims = jwt.Claims;

            foreach (Claim item in claims)
            {
                Console.WriteLine(item.Type + " - "+item.Value);
            }

            Console.WriteLine(currentUser.Token);


            //requester.Post(newContact);
            //requester.Delete(5);

            //requester.Update(1, newContact);

            IEnumerable<Contact> listeContact = requester.Get<IEnumerable<Contact>>("contact", currentUser.Token);

            Console.WriteLine(listeContact);


            foreach (Contact item in listeContact)
            {
                Console.WriteLine("Nom : {0}", item.Nom);
                Console.WriteLine("Prenom : {0}", item.Prenom);
                Console.WriteLine("Email : {0}", item.Email);
                Console.WriteLine("Tel : {0}", item.Telephone);
                Console.WriteLine("--------------------------");
                Console.WriteLine();
            }

            //Contact c = requester.Get<Contact>("contact/1");

            //Console.WriteLine("Contact avec l'id 1");

            //Console.WriteLine(c.Prenom + " " + c.Nom );
            //Console.WriteLine("Email : {0} || Tel : {1}", c.Email, c.Telephone);


            //Console.WriteLine("Hello World!");
        }
    }
}
