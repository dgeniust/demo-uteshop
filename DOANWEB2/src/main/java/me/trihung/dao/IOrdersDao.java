package me.trihung.dao;

import java.util.List;

import me.trihung.entity.Orders;

public interface IOrdersDao {
	
	List<Orders> findAll();
	
	List<Orders> findAll(int page, int pageSize);
	
	Orders findById(int id);
	
	void insert(Orders order);
		 
	boolean update(Orders order); 
	
	boolean delete(int id);
	
	List<Orders> findByIdUser(int id, int type);
	
	List<Orders> findByIdUser(int id, int page, int pageSize, int type);
	
	boolean softDelete(Orders order);
}
