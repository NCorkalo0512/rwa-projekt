using System;

namespace Administrativni_dio
{
    public partial class Administracija : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Username"] == null)
            {
                Response.Redirect("~/LoginForm.aspx");
            }
            LblIme.Text = Session["Username"].ToString();
        }
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Contents.RemoveAll();
            Response.Redirect("~/LoginForm.aspx");
        }
    }
}