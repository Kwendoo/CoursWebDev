﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsommationAPI.Models
{
    public class ContactForm
    {
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Email { get; set; }
        public string Telephone { get; set; }
        public bool IsFavorite { get; set; }
    }
}