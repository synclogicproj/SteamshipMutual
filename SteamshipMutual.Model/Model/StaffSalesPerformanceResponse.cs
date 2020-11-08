using System.Collections.Generic;

namespace SteamshipMutual.Model
{
    public class StaffSalesPerformanceResponse
    {
        public IEnumerable<StaffSalesPerformance> Items { get; set; }
        public StaffSalesPerformanceMetaData MetaData { get; set; }
        public PaginationLinks Links { get; set; }
    }
}
