using Administrativni_dio.Models;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;

namespace Administrativni_dio.Repositories.Apartment_Reviews
{
    public class ApartmentReviews : IApartmentReviews
    {
        public static DataSet ds { get; set; }
        private static string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;


        public bool InsertApartmentReview(ApartmentReview review)
        {
            int success = SqlHelper.ExecuteNonQuery(cs, "InsertApartmentReviews", review.ApartmentID, review.UserID,
                review.Stars, review.Details);
            if (success == 1)
            {
                return true;
            }
            return false;
        }

        public ApartmentReview SelectApartmentReview(Guid guid)
        {
            DataRow row = SqlHelper.ExecuteDataset(cs, "SelectApartmentReview", guid).Tables[0].Rows[0];
            return GetApartmentFromDataRow(row);
        }

        private ApartmentReview GetApartmentFromDataRow(DataRow row)
        {
            return new ApartmentReview
            {
                CreatedAt = (DateTime)row["CreatedAt"],
                Stars = (int)row["Stars"],
                Details = row["Details"].ToString(),

            };
        }
        public List<ApartmentReview> SelectAllApartmentReviews(Guid reviewsGuid)
        {
            List<ApartmentReview> listaReviewsa = new List<ApartmentReview>();
            ds = SqlHelper.ExecuteDataset(cs, "SelectApartmentReviews", reviewsGuid);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                listaReviewsa.Add(GetApartmentFromDataRow(row));
            }
            return listaReviewsa;
        }
    }
}

