using System;

namespace Administrativni_dio.Models
{
    public class AspNetUsers
    {
        public int IDUser { get; set; }
        public Guid Guid { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime DeletedAt { get; set; }

        public string Email { get; set; }
        public int EmailConfirmed { get; set; }
        public string PasswordHash { get; set; }
        public int SecurityStamp { get; set; }

        public string PhoneNumber { get; set; }
        public int PhoneNumberConfirmed { get; set; }

        public DateTime LockoutEndDateUtc { get; set; }
        public int LockoutEnabled { get; set; }
        public int AccessFailedCount { get; set; }
        public string UserName { get; set; }
        public string Address { get; set; }


    }
}