package com.gray.bookclub.controllers;

import java.util.List;
import java.util.Optional;

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

import com.gray.bookclub.models.Book;
import com.gray.bookclub.models.User;
import com.gray.bookclub.services.BookService;
import com.gray.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/books")
public class BookController {
	@Autowired
	private BookService bookService;
	@Autowired
	private UserService userService;
	
	
	@GetMapping("")
    public String dashboard(Model model, HttpSession session) {
    	try {
    		Optional<Object> thisSession = Optional.of(session.getAttribute("id"));
    		if (thisSession.isPresent()) {
    			List<Book> allBooks = bookService.findAllBooks();
    			model.addAttribute("allBooks", allBooks);
    			return "dashboard.jsp";    			
    		} else return "redirect:/";
    	} catch (IllegalStateException | NullPointerException e) {
    		System.err.println("No one is logged in! Redirecting. . . " + e);
    		return "redirect:/";
    	}
    }
	
	@GetMapping("/new")
	public String newBook(@ModelAttribute("book") Book book, BindingResult result, Model model, HttpSession session) {
		try {
    		Optional<Object> thisSession = Optional.of(session.getAttribute("id"));
    		if (thisSession.isPresent()) {
    			model.addAttribute("book", book);
    			return "newBook.jsp";    			
    		} else return "redirect:/";
    	} catch (IllegalStateException | NullPointerException e) {
    		System.err.println("No one is logged in! Redirecting. . ." + e);
    		return "redirect:/";
    	}
	}
	
	@PostMapping("/create")
	public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model, HttpSession session) {
		//validate book from form
		if (result.hasErrors()) {
			model.addAttribute("book", book);
			return "newBook.jsp";
		} else {
			Long userId = (Long) session.getAttribute("id");
			User user = userService.findUserById(userId);
			book.setUser(user);
			bookService.createBook(book);
			return "redirect:/books";
		}
	}
	
	@GetMapping("/{bookId}")
	public String viewBook(@PathVariable("bookId") Long id, Model model, HttpSession session) {
		try {
    		Optional<Object> thisSession = Optional.of(session.getAttribute("id"));
    		if (thisSession.isPresent()) {
    			//grab the book
    			Book book = bookService.findBook(id);
    			//pass it to the JSP
    			model.addAttribute("book", book);
    			return "showBook.jsp";
    		} else return "redirect:/";
    	} catch (IllegalStateException | NullPointerException e) {
    		System.err.println("No one is logged in! Redirecting. . ." + e);
    		return "redirect:/";
    	}
	}
	
	@GetMapping("/{bookId}/edit")
	public String editBookForm(@PathVariable("bookId") Long id, @ModelAttribute("book") Book book, BindingResult result, Model model, HttpSession session) {
		try {
			Optional<Object> thisSession = Optional.of(session.getAttribute("id"));
			if (thisSession.isPresent()) {
				//grab the book
				Book thisBook = bookService.findBook(id);
				//pass it to the JSP    		
				model.addAttribute("book", thisBook);
				return "editBook.jsp";
			} else return "redirect:/";
		} catch (IllegalStateException | NullPointerException e) {
			System.err.println("No one is logged in! Redirecting. . ." + e);
			return "redirect:/";
		}
	}
	
	@PutMapping("/{id}")
	public String editBook(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("book", book);
			return "editBook.jsp";
		} else {
			bookService.updateBook(book);
			return "redirect:/books";
		}
	}
	
	@DeleteMapping("/delete/{bookId}")
	public String deleteBook(@PathVariable("bookId") Long id) {
		bookService.deleteBook(id);
		return "redirect:/books";
	}
}
