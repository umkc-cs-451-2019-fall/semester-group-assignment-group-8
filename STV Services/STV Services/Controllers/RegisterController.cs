using STV_Services.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySql.Data.MySqlClient;


namespace STV_Services.Controllers
{
    public class RegisterController : Controller
    {
        // GET: Register
        public ActionResult Register()
        {
            Register newuser = new Register();
            return View(newuser);
        }



        [HttpPost]
        public ActionResult Register(Register user)
        {

            TempData["Success"] = null;
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            MySqlConnection con = new MySqlConnection(constr);

            try
            {
                con.Open();
                string query = "call create_new_user('" + user.Username + "','" + user.Firstname + "','" + user.Lastname + "','" + user.Email + "','" + user.Password + "','" + user.DateOfBirth + "');";

                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.ExecuteNonQuery();
                TempData["Success"] = "Added Successfully!";
                return View();
            }
            catch (Exception exception)
            {
                throw exception;
            }

            //return View();
        }
    }
}