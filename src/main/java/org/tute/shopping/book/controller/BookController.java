package org.tute.shopping.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.tute.shopping.book.dao.BookMapper;
import org.tute.shopping.book.pojo.BookWithBLOBs;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by dell on 2016/4/5.
 */
@Controller("book")
@RequestMapping("book")
public class BookController {

    @Autowired
    private BookMapper bookMapper;

    /**
     * 搜索
     */
    @RequestMapping(value = "/search")
    public String search(HttpServletRequest request) throws UnsupportedEncodingException {
        Set<BookWithBLOBs> set = new HashSet<BookWithBLOBs>();
        List<BookWithBLOBs> books = new ArrayList<BookWithBLOBs>();
        String value = request.getParameter("value");
        System.out.println("搜索条件："+value);
        set.addAll(bookMapper.selectByAuthor(value));
        set.addAll(bookMapper.selectByBookName(value));
        set.addAll(bookMapper.selectByType(value));
        books.addAll(set);
        System.out.println("搜索结果："+set.size());
        request.setAttribute("books",books);
        return "search";
    }

    /**
     * 书的详细介绍
     */
    @RequestMapping(value = "/index/{bookId}")
    public String index(HttpServletRequest request,@PathVariable("bookId") String bookId) {
        BookWithBLOBs book = bookMapper.selectByPrimaryKey(bookId);
        System.out.println("index book : "+book);
        request.setAttribute("book",book);
        List<BookWithBLOBs> books = bookMapper.selectByType(book.getType());
        request.setAttribute("books",books);
        return "book";
    }

    /**
     * 相同出版社
     */
    @RequestMapping(value = "/publish")
    public String publish(HttpServletRequest request,@RequestParam String publicsh) {
        List<BookWithBLOBs> books = bookMapper.selectByPublishDate(publicsh);
        request.setAttribute("books",books);
        return " ";
    }

    /**
     * 相同作者
     */
    @RequestMapping(value = "/author")
    public String author(HttpServletRequest request,@RequestParam String author) {
        List<BookWithBLOBs> books = bookMapper.selectByAuthor(author);
        request.setAttribute("books",books);
        return " ";
    }

    /**
     * 相同类型
     */
    @RequestMapping(value = "/type")
    public String type(HttpServletRequest request,@RequestParam String type) {
        List<BookWithBLOBs> books = bookMapper.selectByType(type);
        request.setAttribute("books",books);
        return " ";
    }

    /**
     * 购买本书的人还购买了的书
     */
    @RequestMapping(value = "/books")
    public String books(HttpServletRequest request,@RequestParam String bookId) {
        List<BookWithBLOBs> books = bookMapper.selectByBookId(bookId);
        request.setAttribute("books", books);
        return "";
    }

}
