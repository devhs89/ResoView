/*
 * Copyright 2023, Group 2
 * Harpreet Singh (8870943)
 * Pratharan Sai Rupak Reddy, Gondi ()
 * Deepak, Mikkilneni Jeevarathnam (8850079)
 * Bhavna, Bhavna (8864264)
 */

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
