using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace STV_Services.Models
{
    public class Register
    {

        [Required(ErrorMessage = "usernaem cannot be empty!")]
        [RegularExpression(@"[a-zA-Z0-9]+", ErrorMessage = "Invalid username.")]
        public string Username { set; get; }

        [DataType(DataType.Password), Required(ErrorMessage = "Password cannot be empty!")]
        public string Password { set; get; }

        [DisplayName("First Name"), Required(ErrorMessage = "First Name cannot be empty!")]
        [RegularExpression(@"[a-zA-Z/'/-]+", ErrorMessage = "The First Name has invalid Character.")]
        public string Firstname { set; get; }

        [DisplayName("Last Name"), Required(ErrorMessage = "Last Name cannot be empty!")]
        [RegularExpression(@"[a-zA-Z/'/-]+", ErrorMessage = "The Last Name has invalid Character.")]

        public string Lastname { set; get; }


        [DisplayName("Email Address"), Required(ErrorMessage = "Email cannot be empty!")]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "This Email is not valid")]
        public string Email { set; get; }

        [DisplayName("Date of Birth"), Required(ErrorMessage = "This field cannot be empty!")]
        [DataType(DataType.Date), DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public string DateOfBirth { set; get; }

    }
}