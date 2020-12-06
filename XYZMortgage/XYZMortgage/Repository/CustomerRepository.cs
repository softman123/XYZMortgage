using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using XYZMortgage.DbContexts;
using XYZMortgage.Interface;
using XYZMortgage.Model;
using Microsoft.EntityFrameworkCore;

namespace XYZMortgage
{
    public class CustomerRepository : ICustomerRepository
    {
        private readonly LoanDbContext _loanDbContext;
        public CustomerRepository(LoanDbContext loanDbContext)
        {
            _loanDbContext = loanDbContext;
        }
        async public Task AddCustomer(Customer customer)
        {
            _loanDbContext.Add(customer);
            await _loanDbContext.SaveChangesAsync();
        }
        async public Task<Customer> GetCustomer(int CustomerId)
        {
            var customer = await _loanDbContext.Customers.FindAsync(CustomerId);
            return customer;
        }
        async public Task<IEnumerable<Customer>> GetCustomers()
        {
            return await _loanDbContext.Customers.Select(a => a).ToListAsync();
        }
        async public Task UpdateCustomer(int id, Customer customer)
        {
            _loanDbContext.Entry(customer).State = EntityState.Modified;
            await _loanDbContext.SaveChangesAsync();
        }
        public bool IsCustomerExists(int id) =>
        _loanDbContext.Customers.Any(c => c.CustomerId == id);
    }
}
