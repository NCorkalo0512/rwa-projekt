using System.Collections.Generic;
using System;
using Model = Administrativni_dio.Models;

namespace Administrativni_dio.Repositories.Apartment
{
    interface IApartmentRepository
    {
        bool InsertApartment(Model.Apartment apartment);
        bool DeleteApartman(int id);

        bool UpdateApartment(Model.Apartment apartment);

      
        List <Model.Apartment> SelectApartments();
    }
}
