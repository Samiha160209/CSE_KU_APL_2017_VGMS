//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VideoGallery.WinApp.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Sold
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int InvoiceId { get; set; }
        public int Quantity { get; set; }
        public float UnitSellingPrice { get; set; }
        public float TotalPrice { get; set; }
        public System.DateTime SaleDate { get; set; }
    
        public virtual Invoice Invoice { get; set; }
        public virtual Product Product { get; set; }
    }
}
