package com.book.dao;

import java.util.List;

import com.book.dto.BookDTO;

public interface BookDao {
	int insertBook(BookDTO book);
	List<BookDTO> listBook();
	int updateBook(BookDTO book);
	int deleteBook(BookDTO book);
}
