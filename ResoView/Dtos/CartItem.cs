using ResoView.Models;

namespace ResoView.Dtos
{
  public class CartItem
  {
    public Product Product { get; set; }
    public int ProductQuantity { get; set; }
  }
}