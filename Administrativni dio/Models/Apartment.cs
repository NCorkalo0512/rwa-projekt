using System;
using System.Collections.Generic;

namespace Administrativni_dio.Models
{
    public class Apartment
    {
        public int IDApartment { get; set; }
        public string Guid { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime DeletedAt { get; set; }

        public int OwnerID { get; set; }
        public int TagTypeID { get; set; }
        public int StatusID { get; set; }
        public int CityID { get; set; }

        public string ApartmentName { get; set; }
        public string ApartmentNameEng { get; set; }
        public string Address { get; set; }
        public string Name { get; set; }
        public string NameEng { get; set; }
        public double Price { get; set; }
        public int MaxAdults { get; set; }
        public int MaxChildren { get; set; }
        public int TotalRooms { get; set; }
        public double BeachDistance { get; set; }

        public string ApartmentOwner { get; set; }
        public string City { get; set; }

        public string ApartmentStatus { get; set; }

        public List<Tag> Tagovi { get; set; }

        public string PutanjaSlike { get; set; }

    }
}