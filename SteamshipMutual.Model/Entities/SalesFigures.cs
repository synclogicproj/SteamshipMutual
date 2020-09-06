using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SteamshipMutual.Model.Entities
{
    public partial class SalesFigures
    {
        [Key]
        public int SalesRef { get; set; }
        [Column(TypeName = "date")]
        public DateTime SalesDate { get; set; }
        public double SalesAmount { get; set; }
        public int StaffId { get; set; }

        [ForeignKey(nameof(StaffId))]
        [InverseProperty("SalesFigures")]
        public virtual Staff Staff { get; set; }
    }
}
