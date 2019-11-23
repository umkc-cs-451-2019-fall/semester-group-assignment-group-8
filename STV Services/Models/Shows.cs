using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace STV.Models
{
    public class Shows
    {
        [Display(Name ="Show Name")]
        public string ShowName { get; set; }

        [Display(Name = "Channel Name")]
        public string ChannelName { get; set; }
        public string Description { get; set; }

        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        [Display(Name = "Date of Release")]
        [DataType(DataType.Date)]
        public DateTime DateOfRelease { get; set; }

        public string ServiceName { get; set; }

        public int Seasons { get; set; }
        public int Episodes { get; set; }


        public List<Shows> show_service { get; set; }

        public bool Favorite { get; set; }

    }
}