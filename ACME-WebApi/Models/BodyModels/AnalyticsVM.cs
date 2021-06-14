using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ACME_WebApi.Models.BodyModels
{
    public class AnalyticsVM
    {
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string CategoryID { get; set; }
    }
}
