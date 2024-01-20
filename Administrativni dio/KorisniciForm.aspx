<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Administracija.Master" CodeBehind="KorisniciForm.aspx.cs" Inherits="Administrativni_dio.KorisniciForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CssClass="table thead-dark">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="Korisničko ime" SortExpression="UserName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="Broj mobitela" SortExpression="PhoneNumber" />
            <asp:BoundField DataField="Address" HeaderText="Adresa" SortExpression="Address" />
            <asp:BoundField DataField="CreatedAt" HeaderText="Kreirano" SortExpression="CreatedAt" />
            <asp:BoundField DataField="DeletedAt" HeaderText="Izbrisano" SortExpression="DeletedAt" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RwaApartmaniConnectionString %>" SelectCommand="GetUsers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

</asp:Content>
