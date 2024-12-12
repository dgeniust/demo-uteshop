package me.trihung.services;

import java.util.List;

import me.trihung.entity.ProductCategory;

public interface IProductCategoryService {
	
	List<ProductCategory> findAll();
	
	List<ProductCategory> findAll(int page, int pageSize);
	
	ProductCategory findById(int id);
	
	void insert(ProductCategory productCategory);
	 
	boolean update(ProductCategory productCategory); 
	
	boolean delete(int id);
	
	List<ProductCategory> findByName(String keyword);
	
	List<ProductCategory> findByName(String keyword, int page, int pageSize);
	
	boolean softDelete(ProductCategory productCategory);
	
	int count();
}
