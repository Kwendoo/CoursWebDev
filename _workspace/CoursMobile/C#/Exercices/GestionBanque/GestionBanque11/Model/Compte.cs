using System;

namespace GestionBanque11.Model
{

    public abstract class Compte : IBanker, ICustumer
    {
        // Attributs
        private string _Numero;
        private double _Solde;
        private Personne _Titulaire;

        // Event
        public event Action<Compte> PassageEnNegatifEvent = null;

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
                throw new ArgumentOutOfRangeException("Vous devez entrer un montant positif strictement supérieur à 0.");

            if (Solde - Montant < -LigneDeCredit)
                throw new SoldeInsuffisantException();

            Console.WriteLine($"[{this.Numero}] : Retrait de {Montant}");
            Solde -= Montant;
        }

        public virtual void Retrait(double Montant)
        {
            Retrait(Montant, 0.0);
        }

        public void Depot(double Montant)
        {
            if (Montant <= 0)
                throw new ArgumentOutOfRangeException("Vous devez entrer un montant positif strictement supérieur à 0.");

            Console.WriteLine($"[{this.Numero}] : Dépot de {Montant}");
            Solde += Montant;
        }

        protected abstract double CalculInteret();

        public void AppliquerInteret()
        {
            _Solde += CalculInteret();
        }

        protected void PassageEnNegatif()
        {
            //if(this.PassageEnNegatifEvent!= null)this.PassageEnNegatifEvent(this);
            this.PassageEnNegatifEvent?.Invoke(this);
        }

        // Surcharge d'opérateur
        public static double operator +(double Solde, Compte c)
        {
            return Solde + ((c.Solde < 0.0) ? 0.0 : c.Solde);
        }
    }
}
