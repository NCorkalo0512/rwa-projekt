using Administrativni_dio.Models;
using System;

namespace Administrativni_dio.Repositories.User
{
    interface IUserRepository
    {
        bool RegisterUser(AspNetUsers user);

        AspNetUsers LoginUser(string username, string password);

        AspNetUsers GetUser(Guid guid);

        bool DeleteUser(Guid guid);
    }
}
