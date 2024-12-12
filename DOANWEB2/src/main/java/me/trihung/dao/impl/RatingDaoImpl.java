package me.trihung.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import me.trihung.config.JPAConfig;
import me.trihung.dao.IRatingDao;
import me.trihung.entity.Rating;
import me.trihung.services.IProductService;
import me.trihung.services.impl.ProductServiceImpl;

public class RatingDaoImpl implements IRatingDao{

	@Override
	public List<Rating> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Rating> query = enma.createNamedQuery("Rating.findAll", Rating.class);
		return query.getResultList();
	}

	@Override
	public List<Rating> findAll(int page, int pageSize) {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Rating> query = enma.createNamedQuery("Product.findAll", Rating.class);
		query.setFirstResult(page*pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public Rating findById(int id) {
		EntityManager enma = JPAConfig.getEntityManager();
		Rating rating = enma.find(Rating.class, id);
		return rating;
	}

	@Override
	public void insert(Rating rating) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.persist(rating);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}finally {
			enma.close();
		}
	}

	@Override
	public boolean update(Rating rating) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.merge(rating);
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
			Rating catego = enma.find(Rating.class, id);
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
	public List<Rating> findByIdList(int id) {
		String sql = "SELECT r FROM Rating r WHERE r.productId = :productid";
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Rating> query = enma.createQuery(sql, Rating.class);
		IProductService ips = new ProductServiceImpl();
		query.setParameter("productid", id);
		return query.getResultList();
	}

	@Override
	public List<Rating> findByIdList(int id, int page, int pageSize) {
		String sql = "SELECT r FROM Rating r WHERE r.productId = :productid";
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Rating> query = enma.createQuery(sql, Rating.class);
		IProductService ips = new ProductServiceImpl();
		query.setParameter("productid", id);
//		query.setFirstResult(page*pageSize);
//		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public boolean softDelete(Rating rating) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int count() {
		EntityManager enma = JPAConfig.getEntityManager();
		String jpql = "SELECT count(r) FROM Rating r";
		Query query = enma.createQuery(jpql);
		return ((Long)query.getSingleResult()).intValue();
	}

}
