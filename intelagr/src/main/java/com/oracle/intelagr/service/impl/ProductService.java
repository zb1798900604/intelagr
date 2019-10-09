package com.oracle.intelagr.service.impl;

import com.oracle.intelagr.entity.Product;
import com.oracle.intelagr.mapper.ProductMapper;
import com.oracle.intelagr.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService implements IProductService {
	@Autowired
	private ProductMapper productapper;

	@Override
	public List<Product> select() {
		return productapper.select();
	}
}
