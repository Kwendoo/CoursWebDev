using System;

namespace GestionBanque08.Model
{
    public class Courant : Compte
    {
        // Attributs
     
        private double _LigneDeCredit;

        // Propriétés
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

        // Constructeurs

        public Courant(string Numero, Personne Titulaire) : base(Numero, Titulaire)
        {
        
        }

        public Courant(string Numero, Personne Titulaire, double Solde) : base(Numero, Titulaire, Solde)
        {
        
        }


        // Méthodes
        public override void Retrait(double Montant)
        {
            Retrait(Montant, LigneDeCredit);
        }

        protected override double CalculInteret()
        {
            return (Solde < 0) ? Solde * .975 : Solde * .03;
        }

    }
}
