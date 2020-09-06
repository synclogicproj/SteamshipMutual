using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SteamshipMutual.Model.Entities
{
    public partial class Company
    {
        public Company()
        {
            Staff = new HashSet<Staff>();
        }

        [Key]
        public int CompanyId { get; set; }
        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [InverseProperty("Company")]
        public virtual ICollection<Staff> Staff { get; set; }
    }
}
