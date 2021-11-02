using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Models
{
    public class MovieTitle
    {
        public int Id { get; set; }
        public int PersonId { get; set; }
        public string Title { get; set; }
    }
}
