using Administrativni_dio.Repositories.User;
using System;

namespace Administrativni_dio
{
    public partial class LoginForm : System.Web.UI.Page
    {
        IUserRepository userRepository = new UserRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Focus();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var user = userRepository.LoginUser(txtEmail.Text, txtPassword.Text);
            if (user != null)
            {
                Session["Username"] = user.UserName;
                Session["EMail"] = user.Email;
                Session["User"] = user;
                if (user.Email == "admin@mail.hr")
                {
                    Response.Redirect("~/HomeAdministracijaForm.aspx");
                }
                Response.Redirect("~/HomeApartmani");
            }
            else
            {
                lblError.Text = "Krivi korisnički podaci";
                ClearForm();
            }
        }

        private void ClearForm()
        {
            txtEmail.Text = "";
            txtPassword.Text = "";
        }
    }
}