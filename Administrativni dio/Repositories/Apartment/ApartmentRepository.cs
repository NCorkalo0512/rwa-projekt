using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Administrativni_dio.Repositories.Apartment
{
    public class ApartmentRepository : IApartmentRepository
    {
        public static DataSet ds { get; set; }
        private static string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;


        public bool DeleteApartman(int id)
        {
            SqlParameter[] spParameter = new SqlParameter[1];

            spParameter[0] = new SqlParameter("@Id", SqlDbType.Int);
            spParameter[0].Direction = ParameterDirection.Input;
            spParameter[0].Value = id;

            int success = SqlHelper.ExecuteNonQuery(cs, "DeleteApartman", spParameter);
            if (success == 1)
            {
                return true;
            }
            return false;
        }

        public bool UpdateApartmentStatus(int apartmentId, int statusId, int userId)
        {
            SqlParameter[] spParameter = new SqlParameter[3];

            spParameter[0] = new SqlParameter("@Id", SqlDbType.Int);
            spParameter[0].Direction = ParameterDirection.Input;
            spParameter[0].Value = apartmentId;

            spParameter[1] = new SqlParameter("@UserId", SqlDbType.Int);
            spParameter[1].Direction = ParameterDirection.Input;
            spParameter[1].Value = userId;

            spParameter[2] = new SqlParameter("@StatusId", SqlDbType.Int);
            spParameter[2].Direction = ParameterDirection.Input;
            spParameter[2].Value = statusId;

            int success = SqlHelper.ExecuteNonQuery(cs, "UpdateApartmentStatus", spParameter);
            if (success >= 1)
            {
                return true;
            }
            return false;
        }

        public bool UpdateApartment(Models.Apartment updateapartment)
        {
            SqlParameter[] spParameter = new SqlParameter[9];

            spParameter[1] = new SqlParameter("@Name", SqlDbType.NVarChar, 20);
            spParameter[1].Direction = ParameterDirection.Input;
            spParameter[1].Value = updateapartment.Name;

            spParameter[2] = new SqlParameter("@NameEng", SqlDbType.NVarChar, 20);
            spParameter[2].Direction = ParameterDirection.Input;
            spParameter[2].Value = updateapartment.NameEng;

            spParameter[5] = new SqlParameter("@MaxChildren", SqlDbType.Int);
            spParameter[5].Direction = ParameterDirection.Input;
            spParameter[5].Value = updateapartment.MaxChildren;

            spParameter[3] = new SqlParameter("@Price", SqlDbType.Money);
            spParameter[3].Direction = ParameterDirection.Input;
            spParameter[3].Value = updateapartment.Price;

            spParameter[7] = new SqlParameter("@BeachDistance", SqlDbType.Int);
            spParameter[7].Direction = ParameterDirection.Input;
            spParameter[7].Value = updateapartment.BeachDistance;

            spParameter[6] = new SqlParameter("@TotalRooms", SqlDbType.Int);
            spParameter[6].Direction = ParameterDirection.Input;
            spParameter[6].Value = updateapartment.TotalRooms;

            spParameter[4] = new SqlParameter("@MaxAdults", SqlDbType.Int);
            spParameter[4].Direction = ParameterDirection.Input;
            spParameter[4].Value = updateapartment.MaxAdults;

            spParameter[0] = new SqlParameter("@Address", SqlDbType.NVarChar);
            spParameter[0].Direction = ParameterDirection.Input;
            spParameter[0].Value = updateapartment.Address;

            spParameter[8] = new SqlParameter("@ApartmentId", SqlDbType.Int);
            spParameter[8].Direction = ParameterDirection.Input;
            spParameter[8].Value = updateapartment.IDApartment;

            int success = SqlHelper.ExecuteNonQuery(cs, "UpdateApartment", spParameter);
            if (success == 1)
            {
                return true;
            }
            return false;
        }
        private string GetApartmentNameEng(int v)
        {
            return (string)SqlHelper.ExecuteScalar(cs, "GetApartmentNameEng", v);
        }

        private string GetApartmentName(int v)
        {
            return (string)SqlHelper.ExecuteScalar(cs, "GetApartmentName", v);
        }

        public bool InsertApartment(Models.Apartment apartment)
        {
            SqlParameter[] spParameter = new SqlParameter[10];

            spParameter[3] = new SqlParameter("@Name", SqlDbType.NVarChar, 20);
            spParameter[3].Direction = ParameterDirection.Input;
            spParameter[3].Value = apartment.Name;

            spParameter[4] = new SqlParameter("@NameEng", SqlDbType.NVarChar, 20);
            spParameter[4].Direction = ParameterDirection.Input;
            spParameter[4].Value = apartment.NameEng;

            spParameter[7] = new SqlParameter("@MaxChildren", SqlDbType.Int);
            spParameter[7].Direction = ParameterDirection.Input;
            spParameter[7].Value = apartment.MaxChildren;

            spParameter[5] = new SqlParameter("@Price", SqlDbType.Money);
            spParameter[5].Direction = ParameterDirection.Input;
            spParameter[5].Value = apartment.Price;

            spParameter[9] = new SqlParameter("@BeachDistance", SqlDbType.Int);
            spParameter[9].Direction = ParameterDirection.Input;
            spParameter[9].Value = apartment.BeachDistance;

            spParameter[8] = new SqlParameter("@TotalRooms", SqlDbType.Int);
            spParameter[8].Direction = ParameterDirection.Input;
            spParameter[8].Value = apartment.TotalRooms;

            spParameter[6] = new SqlParameter("@MaxAdults", SqlDbType.Int);
            spParameter[6].Direction = ParameterDirection.Input;
            spParameter[6].Value = apartment.MaxAdults;

            spParameter[2] = new SqlParameter("@Address", SqlDbType.NVarChar);
            spParameter[2].Direction = ParameterDirection.Input;
            spParameter[2].Value = apartment.Address;

            spParameter[0] = new SqlParameter("@OwnerId", SqlDbType.Int);
            spParameter[0].Direction = ParameterDirection.Input;
            spParameter[0].Value = apartment.OwnerID;

            spParameter[1] = new SqlParameter("@CityId", SqlDbType.Int);
            spParameter[1].Direction = ParameterDirection.Input;
            spParameter[1].Value = apartment.CityID;

            int success = SqlHelper.ExecuteNonQuery(cs, "InsertApartment", spParameter);
            if (success == 1)
            {
                return true;
            }
            return false;
        }



        private Models.Apartment GetApartmentFromDataRow(DataRow row)
        {
            return new Models.Apartment
            {
                CreatedAt = DateTime.Parse(row["CreatedAt"].ToString()),
                ApartmentName = row["Name"].ToString(),
                ApartmentNameEng = row["NameEng"].ToString(),
                BeachDistance = (int)row["BeachDistance"],
                TotalRooms = (int)row["TotalRooms"],
                MaxAdults = (int)row["MaxAdults"],
                MaxChildren = (int)row["MaxChildren"],
                Address = row["Address"].ToString(),
                ApartmentStatus = row["ApartmentStatus"].ToString(),
                ApartmentOwner = row["ApartmentOwner"].ToString(),
                City = row["City"].ToString(),
                IDApartment = int.Parse(row["ApartmentID"].ToString()),
                Price = double.Parse(row["Price"].ToString())
            };
        }

        public List<Models.Apartment> SelectApartments()
        {
            List<Models.Apartment> apartmentslista = new List<Models.Apartment>();
            ds = SqlHelper.ExecuteDataset(cs, "SelectApartments");
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                apartmentslista.Add(GetApartmentFromDataRow(row));
            }
            return apartmentslista;
        }

    }
}