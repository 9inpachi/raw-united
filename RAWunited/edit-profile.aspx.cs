using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RAWunited
{
    public partial class edit_profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            else
            {
                if (HttpContext.Current.Request.HttpMethod != "POST")
                {
                    SqlDataReader userInfo = this.getUserInfo();
                    if (userInfo != null)
                    {
                        FullName.Text = userInfo["fullname"].ToString();
                        Username.Text = userInfo["username"].ToString();
                        Email.Text = userInfo["email"].ToString();
                        DateTime dob = Convert.ToDateTime(userInfo["dob"].ToString());
                        DOB.Text = String.Format("{0:yyyy-MM-dd}", dob);
                        userInfo.Close();
                    }
                    else
                    {
                        Result.Text = "Error getting user info";
                    }
                }
            }
        }

        protected void UpdateUserInfo_Click(object sender, EventArgs e) //Not correctly written
        {
            //Check if email and username exist
            string connectionString = WebConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string checkUser = "SELECT * FROM Users WHERE user_id != @cur_user_id AND (username = @username OR email = @email)";
            SqlCommand cmd = new SqlCommand(checkUser, con);
            SqlDataReader reader;
            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@username", Username.Text);
                cmd.Parameters.AddWithValue("@email", Email.Text);
                cmd.Parameters.AddWithValue("@cur_user_id", Session["user_id"]);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    reader.Close();
                    Result.ForeColor = System.Drawing.Color.FromName("Red");
                    Result.Text = "Username or Email already exists";
                }
                else
                {
                    reader.Close();
                    //Update user information
                    string updateUserInfo = "UPDATE Users SET fullname = @fullname, username = @username, email = @email, dob = @dob WHERE user_id = @user_id";
                    SqlCommand cmdUpdateInfo = new SqlCommand(updateUserInfo, con);
                    try
                    {
                        cmdUpdateInfo.Parameters.AddWithValue("@user_id", Session["user_id"]);
                        cmdUpdateInfo.Parameters.AddWithValue("@fullname", FullName.Text);
                        cmdUpdateInfo.Parameters.AddWithValue("@username", Username.Text);
                        cmdUpdateInfo.Parameters.AddWithValue("@email", Email.Text);
                        cmdUpdateInfo.Parameters.AddWithValue("@dob", DOB.Text);
                        if (cmdUpdateInfo.ExecuteNonQuery() > 0)
                        {
                            Result.ForeColor = System.Drawing.Color.FromName("Green");
                            Result.Text = "User information successfully updated";
                        }
                        else
                        {
                            Result.Text = "Error updating user information";
                        }
                    }
                    catch (Exception e1)
                    {
                        Result.Text = "Exception. Error updating user information.\n" + e1;
                    }
                }
                con.Close();
            }
            catch (Exception e1)
            {
                Result.ForeColor = System.Drawing.Color.FromName("Red");
                Result.Text = "Exception. There was an error registering." + e1;
            }
        }

        protected void UpdatePasswordBtn_Click(object sender, EventArgs e)
        {
            if(!NewPassword.Text.Equals(ConfirmNewPassword.Text)){
                ResultUpdatePassword.Text = "New Password and Confirm New Password donot match";
                return;
            }
            else
            {
                SqlDataReader userInfo = this.getUserInfo();
                if (userInfo != null)
                {
                    if (userInfo["password"].ToString().Equals(CurrentPassword.Text))
                    {
                        //Update user password
                        string connString = WebConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
                        SqlConnection con = new SqlConnection(connString);
                        string updateUserPassword = "UPDATE Users SET password = @newpassword WHERE user_id = @user_id";
                        SqlCommand cmdUpdatePassword = new SqlCommand(updateUserPassword, con);
                        try
                        {
                            con.Open();
                            cmdUpdatePassword.Parameters.AddWithValue("@user_id", Session["user_id"]);
                            cmdUpdatePassword.Parameters.AddWithValue("@newpassword", NewPassword.Text);
                            if (cmdUpdatePassword.ExecuteNonQuery() > 0)
                            {
                                ResultUpdatePassword.ForeColor = System.Drawing.Color.FromName("Green");
                                ResultUpdatePassword.Text = "User password successfully updated";
                            }
                            else
                            {
                                ResultUpdatePassword.Text = "Error updating user password";
                            }
                            con.Close();
                        }
                        catch (Exception e1)
                        {
                            ResultUpdatePassword.Text = "Exception. Error updating user password.";
                        }
                        userInfo.Close();
                    }
                    else
                    {
                        ResultUpdatePassword.Text = "Current password is not correct";
                    }
                }
                else
                {
                    ResultUpdatePassword.Text = "Error reading user data";
                }
            }
        }
        protected SqlDataReader getUserInfo()
        {
            //Get user information
            string connString = WebConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
            SqlConnection con = new SqlConnection(connString);
            string userInfo = "SELECT * FROM Users WHERE user_id = @user_id";
            SqlCommand cmd = new SqlCommand(userInfo, con);
            SqlDataReader reader;
            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@user_id", Session["user_id"]);
                reader = cmd.ExecuteReader();
                reader.Read();
                return reader;
            }
            catch (Exception e1)
            {
                Result.Text = "Exception in reading user data";
                return null;
            }
        }
    }
}