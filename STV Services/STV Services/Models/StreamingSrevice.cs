using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace STV_Services.Models
{
    public class StreamingSrevice
    {
        [StringLength(20)]
        [DisplayName("Service Name"), Required(ErrorMessage = "Service Name is required")]
        public string ServiceName { set; get; }

        [StringLength(250)]
        [DisplayName("Description"),Required(ErrorMessage = "Description Field is required")]
        public string Description { set; get; }

    }
}