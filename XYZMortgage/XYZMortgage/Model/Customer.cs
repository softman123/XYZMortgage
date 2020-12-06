using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace XYZMortgage.Model
{
    public class Customer
    {
        public int CustomerId { get; set; }
        public string Ssn { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string AddressLine1 { get; set; }
        public string  City { get; set; }
        public string State { get; set; }
    }
}
