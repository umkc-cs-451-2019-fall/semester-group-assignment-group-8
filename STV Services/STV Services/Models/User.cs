using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace STV_Services.Models
{
    public class User
    {


        public string Username { set; get; }

        public string Password { set; get; }

        public string Firstname { set; get; }

        public string Lastname { set; get; }

        public string Email { set; get; }

        public char Permission { set; get; }

        public string DateOfBirth { set; get; }

    }
}