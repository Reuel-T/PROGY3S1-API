using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ACME_WebApi.Migrations
{
    public partial class ImageURLAdded : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.CreateTable(
            //    name: "Category",
            //    columns: table => new
            //    {
            //        CID = table.Column<int>(type: "int", nullable: false)
            //            .Annotation("SqlServer:Identity", "1, 1"),
            //        CategoryName = table.Column<string>(type: "varchar(32)", unicode: false, maxLength: 32, nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK__Category__C1F8DC59A393893F", x => x.CID);
            //    });

            //migrationBuilder.CreateTable(
            //    name: "Role",
            //    columns: table => new
            //    {
            //        RID = table.Column<int>(type: "int", nullable: false)
            //            .Annotation("SqlServer:Identity", "1, 1"),
            //        RoleName = table.Column<string>(type: "varchar(32)", unicode: false, maxLength: 32, nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK__Role__CAFF41327BDE56F8", x => x.RID);
            //    });

            //migrationBuilder.CreateTable(
            //    name: "Product",
            //    columns: table => new
            //    {
            //        PID = table.Column<int>(type: "int", nullable: false)
            //            .Annotation("SqlServer:Identity", "1, 1"),
            //        Name = table.Column<string>(type: "varchar(32)", unicode: false, maxLength: 32, nullable: false),
            //        Description = table.Column<string>(type: "varchar(128)", unicode: false, maxLength: 128, nullable: true),
            //        Price = table.Column<decimal>(type: "money", nullable: false),
            //        CID = table.Column<int>(type: "int", nullable: false),
            //        ImageUrl = table.Column<string>(type: "nvarchar(max)", nullable: true)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK__Product__C5775520E28A45CA", x => x.PID);
            //        table.ForeignKey(
            //            name: "FK__Product__CID__1273C1CD",
            //            column: x => x.CID,
            //            principalTable: "Category",
            //            principalColumn: "CID",
            //            onDelete: ReferentialAction.Restrict);
            //    });

            //migrationBuilder.CreateTable(
            //    name: "User",
            //    columns: table => new
            //    {
            //        UID = table.Column<int>(type: "int", nullable: false)
            //            .Annotation("SqlServer:Identity", "1, 1"),
            //        Username = table.Column<string>(type: "varchar(32)", unicode: false, maxLength: 32, nullable: false),
            //        Password = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: false),
            //        RID = table.Column<int>(type: "int", nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK__User__C5B19602C3549369", x => x.UID);
            //        table.ForeignKey(
            //            name: "FK__User__RID__182C9B23",
            //            column: x => x.RID,
            //            principalTable: "Role",
            //            principalColumn: "RID",
            //            onDelete: ReferentialAction.Restrict);
            //    });

            //migrationBuilder.CreateTable(
            //    name: "ProductOrder",
            //    columns: table => new
            //    {
            //        OID = table.Column<int>(type: "int", nullable: false)
            //            .Annotation("SqlServer:Identity", "1, 1"),
            //        Date = table.Column<DateTime>(type: "datetime", nullable: false),
            //        Qty = table.Column<int>(type: "int", nullable: false),
            //        Price = table.Column<decimal>(type: "money", nullable: false),
            //        PID = table.Column<int>(type: "int", nullable: false),
            //        UID = table.Column<int>(type: "int", nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK__ProductO__CB394B3944DB71C8", x => x.OID);
            //        table.ForeignKey(
            //            name: "FK__ProductOrde__PID__239E4DCF",
            //            column: x => x.PID,
            //            principalTable: "Product",
            //            principalColumn: "PID",
            //            onDelete: ReferentialAction.Restrict);
            //        table.ForeignKey(
            //            name: "FK__ProductOrde__UID__24927208",
            //            column: x => x.UID,
            //            principalTable: "User",
            //            principalColumn: "UID",
            //            onDelete: ReferentialAction.Restrict);
            //    });

            //migrationBuilder.CreateTable(
            //    name: "ShoppingCart",
            //    columns: table => new
            //    {
            //        SID = table.Column<int>(type: "int", nullable: false)
            //            .Annotation("SqlServer:Identity", "1, 1"),
            //        Qty = table.Column<int>(type: "int", nullable: false),
            //        UID = table.Column<int>(type: "int", nullable: false),
            //        PID = table.Column<int>(type: "int", nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK__Shopping__CA195970045AB45D", x => x.SID);
            //        table.ForeignKey(
            //            name: "FK__ShoppingCar__PID__286302EC",
            //            column: x => x.PID,
            //            principalTable: "Product",
            //            principalColumn: "PID",
            //            onDelete: ReferentialAction.Restrict);
            //        table.ForeignKey(
            //            name: "FK__ShoppingCar__UID__276EDEB3",
            //            column: x => x.UID,
            //            principalTable: "User",
            //            principalColumn: "UID",
            //            onDelete: ReferentialAction.Restrict);
            //    });

            //migrationBuilder.CreateTable(
            //    name: "Wishlist",
            //    columns: table => new
            //    {
            //        WID = table.Column<int>(type: "int", nullable: false)
            //            .Annotation("SqlServer:Identity", "1, 1"),
            //        UID = table.Column<int>(type: "int", nullable: false),
            //        PID = table.Column<int>(type: "int", nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK__Wishlist__DB376519C2C455DD", x => x.WID);
            //        table.ForeignKey(
            //            name: "FK__Wishlist__PID__2C3393D0",
            //            column: x => x.PID,
            //            principalTable: "Product",
            //            principalColumn: "PID",
            //            onDelete: ReferentialAction.Restrict);
            //        table.ForeignKey(
            //            name: "FK__Wishlist__UID__2B3F6F97",
            //            column: x => x.UID,
            //            principalTable: "User",
            //            principalColumn: "UID",
            //            onDelete: ReferentialAction.Restrict);
            //    });

            //migrationBuilder.CreateIndex(
            //    name: "IX_Product_CID",
            //    table: "Product",
            //    column: "CID");

            //migrationBuilder.CreateIndex(
            //    name: "IX_ProductOrder_PID",
            //    table: "ProductOrder",
            //    column: "PID");

            //migrationBuilder.CreateIndex(
            //    name: "IX_ProductOrder_UID",
            //    table: "ProductOrder",
            //    column: "UID");

            //migrationBuilder.CreateIndex(
            //    name: "IX_ShoppingCart_PID",
            //    table: "ShoppingCart",
            //    column: "PID");

            //migrationBuilder.CreateIndex(
            //    name: "IX_ShoppingCart_UID",
            //    table: "ShoppingCart",
            //    column: "UID");

            //migrationBuilder.CreateIndex(
            //    name: "IX_User_RID",
            //    table: "User",
            //    column: "RID");

            //migrationBuilder.CreateIndex(
            //    name: "UQ__User__536C85E402946CCB",
            //    table: "User",
            //    column: "Username",
            //    unique: true);

            //migrationBuilder.CreateIndex(
            //    name: "IX_Wishlist_PID",
            //    table: "Wishlist",
            //    column: "PID");

            //migrationBuilder.CreateIndex(
            //    name: "IX_Wishlist_UID",
            //    table: "Wishlist",
            //    column: "UID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ProductOrder");

            migrationBuilder.DropTable(
                name: "ShoppingCart");

            migrationBuilder.DropTable(
                name: "Wishlist");

            migrationBuilder.DropTable(
                name: "Product");

            migrationBuilder.DropTable(
                name: "User");

            migrationBuilder.DropTable(
                name: "Category");

            migrationBuilder.DropTable(
                name: "Role");
        }
    }
}
