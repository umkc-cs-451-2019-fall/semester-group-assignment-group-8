using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace STV_Services.Models
{
    public class PackageModel
    {
        public int PackageID { get; set; }

        [StringLength(20)]
        [DisplayName("Streaming Service"), Required(ErrorMessage = "Streaming Service cannot be empty!")]
        public string ServiceName { get; set; }

        [StringLength(20)]
        [DisplayName("Package Name"), Required(ErrorMessage = "Package Name cannot be empty!")]
        public string PackageName { get; set; }

        [StringLength(20)]
        [DisplayName("Description"), Required(ErrorMessage = "Description cannot be empty!")]
        public string Description { get; set; }

        [DisplayName("Price")]
        public float Price { get; set; }
    }
}