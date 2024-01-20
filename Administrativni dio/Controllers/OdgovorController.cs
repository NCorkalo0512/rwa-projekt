using Administrativni_dio.Models;
using CaptchaMvc.HtmlHelpers;
using System.Web.Mvc;

namespace Administrativni_dio.Controllers
{
    public class OdgovorController : Controller
    {
        // GET: Odgovor
        public ActionResult Index()
        {
            if (this.IsCaptchaValid("Validate your captcha"))
            {
                ViewBag.ErrMessage = "Krivi broj za provjeru";
            }
            return View();
        }

        [HttpPost]
        public void AjaxPostCall(Upit upit)
        {
            Upit upitZaSpremanje = new Upit
            {
                Username = upit.Username,
                Napomena = upit.Napomena,
                brojOsoba = upit.brojOsoba,
                Email = upit.Email,
                SelectDatum= upit.SelectDatum
            };
            if (!this.IsCaptchaValid("Validate your captcha") && string.IsNullOrEmpty(Session["Username"] == null ? "" : "Korisnik"))
            {
                ViewBag.ErrMessage = "Krivi broj za provjeru";
                Response.Redirect("/Error");
            }
            else
            {
                Response.Redirect("/Odgovor");
            }
        }
    }
}