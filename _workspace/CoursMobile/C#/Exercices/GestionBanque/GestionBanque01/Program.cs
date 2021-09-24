using GestionBanque01.Model;
using System;

namespace GestionBanque01
{
    class Program
    {
        static void Main(string[] args)
        {
            Personne p = new Personne()
            {
                Nom = "John",
                Prenom = "Doe",
                DateNaiss = new DateTime(2000, 1, 1)
            };

            Courant c = new Courant();
            c.Numero = "0000001";
            c.Titulaire = p;

            c.Depot(500);
            c.Retrait(300);

            Console.WriteLine(c.Solde);
        }
    }
}
