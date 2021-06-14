using System;
using System.Collections.Generic;

#nullable disable

namespace ACME_WebApi.Models
{
    public partial class User
    {
        public User()
        {
            ProductOrders = new HashSet<ProductOrder>();
            ShoppingCarts = new HashSet<ShoppingCart>();
            Wishlists = new HashSet<Wishlist>();
        }

        public int Uid { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public int Rid { get; set; }

        public virtual Role RidNavigation { get; set; }
        public virtual ICollection<ProductOrder> ProductOrders { get; set; }
        public virtual ICollection<ShoppingCart> ShoppingCarts { get; set; }
        public virtual ICollection<Wishlist> Wishlists { get; set; }
    }
}
