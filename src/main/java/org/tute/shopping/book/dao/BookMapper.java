package org.tute.shopping.book.dao;

import org.springframework.stereotype.Component;
import org.tute.shopping.book.pojo.Book;
import org.tute.shopping.book.pojo.BookWithBLOBs;

import java.util.List;

@Component
public interface BookMapper {
    int deleteByPrimaryKey(String bookId);

    int insert(BookWithBLOBs record);

    int insertSelective(BookWithBLOBs record);

    BookWithBLOBs selectByPrimaryKey(String bookId);

    int updateByPrimaryKeySelective(BookWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(BookWithBLOBs record);

    int updateByPrimaryKey(Book record);

    List<BookWithBLOBs> selectByBookName(String bookname);

    List<BookWithBLOBs> selectByType(String type);

    List<BookWithBLOBs> selectByAuthor(String author);

    List<BookWithBLOBs> selectByPublishDate(String publishdate);

    List<BookWithBLOBs> selectByClientId(String clientId);

    List<BookWithBLOBs> selectByBookId(String book_id);
}