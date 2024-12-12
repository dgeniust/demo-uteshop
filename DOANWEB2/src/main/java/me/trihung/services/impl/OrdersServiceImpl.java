package me.trihung.services.impl;

import java.util.List;

import me.trihung.dao.IOrdersDao;
import me.trihung.dao.impl.OrdersDaoImpl;
import me.trihung.entity.Orders;
import me.trihung.services.IOrdersService;

public class OrdersServiceImpl implements IOrdersService{
	
	IOrdersDao iod = new OrdersDaoImpl();

	@Override
	public List<Orders> findAll() {
		// TODO Auto-generated method stub
		return iod.findAll();
	}

	@Override
	public List<Orders> findAll(int page, int pageSize) {
		// TODO Auto-generated method stub
		return iod.findAll(page, pageSize);
	}

	@Override
	public Orders findById(int id) {
		// TODO Auto-generated method stub
		return iod.findById(id);
	}

	@Override
	public void insert(Orders order) {
		// TODO Auto-generated method stub
		iod.insert(order);
	}

	@Override
	public boolean update(Orders order) {
		// TODO Auto-generated method stub
		return iod.update(order);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return iod.delete(id);
	}

	@Override
	public List<Orders> findByIdUser(int id, int type) {
		// TODO Auto-generated method stub
		return iod.findByIdUser(id, type);
	}

	@Override
	public List<Orders> findByIdUser(int id, int page, int pageSize, int type) {
		// TODO Auto-generated method stub
		return iod.findByIdUser(id, page, pageSize, type);
	}

	@Override
	public boolean softDelete(Orders order) {
		// TODO Auto-generated method stub
		return false;
	}

}
