using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace STV_Services.Models
{
    public class Login
    {
        [StringLength(20)]
        [Required(ErrorMessage = "usernaem cannot be empty!")]
        public string Username { get; set; }

        [StringLength(20)]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}