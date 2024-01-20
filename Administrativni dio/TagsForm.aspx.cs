using Administrativni_dio.Models;
using Administrativni_dio.Repositories.Tag;
using System;

namespace Administrativni_dio
{
    public partial class TagsForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ITagRepository tagRepository = new TagRepository();
            tagRepository.InsertTaggedApartment(new TaggedApartment
            {
                ApartmentID = int.Parse(ddlApartment.SelectedValue),
                TagID = int.Parse(ddlTagName.SelectedValue)
            });
        }

        protected void btnAddTag_Click(object sender, EventArgs e)
        {
            ITagRepository tagRepository = new TagRepository();
            tagRepository.InsertTag(new Tag
            {
                Name = tbName.Text,
                NameEng = tbNameEng.Text,
                TagTypeID = int.Parse(DropDownList1.SelectedValue)
            });
            Response.Redirect("~/TagsForm.aspx");
        }
    }
}