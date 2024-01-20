using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Administrativni_dio.Models
{
    public class AspnetUserLogin
    {

        public string LoginProvider { get; set; }
        public int ProviderKey { get; set; }

        public int UserID { get; set; }
       
    }
}