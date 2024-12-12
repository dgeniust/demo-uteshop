package me.trihung.services;

import java.util.List;

import me.trihung.entity.Rating;

public interface IRatingService {
	
	List<Rating> findAll();
	
	List<Rating> findAll(int page, int pageSize);
	
	Rating findById(int id);
	
	void insert(Rating rating);
		 
	boolean update(Rating rating); 
	
	boolean delete(int id);
	
	List<Rating> findByIdList(int id);
	
	List<Rating> findByIdList(int id, int page, int pageSize);
	
	boolean softDelete(Rating rating);
	
	int count();
}
