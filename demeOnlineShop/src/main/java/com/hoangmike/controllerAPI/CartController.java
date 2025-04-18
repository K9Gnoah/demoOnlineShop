package com.hoangmike.controllerAPI;

import com.hoangmike.dto.response.ApiResponse;
import com.hoangmike.dto.request.UpdateCartDTO;
import com.hoangmike.entity.Cart;
import com.hoangmike.exception.AppException;
import com.hoangmike.service.CartService;
import com.hoangmike.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;

    @Autowired
    private OrderService orderService;

    @GetMapping
    public ApiResponse getCart(){
        ApiResponse response = new ApiResponse();
        Cart cart = cartService.getCart();
        response.setResult(cart);
        return response;
    }

    @PutMapping("/update")
    public String updateCart(@RequestBody UpdateCartDTO updateCartDTO){
        cartService.updateCartItem(updateCartDTO);
        return "update cart success";
    }

    @PostMapping("/add/{productId}")
    public ResponseEntity<Void> addToCart(@PathVariable Long productId) {
        cartService.addToCart(productId);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/count")
    public ResponseEntity<Integer> getCartItemCount() {
        int count = cartService.getCartItemCount();
        return ResponseEntity.ok(count);
    }

    @DeleteMapping("/remove/{itemId}")
    public ResponseEntity<Void> removeItem(@PathVariable Long itemId){
        cartService.removeItem(itemId);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/checkout")
    public ResponseEntity<ApiResponse> checkOut(@RequestParam String address, @RequestParam String name, @RequestParam String phone) {
        ApiResponse<Object> response = new ApiResponse<>();
        try {
            orderService.createOrder(address, name, phone);
            response.setMessage("Order created successfully");
            return ResponseEntity.ok(response);
        } catch (AppException e) {
            response.setCode(e.getErrorCode().getCode());
            response.setMessage(e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }
}
