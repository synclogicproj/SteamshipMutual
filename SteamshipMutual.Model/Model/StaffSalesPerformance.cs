using System;
using System.Collections.Generic;
using System.Text;

namespace SteamshipMutual.Model
{
    public class StaffSalesPerformance
    {
        public int StaffId { get; set; }
        public string Name { get; set; }
        public string Manager { get; set; }
        public string CompanyName { get; set; }
        public double SalesAmount { get; set; }
        public int SalesCount { get; set; }
    }
}
