using Administrativni_dio.Models;
using Administrativni_dio.Repositories.Apartment;
using Administrativni_dio.Repositories.Tag;
using System.Linq;
using System.Web.Mvc;

namespace Administrativni_dio.Controllers
{
    public class DetaljiApartmanaController : Controller
    {
        ApartmentRepository apartmentRepository = new ApartmentRepository();
        TagRepository tagRepository = new TagRepository();
        public ActionResult Index(string IdApartman)
        {
            Apartment apartman = apartmentRepository.SelectApartments().Where(x => x.IDApartment == int.Parse(IdApartman)).FirstOrDefault();
            apartman.Tagovi = tagRepository.SelectTagsForApartment(int.Parse(IdApartman));
            DetaljiApartman detaljiApartman = new DetaljiApartman();
            detaljiApartman.Apartman = apartman;
            return View(detaljiApartman);
        }
    }
}