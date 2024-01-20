<%@ Page Title="" Language="C#" MasterPageFile="~/Administracija.Master" AutoEventWireup="true" CodeBehind="StatusApartmentForm.aspx.cs" Inherits="Administrativni_dio.StatusApartmentForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <asp:Label runat="server" Text="Promjena statusa apartmana"></asp:Label>

        <asp:Label runat="server" Text="Ime apartmana"></asp:Label>

        <asp:Label ID="lblName" runat="server" Text=""></asp:Label>

        <asp:DropDownList ID="ddlStatus" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id"></asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RwaApartmaniConnectionString %>" SelectCommand="Select * FROm APartmentStatus"></asp:SqlDataSource>

        <asp:Label runat="server" Text="Osoba za apartman"></asp:Label>

        <asp:DropDownList ID="ddlUser" runat="server" DataSourceID="SqlDataSource2" DataTextField="UserName" DataValueField="Id"></asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RwaApartmaniConnectionString %>" SelectCommand="SELECT * FROM [AspNetUsers]"></asp:SqlDataSource>

        <div>
            <asp:LinkButton ID="lbSave" runat="server" Text="Potvrdi spremanje" CssClass="btn btn-success" OnClick="lbSave_Click" />
            <asp:LinkButton ID="lbBack" runat="server" Text="Odustani" CssClass="btn btn-primary" OnClick="lbBack_Click" />
        </div>
    </div>

</asp:Content>

