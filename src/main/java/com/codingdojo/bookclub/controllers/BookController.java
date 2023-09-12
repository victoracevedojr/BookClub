package com.codingdojo.bookclub.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.models.User;
import com.codingdojo.bookclub.services.BookService;
import com.codingdojo.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/books")
public class BookController {
	
	@Autowired
	BookService bookServ;
	@Autowired
	UserService userServ;
	
	// Methods used for creating a new book
	@GetMapping("/new")
	public String newBook(@ModelAttribute("book") Book book, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		User user = userServ.findById(userId);
		model.addAttribute("user", user);
		return "newBook.jsp";
	}
	@PostMapping("/new")
	public String createBook(
			@Valid @ModelAttribute("book") Book book,
			BindingResult result) {
		if(result.hasErrors()) {
			return "newBook.jsp";
		} else {
			bookServ.createBook(book);
			return "redirect:/dashboard";
		}
	}	
	
	//Method to view a single book
	@GetMapping("/{id}")
	public String details(@PathVariable("id") Long id, Model model, HttpSession session) {
		Book book = bookServ.findBookById(id);
		model.addAttribute("book", book);
		Long userId = (Long) session.getAttribute("userId");
		User user = userServ.findById(userId);
		model.addAttribute("user", user);			
		return "showBook.jsp";
	}
	// Methods used to edit an existing book
	@GetMapping("/{bookId}/edit")
	public String edit(@PathVariable("bookId") Long bookId, Model model) {
		Book bookToUpdate = bookServ.findBookById(bookId);
		model.addAttribute("bookToUpdate", bookToUpdate);
		return "editBook.jsp";
	}
	@PutMapping("/{bookId}/edit")
	public String update(
			@PathVariable("bookId") Long bookId,
			@Valid @ModelAttribute("bookToUpdate") Book bookToUpdate, 
			BindingResult result, 
			Model model) {		
		if(result.hasErrors()) {
			// Ensures that input fields are still pre-populated after validation
			Book thisBook = bookServ.findBookById(bookId);
			model.addAttribute("thisBook", thisBook);
			return "editBook.jsp";
		} else {
			// Find existing book in database and update fields based on form input fields
			Book existingBook = bookServ.findBookById(bookId);
			existingBook.setTitle(bookToUpdate.getTitle());
			existingBook.setAuthor(bookToUpdate.getAuthor());
			existingBook.setThoughts(bookToUpdate.getThoughts());
		    bookServ.updateBook(existingBook);
			return "redirect:/dashboard";
		}
	}	
	
	// Method to delete a book
	@DeleteMapping("/{bookId}/delete")
	public String destroyBook(@PathVariable("bookId") Long bookId, HttpSession session) {
		Book bookToDelete = bookServ.findBookById(bookId);
		if(session.getAttribute("userId")!=bookToDelete.getUser().getId()) {
			return "redirect:/dashboard";
		} else {
			bookServ.deleteBook(bookId);
			return "redirect:/dashboard";			
		}
	}	
}
