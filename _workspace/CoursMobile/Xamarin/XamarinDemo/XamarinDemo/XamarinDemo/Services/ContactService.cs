using System;
using System.Collections.Generic;
using System.Text;
using XamarinDemo.Models;

namespace XamarinDemo.Services
{
    public class ContactService
    {
        private List<Contact> ListContact { get; set; }

        public ContactService()
        {
            ListContact = new List<Contact>();
            ListContact.Add(new Contact
            {
                Nom = "Lagna Antoine",
                Gsm = "0123/456789",
                Tel = "987/6543210",
                Email = "antoine.lagna@gmail.com",
                Info = "Ceci sont des info très importante !"
            });
        }

        public List<Contact> GetAll()
        {
            return ListContact;
        }

        public void AddContact(Contact c)
        {
            ListContact.Add(c);
        }

        public void RemoveContact(Contact c)
        {
            ListContact.Remove(c);
        }



    }
}
