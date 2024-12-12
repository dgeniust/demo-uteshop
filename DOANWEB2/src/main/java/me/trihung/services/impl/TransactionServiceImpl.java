package me.trihung.services.impl;

import java.util.List;

import me.trihung.dao.ITransactionDao;
import me.trihung.dao.impl.TransactionDaoImpl;
import me.trihung.entity.Transaction;
import me.trihung.services.ITransactionService;

public class TransactionServiceImpl implements ITransactionService{
	
	ITransactionDao itd = new TransactionDaoImpl();
	
	@Override
	public List<Transaction> findAll() {
		// TODO Auto-generated method stub
		return itd.findAll();
	}

	@Override
	public List<Transaction> findAll(int page, int pageSize) {
		// TODO Auto-generated method stub
		return itd.findAll(page, pageSize);
	}

	@Override
	public Transaction findById(int id) {
		// TODO Auto-generated method stub
		return itd.findById(id);
	}

	@Override
	public void insert(Transaction transaction) {
		// TODO Auto-generated method stub
		itd.insert(transaction);
	}

	@Override
	public boolean update(Transaction transaction) {
		// TODO Auto-generated method stub
		return itd.update(transaction);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return itd.delete(id);
	}

	@Override
	public List<Transaction> findByRangeDate(String date1, String date2) {
		// TODO Auto-generated method stub
		return itd.findByRangeDate(date1, date2);
	}

	@Override
	public boolean softDelete(Transaction transaction) {
		// TODO Auto-generated method stub
		return itd.softDelete(transaction);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return itd.count();
	}

	@Override
	public List<Transaction> findByUser(int userid) {
		// TODO Auto-generated method stub
		return itd.findByUser(userid);
	}

	@Override
	public List<Transaction> findByRangeDate(String date1, String date2, int page, int pageSize) {
		// TODO Auto-generated method stub
		return itd.findByRangeDate(date1, date2, page, pageSize);
	}

	@Override
	public List<Transaction> findByUser(int userid, int page, int pageSize) {
		// TODO Auto-generated method stub
		return itd.findByUser(userid, page, pageSize);
	}

}
