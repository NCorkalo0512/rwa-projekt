<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Administracija.Master" CodeBehind="DeleteApartmentForm.aspx.cs" Inherits="Administrativni_dio.DeleteApartmentForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <div class="form-group">
        <label>Vlasnik</label>
        <asp:Label ID="lblApartmentOwner" runat="server" CssClass="form-control"></asp:Label>
    </div>
    <div class="form-group">
        <label>Naziv</label>
        <asp:Label ID="lblName" runat="server" CssClass="form-control"></asp:Label>
    </div>
    <div class="form-group">
        <label>Adresa</label>
        <asp:Label ID="lblAddress" runat="server" CssClass="form-control"></asp:Label>
    </div>
    <div class="form-group">
        <label>Grad</label>
        <asp:Label ID="lblCity" runat="server" CssClass="form-control"></asp:Label>
    </div>
    <div class="form-group">
        <label>Udaljenost od plaže</label>
        <asp:Label ID="lblBeachDistance" runat="server" CssClass="form-control"></asp:Label>
    </div>
    <div>
        <asp:LinkButton ID="lbConfirmDelete" runat="server" Text="Potvrdi brisanje" CssClass="btn btn-danger" OnClick="lbConfirmDelete_Click" />
        <asp:LinkButton ID="lbBack" runat="server" Text="Odustani" CssClass="btn btn-primary" OnClick="lbBack_Click" />
    </div>
</asp:Content>
