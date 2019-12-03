using STV_Services.Models;
using System.Collections.Generic;
using System.Web.Mvc;

namespace STV_Services.Controllers
{
    public class AdminController : Controller
    {
        public ActionResult Index()
        {
            return View();
                
        }

        // GET: Admin
        public ActionResult AdminHome()
        {
            string username = Session["Username"].ToString();
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
            if (ModelState.IsValid) { 
            if (DataAccess.IsStreamExist(stream.ServiceName) == true)
            {
                    TempData["Danger"] = "Streaming Service is already existed!";
                    ModelState.AddModelError("ChannelName", "This channel is already exists.");

            }
            else
            {
                DataAccess.CreateStreamingService(stream);
                return RedirectToAction("AdminHome", "Admin");

            }
            }
            return View(stream);

            //return RedirectToAction("AdminHome","Admin");
        }


        public ActionResult CreatePackage()
        {
            PackageViewModel packageView = new PackageViewModel();
            List<StreamingSrevice> streamingSrevices = DataAccess.GetStreamingSrevices();
            packageView.services = DataAccess.getStreamingServices();
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


        public ActionResult CreateShow()
        {
            ShowViewModel showView = new ShowViewModel();
            showView.Channels = DataAccess.GetChannelsName();
            return View(showView);
        }


        [HttpPost]
        public ActionResult CreateShow(ShowViewModel showView)
        {
            DataAccess.CreateShow(showView);

            return RedirectToAction("AdminHome", "Admin");
        }

        public ActionResult CreateSeason()
        {
            SeasonViewModel seasonViewModel = new SeasonViewModel();
            seasonViewModel.Shows = DataAccess.GetShowsList();
            return View(seasonViewModel);
        }
        [HttpPost]
        public ActionResult CreateSeason(SeasonViewModel seasonView)
        {
            DataAccess.CreateSeason(seasonView);

            return RedirectToAction("AdminHome", "Admin");
        }

    }
}