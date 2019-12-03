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
        [StringLength(20)]
        [Required(ErrorMessage = "username cannot be empty!")]
        [RegularExpression(@"[a-zA-Z0-9]+", ErrorMessage = "Invalid username.")]
        public string Username { set; get; }

        [StringLength(20)]
        [DataType(DataType.Password), Required(ErrorMessage = "Password cannot be empty!")]
        public string Password { set; get; }

        [StringLength(20)]
        [DisplayName("First Name"), Required(ErrorMessage = "First Name cannot be empty!")]
        [RegularExpression(@"[a-zA-Z/'/-]+", ErrorMessage = "The First Name has invalid Character.")]
        public string Firstname { set; get; }

        [StringLength(20)]
        [DisplayName("Last Name"), Required(ErrorMessage = "Last Name cannot be empty!")]
        [RegularExpression(@"[a-zA-Z/'/-]+", ErrorMessage = "The Last Name has invalid Character.")]
        public string Lastname { set; get; }

        [StringLength(20)]
        [DisplayName("Email Address"), Required(ErrorMessage = "Email cannot be empty!")]
        [DataType(DataType.EmailAddress)]
        public string Email { set; get; }

        [DisplayName("Date of Birth"), Required(ErrorMessage = "This field cannot be empty!")]
        [DataType(DataType.Date), DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public string DateOfBirth { set; get; }

    }
}