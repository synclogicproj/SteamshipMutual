using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using SteamshipMutual.Model.Repository;
using SteamshipMutual.Model.Services;
using System;
using System.Collections.Generic;
using System.Text;

namespace Microsoft.Extensions.DependencyInjection
{
    public static class ModelServiceCollectionExtensions
    {
        public static IServiceCollection AddInventoryManagementServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<SteamshipMutualDbContext>(options => options.UseSqlServer(configuration["ConnectionStrings:DefaultConnection"]));
            services.AddScoped<ICompanySalesService, CompanySalesPerformance>();

            return services;
        }
    }
}
