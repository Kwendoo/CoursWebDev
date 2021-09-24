using System;

namespace GestionBanque08.Model
{
    public abstract class Compte : ICustumer, IBanker
    {

        // Attributs
        private string _Numero;
        private double _Solde;
        private Personne _Titulaire;

        // Propriétés
        public string Numero
        {
            get { return _Numero; }
            private set { _Numero = value; }
        }

        public double Solde
        {
            get { return _Solde; }
            private set { _Solde = value; }
        }

        public Personne Titulaire
        {
            get { return _Titulaire; }
            private set { _Titulaire = value; }
        }

        // Constructeurs

        public Compte(string Numero, Personne Titulaire) : this(Numero, Titulaire, 0D)
        {

        }
        public Compte(string Numero, Personne Titulaire, double Solde)
        {
            this.Numero = Numero;
            this.Titulaire = Titulaire;
            this.Solde = Solde;

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
