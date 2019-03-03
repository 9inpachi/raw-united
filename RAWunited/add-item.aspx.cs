using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RAWunited
{
    public partial class add_item : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
        }
        protected void AddItemBtn_Click(object sender, EventArgs e)
        {
            string it_title = TitleItem.Text;
            string it_category = Category.SelectedValue;
            string it_descr = Desc.Text;
            string pictures = "default.jpg";
            string path = "uploads/items/";
            int insertedID;

            string connString = WebConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
            SqlConnection con = new SqlConnection(connString);
            string insertItem = "INSERT INTO Items (user_id, title, category, descr, pictures) VALUES (@user_id, @title, @category, @descr, 'default.jpg');SELECT SCOPE_IDENTITY();";
            SqlCommand cmd = new SqlCommand(insertItem, con);
            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@user_id", Session["user_id"]);
                cmd.Parameters.AddWithValue("@title", it_title);
                cmd.Parameters.AddWithValue("@category", it_category);
                cmd.Parameters.AddWithValue("@descr", it_descr);
                insertedID = Convert.ToInt32(cmd.ExecuteScalar());

                //Pictures upload
                if (Pictures.HasFile)
                {
                    try
                    {
                        int photoCount = 0;
                        string fileName;
                        foreach (HttpPostedFile singlePic in Pictures.PostedFiles)
                        {
                            if (singlePic.ContentType.Contains("image"))
                            {
                                if (photoCount >= 5) break;
                                photoCount++;
                                String ext = System.IO.Path.GetExtension(singlePic.FileName);
                                fileName = "item-" + insertedID + "-p-" + photoCount + ext;
                                singlePic.SaveAs(Server.MapPath(".\\") + path + fileName);
                                if (photoCount == 1)
                                {
                                    pictures = fileName;
                                }
                                else
                                {
                                    pictures += "," + fileName;
                                }
                            }
                            else
                            {
                                Result.Text = "Only image files can be uploaded";
                                return;
                            }
                        }
                    }
                    catch (Exception e2)
                    {
                        Result.Text = "Exception. Error adding item." + e2;
                        return;
                    }
                }
                else
                {
                    Result.Text = "No file chosen";
                    return;
                }
                //End pictures upload

                string updatePics = "UPDATE Items SET pictures = @pictures WHERE item_id = @item_id";
                SqlCommand cmd1 = new SqlCommand(updatePics, con);
                cmd1.Parameters.AddWithValue("@pictures", pictures);
                cmd1.Parameters.AddWithValue("@item_id", insertedID);
                int picUpdateRes = cmd1.ExecuteNonQuery();
                if (picUpdateRes > 0)
                {
                    Result.ForeColor = System.Drawing.Color.FromName("Green");
                    Result.Text = "Item successfully added";
                    return;
                }
            }
            catch (Exception e1)
            {
                Result.Text = "Exception. Error adding item." + e1;
                return;
            }
        }
    }
}