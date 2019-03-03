using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RAWunited
{
    public partial class items_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
        }
        //protected void ItemListDataBound(Object Sender, RepeaterItemEventArgs e)
        //{
        //    Repeater itemRating = (Repeater)e.Item.FindControl("ItemRatingRepeater");
        //    itemRating.DataBind();
        //}
    }
}