/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author amitkabra59
 */
import java.util.HashMap;
public class Cart {
    HashMap<String, Integer> cartItems;
    public Cart(){
     cartItems = new HashMap<>();
      
    }
    public HashMap getCartItems(){
        return cartItems;
    }
    public void addToCart(String itemId, int price){
        cartItems.put(itemId, price);
    }
     
}