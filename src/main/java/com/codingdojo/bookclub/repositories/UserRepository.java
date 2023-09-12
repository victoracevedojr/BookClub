package com.codingdojo.bookclub.repositories;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.bookclub.models.User;

public interface UserRepository extends CrudRepository<User, Long> {
 
	ArrayList<User> findAll();

	Optional<User> findByEmail(String email);

	void deleteById(Long id);
 
}

