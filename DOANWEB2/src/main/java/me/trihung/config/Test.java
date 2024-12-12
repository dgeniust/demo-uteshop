package me.trihung.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import me.trihung.services.IProductCategoryService;
import me.trihung.services.IRatingService;
import me.trihung.services.IUserService;
import me.trihung.services.impl.ProductCategoryServiceImpl;
import me.trihung.services.impl.RatingServiceImpl;
import me.trihung.services.impl.UserServiceImpl;

public class Test {
	
	public static void main(String[] args) {
		
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		IRatingService s = new RatingServiceImpl();
		
		
		try {
			trans.begin();
			trans.commit();
			System.out.println("ok");
			s.count();
		}catch(Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}

	}
	
	

}
