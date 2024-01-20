using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Administrativni_dio.Models
{
    public class AspNetUserClaim
    {
        public int IDUserClaim { get; set; }
        public int UserID { get; set; }

        public int ClaimType { get; set; }
        public int ClaimValue { get; set; }

    }
}