using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Administrativni_dio.Models
{
    public class ApartmentReview
    {
        public int IDApartmentReview { get; set; }
        public string Guid { get; set; }
        public DateTime CreatedAt { get; set; } 
        public int ApartmentID { get; set; }
        public int UserID { get; set; }
        public string Details { get; set; }
        public int Stars { get; set; }
    }
}