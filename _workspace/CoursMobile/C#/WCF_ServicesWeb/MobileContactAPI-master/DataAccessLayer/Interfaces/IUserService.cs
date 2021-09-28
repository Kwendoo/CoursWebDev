using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Models;

namespace DataAccessLayer.Interfaces
{
    public interface IUserService
    {
        void Register(string Email, string PassWrod, bool IsAdmin);

        User Login(string Email, string Password);
    }
}
