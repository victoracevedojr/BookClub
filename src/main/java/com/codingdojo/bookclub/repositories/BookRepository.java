package com.codingdojo.bookclub.repositories;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.bookclub.models.Book;

public interface BookRepository extends CrudRepository<Book, Long> {
	ArrayList<Book> findAll();
	
	void deleteById(Long id);
}
