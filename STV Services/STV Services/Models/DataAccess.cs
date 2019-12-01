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

        public static List<StreamingSrevice> GetStreamingSrevices()
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
    }
}