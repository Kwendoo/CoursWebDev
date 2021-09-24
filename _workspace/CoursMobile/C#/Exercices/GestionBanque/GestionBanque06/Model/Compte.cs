using System;

namespace GestionBanque06.Model
{
    public abstract class Compte
    {

        // Attributs
        private string _Numero;
        private double _Solde;
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

        public Personne Titulaire
        {
            get { return _Titulaire; }
            set { _Titulaire = value; }
        }

        // Méthodes
        public virtual void Retrait(double Montant, double LigneDeCredit)
        {
            if (Montant <= 0)
                return; //à remplacer plus tard par une exception

            if (Solde - Montant < -LigneDeCredit)
                return; //à remplacer plus tard par une exception

            Solde -= Montant;
        }

        public virtual void Retrait(double Montant)
        {
            Retrait(Montant, 0.0);
        }

        public void Depot(double Montant)
        {
            if (Montant <= 0)
                return; //à remplacer plus tard par une exception

            Solde += Montant;
        }

        protected abstract double CalculInteret();

        public void AppliquerInteret()
        {
            _Solde += CalculInteret();
        }

        // Surcharge d'opérateur

        public static double operator +(double Solde, Compte c)
        {
            return Solde + ((c.Solde < 0) ? 0.0 : c.Solde); // Ceci est un opérateur ternaire et permet de racourcir un if : ((si X est <>= à Y) ? Alors Z : sinon W)
        }

    }
}
