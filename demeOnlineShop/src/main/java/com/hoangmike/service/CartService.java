package com.hoangmike.service;

import com.hoangmike.dto.request.UpdateCartDTO;
import com.hoangmike.entity.Cart;
import com.hoangmike.entity.CartItem;
import com.hoangmike.entity.User;
import com.hoangmike.repository.CartItemRepository;
import com.hoangmike.repository.CartRepository;
import com.hoangmike.repository.ProductRepository;
import com.hoangmike.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import com.hoangmike.entity.Product;

import java.util.Optional;

@Service
public class CartService {
    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private CartItemRepository cartItemRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;

    public Cart getCart(){
        String email = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.findByEmail(email);

        if (user == null){
            throw new RuntimeException("User not found");
        }

        // get the cart for the current user
        Cart cart = user.getCart();
        if(cart == null){
            cart = new Cart();
            cart.setUser(user);
            cart = cartRepository.save(cart);
        }

        return cart;
    }

    public void addToCart(Long productId){
        //get the product
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        //get the cart
        Cart cart = getCart();

        //check if the product is already in the cart
        Optional<CartItem> optionalCartItem = cart.getItems().stream()
                .filter(item -> item.getProduct().getProductId() == product.getProductId())
                .findFirst();

        if(optionalCartItem.isPresent()) {
            //if the product is already in the cart, increase the quantity
            CartItem cartItem = optionalCartItem.get();
            cartItem.setQuantity(cartItem.getQuantity() + 1);
            cartItemRepository.save(cartItem);
        } else {
            // if the product is not in the cart, add a new cart item
            CartItem cartItem = new CartItem();
            cartItem.setProduct(product);
            cartItem.setQuantity(1);
            cartItem.setCart(cart);
            cart.addItem(cartItem);
            cartItemRepository.save(cartItem);
        }

        //Save the cart
        cartRepository.save(cart);
    }

    public int getCartItemCount(){
        Cart cart = getCart();
        return cart.getItems().stream().mapToInt(CartItem::getQuantity).sum();
    }

    public void updateCartItem(UpdateCartDTO updateCartDTO){
        CartItem cartItem = cartItemRepository.findCartItemById(updateCartDTO.getId());
        if(cartItem == null){
            throw new RuntimeException("Cart item not found");
        }
        else{
        cartItem.setQuantity(updateCartDTO.getQuantity());
            cartItemRepository.save(cartItem);
        }
    }

    public void removeItem(Long itemId){
        Cart cart = getCart();

        CartItem itemToRemove = null;
        for(CartItem item : cart.getItems()){
            if(item.getId().equals(itemId)){
                itemToRemove = item;
                break;
            }
        }

        //remove the item from the cart
        if(itemToRemove != null){
            cart.removeItem(itemToRemove);
            //remove the item form the database
            cartItemRepository.delete(itemToRemove);
        }
        cartRepository.save(cart);
    }
}
