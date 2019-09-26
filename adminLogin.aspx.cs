using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace EMS.Admin
{
    public partial class adminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblLoginError.Visible = false;
            if (!IsPostBack)
            {
                if (Request.Cookies["Admin"] != null && Request.Cookies["AdPassword"] != null)
                {
                    txtLoginEmail.Text = Request.Cookies["Admin"].Value;
                    txtLoginPass.Attributes["value"] = Request.Cookies["AdPassword"].Value;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            AuthenticateAdmin(txtLoginEmail.Text, txtLoginPass.Text);
        }
        private void AuthenticateAdmin(string username, string password)
        {
            // ConfigurationManager class is in System.Configuration namespace
            string CS = ConfigurationManager.ConnectionStrings["EMSConnectionString"].ConnectionString;



            // SqlConnection is in System.Data.SqlClient namespace
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spAuthenticateAdmin", con);
                cmd.CommandType = CommandType.StoredProcedure;

                //Formsauthentication is in system.web.security

                //sqlparameter is in System.Data namespace
                SqlParameter paramUsername = new SqlParameter("@Email", username);
                string encryptedpassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");

                SqlParameter paramPassword = new SqlParameter("@Password", encryptedpassword);

                cmd.Parameters.Add(paramUsername);
                cmd.Parameters.Add(paramPassword);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    int RetryAttempt = Convert.ToInt32(dr["RetryAttempt"]);
                    if (Convert.ToBoolean(dr["AccountLocked"]))
                    {
                        lblLoginError.Text = "Account locked. Please contact administrator";
                    }
                    else if (RetryAttempt > 0)
                    {
                        int AttemptsLeft = (4 - RetryAttempt);
                        lblLoginError.Text = "Invalid user name and/or password. " +
                            AttemptsLeft.ToString() + "attempt(s) left";
                    }
                    else if (Convert.ToBoolean(dr["Authenticated"]))
                    {
                        Session["Email"] = txtLoginEmail.Text;
                        Response.Redirect("~/Admin/Admin.aspx");
                    }
                    else
                    {
                        lblLoginError.Text = "Invalid User Name and/or Pasword";
                    }
                }
            }
        }
    }
}