using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionBanque02.Model
{
    class Banque
    {

        public string Nom { get; set; }

        Dictionary<string, Courant> _Comptes = new Dictionary<string, Courant>();

        public Courant this[string Numero]
        {
            get
            {
                _Comptes.TryGetValue(Numero, out Courant courant);

                return courant;
            }
        }

        public void Ajouter (Courant compte)
        {
            if (_Comptes.TryAdd(compte.Numero, compte)) Console.WriteLine("Ajouté");
            else Console.WriteLine("Compte déjà existant");
        }

        public void Supprimer (string Numero)
        {
            _Comptes.Remove(Numero);
        }

    }
}
