using System;
using System.Collections.Generic;

#nullable disable

namespace ACME_WebApi.Models
{
    public partial class Product
    {
        public Product()
        {
            ProductOrders = new HashSet<ProductOrder>();
            ShoppingCarts = new HashSet<ShoppingCart>();
            Wishlists = new HashSet<Wishlist>();
        }

        public int Pid { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Cid { get; set; }
        public string ImageUrl { get; set; }

        public virtual Category CidNavigation { get; set; }
        public virtual ICollection<ProductOrder> ProductOrders { get; set; }
        public virtual ICollection<ShoppingCart> ShoppingCarts { get; set; }
        public virtual ICollection<Wishlist> Wishlists { get; set; }
    }
}
