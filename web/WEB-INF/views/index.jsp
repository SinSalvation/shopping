<%@ page import="org.tute.shopping.book.pojo.BookWithBLOBs" %>
<%@ page import="java.util.List" %>
<%--
  Copyright 2014-2015 the original BZTWT
  Created by QianLong
  User: QianLong
  Date: 2016/4/3 0003
  Time: 09:55
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head lang="en">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <link rel='stylesheet' href='/shopping/assets/css/font-awesome.min.css' />
    <link rel='stylesheet' href='/shopping/assets/css/bootstrap.min.css' />
    <link rel='stylesheet' href='/shopping/assets/css/style.css' />
    <link rel='stylesheet' href='/shopping/assets/css/color.css' />
    <link rel='stylesheet' href='/shopping/assets/css/elements.css' />
    <link rel='stylesheet' href='/shopping/assets/css/index.css' />

    <script type="text/javascript" src="/shopping/assets/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/shopping/assets/js/bootstrap.min.js"></script>
    <title>职师书园——网上购书中心</title>
</head>
<body>
<jsp:include page="topbar.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<div class="container">
    <jsp:include page="tab.jsp"></jsp:include>
    <div class="row top20">
        <div class="col-md-3">
            <ul class="list-menu">
                <li class="menu-active medium">全部分类</li>
                <a href="/shopping/book/search?value=自然科学"><li>自然科学</li></a>
                <a href="/shopping/book/search?value=教育"><li>教育</li></a>
                <a href="/shopping/book/search?value=游戏"><li>游戏</li></a>
                <a href="/shopping/book/search?value=历史"><li>历史</li></a>
                <a href="/shopping/book/search?value=军事"><li>军事</li></a>
                <a href="/shopping/book/search?value=幼儿"><li>幼儿</li></a>
                <a href="/shopping/book/search?value=法律"><li>法律</li></a>
                <a href="/shopping/book/search?value=计算机"><li>计算机</li></a>
                <a href="/shopping/book/search?value=经济"><li>经济</li></a>
                <a href="/shopping/book/search?value=医学"><li>医学</li></a>
                <a href="/shopping/book/search?value=语言"><li>语言</li></a>
                <a href="/shopping/book/search?value=小说"><li>小说</li></a>
                <a href="/shopping/book/search?value=益智"><li>益智</li></a>
                <a href="/shopping/book/search?value=管理"><li>管理</li></a>
            </ul>
            <img src="/shopping/assets/images/side.jpg" class="side-img" alt="商品">
            <ul class="sector-menu grey2-bg">
                <li><a href="/shopping/book/search?value=教" class="black-font">考试</a></li>
                <li><a href="/shopping/book/search?value=教" class="black-font">教材</a></li>
                <li><a href="/shopping/book/search?value=经济" class="black-font">经济</a></li>
                <li><a href="/shopping/book/search?value=管理" class="black-font">成功/励志</a></li>
                <li><a href="/shopping/book/search?value=小说" class="black-font">小说</a></li>
                <li><a href="/shopping/book/search?value=语言" class="black-font">外语</a></li>
                <li><a href="/shopping/book/search?value=历史" class="black-font">历史</a></li>
                <li><a href="/shopping/book/search?value=医" class="black-font">养生</a></li>
                <li><a href="/shopping/book/search?value=计算机" class="black-font">电脑</a></li>
                <li><a href="/shopping/book/search?value=法律" class="black-font">法律</a></li>
                <li><a href="/shopping/book/search?value=军事" class="black-font">军事</a></li>
                <li><a href="/shopping/book/search?value=益智" class="black-font">益智</a></li>
            </ul>
        </div>
        <div class="col-md-9">
            <div id="myCarousel" class="carousel slide carousel-div">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <a href="http://www.taobao.com">
                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="carousel-img" src="/shopping/assets/images/page1.jpg" alt="First slide">
                        </div>
                        <div class="item">
                            <img class="carousel-img" src="/shopping/assets/images/page2.jpg" alt="Second slide">
                        </div>
                        <div class="item">
                            <img class="carousel-img" src="/shopping/assets/images/page3.jpg" alt="Third slide">
                        </div>
                    </div>
                </a>

            </div>
            <img src="/shopping/assets/images/recommend.jpg" class="top40">
            <div class="row">
                <c:forEach items="${requestScope.books}" var="item">
                    <div class="top20 col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <a href="/shopping/book/index/${item.bookId}" class="thumbnail">
                                <img src="/shopping/assets/images/category/${item.bookId}.jpg" alt="商品">
                            </a>
                            <div class="caption">
                                <p class="no-select bookname">
                                        ${item.bookname}
                                </p>
                                <p>
                    <span class="blue2-font big">
                      ￥<strong><fmt:formatNumber type="number" value="${item.price}" pattern="0.0" maxFractionDigits="1"/> </strong>
                    </span>
                    <span class="small">
                      <del>
                          <fmt:formatNumber type="number" value="${item.price * 1.2}" pattern="0.0" maxFractionDigits="1"/>
                      </del>
                    </span>
                  <span class="right stamp">
                    包邮
                  </span>
                  <span class="right decline">
                    降价
                  </span>
                                </p>
                                <hr class="fullwidth"/>
                                <p>
                                <form action="/shopping/cart/add" method="post">
                                    <input type="hidden" name="number" value="1"/>
                                    <input type="hidden" name="bookId" value="${item.bookId}"/>
                                    <button href="#" class="btn btn-primary" type="submit" role="button">
                                        <strong class="white-font btn-font">加入购物车</strong>
                                    </button>
                                </form>
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>