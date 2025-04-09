package com.m4gi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.m4gi.domain.Product;
import com.m4gi.dto.ProductDTO;
import com.m4gi.mapper.ProductMapper;

import java.io.IOException;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private FileUploadService fileUploadService;

    @Override
    public void registerProduct(ProductDTO dto, Integer companyId) {
        Product product = new Product();

        // 이미지 있을 경우 GCS 업로드
        if (!dto.getProductImgFile().isEmpty()) {
            try {
                String fileName = "product_images/" + dto.getProductImgFile().getOriginalFilename();
                String imageUrl = fileUploadService.uploadFile(dto.getProductImgFile(), fileName);
                product.setProductImg(imageUrl);
            } catch (IOException e) {
                e.printStackTrace();
                product.setProductImg(null);
            }
        } else {  // 이미지 없을시
            product.setProductImg(null);
        }

        // 나머지 정보 세팅
        product.setCompanyId(companyId);
        product.setProductName(dto.getProductName());
        product.setProductDesc(dto.getProductDesc());
        product.setProductQtty(dto.getProductQtty());
        product.setCategory(dto.getCategory());
        product.setPrice(dto.getPrice());
        product.setStatus(dto.getStatus());

        // DB 저장시 product_id 생성됨
        productMapper.insertProduct(product);

    }
    
    @Override
    public List<Product> getProductListByCompany(Integer companyId) {
        return productMapper.selectProductListByCompanyId(companyId);
    }

    
} // ProductServiceImpl 끝

