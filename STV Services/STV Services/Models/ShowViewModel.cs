using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace STV_Services.Models
{
    public class ShowViewModel
    {
        public Show show { get; set; }
        public List<string> Channels { get; set; }
    }
}