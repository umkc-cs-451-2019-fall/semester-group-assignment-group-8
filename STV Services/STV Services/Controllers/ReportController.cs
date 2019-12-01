using MySql.Data.MySqlClient;
using STV_Services.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.Mvc;
using PagedList;
using System.Linq;

namespace STV_Services.Controllers
{
    public class ReportController : Controller
    {
        // GET: Report
        public ActionResult CreateReport()
        {

            Report report = new Report();
            return View(report);
        }

        [HttpPost]
        public ActionResult CreateReport(Report newReport)
        {

            DataAccess.CreateReport(newReport);

            return RedirectToAction("Index","Home");
 
        }

        public ActionResult Reports(int? page)
        {

            List<Report> reports = DataAccess.GetReports();
            IPagedList<Report> rports = null ;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            rports = reports.ToPagedList(pageNumber, pageSize);
            return View(rports);
        }

        public ActionResult Delete(int? id)
        {
            DataAccess.DeleteReport(id);
            return RedirectToAction("Reports", "Report");
        }
    }
}