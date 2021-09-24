using System;

namespace GestionBanque08.Model
{
    class Epargne : Compte
    {

        // Attributs
        private DateTime _DateDernierRetrait;

        // Propriétés
        public DateTime DateDernierRetrait
        {
            get { return _DateDernierRetrait; }
            private set { _DateDernierRetrait = value; }
        }

        // Constructeurs

        public Epargne(string Numero, Personne Titulaire) : base(Numero, Titulaire)
        {
        }

        public Epargne(string Numero, Personne Titulaire, double Solde) : base(Numero, Titulaire, Solde)
        {
        }

        // Méthodes

        public override void Retrait(double Montant)
        {
            double AncienSolde = Solde;
            base.Retrait(Montant);

            if (Solde != AncienSolde)
                DateDernierRetrait = DateTime.Now;
        }

        protected override double CalculInteret()
        {
            return Solde * .045;
        }

    }
}
