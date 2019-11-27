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
        public ActionResult Report()
        {

            Report report = new Report();
            return View(report);
        }

        [HttpPost]
        public ActionResult Report(Report newReport)
        {


            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            MySqlConnection con = new MySqlConnection(constr);

            try
            {
                con.Open();
                string query = "call create_new_report('" + newReport.Title + "','" + newReport.Description + "','" + newReport.Type + "');";

                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.ExecuteNonQuery();
                TempData["Success"] = "Report has been submitted Successfully!";
                con.Close();

                return View();
            }
            catch (Exception exception)
            {
                throw exception;
            }
        }

        public ActionResult Reports(int? page)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            MySqlConnection con = new MySqlConnection(constr);
            List<Report> reports = new List<Report>();
            IPagedList<Report> rports = null ;

            try
            {
                con.Open();
                string query = "call get_all_reports();";

                MySqlCommand cmd = new MySqlCommand(query, con);
                using (MySqlDataReader reader = cmd.ExecuteReader())

                {
                    while (reader.Read())
                    {
                        Report report = new Report();

                        report.ReportID = reader.GetInt32(0);
                        report.Title = reader.GetString(1);
                        report.Description = reader.GetString(2);
                        string val = reader.GetString(3);
                        var employee = (ReportType)Enum.Parse(typeof(ReportType), val);
                        report.Type = employee;

                        reports.Add(report);

                    }
                }
                con.Close();

                int pageSize = 10;
                int pageNumber = (page ?? 1);
                rports = reports.ToPagedList(pageNumber, pageSize);
                return View(rports);
            }
            catch (Exception exception)
            {
                throw exception;
            }
            //return View();
        }

        public ActionResult Delete(int? id)
        {

            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            MySqlConnection con = new MySqlConnection(constr);

            try
            {
                con.Open();
                string query = "call delete_report(" + id + ");";

                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.ExecuteNonQuery();
                TempData["Success"] = "Report has been deleted Successfully!";
                con.Close();

                return RedirectToAction("Reports","Report");
            }
            catch (Exception exception)
            {
                throw exception;
            }


        }
    }
}