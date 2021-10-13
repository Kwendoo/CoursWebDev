using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace DemoASP.Models
{
    public class BiereForm
    {
        [Required]
        [MinLength(4)]
        public string Nom { get; set; }
        
        [Required]
        [Display(Name = "Pourcentage d'alcool")]
        public int Alcool { get; set; }

        public string Type { get; set; }
    }
}
