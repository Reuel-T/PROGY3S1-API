using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace ACME_WebApi.Models
{
    public partial class PROG7311T2Context : DbContext
    {
        public PROG7311T2Context()
        {
        }

        public PROG7311T2Context(DbContextOptions<PROG7311T2Context> options)
            : base(options)
        {
        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductOrder> ProductOrders { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<ShoppingCart> ShoppingCarts { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Wishlist> Wishlists { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
//                optionsBuilder.UseSqlServer("Data Source=REUEL-NITRO\\SQLEXPRESS;Initial Catalog=PROG7311T2;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Category>(entity =>
            {
                entity.HasKey(e => e.Cid)
                    .HasName("PK__Category__C1F8DC59A393893F");

                entity.ToTable("Category");

                entity.Property(e => e.Cid).HasColumnName("CID");

                entity.Property(e => e.CategoryName)
                    .IsRequired()
                    .HasMaxLength(32)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.HasKey(e => e.Pid)
                    .HasName("PK__Product__C5775520E28A45CA");

                entity.ToTable("Product");

                entity.Property(e => e.Pid).HasColumnName("PID");

                entity.Property(e => e.Cid).HasColumnName("CID");

                entity.Property(e => e.Description)
                    .HasMaxLength(128)
                    .IsUnicode(false);

                entity.Property(e => e.ImageUrl)
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(32)
                    .IsUnicode(false);

                entity.Property(e => e.Price).HasColumnType("money");

                entity.HasOne(d => d.CidNavigation)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.Cid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Product__CID__1273C1CD");
            });

            modelBuilder.Entity<ProductOrder>(entity =>
            {
                entity.HasKey(e => e.Oid)
                    .HasName("PK__ProductO__CB394B3944DB71C8");

                entity.ToTable("ProductOrder");

                entity.Property(e => e.Oid).HasColumnName("OID");

                entity.Property(e => e.Date).HasColumnType("datetime");

                entity.Property(e => e.Pid).HasColumnName("PID");

                entity.Property(e => e.Price).HasColumnType("money");

                entity.Property(e => e.Uid).HasColumnName("UID");

                entity.HasOne(d => d.PidNavigation)
                    .WithMany(p => p.ProductOrders)
                    .HasForeignKey(d => d.Pid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ProductOrde__PID__239E4DCF");

                entity.HasOne(d => d.UidNavigation)
                    .WithMany(p => p.ProductOrders)
                    .HasForeignKey(d => d.Uid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ProductOrde__UID__24927208");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.HasKey(e => e.Rid)
                    .HasName("PK__Role__CAFF41327BDE56F8");

                entity.ToTable("Role");

                entity.Property(e => e.Rid).HasColumnName("RID");

                entity.Property(e => e.RoleName)
                    .IsRequired()
                    .HasMaxLength(32)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ShoppingCart>(entity =>
            {
                entity.HasKey(e => e.Sid)
                    .HasName("PK__Shopping__CA195970045AB45D");

                entity.ToTable("ShoppingCart");

                entity.Property(e => e.Sid).HasColumnName("SID");

                entity.Property(e => e.Pid).HasColumnName("PID");

                entity.Property(e => e.Uid).HasColumnName("UID");

                entity.HasOne(d => d.PidNavigation)
                    .WithMany(p => p.ShoppingCarts)
                    .HasForeignKey(d => d.Pid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ShoppingCar__PID__286302EC");

                entity.HasOne(d => d.UidNavigation)
                    .WithMany(p => p.ShoppingCarts)
                    .HasForeignKey(d => d.Uid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ShoppingCar__UID__276EDEB3");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasKey(e => e.Uid)
                    .HasName("PK__User__C5B19602C3549369");

                entity.ToTable("User");

                entity.HasIndex(e => e.Username, "UQ__User__536C85E402946CCB")
                    .IsUnique();

                entity.Property(e => e.Uid).HasColumnName("UID");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Rid).HasColumnName("RID");

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasMaxLength(32)
                    .IsUnicode(false);

                entity.HasOne(d => d.RidNavigation)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.Rid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__User__RID__182C9B23");
            });

            modelBuilder.Entity<Wishlist>(entity =>
            {
                entity.HasKey(e => e.Wid)
                    .HasName("PK__Wishlist__DB376519C2C455DD");

                entity.ToTable("Wishlist");

                entity.Property(e => e.Wid).HasColumnName("WID");

                entity.Property(e => e.Pid).HasColumnName("PID");

                entity.Property(e => e.Uid).HasColumnName("UID");

                entity.HasOne(d => d.PidNavigation)
                    .WithMany(p => p.Wishlists)
                    .HasForeignKey(d => d.Pid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Wishlist__PID__2C3393D0");

                entity.HasOne(d => d.UidNavigation)
                    .WithMany(p => p.Wishlists)
                    .HasForeignKey(d => d.Uid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Wishlist__UID__2B3F6F97");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
