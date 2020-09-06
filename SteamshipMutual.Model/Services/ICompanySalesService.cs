using SteamshipMutual.Model;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace SteamshipMutual.Model.Services
{
    public interface ICompanySalesService
    {
        Task<IEnumerable<StaffSalesPerformance>> GetStaffTotalSales(int pageIndex, int pageSize);

        Task<StaffSalesPerformance> GetSalesPerformanceByStaff(int staffId);
        Task<int> GetStaffTotalSalesCount();
    }
}
