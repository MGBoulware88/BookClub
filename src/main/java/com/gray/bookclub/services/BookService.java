package com.gray.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gray.bookclub.models.Book;
import com.gray.bookclub.repositories.BookRepository;

@Service
public class BookService {
	@Autowired
	private BookRepository bookRepo;
	//get all
	public List<Book> findAllBooks() {
		return bookRepo.findAll();
	}
	//get one by ID
	public Book findBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		} else return null;
	}
	//create one
	public Book createBook(Book book) {
		return bookRepo.save(book);
	}
	//update one by ID
	public Book updateBook(Book book) {	
		return bookRepo.save(book);
	}
	//delete one by ID
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}
	
}
