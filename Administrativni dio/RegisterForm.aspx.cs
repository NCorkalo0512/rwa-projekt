using Administrativni_dio.Models;
using Administrativni_dio.Repositories.User;
using System;

namespace Administrativni_dio
{
    public partial class RegisterForm : System.Web.UI.Page
    {
        IUserRepository userRepository = new UserRepository();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var user = new AspNetUsers
            {
                UserName = txtUsername.Text,
                PasswordHash = txtPassword.Text,
                Email = txtEmail.Text,
                Address = txtAddress.Text,
                PhoneNumber = txtPhone.Text
            };
            userRepository.RegisterUser(user);
            Response.Redirect("~/LoginForm.aspx");
        }
    }
}