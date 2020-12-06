using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using XYZMortgage.Model;

namespace XYZMortgage.Interface
{
    public interface ICustomerRepository
    {
        Task AddCustomer(Customer customer);
        Task<Customer> GetCustomer(int CustomerId);
        Task<IEnumerable<Customer>> GetCustomers();
        Task UpdateCustomer(int id, Customer customer);
        bool IsCustomerExists(int CustomerId);
    }
}
