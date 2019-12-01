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


        public ActionResult CreateStreamingService()
        {
            StreamingSrevice srevice = new StreamingSrevice();
            return View(srevice);
        }

        [HttpPost]
        public ActionResult CreateStreamingService(StreamingSrevice stream)
        {
            TempData["Danger"] = null;
            StreamingSrevice newStreamingSrevice = new StreamingSrevice();
            if (DataAccess.IsStreamExist(stream.ServiceName) == false)
            {
                DataAccess.CreateStreamingService(stream);

            }
            else
            {
                TempData["Danger"] = "Streaming Service is already existed!";

            }
            return RedirectToAction("AdminHome","Admin");
        }
    }
}