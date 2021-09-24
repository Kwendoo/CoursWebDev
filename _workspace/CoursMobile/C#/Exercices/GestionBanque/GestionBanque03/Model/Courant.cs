using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionBanque03.Model
{
    public class Courant
    {
        // Attributs
        private string _Numero;
        private double _Solde;
        private double _LigneDeCredit;
        private Personne _Titulaire;

        // Propriétés
        public string Numero
        {
            get { return _Numero; }
            set { _Numero = value; }
        }

        public double Solde
        {
            get { return _Solde; }
            private set { _Solde = value; }
        }

        public double LigneDeCredit
        {
            get { return _LigneDeCredit; }
            set
            {
                if (value < 0)
                    return; //à remplacer plus tard par une exception

                _LigneDeCredit = value;
            }
        }

        public Personne Titulaire
        {
            get { return _Titulaire; }
            set { _Titulaire = value; }
        }

        // Méthodes
        public void Retrait(double Montant)
        {
            if (Montant <= 0)
                return; //à remplacer plus tard par une exception

            if (Solde - Montant < -LigneDeCredit)
                return; //à remplacer plus tard par une exception

            Solde -= Montant;
        }

        public void Depot(double Montant)
        {
            if (Montant <= 0)
                return; //à remplacer plus tard par une exception

            Solde += Montant;
        }

        // Surcharge d'opérateur

        public static double operator +(double Solde, Courant c)
        {
            return Solde + ((c.Solde < 0) ? 0.0 : c.Solde); // Ceci est un opérateur ternaire et permet de racourcir un if : ((si X est <>= à Y) ? Alors Z : sinon W)
        }


    }
}
