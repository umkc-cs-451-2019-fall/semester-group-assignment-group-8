using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace STV_Services.Models
{
    public class Channel
    {

        [StringLength(30)]
        [DisplayName("Channel Name"), Required(ErrorMessage = "Channel Name cannot be empty!")]
        public string ChannelName { get; set; }

        [StringLength(250)]
        [DisplayName("Description"), Required(ErrorMessage = "Description cannot be empty!")]
        public string Description { get; set; }

        public bool Checked { get; set; }

    }
}