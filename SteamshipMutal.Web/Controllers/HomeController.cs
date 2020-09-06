using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using cloudscribe.Pagination.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using SteamshipMutal.Web.Models;

namespace SteamshipMutal.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IConfiguration _configuration;

        public HomeController(ILogger<HomeController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
        }

        public async Task<IActionResult> Index(int pageIndex = 1, int pageSize = 4)
        {
            using (HttpClient client = new HttpClient())
            {
                string endpoint = _configuration["baseUrl"] + "/staff/" + pageIndex + "/" + pageSize;

                using (var response = await client.GetAsync(endpoint))
                {
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var data = await response.Content.ReadAsStringAsync();
                        var result = new PagedResult<StaffSalesPerformanceViewModel>
                        {
                            Data = JsonConvert.DeserializeObject<List<StaffSalesPerformanceViewModel>>(data),
                            TotalItems = await GetTotalSales(),
                            PageNumber = pageIndex,
                            PageSize = pageSize
                        };

                        return View(result);

                    }
                    else
                    {
                        ModelState.Clear();
                        ModelState.AddModelError(string.Empty, "No staff performance data found");
                        return View();

                    }

                }
            }
        }

        private async Task<long> GetTotalSales()
        {
            using (HttpClient client = new HttpClient())
            {
                string endpoint = _configuration["baseUrl"] + "/staff/totalstaff";

                using (var response = await client.GetAsync(endpoint))
                {
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var data = await response.Content.ReadAsStringAsync();
                        return JsonConvert.DeserializeObject<long>(data);
                    }
                    else
                    {
                        return 0;
                    }
                }
            }
        }

        public async Task<IActionResult> Details(int id)
        {
            using (HttpClient client = new HttpClient())
            {
                string endpoint = _configuration["baseUrl"] + "/staff/" + id;

                using (var response = await client.GetAsync(endpoint))
                {
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var data = await response.Content.ReadAsStringAsync();
                        return View(JsonConvert.DeserializeObject<StaffSalesPerformanceViewModel>(data));

                    }
                    else
                    {
                        ModelState.Clear();
                        ModelState.AddModelError(string.Empty, "No staff data found");
                        return View();

                    }

                }
            }
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
