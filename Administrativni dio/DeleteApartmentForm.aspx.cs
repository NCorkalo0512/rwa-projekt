using Administrativni_dio.Repositories.Apartment;
using System;
using System.Linq;

namespace Administrativni_dio
{
    public partial class DeleteApartmentForm : System.Web.UI.Page
    {
        ApartmentRepository apartmentRepository;
        public DeleteApartmentForm()
        {
            apartmentRepository = new ApartmentRepository();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string qryStrId = Request.QueryString["id"];
            int? id = null;
            if (!string.IsNullOrEmpty(qryStrId))
            {

                id = int.Parse(qryStrId);
                var dbApartment = apartmentRepository.SelectApartments().Where(x => x.IDApartment == id.Value).FirstOrDefault();
                SetFormApartment(dbApartment);
            }
        }

        private void SetFormApartment(Models.Apartment dbApartment)
        {
            lblApartmentOwner.Text = dbApartment.ApartmentOwner;
            lblName.Text = dbApartment.ApartmentName;
            lblAddress.Text = dbApartment.Address;
            lblBeachDistance.Text = dbApartment.BeachDistance.ToString();
            lblCity.Text = dbApartment.City;
        }

        protected void lbConfirmDelete_Click(object sender, EventArgs e)
        {
            string qryStrId = Request.QueryString["id"];
            var id = int.Parse(qryStrId);
            apartmentRepository.DeleteApartman(id);
            Response.Redirect("HomeAdministracijaForm.aspx");
        }

        protected void lbBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeAdministracijaForm.aspx");
        }
    }
}