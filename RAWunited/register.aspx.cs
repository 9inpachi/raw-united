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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] != null)
            {
                Response.Redirect("/");
            }
        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string checkUser = "SELECT * FROM Users WHERE username = @username OR email = @email";
            SqlCommand cmd = new SqlCommand(checkUser, con);
            SqlDataReader reader;
            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@username", Username.Text);
                cmd.Parameters.AddWithValue("@email", Email.Text);
                reader = cmd.ExecuteReader();
                if (reader.Read() && Username.Text.Equals(reader["username"]))
                {
                    Result.ForeColor = System.Drawing.Color.FromName("Red");
                    Result.Text = "Username already exists";
                }
                else
                {
                    reader.Close();
                    string insertUser = "INSERT INTO Users (username, email, fullname, dob, password) VALUES (@username, @email, @fullname, @dob, @password)";
                    SqlCommand cmd1 = new SqlCommand(insertUser, con);
                    cmd1.Parameters.AddWithValue("@username", Username.Text);
                    cmd1.Parameters.AddWithValue("@email", Email.Text);
                    cmd1.Parameters.AddWithValue("@fullname", FullName.Text);
                    cmd1.Parameters.AddWithValue("@dob", DOB.Text);
                    cmd1.Parameters.AddWithValue("@password", Password.Text);
                    try
                    {
                        if (cmd1.ExecuteNonQuery() == 1)
                        {
                            Result.ForeColor = System.Drawing.Color.FromName("Green");
                            Result.Text = "User successfully registered";
                        }
                        else
                        {
                            Result.Text = "There was an error registering the user";
                        }
                    }
                    catch (Exception e1)
                    {
                        Result.ForeColor = System.Drawing.Color.FromName("Red");
                        Result.Text = "There was an error registering the user. " +e1;
                    }
                }
                con.Close();
            }
            catch (Exception e1)
            {
                Result.ForeColor = System.Drawing.Color.FromName("Red");
                Result.Text = "Exception. There was an error registering."+e1;
            }
        }
    }
}