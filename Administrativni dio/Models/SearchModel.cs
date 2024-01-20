using System.Collections.Generic;

namespace Administrativni_dio.Models
{
    public class SearchModel
    {
        public int Sort { get; set; }

        public List<Apartment> Apartmani { get; set; }
    }
}