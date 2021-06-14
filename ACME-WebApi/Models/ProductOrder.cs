using System;
using System.Collections.Generic;

#nullable disable

namespace ACME_WebApi.Models
{
    public partial class ProductOrder
    {
        public int Oid { get; set; }
        public DateTime Date { get; set; }
        public int Qty { get; set; }
        public decimal Price { get; set; }
        public int Pid { get; set; }
        public int Uid { get; set; }

        public virtual Product PidNavigation { get; set; }
        public virtual User UidNavigation { get; set; }
    }
}
