package com.hoangmike.controller;

import com.hoangmike.dto.request.ProductUpdateStockIn;
import com.hoangmike.entity.OrderStatus;
import com.hoangmike.entity.Product;
import com.hoangmike.entity.User;
import com.hoangmike.exception.AppException;
import com.hoangmike.repository.ProductRepository;
import com.hoangmike.service.CustomUserDetailsService;
import com.hoangmike.service.FileService;
import com.hoangmike.service.OrderService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/saler")
public class SalerController {
    @Autowired
    FileService fileService;

    @Autowired
    OrderService orderService;
    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/stockIn")
    public String salerPage() {
        return "stockIn";
    }
    @PostMapping("/upload")
    public ModelAndView processUploadedFile(@RequestParam("file") MultipartFile reapExcelDataFile) {
        ModelAndView mav = new ModelAndView("stockIn");
        try {
            List<Product> tempProductList = fileService.processFile(reapExcelDataFile);
            mav.addObject("products", tempProductList);
        } catch (Exception e) {
            mav.addObject("error", "Failed to process file: " + e.getMessage());
        }
        return mav;
    }

    @PostMapping("/updateWithStockIn")
    public String updateWithStockIn(@ModelAttribute("updates") ProductUpdateStockInList updates, RedirectAttributes redirectAttributes) {
        try {
            fileService.updateWithStockIn(updates.getUpdates());
            redirectAttributes.addFlashAttribute("message", "Quantities updated successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to update quantities: " + e.getMessage());
        }
        return "redirect:/saler/stockIn";
    }

    public static class ProductUpdateStockInList {
        private List<ProductUpdateStockIn> updates;

        public List<ProductUpdateStockIn> getUpdates() {
            return updates;
        }

        public void setUpdates(List<ProductUpdateStockIn> updates) {
            this.updates = updates;
        }
    }

    @GetMapping("/manageOrder")
    public String manageOrder(Model model) {
        User currentUser = CustomUserDetailsService.getCurrentUserEntity();
        model.addAttribute("user", currentUser);
        model.addAttribute("orders", orderService.getAllOrdersSortedByDate());
        return "manageOrder";
    }

    @PostMapping("/updateOrderStatus")
    public String updateOrderStatus(@RequestParam("orderId") Long orderId, @RequestParam("status") String status, RedirectAttributes redirectAttributes) {
        try {
            OrderStatus orderStatus = OrderStatus.valueOf(status.toUpperCase());
            orderService.updateOrderStatus(orderId, orderStatus);
            redirectAttributes.addFlashAttribute("successMessage", "Order status updated successfully!");
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Invalid order status provided.");
        } catch (AppException e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Insufficient product quantity for order.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Could not update order status.");
        }
        return "redirect:/saler/manageOrder";
    }

}
