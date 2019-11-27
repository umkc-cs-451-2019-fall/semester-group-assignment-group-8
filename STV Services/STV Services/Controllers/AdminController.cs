using STV_Services.Models;
using System.Web.Mvc;

namespace STV_Services.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult AdminHome()
        {
            string username = "mazin";
            AdminViewModel adminViewModel = new AdminViewModel();
            adminViewModel.admin = DataAccess.GetUserInfo(username);
            adminViewModel.streamingSrevice = DataAccess.GetStreamingSrevices();

            return View(adminViewModel);
        }
    }
}