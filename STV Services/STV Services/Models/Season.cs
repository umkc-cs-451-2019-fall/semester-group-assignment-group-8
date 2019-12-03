using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace STV_Services.Models
{
    public class Season
    {
        public int SeasonID { get; set; }

        [StringLength(20)]
        [DisplayName("Season Title"), Required(ErrorMessage = "Season Title cannot be empty!")]
        public string SeasonTitle { get; set; }

        [StringLength(50)]
        [DisplayName("Show Name"), Required(ErrorMessage = "Show Name cannot be empty!")]
        public string ShowName { get; set; }

        [StringLength(250)]
        [DisplayName("Description"), Required(ErrorMessage = "Description cannot be empty!")]
        public string Description { get; set; }

        [DisplayName("Number Of Episode"), Required(ErrorMessage = "This field cannot be empty!")]
        public int EpisodesNumber { get; set; }
    }
}