using GestionBanque03.Model;
using System;

namespace GestionBanque03
{
    class Program
    {
        static void Main(string[] args)
        {
            // Personnes
            Personne p = new Personne()
            {
                Nom = "John",
                Prenom = "Doe",
                DateNaiss = new DateTime(2000, 1, 1)
            };
            
            Personne p2 = new Personne()
            {
                Nom = "Lagna",
                Prenom = "Antoine",
                DateNaiss = new DateTime(1993, 06, 23)
            };

            // Compte courant
            Courant c = new Courant();
            c.Numero = "0000001";
            c.Titulaire = p;

            Courant c2 = new Courant();
            c2.Numero = "0000002";
            c2.Titulaire = p;

            Courant c3 = new Courant();
            c3.Numero = "0000003";
            c3.Titulaire = p2;

            // Banque
            Banque b = new Banque();
            b.Nom = "Ma Banque";
            b.Ajouter(c);
            b.Ajouter(c2);
            b.Ajouter(c3);

            b["0000001"].Depot(500);
            b["0000002"].Depot(300);
            b["0000001"].Retrait(300);

            b["0000003"].Depot(500);
            b["0000003"].Retrait(37);

            Console.WriteLine("----------Soldes----------");
            Console.WriteLine(b["0000001"].Solde);
            Console.WriteLine(b["0000002"].Solde);
            Console.WriteLine(b["0000003"].Solde);

            Console.WriteLine("------------Avoirs-----------");
            Console.WriteLine(b.AvoirDesComptes(p));
            Console.WriteLine(b.AvoirDesComptes(p2));

        }
    }
}
