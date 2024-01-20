using Administrativni_dio.Models;
using System;
using System.Collections.Generic;

namespace Administrativni_dio.Repositories.Apartment_Reviews
{
    interface IApartmentReviews
    {
        bool InsertApartmentReview(ApartmentReview review);

        ApartmentReview SelectApartmentReview(Guid guid);

        List<ApartmentReview> SelectAllApartmentReviews(Guid guid);
    }
}
