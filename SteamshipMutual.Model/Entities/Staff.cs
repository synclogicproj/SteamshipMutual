using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SteamshipMutual.Model.Entities
{
    public partial class Staff
    {
        public Staff()
        {
            InverseManager = new HashSet<Staff>();
            SalesFigures = new HashSet<SalesFigures>();
        }

        [Key]
        public int StaffId { get; set; }
        public int? ManagerId { get; set; }
        [Required]
        [StringLength(50)]
        public string Name { get; set; }
        public int CompanyId { get; set; }

        [ForeignKey(nameof(CompanyId))]
        [InverseProperty("Staff")]
        public virtual Company Company { get; set; }
        [ForeignKey(nameof(ManagerId))]
        [InverseProperty(nameof(Staff.InverseManager))]
        public virtual Staff Manager { get; set; }
        [InverseProperty(nameof(Staff.Manager))]
        public virtual ICollection<Staff> InverseManager { get; set; }
        [InverseProperty("Staff")]
        public virtual ICollection<SalesFigures> SalesFigures { get; set; }
    }
}
