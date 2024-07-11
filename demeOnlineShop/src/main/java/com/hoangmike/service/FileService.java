package com.hoangmike.service;

import com.hoangmike.dto.request.ProductUpdateStockIn;
import com.hoangmike.entity.Product;
import com.hoangmike.repository.ProductRepository;
import jakarta.transaction.Transactional;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class FileService {
    @Autowired
    private ProductRepository productRepository;

    // Existing methods...

    public List<Product> processFile(MultipartFile reapExcelDataFile) throws IOException {
        List<Product> tempProductList = new ArrayList<>();
        XSSFWorkbook workbook = new XSSFWorkbook(reapExcelDataFile.getInputStream());
        XSSFSheet worksheet = workbook.getSheetAt(0);

        for (int i = 1; i < worksheet.getPhysicalNumberOfRows(); i++) {
            XSSFRow row = worksheet.getRow(i);
            int productId = (int) row.getCell(0).getNumericCellValue();
            int productQuantity = (int) row.getCell(1).getNumericCellValue();

            String productName = productRepository.findById((long) productId)
                    .map(Product::getProductName)
                    .orElse("Unknown Product");

            tempProductList.add(new Product(productId, productName, productQuantity));
        }
        return tempProductList;
    }

    @Transactional
    public void updateWithStockIn(List<ProductUpdateStockIn> updates) throws Exception {
        for (ProductUpdateStockIn update : updates) {
            Long productId = update.getProductId();
            int quantity = update.getQuantity();
            productRepository.updateProductQuantity(productId, quantity);
        }
    }
}
