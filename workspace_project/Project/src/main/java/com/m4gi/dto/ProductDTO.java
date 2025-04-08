package com.m4gi.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class ProductDTO {
    private String productName;
    private String productDesc;
    private MultipartFile productImgFile;
    private Integer productQtty;
    private String category;
    private Integer price;
    private Integer status;
}
