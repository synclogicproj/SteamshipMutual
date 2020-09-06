using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SteamshipMutal.Web.Models
{
    public class StaffSalesPerformanceViewModel
    {
        public int StaffId { get; set; }
        public string Name { get; set; }
        public string Manager { get; set; }
        public string CompanyName { get; set; }
        [DisplayFormat(DataFormatString = "{0:c}")]
        public double SalesAmount { get; set; }
        public int SalesCount { get; set; }
    }
}
