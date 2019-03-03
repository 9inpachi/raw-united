using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RAWunited
{
    public partial class view_item : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            if (Request.QueryString["item_id"] == null)
            {
                Response.Redirect("~/items-list.aspx");
            }
        }
        protected void ItemDetailInfoBound(Object Sender, RepeaterItemEventArgs e)
        {
            String pics = ((HiddenField)e.Item.FindControl("ItemPictures")).Value;
            String[] picsArr = pics.Split(',');
            DataTable dt = new DataTable();
            dt.Clear();
            dt.Columns.Add("picName");
            for (int i = 0; i < picsArr.Length; i++)
            {
                DataRow picRow = dt.NewRow();
                picRow["picName"] = picsArr[i];
                dt.Rows.Add(picRow);
            }
            ((Repeater)e.Item.FindControl("ImagesRepeater")).DataSource = dt;
            ((Repeater)e.Item.FindControl("ImagesRepeater")).DataBind();
            ((Repeater)e.Item.FindControl("ImagesThumbRepeater")).DataSource = dt;
            ((Repeater)e.Item.FindControl("ImagesThumbRepeater")).DataBind();
        }
        [WebMethod]
        public static string addRating(int ratingVal, int itemId)
        {
            int ratingValInt = Convert.ToInt16(ratingVal);
            int userId = Convert.ToInt32(HttpContext.Current.Session["user_id"]);
            string result = "";
            if (ratingValInt <= 0 || ratingValInt > 5)
            {
                result = "Rating is not valid";
            }
            string connectionString = WebConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string checkRating = "SELECT rating FROM ItemRating WHERE user_id = @user_id AND item_id = @item_id";
            SqlCommand cmd = new SqlCommand(checkRating, con);
            SqlDataReader reader;
            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@user_id", userId);
                cmd.Parameters.AddWithValue("@item_id", itemId);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    //If reader has returned a value then update
                    reader.Close();
                    string updateRating = "UPDATE ItemRating SET rating = @rating WHERE item_id = @item_id AND user_id = @user_id";
                    SqlCommand cmdUpdateRating = new SqlCommand(updateRating, con);
                    cmdUpdateRating.Parameters.AddWithValue("@item_id", itemId);
                    cmdUpdateRating.Parameters.AddWithValue("@user_id", userId);
                    cmdUpdateRating.Parameters.AddWithValue("@rating", ratingValInt);
                    if (cmdUpdateRating.ExecuteNonQuery() > 0)
                    {
                        result = "Rating successfully updated";
                    }
                    else
                    {
                        result = "Error updating rating";
                    }
                }
                else
                {
                    //If reader has returned no value then insert
                    reader.Close();
                    string insertRating = "INSERT INTO ItemRating (item_id, user_id, rating) VALUES (@item_id, @user_id, @rating)";
                    SqlCommand cmdInsertRating = new SqlCommand(insertRating, con);
                    cmdInsertRating.Parameters.AddWithValue("@item_id", itemId);
                    cmdInsertRating.Parameters.AddWithValue("@user_id", userId);
                    cmdInsertRating.Parameters.AddWithValue("@rating", ratingValInt);
                    if (cmdInsertRating.ExecuteNonQuery() == 1)
                    {
                        result = "Rating successfully inserted";
                    }
                    else
                    {
                        result = "Error inserting rating";
                    }
                }
                con.Close();
            }
            catch (Exception e1)
            {
                result = "Exception occured at e1\n"+e1;
            }
            return result;
        }

        protected void MyReviewBtn_Click(object sender, EventArgs e)
        {
            string review = MyReview.Text;
            int userId = Convert.ToInt32(Session["user_id"]);
            int itemId = Convert.ToInt32(Request.QueryString["item_id"]);
            string connString = WebConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
            SqlConnection con = new SqlConnection(connString);
            string checkReview = "SELECT * FROM ItemReviews WHERE user_id = @user_id AND item_id = @item_id";
            SqlCommand cmd = new SqlCommand(checkReview, con);
            SqlDataReader reader;
            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@user_id", userId);
                cmd.Parameters.AddWithValue("@item_id", itemId);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    reader.Close();
                    //Update review
                    string updateReview = "UPDATE ItemReviews SET review = @review WHERE user_id = @user_id and item_id = @item_id";
                    SqlCommand cmdUpdateReview = new SqlCommand(updateReview, con);
                    try
                    {
                        cmdUpdateReview.Parameters.AddWithValue("@review", review);
                        cmdUpdateReview.Parameters.AddWithValue("@user_id", userId);
                        cmdUpdateReview.Parameters.AddWithValue("@item_id", itemId);
                        if (cmdUpdateReview.ExecuteNonQuery() > 0)
                        {
                            PersonalReviewRes.Style.Add("color", "green");
                            PersonalReviewRes.InnerText = "Review successfully updated";
                        }
                        else
                        {
                            PersonalReviewRes.Style.Add("color", "red");
                            PersonalReviewRes.InnerText = "Error adding review";
                        }
                    }
                    catch (Exception e1)
                    {
                        PersonalReviewRes.Style.Add("color", "red");
                        PersonalReviewRes.InnerText = "Error reviewing\n"+e1;
                    }
                }
                else
                {
                    reader.Close();
                    //Insert review
                    string insertReview = "INSERT INTO ItemReviews (user_id, item_id, review) VALUES (@user_id, @item_id, @review)";
                    SqlCommand cmdInsertReview = new SqlCommand(insertReview, con);
                    try
                    {
                        cmdInsertReview.Parameters.AddWithValue("@user_id", userId);
                        cmdInsertReview.Parameters.AddWithValue("@item_id", itemId);
                        cmdInsertReview.Parameters.AddWithValue("@review", review);
                        if (cmdInsertReview.ExecuteNonQuery() > 0)
                        {
                            PersonalReviewRes.Style.Add("color", "green");
                            PersonalReviewRes.InnerText = "Review successfully added";
                        }
                        else
                        {
                            PersonalReviewRes.Style.Add("color", "red");
                            PersonalReviewRes.InnerText = "Error adding review";
                        }
                    }
                    catch (Exception e1)
                    {
                        PersonalReviewRes.Style.Add("color", "red");
                        PersonalReviewRes.InnerText = "Error reviewing\n" + e1;
                    }
                }
                con.Close();
            }
            catch (Exception e1)
            {

            }
        }
    }
}