using STV_Services.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace STV_Services.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            Login login = new Login();
            return View(login);
        }

        [HttpPost]
        public ActionResult Login(Login login)
        {
            User user = new User();
            user.Username = login.Username;
            user.Password = login.Password;
            TempData["Error"] = null;
            if (DataAccess.VerifyUser(user) == true)
            {
                Session["Username"] = user.Username;
                Session["Permission"] = user.Permission;
                if (user.Permission == 'a')
                {
                    return RedirectToAction("AdminHome", "Admin");
                }
                else if (user.Permission == 'u')
                {
                    return RedirectToAction("CreateReport", "Report");
                }
            }
            else
            {
                Session["Username"] = null;
                Session["Permission"] = null;
                TempData["Error"] = "Username or Password is incorrect.";
                ModelState.AddModelError("LoginError", "Username or Password is incorrect.");
                return View();
            }
            return View();
        } 

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Logout()
        {
            Session["Username"] = null;
            Session["Permission"] = null;
            Session.Clear();
            return RedirectToAction("Index","Home");
        }
    }
}