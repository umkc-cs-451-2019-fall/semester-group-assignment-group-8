using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace STV_Services.Models
{
    public class UserViewModel
    {
        public User user { set; get; }
        public List<Show> userfav { set; get; }
    }
}