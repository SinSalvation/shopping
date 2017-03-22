<%--
  Copyright 2014-2015 the original BZTWT
  Created by QianLong
  User: QianLong
  Date: 2016/4/5 0005
  Time: 09:10
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
  <link rel='stylesheet' href='/shopping/assets/css/search.css' />

  <script type="text/javascript" src="/shopping/assets/js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="/shopping/assets/js/bootstrap.min.js"></script>

  <style>

  </style>
  <title>购物站——搜索</title>
</head>
<body>
<jsp:include page="topbar.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<div class="container">
  <jsp:include page="tab.jsp"></jsp:include>
  <%--<div class="row top40">--%>
    <%--<ul class="sort-menu grey2-bg">--%>
      <%--<a href="/shopping/book/search/${requestScope.condition}?condition=price">--%>
        <%--<li class="blue1-bg menuhead">--%>
          <%--<span class="btn-font white-font medium btn-menu">价格升序</span>--%>
        <%--</li>--%>
      <%--</a>--%>
      <%--<a href="/shopping/book/search/${requestScope.condition}?condition=remain">--%>
        <%--<li class="menutail">--%>
          <%--<span class="btn-font medium btn-menu">剩余库存</span>--%>
        <%--</li>--%>
      <%--</a>--%>
      <%--<a href="/shopping/book/search/${requestScope.condition}?condition=publishdate">--%>
        <%--<li class="menutail">--%>
          <%--<span class="btn-font medium btn-menu">出版时间</span>--%>
        <%--</li>--%>
      <%--</a>--%>
    <%--</ul>--%>
  <%--</div>--%>
  <div class="row top20">
    <c:forEach items="${requestScope.books}" var="item">
      <div class="top20 col-sm-4 col-md-3">
        <a href="/shopping/book/index/${item.bookId}">
          <div class="thumbnail">
            <img src="/shopping/assets/images/category/${item.bookId}.jpg" alt="商品">
            <div class="caption">
              <p class="no-select bookname">
                  ${item.bookname}
              </p>
              <p>
                <span class="blue2-font big">￥<strong><fmt:formatNumber type="number" value="${item.price *1.2}" pattern="0.0" maxFractionDigits="1"/></strong></span>
                <span class="small"><del> ￥<fmt:formatNumber type="number" value="${item.price}" pattern="0.0" maxFractionDigits="1"/></del></span>
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
                <a href="#" class="btn btn-primary" role="button">
                  <strong class="white-font btn-font">加入购物车</strong>
                </a>
              </form>
              </p>
            </div>
          </div>
        </a>
      </div>
    </c:forEach>

  </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
