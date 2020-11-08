using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SteamshipMutual.Model;
using SteamshipMutual.Model.Services;

namespace SteamshipMutual.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StaffController : ControllerBase
    {
        private readonly ICompanySalesService _companySalesService;

        public StaffController(ICompanySalesService companySalesService)
        {
            this._companySalesService = companySalesService;
        }

        // GET: api/<StaffController>
        [HttpGet("{pageIndex}/{pageSize}")]
        public async Task<ActionResult<StaffSalesPerformanceResponse>> Get(int pageIndex, int pageSize)
        {
            var response = new StaffSalesPerformanceResponse();
            response.Items = await _companySalesService.GetStaffTotalSales(pageIndex, pageSize);
            response.MetaData = new StaffSalesPerformanceMetaData
            {
                CurrentPage = pageIndex,
                ItemsPerPage = pageSize,
                TotalItems = await _companySalesService.GetStaffTotalSalesCount(),
            };
            response.MetaData.TotalPages = Math.Ceiling((double)response.MetaData.TotalItems / (double)pageSize);

            response.Links = new PaginationLinks
            {
                First = $"/{1}/{pageSize}",
                Next = $"/{pageIndex + 1}/{pageSize}",
                Previous = $"/{pageIndex - 1}/{pageSize}",
                Last = $"/{response.MetaData.TotalPages}/{pageSize}"
            };

            return Ok(response);
        }

        // GET api/<StaffController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<StaffSalesPerformance>> Get(int id)
        {
            var obj = await _companySalesService.GetSalesPerformanceByStaff(id);
            if (obj != null)
                return Ok(obj);
            else
                return NotFound(id);
        }

        // GET api/<StaffController>/count
        [HttpGet("totalstaff")]
        public async Task<ActionResult<int>> GetTotalStaff()
        {
            return Ok(await _companySalesService.GetStaffTotalSalesCount());
        }

    }
}
