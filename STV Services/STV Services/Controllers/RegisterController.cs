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

            if (DataAccess.IsUserExist(user.Username) == false)
            {
                DataAccess.CreateNewAccount(user);
                return RedirectToAction("Index","Home");
            }
            else
            {
                ModelState.AddModelError("Username", "this username is already exists. Please enter a different username.");

            }

            return View(user);  
        }
    }
}