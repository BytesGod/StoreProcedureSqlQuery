using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                lblWelcome.Text = "Welcome " + Session["Email"].ToString();
                lbAdminLogin.Text = "Logout";
            }
        }

        protected void lbAdminLogin_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Admin/adminLogin.aspx");
        }
    }
}