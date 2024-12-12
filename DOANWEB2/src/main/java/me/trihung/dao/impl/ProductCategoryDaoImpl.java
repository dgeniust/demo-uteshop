package me.trihung.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import me.trihung.config.JPAConfig;
import me.trihung.dao.IProductCategoryDao;
import me.trihung.entity.Product;
import me.trihung.entity.ProductCategory;

public class ProductCategoryDaoImpl implements IProductCategoryDao{

	@Override
	public List<ProductCategory> findAll() { 
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<ProductCategory> query = enma.createNamedQuery("ProductCategory.findAll", ProductCategory.class);
		return query.getResultList();
	}

	@Override
	public List<ProductCategory> findAll(int page, int pageSize) {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<ProductCategory> query = enma.createNamedQuery("ProductCategory.findAll", ProductCategory.class);
		query.setFirstResult(page*pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public ProductCategory findById(int id) {
		EntityManager enma = JPAConfig.getEntityManager();
		ProductCategory product = enma.find(ProductCategory.class, id);
		return product;
	}

	@Override
	public void insert(ProductCategory productCategory) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.persist(productCategory);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}finally {
			enma.close();
		}
		
	}

	@Override
	public boolean update(ProductCategory productCategory) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.merge(productCategory);
			trans.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			return false;
		}finally {
			enma.close();
		}
		return true;
	}

	@Override
	public boolean delete(int id) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			Product catego = enma.find(Product.class, id);
			if(catego!=null)
				enma.remove(catego);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			return false;
		}finally {
			enma.close();
		}
		return true;
	}

	@Override
	public List<ProductCategory> findByName(String keyword) {
		EntityManager enma = JPAConfig.getEntityManager();
		String jpql = "SELECT pc FROM ProductCategory pc WHERE pc.productCategoryName like :productname";
		TypedQuery<ProductCategory> query = enma.createQuery(jpql, ProductCategory.class);
		query.setParameter("productname", "%"+keyword+"%");
		
		return query.getResultList();
	}

	@Override
	public List<ProductCategory> findByName(String keyword, int page, int pageSize) {
		EntityManager enma = JPAConfig.getEntityManager();
		String jpql = "SELECT pc FROM ProductCategory pc WHERE pc.productCategoryName like :productname";
		TypedQuery<ProductCategory> query = enma.createQuery(jpql, ProductCategory.class);
		query.setParameter("productname", "%"+keyword+"%");
		query.setFirstResult(page*pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public boolean softDelete(ProductCategory productCategory) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int count() {
		EntityManager enma = JPAConfig.getEntityManager();
		String jpql = "SELECT count(p) FROM Product p";
		Query query = enma.createQuery(jpql);
		return ((Long)query.getSingleResult()).intValue();
	}

}
