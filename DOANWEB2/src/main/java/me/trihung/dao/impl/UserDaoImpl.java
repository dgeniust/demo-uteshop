package me.trihung.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import me.trihung.config.JPAConfig;
import me.trihung.dao.IUserDao;
import me.trihung.entity.Users;

public class UserDaoImpl implements IUserDao{

	@Override
	public List<Users> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Users> query = enma.createNamedQuery("Users.findAll", Users.class);
		return query.getResultList();
	}

	@Override
	public List<Users> findAll(int page, int pageSize) {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Users> query = enma.createNamedQuery("Users.findAll", Users.class);
		query.setFirstResult(page*pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public Users findById(int id) {
		EntityManager enma = JPAConfig.getEntityManager();
		Users user = enma.find(Users.class, id);
		return user;
	}

	@Override
	public Users findByEmail(String email) {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Users> query = enma.createQuery(
                "SELECT u FROM User u WHERE u.userEmail = :useremail",
                Users.class);
        query.setParameter("useremail", email);
        Users user = query.getResultStream().findFirst().orElse(null);
        return user;
	}

	@Override
	public void insert(Users users) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.persist(users);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		}finally {
			enma.close();
		}
		
	}

	@Override
	public boolean update(Users users) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.merge(users);
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
	public boolean delete(String username) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			Users user = findByUserName(username);
			if(user!=null)
				enma.remove(user);
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
	public boolean login(String username, String pass) {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Users> query = enma.createQuery(
                "SELECT u FROM Users u WHERE u.userName = :username AND u.userPassword = :password",
                Users.class);
        query.setParameter("username", username);
        query.setParameter("password", pass);

        Users user = query.getResultStream().findFirst().orElse(null);
        if (user!=null)
        	return true;
		return false;
	}

	@Override
	public boolean softDelete(Users users) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int count() {
		EntityManager enma = JPAConfig.getEntityManager();
		String jpql = "SELECT count(u) FROM Users u";
		Query query = enma.createQuery(jpql);
		return ((Long)query.getSingleResult()).intValue();
	}

	@Override
	public Users findByUserName(String username) {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Users> query = enma.createQuery(
                "SELECT u FROM Users u WHERE u.userName = :username",
                Users.class);
        query.setParameter("username", username);

        Users user = query.getResultStream().findFirst().orElse(null);
        return user;
	}

	@Override
	public boolean register(Users users) {
		if (findByUserName(users.getUserName()) != null)
			return false;
		if (findByUserName(users.getUserEmail()) != null)
			return false;
		insert(users);
		return true;
	}
	
	

}
