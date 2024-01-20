using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace Administrativni_dio.Models
{
    public class Repo
    {
        public static DataSet ds { get; set; }
        private static string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        /*  /*APARTMENT
          public static IEnumerable<Apartment> GetApartments()
          {
              ds = SqlHelper.ExecuteDataset(cs, "SelectApartments");
              foreach(DataRow row in ds.Tables[0].Rows )
              {
                  yield return GetApartmentsFromDataRow(row);
              }
          }

          private static Apartment GetApartmentsFromDataRow(DataRow row)
          {
              return new Apartment
              {
                 IDApartment=(int)row[]
              }
          }
      public static Apartment GetApartment(int IDApartment)
          {
              DataRow row = SqlHelper.ExecuteDataset(cs, "SelectApartments", IDApartment).Tables[0].Rows[0];
          }
      */
        /*APARTMENT PICTURE*/

        public static IEnumerable<ApartmentPics> GetApartmentPics()
        {
            ds = SqlHelper.ExecuteDataset(cs, "SelectApartmentPictures");
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                yield return GetApartmentPicturesFromDataRow(row);
            }
        }
        

        private static ApartmentPics GetApartmentPicturesFromDataRow(DataRow row)
        {
            return new ApartmentPics
            {
               
            };
        }

        public static int CreateApartmentPicture(ApartmentPics pics) => SqlHelper.ExecuteNonQuery(cs, "InsertApartmentPicture", pics.ApartmentID, pics.Path,
            pics.Base64Content, pics.Name, pics.IsRepresentative);
        public static int UpdateApartmentPicture(ApartmentPics pics) => SqlHelper.ExecuteNonQuery(cs, "UpdateApartmentPicture", pics.Path, pics.Base64Content,
            pics.Name, pics.IsRepresentative, pics.Guid);
        public static int DeleteApartmentPicture(string Guid) => SqlHelper.ExecuteNonQuery(cs, "DeleteApartmentPicture", Guid);

        /*APARTMENT REVIEW*/

        public static IEnumerable<ApartmentReview> GetApartmentReviews(int IDApartmentReview )
        {
            ds = SqlHelper.ExecuteDataset(cs, "SelectApartmentReviews", IDApartmentReview);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                yield return GetApartmentReviewsFromDataRow(row);
            }
        }

        private static ApartmentReview GetApartmentReviewsFromDataRow(DataRow row)
        {
            return new ApartmentReview
            {
                IDApartmentReview = (int)row["Id"],
                CreatedAt = (DateTime)row["CreatedAt"],
                ApartmentID = (int)row["ApartmentId"],
                UserID = (int)row["UserId"],
                Details = row["Details"].ToString(),
                Stars= (int)row["Stars"]
            };
        }
        public static int CreateApartmentReview(ApartmentReview apartmentReview) => SqlHelper.ExecuteNonQuery
            (cs, "InsertApartmentReview", apartmentReview.ApartmentID, apartmentReview.UserID, 
            apartmentReview.Details, apartmentReview.Stars);


        /*TAG*/

        public static IEnumerable<Tag> GetTags()
        {
            ds = SqlHelper.ExecuteDataset(cs, "SelectTags");
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                yield return GetTagsFromDataRow(row);
            }
        }

        private static Tag GetTagsFromDataRow(DataRow row)
        {
            return new Tag
            {
                IDTag = (int)row["Id"],           
                TagTypeID = (int)row["TypeId"],              
                Name =row["Name"].ToString(),
                NameEng = row["NameEng"].ToString()
            };
        }

        public static int CreateTags(Tag tag) => SqlHelper.ExecuteNonQuery(cs, "InsertTag", tag.TagTypeID, 
            tag.Name, tag.NameEng);
        public static int DeleteTags(string Guid) => SqlHelper.ExecuteNonQuery(cs, "DeleteTag", Guid);


        /*TAG TYPE*/
        public static IEnumerable<TagType> GetTagTypes(string Guid)
        {
            ds = SqlHelper.ExecuteDataset(cs, "SelectTagType");
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                yield return GetTagTypesFromDataRow(row);
            }
        }

        private static TagType GetTagTypesFromDataRow(DataRow row)
        {
            return new TagType
            {

                Name = row["Name"].ToString(),

                NameEng = row["NameEng"].ToString()
            };
        }
        public static int CreateTagTypes(TagType type) => SqlHelper.ExecuteNonQuery(cs, "InsertTagType", type.Name,
            type.NameEng);
        public static int DeleteTagTypes(string Guid) => SqlHelper.ExecuteNonQuery(cs, "DeleteTagType", Guid);

        /*TAG APARTMENT*/

        public static IEnumerable<TaggedApartment> GetTaggedApartment(string Guid)
        {
            ds = SqlHelper.ExecuteDataset(cs, "SelectTaggedApartment");
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                yield return GetTaggedApartmentFromDataRow(row);
            }
        }

        private static TaggedApartment GetTaggedApartmentFromDataRow(DataRow row)
        {
            return new TaggedApartment
            {

                ApartmentID = (int)row["ApartmentId"],

                TagID = (int)row["TagId"]
            };
        }

       
        public static int CreateTaggedApartment(TaggedApartment taggedApartment) => SqlHelper.ExecuteNonQuery(cs, "InsertTaggedApartment", taggedApartment.ApartmentID,
            taggedApartment.TagID);
        public static int DeleteTaggedApartment(string Guid) => SqlHelper.ExecuteNonQuery(cs, "DeleteTagType", Guid);

    }

    

   


}