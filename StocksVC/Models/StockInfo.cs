//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace StocksVC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class StockInfo
    {
        public int Id { get; set; }
        public string StockName { get; set; }
        public decimal Price { get; set; }
        public string Thoughts { get; set; }
        public int TotalBought { get; set; }
        public int TotalSold { get; set; }
    }
}