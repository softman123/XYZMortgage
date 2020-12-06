using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using XYZMortgage.Model;

namespace XYZMortgage.DbContexts
{
    public class LoanDbContext : DbContext
    {
        private readonly IConfiguration _configuration;
        public LoanDbContext(IConfiguration configuration, DbContextOptions<LoanDbContext> options)
            : base(options)
        {
            _configuration = configuration;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            string dbConnection = _configuration.GetValue<string>("ConnectionStrings:LoanDbConnectionString");
            optionsBuilder.UseSqlServer(dbConnection);
        }
        public DbSet<Customer> Customers { get; set; }

        protected override void OnModelCreating(ModelBuilder modelbuilder)
        {
            base.OnModelCreating(modelbuilder);

            modelbuilder.Entity<Customer>().ToTable("Customer", "dbo");
            modelbuilder.Entity<Customer>().HasKey(e => new { e.CustomerId });
        }
    }
}
