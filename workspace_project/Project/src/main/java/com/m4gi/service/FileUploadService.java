package com.m4gi.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {
	String uploadFile(MultipartFile file, String fileName) throws IOException;
}
