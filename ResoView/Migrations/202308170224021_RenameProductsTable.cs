namespace ResoView.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class RenameProductsTable : DbMigration
    {
        public override void Up()
        {
            RenameTable(name: "dbo.ProductModels", newName: "Products");
        }
        
        public override void Down()
        {
            RenameTable(name: "dbo.Products", newName: "ProductModels");
        }
    }
}
