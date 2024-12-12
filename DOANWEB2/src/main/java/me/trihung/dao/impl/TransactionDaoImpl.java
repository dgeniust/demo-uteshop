package me.trihung.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import me.trihung.config.JPAConfig;
import me.trihung.dao.ITransactionDao;
import me.trihung.entity.Transaction;
import me.trihung.utils.Utils;

public class TransactionDaoImpl implements ITransactionDao{

	@Override
	public List<Transaction> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Transaction> query = enma.createNamedQuery("Transaction.findAll", Transaction.class);
		return query.getResultList();
	}

	@Override
	public List<Transaction> findAll(int page, int pageSize) {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Transaction> query = enma.createNamedQuery("Transaction.findAll", Transaction.class);
		query.setFirstResult(page*pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public Transaction findById(int id) {
		EntityManager enma = JPAConfig.getEntityManager();
		Transaction tran = enma.find(Transaction.class, id);
		return tran;
	}

	@Override
	public void insert(Transaction transaction) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.persist(transaction);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}finally {
			enma.close();
		}
		
	}

	@Override
	public boolean update(Transaction transaction) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.merge(transaction);
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
			Transaction catego = enma.find(Transaction.class, id);
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
	public List<Transaction> findByRangeDate(String date1, String date2) {
		String sql = "SELECT t FROM Transaction t WHERE t.transactionDay BETWEEN :startDate AND :endDate";
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Transaction> query = enma.createQuery(sql, Transaction.class);
		query.setParameter("startDate", Utils.getDateFrom(date1));
		query.setParameter("endDate", Utils.getDateFrom(date2));
		return query.getResultList();
	}

	@Override
	public boolean softDelete(Transaction transaction) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int count() {
		EntityManager enma = JPAConfig.getEntityManager();
		String jpql = "SELECT count(t) FROM Transaction t";
		Query query = enma.createQuery(jpql);
		return ((Long)query.getSingleResult()).intValue();
	}

	@Override
	public List<Transaction> findByUser(int userid) {
		String sql = "SELECT t FROM Transaction t WHERE t.user == :userid";
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Transaction> query = enma.createQuery(sql, Transaction.class);
		query.setParameter("userid", userid);
		return query.getResultList();
	}

	@Override
	public List<Transaction> findByRangeDate(String date1, String date2, int page, int pageSize) {
		String sql = "SELECT t FROM Transaction t WHERE t.transactionDay BETWEEN :startDate AND :endDate";
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Transaction> query = enma.createQuery(sql, Transaction.class);
		query.setParameter("startDate", Utils.getDateFrom(date1));
		query.setParameter("endDate", Utils.getDateFrom(date2));
		query.setFirstResult(page*pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public List<Transaction> findByUser(int userid, int page, int pageSize) {
		String sql = "SELECT t FROM Transaction t WHERE t.user == :userid";
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Transaction> query = enma.createQuery(sql, Transaction.class);
		query.setParameter("userid", userid);
		query.setFirstResult(page*pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

}
