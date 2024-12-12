package me.trihung.dao;

import java.util.List;

import me.trihung.entity.Product;

public interface IProductDao {
	
	List<Product> findAll();
	
	List<Product> findAll(int page, int pageSize);
	
	Product findById(int id);
	
	void insert(Product Product);
		 
	boolean update(Product Product); 
	
	boolean delete(int id);
	
	List<Product> findByName(String keyword);
	
	List<Product> findByName(String keyword, int page, int pageSize);
	
	boolean softDelete(Product Product);
	
	int count();

}
