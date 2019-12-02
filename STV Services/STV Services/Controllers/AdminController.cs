using STV_Services.Models;
using System.Collections.Generic;
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


        public ActionResult CreatePackage()
        {
            PackageViewModel packageView = new PackageViewModel();
            List<StreamingSrevice> streamingSrevices = DataAccess.GetStreamingSrevices();
            packageView.services = DataAccess.getStreamingServices();
            //st<Channel> channels = DataAccess.GetChannels();
            packageView.Channels = DataAccess.GetChannels();
 
            return View(packageView);
        }

        [HttpPost]
        public ActionResult CreatePackage(PackageViewModel packageView)
        {

            DataAccess.CreateNewPackage(packageView);

            /*for (ITempDataProvider in)
            DataAccess.AddChannelToPackage(1, "Sling");*/

            return RedirectToAction("AdminHome", "Admin");
        }

        public ActionResult CreateChannel()
        {
            Channel channel = new Channel();
            return View(channel);
        }


        [HttpPost]
        public ActionResult CreateChannel(Channel channel)
        {
            if (DataAccess.IsChannelExist(channel.ChannelName) == false)
            {
                DataAccess.CreateChannel(channel);
                return RedirectToAction("AdminHome", "Admin");
            }
            else
            {
                ModelState.AddModelError("ChannelName", "This channel is already exists.");

            }

            return View(channel);

        }

    }
}