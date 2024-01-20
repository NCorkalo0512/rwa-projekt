<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Administracija.Master" CodeBehind="DeleteTagForm.aspx.cs" Inherits="Administrativni_dio.DeleteTagForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

    <div class="form-group">
        <label>Ime taga</label>
        <asp:Label ID="lblImeTag" runat="server" CssClass="form-control"></asp:Label>
    </div>
    <div class="form-group">
        <label>Ime taga</label>
        <asp:Label ID="lblNameTag" runat="server" CssClass="form-control"></asp:Label>
    </div>

    <div>
        <asp:LinkButton ID="lbConfirmDelete" runat="server" Text="Potvrdi brisanje" CssClass="btn btn-danger" OnClick="lbConfirmDelete_Click" />
        <asp:LinkButton ID="lbBack" runat="server" Text="Odustani" CssClass="btn btn-primary" OnClick="lbBack_Click" />
    </div>
</asp:Content>
