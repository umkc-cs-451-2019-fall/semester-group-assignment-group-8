using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace STV_Services.Models
{
    public class Show
    {
        [StringLength(50)]
        [DisplayName("Show Name"), Required(ErrorMessage = "Channel Name cannot be empty!")]
        public string ShowName { get; set; }

        [StringLength(30)]
        [DisplayName("Channel Name"), Required(ErrorMessage = "Channel Name cannot be empty!")]
        public string ChannelName { get; set; }

        [StringLength(350)]
        [DisplayName("Description"), Required(ErrorMessage = "Description cannot be empty!")]
        public string Description { get; set; }


        [DisplayName("Date of Release"), Required(ErrorMessage = "This field cannot be empty!")]
        [DataType(DataType.Date), DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public string DateofRelease { set; get; }
    }
}