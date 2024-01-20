using Administrativni_dio.Models;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Administrativni_dio.Repositories.User
{
    public class UserRepository : IUserRepository
    {
        public static DataSet ds { get; set; }
        private static string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public AspNetUsers GetUser(Guid guid)
        {
            DataRow row = SqlHelper.ExecuteDataset(cs, "GetUser", guid).Tables[0].Rows[0];
            return GetUserFromDataRow(row);
        }

        private AspNetUsers GetUserFromDataRow(DataRow row)
        {
            return new AspNetUsers
            {
                CreatedAt = (DateTime)row["CreatedAt"],
                Email = row["Email"].ToString(),
                PhoneNumber = row["PhoneNumber"].ToString(),
                UserName = row["UserName"].ToString(),
                Address = row["Address"].ToString()
            };
        }

        public AspNetUsers LoginUser(string Email, string Password)
        {
            byte[] plainTextBytes = System.Text.Encoding.UTF8.GetBytes(Password);
            Password = System.Convert.ToBase64String(plainTextBytes);
            try
            {
                SqlParameter[] spParameter = new SqlParameter[3];

                spParameter[0] = new SqlParameter("@Email", SqlDbType.NVarChar, 20);
                spParameter[0].Direction = ParameterDirection.Input;
                spParameter[0].Value = Email;

                spParameter[1] = new SqlParameter("@Password", SqlDbType.NVarChar, 20);
                spParameter[1].Direction = ParameterDirection.Input;
                spParameter[1].Value = Password;

                spParameter[2] = new SqlParameter("@Guid", SqlDbType.UniqueIdentifier);
                spParameter[2].Direction = ParameterDirection.Output;
                var dataSet = SqlHelper.ExecuteDataset(cs, "LoginUser", spParameter);
                var row = dataSet.Tables[0].Rows[0];
                var guid = (Guid)row["Guid"];
                if (guid == null)
                {
                    throw new Exception();
                }
                return GetUser(guid);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Greška kod logiranja.");
                return null;
            }

            /* execute scalar vraca guid korisnika ( gresku ukoliko se dogodila greska pri logiranju)*/

        }

        public bool RegisterUser(AspNetUsers user)
        {
            byte[] plainTextBytes = System.Text.Encoding.UTF8.GetBytes(user.PasswordHash);
            user.PasswordHash = System.Convert.ToBase64String(plainTextBytes);

            SqlParameter[] spParameter = new SqlParameter[5];

            spParameter[0] = new SqlParameter("@Email", SqlDbType.NVarChar, 20);
            spParameter[0].Direction = ParameterDirection.Input;
            spParameter[0].Value = user.Email;

            spParameter[1] = new SqlParameter("@Password", SqlDbType.NVarChar, 20);
            spParameter[1].Direction = ParameterDirection.Input;
            spParameter[1].Value = user.PasswordHash;

            spParameter[2] = new SqlParameter("@PhoneNumber", SqlDbType.NVarChar, 20);
            spParameter[2].Direction = ParameterDirection.Input;
            spParameter[2].Value = user.PhoneNumber;

            spParameter[3] = new SqlParameter("@Username", SqlDbType.NVarChar, 20);
            spParameter[3].Direction = ParameterDirection.Input;
            spParameter[3].Value = user.UserName;

            spParameter[4] = new SqlParameter("@Address", SqlDbType.NVarChar, 20);
            spParameter[4].Direction = ParameterDirection.Input;
            spParameter[4].Value = user.Address;

            int success = SqlHelper.ExecuteNonQuery(cs, "RegisterUser", spParameter);
            if (success == 1)
            {
                return true;
            }
            return false;
            /*execute non query vraca broj redaka koje su umetnuti u bazi*/
        }

        public bool DeleteUser(Guid guid)
        {
            int success = SqlHelper.ExecuteNonQuery(cs, "DeleteUser", guid);
            if (success == 1)
            {
                return true;
            }
            return false;
        }
    }
}