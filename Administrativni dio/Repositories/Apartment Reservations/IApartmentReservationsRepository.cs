using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Administrativni_dio.Models;

namespace Administrativni_dio.Repositories.Apartment_Reservations
{
    interface IApartmentReservationsRepository
    {
        bool InsertApartmentReservations(ApartmentReservation apartmentReservation);

        List<ApartmentReservation>SelectApartmentsReservations(Guid guid );
    }
}
