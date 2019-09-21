using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace EMS
{
    public partial class ChangePass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["uid"] == null && User.Identity.Name == "")
            {
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["uid"] != null)
                {
                    if (!IsPasswordResetLinkValid())
                    {
                        lblLoginError.ForeColor = System.Drawing.Color.Red;
                        lblLoginError.Text = "Password Reset link has expired or is invalid";
                    }
                    //trCurrentPassword.Visible = false;
                }
                else if (User.Identity.Name != "")
                {
                    //trCurrentPassword.Visible = true;
                }
            }
        }

        private bool ExecuteSP(string SPName, List<SqlParameter> SPParameters)
        {
            string CS = ConfigurationManager.ConnectionStrings["EMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand(SPName, con);
                cmd.CommandType = CommandType.StoredProcedure;

                foreach (SqlParameter parameter in SPParameters)
                {
                    cmd.Parameters.Add(parameter);
                }

                con.Open();
                return Convert.ToBoolean(cmd.ExecuteScalar());
            }
        }

        private bool IsPasswordResetLinkValid()
        {
            List<SqlParameter> paramList = new List<SqlParameter>()
            {
                new SqlParameter()
                {
                    ParameterName = "@GUID",
                    Value = Request.QueryString["uid"]
                }
            };

            return ExecuteSP("spIsPasswordResetLinkValid", paramList);
        }

        private bool ChangeUserPassword()
        {
            List<SqlParameter> paramList = new List<SqlParameter>()
            {
                new SqlParameter()
                {
                    ParameterName = "@GUID",
                    Value = Request.QueryString["uid"]
                },
                new SqlParameter()
                {
                    ParameterName = "@Password",
                    Value = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPass.Text, "SHA1")
                }
            };

            return ExecuteSP("spChangePassword", paramList);
        }

        private bool ChangeUserPasswordUsingCurrentPassword()
        {
            List<SqlParameter> paramList = new List<SqlParameter>()
            {
                new SqlParameter()
                {
                    ParameterName = "@Username",
                    Value = User.Identity.Name
                },
                new SqlParameter()
                {
                    ParameterName = "@CurrentPassword",
                    Value = FormsAuthentication.HashPasswordForStoringInConfigFile(txtCurrentPass.Text, "SHA1")
                },
                new SqlParameter()
                {
                    ParameterName = "@NewPassword",
                    Value = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPass.Text, "SHA1")
                }
            };

            return ExecuteSP("spChangePasswordUsingCurrentPassword", paramList);
        }



        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            if ((Request.QueryString["uid"] != null && ChangeUserPassword()) ||
            (User.Identity.Name != "" && ChangeUserPasswordUsingCurrentPassword()))
            {
                lblLoginError.Text = "Password Changed Successfully!";
            }
            else
            {
                lblLoginError.ForeColor = System.Drawing.Color.Red;
                //if (trCurrentPassword.Visible)
                //{
                //    lblLoginError.Text = "Invalid Current Password!";
                //}
                //else
                //{
                //    lblLoginError.Text = "Password Reset link has expired or is invalid";
                //}
            }
        }
    }
}