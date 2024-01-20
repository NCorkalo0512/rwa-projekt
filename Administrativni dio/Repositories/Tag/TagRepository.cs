using Administrativni_dio.Models;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Administrativni_dio.Repositories.Tag
{
    public class TagRepository : ITagRepository
    {
        public static DataSet ds { get; set; }
        private static string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public bool DeleteTag(int id)
        {
            SqlParameter[] spParameter = new SqlParameter[1];

            spParameter[0] = new SqlParameter("@Id", SqlDbType.Int);
            spParameter[0].Direction = ParameterDirection.Input;
            spParameter[0].Value = id;

            int success = SqlHelper.ExecuteNonQuery(cs, "DeleteTag", spParameter);
            if (success == 1)
            {
                return true;
            }
            return false;
        }

        public bool DeleteTaggedApartment(Guid guid)
        {
            int success = SqlHelper.ExecuteNonQuery(cs, "DeleteTaggedApartment", guid);
            if (success == 1)
            {
                return true;
            }
            return false;
        }

        public bool DeleteTagType(Guid guid)
        {
            int success = SqlHelper.ExecuteNonQuery(cs, "DeleteTagType", guid);
            if (success == 1)
            {
                return true;
            }
            return false;
        }

        public bool InsertTag(Models.Tag tag)
        {
            SqlParameter[] spParameter = new SqlParameter[3];

            spParameter[0] = new SqlParameter("@TypeId", SqlDbType.Int);
            spParameter[0].Direction = ParameterDirection.Input;
            spParameter[0].Value = tag.TagTypeID;

            spParameter[1] = new SqlParameter("@Name", SqlDbType.NVarChar, 255);
            spParameter[1].Direction = ParameterDirection.Input;
            spParameter[1].Value = tag.Name;

            spParameter[2] = new SqlParameter("@NameEng", SqlDbType.NVarChar, 255);
            spParameter[2].Direction = ParameterDirection.Input;
            spParameter[2].Value = tag.NameEng;

            int success = SqlHelper.ExecuteNonQuery(cs, "InsertTag", spParameter);
            if (success == 1)
            {
                return true;
            }
            return false;
        }

        public bool InsertTaggedApartment(TaggedApartment taggedApartment)
        {
            SqlParameter[] spParameter = new SqlParameter[2];

            spParameter[0] = new SqlParameter("@ApartmentId", SqlDbType.Int);
            spParameter[0].Direction = ParameterDirection.Input;
            spParameter[0].Value = taggedApartment.ApartmentID;

            spParameter[1] = new SqlParameter("@@TagId", SqlDbType.Int);
            spParameter[1].Direction = ParameterDirection.Input;
            spParameter[1].Value = taggedApartment.TagID;

            int success = SqlHelper.ExecuteNonQuery(cs, "InsertTaggedApartment", spParameter);
            if (success == 1)
            {
                return true;
            }
            return false;
        }

        public bool InsertTagType(TagType tagType)
        {
            int success = SqlHelper.ExecuteNonQuery(cs, "InsertTagType", tagType.Name, tagType.NameEng);
            if (success == 1)
            {
                return true;
            }
            return false;
        }

        public Models.Tag SelectTag(Guid guid)
        {
            DataRow row = SqlHelper.ExecuteDataset(cs, "SelectTag", guid).Tables[0].Rows[0];
            return GetTagFromDataRow(row);
        }

        private Models.Tag GetTagFromDataRow(DataRow row)
        {
            return new Models.Tag
            {
                IDTag = int.Parse(row["Id"].ToString()),
                Name = row["Name"].ToString(),
                NameEng = row["NameEng"].ToString()
            };
        }
        private string GetTagTypeNameEng(int v)
        {
            return (string)SqlHelper.ExecuteScalar(cs, "GetTagTypeNameEng", v);
        }

        private string GetTagTypeName(int v)
        {
            return (string)SqlHelper.ExecuteScalar(cs, "GetTagTypeName", v);
        }

        public List<Models.Tag> SelectTagsForApartment(int apartmentId)
        {
            List<Models.Tag> listaTagova = new List<Models.Tag>();
            ds = SqlHelper.ExecuteDataset(cs, "GetTagsForApartment", apartmentId);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                listaTagova.Add(GetTagFromDataRow(row));
            }
            return listaTagova;
        }

        public List<Models.Tag> SelectTags()
        {
            List<Models.Tag> listaTagova = new List<Models.Tag>();
            ds = SqlHelper.ExecuteDataset(cs, "SelectTags");
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                listaTagova.Add(GetTagFromDataRow(row));
            }
            return listaTagova;
        }

        public List<Models.Tag> GetTagsAndApartmentCount()
        {
            List<Models.Tag> listaTagova = new List<Models.Tag>();
            ds = SqlHelper.ExecuteDataset(cs, "GetTagsAndApartmentCount");
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                listaTagova.Add(GetTagFromDataRow(row));
            }
            AddApartmentCountToTags(listaTagova, ds);
            return listaTagova;
        }

        void AddApartmentCountToTags(List<Models.Tag> tagovi, DataSet dataSet)
        {
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                foreach (var tag in tagovi)
                {
                    if (row["Name"].ToString() == tag.Name)
                    {
                        tag.ApartmentCount = (int)row["ApartmentCount"];
                    }
                }
            }
        }
    }
}