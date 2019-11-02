using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using STV_Services.Models;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

public class AccountController : Controller
{
    // GET: Account, Login Screen
    [HttpGet]
    public ActionResult Login()
    {
        return View();
    }
    [HttpPost]

    // verify username and password
    public ActionResult Verify(Account acc)
    {
        List<Account> account = new List<Account>();
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString; //setting variable to connection string
        using (MySqlConnection con = new MySqlConnection(constr))
        {
            string query = "select * from users where username = '" + acc.Name + "' and usrpassword ='" + acc.Password + "'"; //select username and password from users table in schema
            using (MySqlCommand cmd = new MySqlCommand(query))
            {
                cmd.Connection = con; //start running commands thru program
                con.Open();
                using (MySqlDataReader sdr = cmd.ExecuteReader())
                {
                    if (sdr.Read()) //if input is within table, login succesful 
                    {
                        con.Close();
                        return View("Create");
                    }
                    else
                    {
                        con.Close(); //if input not in table, login not successful
                        return View("Error");

                    }
                }
            }
        }
    }
}
