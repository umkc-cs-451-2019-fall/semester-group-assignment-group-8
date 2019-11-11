using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using STV.Models;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Threading.Tasks;

namespace STV.Controllers
{
    public class ShowsController : Controller
    {
        // GET: Shows

        //Display all the available shows on the database
        public ActionResult Shows()
        {

            List<Shows> shows = new List<Shows>();

            //setting variable to connection string
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                con.Open();

                //Query the database for all the available shows
                string query = "select * from shows;";
 
                MySqlCommand cmd = new MySqlCommand(query, con);
                using (MySqlDataReader sdr = cmd.ExecuteReader())
                {
                    
                    while (sdr.Read())
                    {
                        Shows show = new Shows();
                        show.ShowName = sdr.GetString(0);
                        show.ChannelName = sdr.GetString(1);
                        show.Description = sdr.GetString(2);
                        show.DateOfRelease = sdr.GetDateTime(3);


                        shows.Add(show);

                    }

                }
                con.Close();
                return View(shows);
            }


        }

        //Search the list of shows using the search input
        public ActionResult Search(string searchString)
        {
            List<Shows> shows_search = new List<Shows>();
            string text = searchString;

            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString; //setting variable to connection string

            using (MySqlConnection con = new MySqlConnection(constr))
            {
                con.Open();

                //Query the database for shows where the name is similar to the search input
                string query = "select * from shows where ShowName like'%" + text + "%';";
                MySqlCommand cmd = new MySqlCommand(query, con);
                using (MySqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        Shows show = new Shows();
                        show.ShowName = sdr.GetString(0);
                        show.ChannelName = sdr.GetString(1);
                        show.Description = sdr.GetString(2);
                        show.DateOfRelease = sdr.GetDateTime(3);

                        shows_search.Add(show);
                    }
                }

                con.Close();
                return View("Shows",shows_search);
            }

        }

        //Display the details of the selected show
        public ActionResult Details(string id)
        {
            Shows show = new Shows();
            show.show_service = new List<Shows>();
            string text = id;

            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString; //setting variable to connection string

            using (MySqlConnection con = new MySqlConnection(constr))
            {
                con.Open();

                //Query the database for the show that matches the selected show
                string query = "select * from shows where ShowName= '" + text + "';";

                MySqlCommand cmd = new MySqlCommand(query, con);
                using (MySqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    show.ShowName = sdr.GetString(0);
                    show.ChannelName = sdr.GetString(1);
                    show.Description = sdr.GetString(2);
                    show.DateOfRelease = sdr.GetDateTime(3);
                }

    
                //Query the database for the show and associated details
                query = "select * from showlist where ShowName= '" + show.ShowName + "';";
 
                cmd = new MySqlCommand(query, con);
                using (MySqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        Shows show_ex = new Shows();
                        show_ex.ShowName = show.ShowName;
                        show_ex.ChannelName = show.ChannelName;
                        show_ex.Description = show.Description;
                        show_ex.DateOfRelease = show.DateOfRelease;
                        show_ex.ServiceName = sdr.GetString(2);
                        show_ex.Seasons = sdr.GetInt16(3);
                        show_ex.Episodes = sdr.GetInt16(4);

                        show.show_service.Add(show_ex);
                    }
                    
                }
                
                con.Close();
                return View(show);
            }
           
        }

        

    }
}