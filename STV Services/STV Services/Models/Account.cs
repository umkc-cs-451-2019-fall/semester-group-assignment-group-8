using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace STV_Services.Models
{
    public class Account //Name = username, Password = password respectively
    {
        public string Name { get; set; }

        public string Password { get; set; }

        public string Firstname { set; get; }

        public string Lastname { set; get; }

        public string Email { set; get; }

        public char Permission { get; set; }

        public string DateOfBirth { set; get; }

    }
}