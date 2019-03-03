using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace RAWunited
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] != null)
            {
                Response.Redirect("/");
            }
        }
        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string checkUser = "SELECT * FROM Users WHERE username = @username AND password = @password";
            SqlCommand cmd = new SqlCommand(checkUser, con);
            SqlDataReader reader;
            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@username", loginUsername.Text);
                cmd.Parameters.AddWithValue("@password", loginPassword.Text);
                reader = cmd.ExecuteReader();
                reader.Read();
                if (reader["user_id"] != null)
                {
                    Session["user_id"] = reader["user_id"];
                    Session["username"] = reader["username"];
                    Console.WriteLine("User logged in successfully");
                    if (reader["username"].Equals("admin"))
                    {
                        Response.Redirect("~/admin/");
                    }
                    else
                    {
                        Response.Redirect("~/");
                    }
                }
                else
                {
                    Result.Text = "Error logging in";
                }
                reader.Close();
                con.Close();
            }
            catch (Exception e1)
            {
                Result.Text = "Exception. There was an error logging in.";
            }
        }
    }
}