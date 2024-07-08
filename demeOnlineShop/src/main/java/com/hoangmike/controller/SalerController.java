package com.hoangmike.controller;

import com.hoangmike.entity.Product;
import com.hoangmike.repository.ProductRepository;
import com.hoangmike.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/saler")
public class SalerController {
    @Autowired
    FileService fileService;

    @GetMapping("/salerPage")
    public String salerPage() {
        return "salerPage";
    }
    @PostMapping("/upload")
    public ModelAndView processUploadedFile(@RequestParam("file") MultipartFile reapExcelDataFile) {
        ModelAndView mav = new ModelAndView("salerPage");
        try {
            List<Product> tempProductList = fileService.processFile(reapExcelDataFile);
            mav.addObject("products", tempProductList);
        } catch (Exception e) {
            mav.addObject("error", "Failed to process file: " + e.getMessage());
        }
        return mav;
    }
}
