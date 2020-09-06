using Microsoft.EntityFrameworkCore;
using SteamshipMutual.Model;
using SteamshipMutual.Model.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SteamshipMutual.Model.Services
{
    class CompanySalesPerformance : ICompanySalesService
    {
        private readonly SteamshipMutualDbContext _dbContext;

        public CompanySalesPerformance(SteamshipMutualDbContext dbContext)
        {
            this._dbContext = dbContext;
        }

        public async Task<StaffSalesPerformance> GetSalesPerformanceByStaff(int staffId)
        {
            var query = await _dbContext.Staff
                                  .Where(s => s.StaffId == staffId)
                                  .Select(s => new StaffSalesPerformance
                                  {
                                      StaffId = s.StaffId,
                                      Name = s.Name,
                                      Manager = s.Manager == null ? string.Empty : s.Manager.Name,
                                      CompanyName = s.Company.Name,
                                      SalesAmount = _dbContext.SalesFigures.Where(sf => sf.StaffId == s.StaffId).Sum(sf => sf.SalesAmount),
                                      SalesCount = _dbContext.SalesFigures.Count(sf => sf.StaffId == s.StaffId)
                                  }).SingleOrDefaultAsync();

            return query;
        }

        public async Task<IEnumerable<StaffSalesPerformance>> GetStaffTotalSales(int pageIndex, int pageSize)
        {
            var query = _dbContext.Staff
                                  .Select(s => new StaffSalesPerformance
                                  {
                                      StaffId = s.StaffId,
                                      Name = s.Name,
                                      Manager = s.Manager == null ? string.Empty : s.Manager.Name,
                                      CompanyName = s.Company.Name,
                                      SalesAmount = _dbContext.SalesFigures.Where(sf => sf.StaffId == s.StaffId).Sum(sf => sf.SalesAmount),
                                      SalesCount = _dbContext.SalesFigures.Count(sf => sf.StaffId == s.StaffId)
                                  })
                                  .OrderByDescending(s => s.SalesAmount)
                                  .Skip((pageIndex - 1) * pageSize)
                                  .Take(pageSize);

            return await query.ToListAsync();                        
        }

        public async Task<int> GetStaffTotalSalesCount()
        {
            return await _dbContext.Staff.CountAsync();
        }

    }
}
