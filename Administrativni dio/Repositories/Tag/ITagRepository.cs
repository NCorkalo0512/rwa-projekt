using System;
using System.Collections.Generic;
using Model = Administrativni_dio.Models;

namespace Administrativni_dio.Repositories.Tag
{
    interface ITagRepository
    {
        bool InsertTag(Model.Tag tag);

        List<Model.Tag> SelectTags();

        Model.Tag SelectTag(Guid guid);

        bool DeleteTag(int id);

        bool InsertTagType(Model.TagType tagType);

        bool DeleteTagType(Guid guid);

        bool InsertTaggedApartment(Model.TaggedApartment taggedApartment);

        List<Model.Tag> SelectTagsForApartment(int id);

        bool DeleteTaggedApartment(Guid guid);

        List<Model.Tag> GetTagsAndApartmentCount();
    }
}
