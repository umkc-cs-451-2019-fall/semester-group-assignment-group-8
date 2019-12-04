using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace STV_Services.Models
{
    public static class DataAccess
    {
        public static User GetUserInfo(string username)
        {
            User user_info = new User();
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("get_UserInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user_name", username);

                con.Open();
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    user_info.Username = rdr["username"].ToString();
                    user_info.Firstname = rdr["usrFirstName"].ToString();
                    user_info.Lastname = rdr["usrLastName"].ToString();
                    user_info.Email = rdr["usrEmail"].ToString();
                    user_info.Password = rdr["usrpassword"].ToString();
                    user_info.Permission = Convert.ToChar(rdr["usrPermission"]);
                    user_info.DateOfBirth = rdr["usrDateOfBirth"].ToString();
                }
                con.Close();
            }


                return user_info;
        }

        public static List<StreamingSrevice> GetUserFav()
        {
            List<StreamingSrevice> StreamingServices = new List<StreamingSrevice>();

            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("get_StreamingServices", con);
                cmd.CommandType = CommandType.StoredProcedure;


                con.Open();
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    StreamingSrevice streamingSrevice = new StreamingSrevice();
                    streamingSrevice.ServiceName = rdr["ServiceName"].ToString();
                    streamingSrevice.Description = rdr["Description"].ToString();
                    StreamingServices.Add(streamingSrevice);
                }
                con.Close();
            }
            return StreamingServices;
        }

        public static bool IsStreamExist(string srevice)
        {
            bool isExist = false;

            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("get_StreamingServiceInfo", con);
                cmd.Parameters.AddWithValue("@ss", srevice);
                cmd.CommandType = CommandType.StoredProcedure;


                con.Open();
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {

                    isExist = true;
                }
                con.Close();
            }
            return isExist ;
        }

        public static void CreateStreamingService(StreamingSrevice srevice)
        {
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("create_StreamingService", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@servicename", srevice.ServiceName);
                cmd.Parameters.AddWithValue("@descr", srevice.Description);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public static bool IsUserExist(string username)
        {
            bool isExist = false;

            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("get_UserInfo", con);
                cmd.Parameters.AddWithValue("@user_name", username);
                cmd.CommandType = CommandType.StoredProcedure;


                con.Open();
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    isExist = true;
                }
                con.Close();
            }
            return isExist;
        }

        public static void CreateNewAccount(Register newUser)
        {
            
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("create_new_user", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@usrnm", newUser.Username);
                cmd.Parameters.AddWithValue("@Fname", newUser.Firstname);
                cmd.Parameters.AddWithValue("@Lname", newUser.Lastname);
                cmd.Parameters.AddWithValue("@email", newUser.Email);
                cmd.Parameters.AddWithValue("@password", newUser.Password);
                cmd.Parameters.AddWithValue("@dob", newUser.DateOfBirth);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public static void CreateReport(Report report)
        {
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("create_new_report", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ttl", report.Title);
                cmd.Parameters.AddWithValue("@descr", report.Description);
                cmd.Parameters.AddWithValue("@type", report.Type.ToString());
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public static List<Report> GetReports()
        {
            List<Report> reports = new List<Report>();
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            MySqlConnection con = new MySqlConnection(constr);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("get_all_reports", con);
            cmd.CommandType = CommandType.StoredProcedure;

            using (MySqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    Report report = new Report
                    {
                        ReportID = reader.GetInt32(0),
                        Title = reader.GetString(1),
                        Description = reader.GetString(2),
                    };
                    string val = reader.GetString(3);
                    var type = (ReportType)Enum.Parse(typeof(ReportType), val);
                    report.Type = type;
                    reports.Add(report);
                }
            }
            con.Close();

        return reports;
        }

        public static void DeleteReport(int? id)
        {
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("delete_report", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@reportID", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public static List<string> getStreamingServices()
        {
            List<string> services = new List<string>();

            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("get_StreamingServices", con);
                cmd.CommandType = CommandType.StoredProcedure;


                con.Open();
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {

                    services.Add(rdr["ServiceName"].ToString());
                }
                con.Close();
            }
                return services;
        }

        public static void CreateNewPackage(PackageViewModel package)
        {
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("create_NewPackage", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@servicename", package.package.ServiceName);
                cmd.Parameters.AddWithValue("@pkgname", package.package.PackageName);
                cmd.Parameters.AddWithValue("@descr", package.package.Description);
                cmd.Parameters.AddWithValue("@prc", package.package.Price);
              
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }



            foreach (Channel channel in package.Channels.ToList())
            {
                if (channel.Checked == true)
                {
                    DataAccess.AddChannelToPackage(DataAccess.getPackageID(package.package.PackageName),channel.ChannelName);
                }
            }
        }

        public static List<Channel> GetChannels()
        {
            List<Channel> channels = new List<Channel>();
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {

                MySqlCommand cmd = new MySqlCommand("get_channels", con);
                cmd.CommandType = CommandType.StoredProcedure;


                con.Open();
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Channel channel = new Channel();
                    channel.ChannelName = rdr["ChannelName"].ToString();
                    channel.Description = rdr["Description"].ToString();
                    channel.Checked = false;
                    channels.Add(channel);
                }
                con.Close();
            }
            return channels;
        }

        public static List<string> GetChannelsName()
        {
            List<string> channels = new List<string>();
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {

                MySqlCommand cmd = new MySqlCommand("get_channels", con);
                cmd.CommandType = CommandType.StoredProcedure;


                con.Open();
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Channel channel = new Channel();
                    channel.ChannelName = rdr["ChannelName"].ToString();
                    channel.Description = rdr["Description"].ToString();
                    channel.Checked = false;
                    channels.Add(channel.ChannelName);
                }
                con.Close();
            }
            return channels;
        }

        public static void AddChannelToPackage(int packageID, string channel)
        {
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("AddChannelToPackage", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@pkgID", packageID);
                cmd.Parameters.AddWithValue("@chnl", channel);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public static int getPackageID(string PackageName)
        {
            int PackageID = 0;
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {


                MySqlCommand cmd = new MySqlCommand("get_packageInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name", PackageName);


                con.Open();
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Channel channel = new Channel();
                    PackageID = Convert.ToInt32(rdr["PackageID"]);
                }
                con.Close();
            }
            return PackageID;
        }

        public static List<PackageModel> GetPackages()
        {
            List<PackageModel> packages = new List<PackageModel>();
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {

                MySqlCommand cmd = new MySqlCommand("get_package", con);
                cmd.CommandType = CommandType.StoredProcedure;


                con.Open();
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    PackageModel package = new PackageModel();
                    package.PackageID = Convert.ToInt32(rdr["PackageID"]);
                    package.ServiceName = rdr["ServiceName"].ToString();
                    package.PackageName = rdr["PackName"].ToString();
                    package.Description = rdr["Description"].ToString();
                    package.Price = Convert.ToInt32(rdr["Price"]);
                    packages.Add(package);
                }
                con.Close();
            }
            return packages;
        }

        public static bool IsChannelExist(string channel_name)
        {

            bool isExist = false;

            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("get_channel", con);
                cmd.Parameters.AddWithValue("@name", channel_name);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    isExist = true;
                }
                con.Close();
            }
            return isExist;
        }

        public static void CreateChannel(Channel channel)
        {
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("create_channel", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@chnl_name", channel.ChannelName);
                cmd.Parameters.AddWithValue("@dscrp", channel.Description);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public static bool VerifyUser(User user)
        {
            bool isExist = false;
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("verfiy_user", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user_name", user.Username);
                cmd.Parameters.AddWithValue("@pass", user.Password);
                con.Open();
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    isExist = true;
                    user.Username = rdr["username"].ToString();
                    user.Permission = Convert.ToChar(rdr["usrPermission"]);

                }
                con.Close();
            }
            return isExist;
        }

        /*public static User GetUserInfo(User user)
        {
            User user_info = new User();

            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("verfiy_user", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user_name", user.Username);
                con.Open();
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    user_info.Username = rdr["username"].ToString();
                    user_info.Permission = Convert.ToChar(rdr["usrPermission"]);
                    
                }
                con.Close();
            }

            return user_info;
        }*/

        public static void UpdateUserInfo(User user)
        {
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("update_userInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@usrname", user.Username);
                cmd.Parameters.AddWithValue("@firstname", user.Firstname);
                cmd.Parameters.AddWithValue("@lastname", user.Lastname);
                cmd.Parameters.AddWithValue("@email", user.Email);
                cmd.Parameters.AddWithValue("@password", user.Password);
                cmd.Parameters.AddWithValue("@dob", user.DateOfBirth);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public static void CreateShow(ShowViewModel showViewModel)
        {
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("create_show", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name", showViewModel.show.ShowName);
                cmd.Parameters.AddWithValue("@chnl", showViewModel.show.ChannelName);
                cmd.Parameters.AddWithValue("@descr", showViewModel.show.Description);
                cmd.Parameters.AddWithValue("@DOR", showViewModel.show.DateofRelease);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public static List<Show> GetShows()
        {
            List<Show> shows = new List<Show>();
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {

                MySqlCommand cmd = new MySqlCommand("get_shows", con);
                cmd.CommandType = CommandType.StoredProcedure;


                con.Open();
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Show show = new Show();
                    show.ShowName = rdr["ShowName"].ToString();
                    show.ChannelName = rdr["ChannelName"].ToString();
                    show.Description = rdr["Description"].ToString();
                    show.DateofRelease = rdr["DateOfRelease"].ToString();
                    shows.Add(show);
                }
                con.Close();
            }
            return shows;
        }

        public static List<string> GetShowsList()
        {
            List<string> shows = new List<string>();
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {

                MySqlCommand cmd = new MySqlCommand("get_shows", con);
                cmd.CommandType = CommandType.StoredProcedure;


                con.Open();
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Show show = new Show();
                    show.ChannelName = rdr["ShowName"].ToString();
                    shows.Add(show.ChannelName);
                }
                con.Close();
            }
            return shows;
        }

        public static void CreateSeason(SeasonViewModel seasonViewModel)
        {
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                MySqlCommand cmd = new MySqlCommand("create_season", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@showname", seasonViewModel.season.ShowName);
                cmd.Parameters.AddWithValue("@epsd", seasonViewModel.season.EpisodesNumber);
                cmd.Parameters.AddWithValue("@SesnTitle", seasonViewModel.season.SeasonTitle);
                cmd.Parameters.AddWithValue("@descrp", seasonViewModel.season.Description);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public static List<Show> GetUserFav(string usernam)
        {
            List<Show> shows = new List<Show>();
            using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {

                MySqlCommand cmd = new MySqlCommand("get_userFav", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@usrnam", usernam);


                con.Open();
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Show show = new Show();
                    show.ShowName = rdr["ShowName"].ToString();
                    show.ChannelName = rdr["ChannelName"].ToString();
                    show.Description = rdr["Description"].ToString();
                    show.DateofRelease = rdr["DateOfRelease"].ToString();
                    shows.Add(show);
                }
                con.Close();
            }
            return shows;
        }
    }
}