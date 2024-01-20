using Administrativni_dio.Models;
using Administrativni_dio.Repositories.Apartment;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Administrativni_dio.Controllers
{
    public class HomeApartmaniController : Controller
    {
        IApartmentRepository apartmentRepository = new ApartmentRepository();
        bool filtrirano = false;
        // GET: HomeApartmani
        public ActionResult Index()
        {
            if (Request.Cookies["UserSettings"] != null)
            {
                var cookie = Request.Cookies["UserSettings"];
                var filtriranaISortiranaListaApartmana = FiltrirajISortiraj(cookie["Rooms"], cookie["MaxAdults"], cookie["MaxChildren"], cookie["City"], cookie["Sort"]);
                var model = new SearchModel();
                model.Apartmani = filtriranaISortiranaListaApartmana;
                foreach (var apartman in model.Apartmani)
                {
                    apartman.PutanjaSlike = GenerirajPutanjuSlike();
                }
                return View(model);
            }

            if (filtrirano)
            {
                return View();
            }
            var searchModel = new SearchModel();
            searchModel.Apartmani = apartmentRepository.SelectApartments();
            foreach (var apartman in searchModel.Apartmani)
            {
                apartman.PutanjaSlike = GenerirajPutanjuSlike();
            }
            return View(searchModel);
        }

        [HttpGet]
        public ActionResult LogOff()
        {
            Session.Clear();
            if (Request.Cookies["UserSettings"] != null)
            {
                Response.Cookies["UserSettings"].Expires = DateTime.Now.AddDays(-1);
            }
            return Redirect("~/LoginForm.aspx");
        }

        [HttpPost]
        public ActionResult Filtriraj(string Rooms = null, string MaxAdults = null, string MaxChildren = null, string City = null, string Sort = null)
        {
            HttpCookie myCookie = new HttpCookie("UserSettings");
            myCookie["MaxAdults"] = MaxAdults;
            myCookie["MaxChildren"] = MaxChildren;
            myCookie["Rooms"] = Rooms;
            myCookie["City"] = City;
            myCookie["Sort"] = Sort;
            myCookie.Expires = DateTime.Now.AddDays(1);
            Response.SetCookie(myCookie);

            filtrirano = true;
            var model = new SearchModel();
            model.Apartmani = FiltrirajISortiraj(Rooms, MaxAdults, MaxChildren, City, Sort);
            foreach (var apartman in model.Apartmani)
            {
                apartman.PutanjaSlike = GenerirajPutanjuSlike();
            }
            return View("Index", model);
        }

        public List<Apartment> FiltrirajISortiraj(string Rooms = null, string MaxAdults = null, string MaxChildren = null, string City = null, string Sort = null)
        {
            List<Apartment> listaApartmana = new List<Apartment>();

            List<Apartment> tempApartmani = new List<Apartment>();
            tempApartmani = apartmentRepository.SelectApartments();

            if (!string.IsNullOrEmpty(Rooms))
            {
                try
                {
                    int numberOfRooms = int.Parse(Rooms);
                    var apartmentWithRooms = tempApartmani.Where(x => x.TotalRooms == numberOfRooms).ToList();
                    foreach (var apartment in apartmentWithRooms)
                    {
                        listaApartmana.Add(apartment);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                    throw;
                }
            }

            if (!string.IsNullOrEmpty(MaxAdults))
            {
                try
                {
                    int maxAdults = int.Parse(MaxAdults);
                    var apartmentWithAdults = tempApartmani.Where(x => x.MaxAdults == maxAdults).ToList();
                    foreach (var apartment in apartmentWithAdults)
                    {
                        listaApartmana.Add(apartment);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                    throw;
                }
            }

            if (!string.IsNullOrEmpty(MaxChildren))
            {
                try
                {
                    int maxChildren = int.Parse(MaxChildren);
                    var apartmentWithChildren = tempApartmani.Where(x => x.MaxChildren == maxChildren).ToList();
                    foreach (var apartment in apartmentWithChildren)
                    {
                        listaApartmana.Add(apartment);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                    throw;
                }
            }

            if (!string.IsNullOrEmpty(City))
            {
                try
                {
                    var apartmentsInCity = tempApartmani.Where(x => x.City == City).ToList();
                    foreach (var apartment in apartmentsInCity)
                    {
                        listaApartmana.Add(apartment);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex);
                    throw;
                }
            }

            if (!string.IsNullOrEmpty(Sort))
            {
                int sortValue = int.Parse(Sort);
                switch (sortValue)
                {
                    case 0:
                        break;
                    case 1:
                        tempApartmani = tempApartmani.OrderBy(x => x.Price).ToList();
                        listaApartmana = listaApartmana.OrderBy(x => x.Price).ToList();
                        break;
                    case 2:
                        tempApartmani = tempApartmani.OrderByDescending(x => x.Price).ToList();
                        listaApartmana = listaApartmana.OrderByDescending(x => x.Price).ToList();
                        break;
                    default:
                        break;
                }
            }

            return (MaxAdults == "" && MaxChildren == "" && City == "" && Rooms == "") ? tempApartmani : listaApartmana;
        }

        public string GenerirajPutanjuSlike()
        {
            Random rnd = new Random(Guid.NewGuid().GetHashCode());
            return "/Images/slika" + rnd.Next(1, 8).ToString() + ".jpg";
        }
    }
}