<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Administracija.Master" CodeBehind="TagsForm.aspx.cs" Inherits="Administrativni_dio.TagsForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="jumbotron pt-0">
            <h1 class="display-4">Tagovi</h1>
            <div class="row py-2">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                    <asp:Label ID="Label2" runat="server" class="h5" Text="Tagovi s apartmanima"></asp:Label>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="ApartmentCount" HeaderText="Broj apartmana" ReadOnly="True" SortExpression="ApartmentCount" />
                        </Columns>
                    </asp:GridView>
                </div>
                </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                    <asp:Label ID="Label1" runat="server" class="h5" Text="Tagovi bez apartmana"></asp:Label>
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Ime" SortExpression="Name" />
                            <asp:BoundField DataField="NameEng" HeaderText="Ime engleski" SortExpression="NameEng" />
                            <asp:TemplateField HeaderText="" runat="server">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlDelete" runat="server" CssClass="btn btn-danger" Text="Briši" NavigateUrl='<%# Eval("Id","~/DeleteTagForm.aspx?id={0}")%>'>
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                </div>
                </div>

            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RwaApartmaniConnectionString %>" SelectCommand="GetTagsAndApartmentCount" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

            <div class="row py-2">
                <div class="card">
                    <div class="card-body">
                <asp:Label ID="Label3" class="h5 pl-2" runat="server" Text="Dodavanje taga na apartman: "></asp:Label>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Tag</th>
                            <th scope="col">Apartman</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <asp:DropDownList class="dropdown" ID="ddlTagName" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlApartment" class="dropdown" runat="server" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="Button1" class="btn-primary" runat="server" Text="Dodaj tag na apartman" OnClick="Button1_Click" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RwaApartmaniConnectionString %>" SelectCommand="GetTagsAndApartmentCountZero" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:RwaApartmaniConnectionString %>" SelectCommand="GetTagsAndZeroApartmentCount" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

            </div>
            </div>
            </div>
            <div class="row py-2">
                <div class="card">
                    <div class="card-body">
                <asp:Label ID="Label4" class="h5" runat="server" Text="Dodavanje novog taga"></asp:Label>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Tip taga</th>
                            <th scope="col">Naziv</th>
                            <th scope="col">Engleski naziv</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList1" class="dropdown" runat="server" DataSourceID="SqlDataSource5" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RwaApartmaniConnectionString %>" SelectCommand="SELECT * FROM [TagType]"></asp:SqlDataSource>
                            </td>
                            <td>
                                <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
                            </td>
                            <td>&nbsp;<asp:TextBox ID="tbNameEng" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnAddTag" class="btn-primary" runat="server" Text="Dodaj novi tag" OnClick="btnAddTag_Click" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RwaApartmaniConnectionString %>" DeleteCommand="delete from Tag where Tag.Id=@Id" SelectCommand="GetTagsAndApartmentCountZero" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

</asp:Content>
