namespace ResoView.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddImageUrlColumnToProductsTable : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.ProductModels", "ImageUrl", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.ProductModels", "ImageUrl");
        }
    }
}
