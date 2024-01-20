using Administrativni_dio.Repositories.Tag;
using System;
using System.Linq;

namespace Administrativni_dio
{
    public partial class DeleteTagForm : System.Web.UI.Page
    {
        TagRepository tagRepository;
        public DeleteTagForm()
        {
            tagRepository = new TagRepository();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string qryStrId = Request.QueryString["id"];
            int? id = null;
            if (!string.IsNullOrEmpty(qryStrId))
            {

                id = int.Parse(qryStrId);
                var dbTag = tagRepository.SelectTags().Where(x => x.IDTag == id).FirstOrDefault();
                SetFormTag(dbTag);
            }
        }

        private void SetFormTag(Models.Tag dbTag)
        {
            lblImeTag.Text = dbTag.Name;
            lblNameTag.Text = dbTag.NameEng;
        }

        protected void lbConfirmDelete_Click(object sender, EventArgs e)
        {
            string qryStrId = Request.QueryString["id"];
            var id = int.Parse(qryStrId);
            tagRepository.DeleteTag(id);
            Response.Redirect("HomeAdministracijaForm.aspx");
        }

        protected void lbBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeAdministracijaForm.aspx");
        }
    }
}