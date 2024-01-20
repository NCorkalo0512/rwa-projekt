using Administrativni_dio.Repositories.Apartment;
using System;
using System.Linq;

namespace Administrativni_dio
{
    public partial class StatusApartmentForm : System.Web.UI.Page
    {
        ApartmentRepository apartmentRepository;
        public StatusApartmentForm()
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
            lblName.Text = dbApartment.ApartmentName;
        }
        protected void lbSave_Click(object sender, EventArgs e)
        {
            string qryStrId = Request.QueryString["id"];
            var id = int.Parse(qryStrId);
            apartmentRepository.UpdateApartmentStatus(id, int.Parse(ddlStatus.SelectedValue),
                int.Parse(ddlUser.SelectedValue));
            Response.Redirect("HomeAdministracijaForm.aspx");
        }

        protected void lbBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeAdministracijaForm.aspx");
        }
    }
}