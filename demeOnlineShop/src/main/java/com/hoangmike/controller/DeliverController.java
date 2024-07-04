package com.hoangmike.controller;

import com.hoangmike.entity.OrderStatus;
import com.hoangmike.repository.OrderRepository;
import com.hoangmike.service.DeliverService;
import com.hoangmike.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/deliver")

public class DeliverController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private DeliverService deliverService;

    @GetMapping("/listOrder")
    public String listorder(Model model){
        model.addAttribute("orders", orderService.getAllOrders());
        return "deliverPage";
    }
    @PostMapping("/updateOrderStatus")
    public String updateOrderStatus(@RequestParam("orderId") Long orderId, @RequestParam("status") String status, RedirectAttributes redirectAttributes) {
        try {
            OrderStatus orderStatus = OrderStatus.valueOf(status.toUpperCase());
            deliverService.updateOrderStatus(orderId, orderStatus);
            redirectAttributes.addFlashAttribute("successMessage", "Order status updated successfully!");
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Invalid order status provided.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Could not update order status.");
        }
        return "redirect:/deliver/listOrder";
    }
}
