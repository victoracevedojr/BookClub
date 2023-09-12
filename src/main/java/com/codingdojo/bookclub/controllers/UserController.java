package com.codingdojo.bookclub.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.models.LoginUser;
import com.codingdojo.bookclub.models.User;
import com.codingdojo.bookclub.services.BookService;
import com.codingdojo.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {

	@Autowired
	private UserService userServ;
	@Autowired
	BookService bookServ;
	
	@GetMapping("/")
	public String index(Model model, HttpSession session) {
		session.setAttribute("userId", null);
		// Bind empty User and LoginUser objects to the JSP to capture the form input
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "home.jsp";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, 
			BindingResult result, Model model, HttpSession session) {

		// Call a register method in the service to do some extra validations and create a new user!
		userServ.register(newUser, result);

		if(result.hasErrors()) {
			// Send in the empty LoginUser before re-rendering the page.
			model.addAttribute("newLogin", new LoginUser());
			return "home.jsp";
		}
		// No errors! Store their ID from the DB in session, in other words, log them in.
		session.setAttribute("userId", newUser.getId());

		return "redirect:/dashboard";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
			BindingResult result, Model model, HttpSession session) {

		User user = userServ.login(newLogin, result);

		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "home.jsp";
		}
		// No errors! Store their ID from the DB in session, in other words, log them in.
		session.setAttribute("userId", user.getId());

		return "redirect:/dashboard";
	}

	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId==null) {
			return "niceTry.jsp";
		}
		User user = userServ.findById(userId);
		List<Book> allBooks = bookServ.allBooks();
		model.addAttribute("user", user);
		model.addAttribute("allBooks", allBooks);

		return "dashboard.jsp";
	}

	@PostMapping("/logout")
	public String logout(Model model, HttpSession session) {
		session.setAttribute("userId", null);
		return "redirect:/";
	}
}

