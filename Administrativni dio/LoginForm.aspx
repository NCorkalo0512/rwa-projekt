<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="Administrativni_dio.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <section class="vh-100 gradient-custom">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                            <div class="card bg-dark text-white" style="border-radius: 1rem;">
                                <div class="card-body p-5 text-center">
                                    <div class="mb-md-5 mt-md-4 pb-5">
                                        <h2 class="fw-bold mb-2 text-uppercase">Login - Apartment App RWA</h2>
                                        <p class="text-white-50 mb-5">Please enter your email and password!</p>
                                        <div class="form-outline form-white mb-4">
                                            <asp:TextBox ID="txtEmail" runat="server" class="form-control form-control-lg" required></asp:TextBox>
                                            Email
                                        </div>
                                        <div class="form-outline form-white mb-4">
                                            <asp:TextBox ID="txtPassword" runat="server" class="form-control form-control-lg" required TextMode="Password"></asp:TextBox>
                                            <label class="form-label" for="typePasswordX">Password</label>
                                        </div>
                                        <asp:Button ID="btnLogin" runat="server" Text="Login" type="submit" class="btn btn-outline-light btn-lg px-5" OnClick="btnLogin_Click" />
                                        <div class="d-flex justify-content-center text-center mt-4 pt-1">
                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/HomeApartmani" class="btn btn-outline-light btn-lg px-5">Gost</asp:HyperLink>
                                        </div>
                                        <div class="d-flex justify-content-center text-center pt-1">
                                            <asp:Label ID="lblError" runat="server"></asp:Label>
                                            <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                                            <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                                            <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
                                        </div>
                                    </div>
                                    <div>
                                        <p class="mb-0">
                                            Don't have an account?
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RegisterForm.aspx">Sign up!</asp:HyperLink>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
