using System;

namespace Administrativni_dio.Models
{
    public class Tag
    {
        public int IDTag { get; set; }
        public Guid Guid { get; set; }
        public DateTime CreatedAt { get; set; }
        public string TagTypeName { get; set; }
        public string TagTypeNameEng { get; set; }
        public string Name { get; set; }
        public string NameEng { get; set; }
        public int ApartmentCount { get; set; }
        public int TagTypeID { get; set; }
    }
}