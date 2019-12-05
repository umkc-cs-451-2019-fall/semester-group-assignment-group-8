using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace STV_Services.Models
{
    public class SeasonViewModel
    {
        public List<string> Shows { get; set; }
        public Season season { get; set; }
    }
}