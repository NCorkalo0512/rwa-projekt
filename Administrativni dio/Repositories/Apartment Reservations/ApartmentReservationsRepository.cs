using Administrativni_dio.Models;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;

namespace Administrativni_dio.Repositories.Apartment_Reservations
{
    public class ApartmentReservationsRepository : IApartmentReservationsRepository
    {
        public static DataSet ds { get; set; }
        private static string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        public bool InsertApartmentReservations(ApartmentReservation apartmentReservation)
        {
            int success = SqlHelper.ExecuteNonQuery(cs, "InsertApartmentReservations", apartmentReservation.Details, apartmentReservation.UserID,
                apartmentReservation.UserAddress, apartmentReservation.UserEmail, apartmentReservation.UserName, apartmentReservation.UserPhone);
            if (success == 1)
            {
                return true;
            }
            return false;
        }

        public List<ApartmentReservation> SelectApartmentsReservations(Guid guidReservations)
        {
            List<Models.ApartmentReservation> ReservationLista = new List<Models.ApartmentReservation>();
            ds = SqlHelper.ExecuteDataset(cs, "GetTagsForApartment", guidReservations);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                ReservationLista.Add(GetReservationFromDataRow(row));
            }
            return ReservationLista;
        }

        private ApartmentReservation GetReservationFromDataRow(DataRow row)
        {
            return new Models.ApartmentReservation
            {
                CreatedAt = (DateTime)row["CreatedAt"],
                UserAddress = row["UserAddress"].ToString(),
                UserPhone = row["UserPhone"].ToString(),
                UserName = row["UserName"].ToString(),
                UserEmail = row["UserEmail"].ToString(),
                Details = row["Details"].ToString()
            };
        }
    }
}