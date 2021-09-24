using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mobile.Strucutre
{
    public struct Contact
    {
        public string Nom, Prenom, Surnom, AdresseMail;
    }

    public struct Message
    {
        public string Objet, Contenu;
        public Contact Destiantaire, Expéditeur;
        public DateTime HeureEnvoie;
        public bool AccuseReception;
    }
}
