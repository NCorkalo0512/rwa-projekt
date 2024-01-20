using Administrativni_dio.Models;
using Administrativni_dio.Repositories.Apartment;
using System;
using System.Collections.Generic;

namespace Administrativni_dio
{
    public partial class HomeAdministracijaForm : System.Web.UI.Page
    {
        IApartmentRepository apartmentRepository = new ApartmentRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public List<Apartment> SelectApartments()
        {
            return apartmentRepository.SelectApartments();
        }

        protected void BtnSaveApartment_Click(object sender, EventArgs e)
        {
            Apartment newApartment = new Apartment
            {
                Name = tbName.Text,
                NameEng = tbNameEng.Text,
                Address = tbAddress.Text,
                CityID = int.Parse(ddlCity.SelectedValue),
                Price = int.Parse(tbPrice.Text),
                MaxAdults = int.Parse(ddlMaxAdults.SelectedValue),
                MaxChildren = int.Parse(ddlMaxChildren.SelectedValue),
                TotalRooms = int.Parse(ddlTotalRooms.SelectedValue),
                BeachDistance = int.Parse(ddlDistance.SelectedValue),
                OwnerID = int.Parse(ddlOwner.SelectedValue)
            };
            apartmentRepository.InsertApartment(newApartment);
            Response.Redirect("~/HomeAdministracijaForm.aspx");
        }
    }
}