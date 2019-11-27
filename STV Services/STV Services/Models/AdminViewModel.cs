using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace STV_Services.Models
{
    public class AdminViewModel
    {
        public User admin { set; get; }
        public List<StreamingSrevice> streamingSrevice { set; get; }
    }
}