using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace STV_Services.Models
{
    public class Report
    {

        public int ReportID { set; get; }

        [Required(ErrorMessage = "Title is required")]
        public string Title { set; get; }

        [Required(ErrorMessage = "Description is required")]
        public string Description { set; get; }

        [Required(ErrorMessage = "Report Type required")]
        public ReportType Type { set; get; }
    }

    public enum ReportType
    {
        problem, feedback
    }
}