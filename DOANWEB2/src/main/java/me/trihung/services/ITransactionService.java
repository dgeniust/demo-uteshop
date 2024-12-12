package me.trihung.services;

import java.util.List;

import me.trihung.entity.Transaction;

public interface ITransactionService {
	
List<Transaction> findAll();
	
	List<Transaction> findAll(int page, int pageSize);
	
	Transaction findById(int id);
	
	void insert(Transaction transaction);
		 
	boolean update(Transaction transaction); 
	
	boolean delete(int id);
		
	List<Transaction> findByRangeDate(String date1, String date2);
	
	List<Transaction> findByRangeDate(String date1, String date2, int page, int pageSize);
	
	List<Transaction> findByUser(int userid);
	
	List<Transaction> findByUser(int userid, int page, int pageSize);
	
	boolean softDelete(Transaction transaction);
	
	int count();
}
