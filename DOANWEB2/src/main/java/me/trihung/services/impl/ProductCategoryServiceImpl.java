package me.trihung.services.impl;

import java.util.List;

import me.trihung.dao.IProductCategoryDao;
import me.trihung.dao.impl.ProductCategoryDaoImpl;
import me.trihung.entity.ProductCategory;
import me.trihung.services.IProductCategoryService;

public class ProductCategoryServiceImpl implements IProductCategoryService{
	
	IProductCategoryDao ipd = new ProductCategoryDaoImpl();

	@Override
	public List<ProductCategory> findAll() {
		// TODO Auto-generated method stub
		return ipd.findAll();
	}

	@Override
	public List<ProductCategory> findAll(int page, int pageSize) {
		// TODO Auto-generated method stub
		return ipd.findAll(page, pageSize);
	}

	@Override
	public ProductCategory findById(int id) {
		// TODO Auto-generated method stub
		return ipd.findById(id);
	}

	@Override
	public void insert(ProductCategory productCategory) {
		// TODO Auto-generated method stub
		ipd.insert(productCategory);
	}

	@Override
	public boolean update(ProductCategory productCategory) {
		// TODO Auto-generated method stub
		return ipd.update(productCategory);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return ipd.delete(id);
	}

	@Override
	public List<ProductCategory> findByName(String keyword) {
		// TODO Auto-generated method stub
		return ipd.findByName(keyword);
	}

	@Override
	public List<ProductCategory> findByName(String keyword, int page, int pageSize) {
		// TODO Auto-generated method stub
		return ipd.findByName(keyword, page, pageSize);
	}

	@Override
	public boolean softDelete(ProductCategory productCategory) {
		// TODO Auto-generated method stub
		return ipd.softDelete(productCategory);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return ipd.count();
	}
	
	

}
