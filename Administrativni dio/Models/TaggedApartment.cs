using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Administrativni_dio.Models
{
    public class TaggedApartment
    {
        public int IDTaggedApartment { get; set; }
        public string Guid { get; set; }
        public int ApartmentID { get; set; }
        public int TagID { get; set; }
    }
}