using ResoView.Models;

namespace ResoView.Dtos
{
  public class CartItem
  {
    public ProductModel Product { get; set; }
    public int ProductQuantity { get; set; }
  }
}