using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Administrativni_dio.Models
{
    public class ApartmentPics
    {
        public int IDApartmentPics { get; set; }
        public string Guid { get; set; }
        public int CreatedAt { get; set; } 
        public int DeletedAt { get; set; }
        public int ApartmentID { get; set; }
        public int IsRepresentative { get; set; }
        public string Path { get; set; }
        public string Base64Content { get; set; }
        public string Name { get; set; }
       

    
    }
}