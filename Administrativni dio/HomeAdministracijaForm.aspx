<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Administracija.Master" CodeBehind="HomeAdministracijaForm.aspx.cs" Inherits="Administrativni_dio.HomeAdministracijaForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>


    <asp:Label ID="lblApartmentList" runat="server" Text="Lista svih apartmana" CssClass="h3"></asp:Label>


    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="ApartmentId,OwnerId,ApartmentStatusId,CityId" class="table table-striped " DataSourceID="SqlDataSource" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" PageSize="3" Font-Size="Small">
            <Columns>
                <asp:BoundField DataField="ApartmentId" HeaderText="ApartmentId" InsertVisible="False" ReadOnly="True" SortExpression="ApartmentId" Visible="False" />
                <asp:BoundField DataField="CreatedAt" HeaderText="Kreiran" SortExpression="CreatedAt" ApplyFormatInEditMode="False" />
                <asp:BoundField DataField="Name" HeaderText="Ime" SortExpression="Name" />
                <asp:BoundField DataField="NameEng" HeaderText="Ime engleski" SortExpression="NameEng" />
                <asp:BoundField DataField="ApartmentOwnerEng" HeaderText="Vlasnik" SortExpression="ApartmentOwnerEng" ReadOnly="True" />
                <asp:BoundField DataField="ApartmentStatus" HeaderText="Status" SortExpression="ApartmentStatus" />
                <asp:BoundField DataField="City" HeaderText="Grad" SortExpression="City" ReadOnly="True" />
                <asp:BoundField DataField="Address" HeaderText="Adresa" SortExpression="Address" />
                <asp:BoundField DataField="Price" HeaderText="Cijena" SortExpression="Price" />
                <asp:BoundField DataField="MaxAdults" HeaderText="Max odraslih" SortExpression="MaxAdults" />
                <asp:BoundField DataField="MaxChildren" HeaderText="Max djece" SortExpression="MaxChildren" />
                <asp:BoundField DataField="TotalRooms" HeaderText="Broj soba" SortExpression="TotalRooms" />
                <asp:BoundField DataField="BeachDistance" HeaderText="Udaljenost od plaže" SortExpression="BeachDistance" />
                <asp:BoundField DataField="DeletedAt" HeaderText="Izbrisan" SortExpression="DeletedAt" ReadOnly="True" />
                <asp:BoundField DataField="NameEng" HeaderText="Ime engleski" SortExpression="NameEng" Visible="False" />
                <asp:CommandField ShowEditButton="True" CancelText="Odustani" DeleteText="Izbriši" EditText="Uredi" InsertText="Unesi" NewText="Novo" SelectText="Odaberi" UpdateText="Ažuriraj">
                    <ControlStyle CssClass="btn" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlDelete" runat="server" CssClass="btn btn-danger" Text="Briši" NavigateUrl='<%# Eval("ApartmentId","~/DeleteApartmentForm.aspx?id={0}")%>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlStatus" runat="server" CssClass="btn btn-warning" Text="Status" NavigateUrl='<%# Eval("ApartmentId","~/StatusApartmentForm.aspx?id={0}")%>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </div>
    <br />
    <asp:Label ID="lblAdApartment" runat="server" Text="Dodavanje novog apartmana" CssClass="h3"></asp:Label>
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Ime</th>
                    <th scope="col">Ime engleski</th>
                    <th scope="col">Adresa</th>
                    <th scope="col">Grad</th>
                    <th scope="col">Cijena</th>
                    <th scope="col">Max odraslih</th>
                    <th scope="col">Max djece</th>
                    <th scope="col">Broj soba</th>
                    <th scope="col">Udaljenost od plaže</th>
                    <th scope="col">Vlasnik</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <asp:TextBox ID="tbName" runat="server" ValidateRequestMode="Inherit" ViewStateMode="Inherit"></asp:TextBox></td>
                    <td>
                        <asp:TextBox ID="tbNameEng" runat="server" ValidateRequestMode="Inherit" ViewStateMode="Inherit"></asp:TextBox></td>
                    <td>
                        <asp:TextBox ID="tbAddress" runat="server" ValidateRequestMode="Inherit" ViewStateMode="Inherit"></asp:TextBox></td>
                    <td>
                        <asp:DropDownList ID="ddlCity" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id"></asp:DropDownList></td>
                    <td>
                        <asp:TextBox ID="tbPrice" runat="server" ValidateRequestMode="Inherit" ViewStateMode="Inherit"></asp:TextBox></td>
                    <td>
                        <asp:DropDownList ID="ddlMaxAdults" runat="server">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:DropDownList ID="ddlMaxChildren" runat="server">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:DropDownList ID="ddlTotalRooms" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:DropDownList ID="ddlDistance" runat="server">
                            <asp:ListItem Value="50">50m</asp:ListItem>
                            <asp:ListItem Value="100">100m</asp:ListItem>
                            <asp:ListItem Value="150">150m</asp:ListItem>
                            <asp:ListItem Value="200">200m</asp:ListItem>
                            <asp:ListItem Value="500">500m</asp:ListItem>
                            <asp:ListItem Value="1000">1km</asp:ListItem>
                            <asp:ListItem Value="2000">2km</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:DropDownList ID="ddlOwner" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:RwaApartmaniConnectionString %>" SelectCommand="GetApartmentOwners" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RwaApartmaniConnectionString %>" SelectCommand="GetUsers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Button ID="btnSaveApartment" runat="server" Text="Add" OnClick="BtnSaveApartment_Click" /></td>
                </tr>
            </tbody>
        </table>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RwaApartmaniConnectionString %>" SelectCommand="GetGradovi" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RwaApartmaniConnectionString %>" SelectCommand="SelectApartments" SelectCommandType="StoredProcedure" DeleteCommand="update Apartment
	set DeletedAt=GETDATE()
	where Apartment.Id=@Id"
        InsertCommand="InsertApartment" InsertCommandType="StoredProcedure" UpdateCommand="update [Apartment]
set 
 [Address]=@Address, 
[Name]= @Name,
[NameEng]= @NameEng,
 [Price]=@Price, 
 [MaxAdults]=@MaxAdults, 
[MaxChildren]= @MaxChildren,
[TotalRooms]= @TotalRooms, 
[BeachDistance]=@BeachDistance 
where
 [Id]=@ApartmentId ">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="NameEng" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="MaxAdults" Type="Int32" />
            <asp:Parameter Name="MaxChildren" Type="Int32" />
            <asp:Parameter Name="TotalRooms" Type="Int32" />
            <asp:Parameter Name="BeachDistance" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="NameEng" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="MaxAdults" Type="Int32" />
            <asp:Parameter Name="MaxChildren" Type="Int32" />
            <asp:Parameter Name="TotalRooms" Type="Int32" />
            <asp:Parameter Name="BeachDistance" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ObjectDataSource ID="ObjectApartmani" runat="server"></asp:ObjectDataSource>


</asp:Content>
