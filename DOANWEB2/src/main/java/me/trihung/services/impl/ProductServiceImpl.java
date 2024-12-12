package me.trihung.services.impl;

import java.util.List;

import me.trihung.dao.IProductDao;
import me.trihung.dao.impl.ProductDaoImpl;
import me.trihung.entity.Product;
import me.trihung.services.IProductService;

public class ProductServiceImpl implements IProductService{
	
	IProductDao ipdao = new ProductDaoImpl();
	
	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		return ipdao.findAll();
	}

	@Override
	public List<Product> findAll(int page, int pageSize) {
		// TODO Auto-generated method stub
		return ipdao.findAll(page, pageSize);
	}

	@Override
	public Product findById(int id) {
		// TODO Auto-generated method stub
		return ipdao.findById(id);
	}

	@Override
	public void insert(Product Product) {
		// TODO Auto-generated method stub
		ipdao.insert(Product);
	}

	@Override
	public boolean update(Product Product) {
		// TODO Auto-generated method stub
		return ipdao.update(Product);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return ipdao.delete(id);
	}

	@Override
	public List<Product> findByName(String keyword) {
		// TODO Auto-generated method stub
		return ipdao.findByName(keyword);
	}

	@Override
	public List<Product> findByName(String keyword, int page, int pageSize) {
		// TODO Auto-generated method stub
		return ipdao.findByName(keyword, page, pageSize);
	}

	@Override
	public boolean softDelete(Product Product) {
		// TODO Auto-generated method stub
		return ipdao.softDelete(Product);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return ipdao.count();
	}

}
