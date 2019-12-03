using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace STV_Services.Models
{
    public class PackageViewModel
    {
        public PackageModel package { get; set; }
        public List<string> services { get; set; }
       public List<Channel> Channels { get; set; }
    }
}