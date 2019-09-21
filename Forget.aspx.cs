using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Net.Mail;
using System.Web.Security;
using System.Text;

namespace EMS
{
    public partial class Forget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["EMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spResetPassword", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramUsername = new SqlParameter("@Username", txtForgetEmail.Text);

                cmd.Parameters.Add(paramUsername);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (Convert.ToBoolean(dr["ReturnCode"]))
                    {
                        SendPasswordResetEmail(dr["Email"].ToString(), txtForgetEmail.Text, dr["UniqueId"].ToString());
                        lblForgetMessage.Text = "An email with instructions to reset your password is sent to your registered email";
                    }
                    else
                    {
                        lblForgetMessage.ForeColor = System.Drawing.Color.Red;
                        lblForgetMessage.Text = "Username not found!";
                    }
                }
            }
        }

        private void SendPasswordResetEmail(string ToEmail, string UserName, string UniqueId)
        {
            // MailMessage class is present is System.Net.Mail namespace
            MailMessage mailMessage = new MailMessage("codewithprogrammer@gmail.com", ToEmail);
             // StringBuilder class is present in System.Text namespace
            StringBuilder sbEmailBody = new StringBuilder();
            sbEmailBody.Append("Dear " + UserName + ",<br/><br/>");
            sbEmailBody.Append("Please click on the following link to reset your password");
            sbEmailBody.Append("<br/>"); sbEmailBody.Append("https://localhost:44328/Password.aspx?uid=" + UniqueId);
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<b>By Utkarsh Patil.</b>");

            mailMessage.IsBodyHtml = true;

            mailMessage.Body = sbEmailBody.ToString();
            mailMessage.Subject = "Reset Your Password";
            SmtpClient smtpClient = new SmtpClient();

            smtpClient.Send(mailMessage);
        }

    }
}