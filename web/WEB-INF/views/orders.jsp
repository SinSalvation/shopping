<%--
  Copyright 2014-2015 the original BZTWT
  Created by QianLong
  User: QianLong
  Date: 2016/4/7 0007
  Time: 09:02
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
  <link rel='stylesheet' href='/shopping/assets/css/bootstrap-spinner.css' />
  <link rel='stylesheet' href='/shopping/assets/css/style.css' />
  <link rel='stylesheet' href='/shopping/assets/css/color.css' />
  <link rel='stylesheet' href='/shopping/assets/css/elements.css' />
  <link rel='stylesheet' href='/shopping/assets/css/cart.css' />

  <script type="text/javascript" src="/shopping/assets/js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="/shopping/assets/js/jquery.spinner.min.js"></script>
  <script type="text/javascript" src="/shopping/assets/js/bootstrap.min.js"></script>

  <title>职师书园——订单信息</title>
</head>
<body>
  <jsp:include page="topbar.jsp"></jsp:include>
  <jsp:include page="nav.jsp"></jsp:include>
  <div class="fullwidth grey5-bg seperator top40">
  </div>
  <div class="container top20">
    <div class="row">
      <div class="col-md-12">
        <c:if test="${not empty sessionScope.order}">
          <ul class="col-md-12 list-inline">
            <li class="col-md-2">
            </li>
            <li class="col-md-3">
              <span>商品信息</span>
            </li>
            <li class="col-md-2">
              <span class="">单价（元）</span>
            </li>
            <li class="col-md-2">
              <span class="">数量</span>
            </li>
            <li class="col-md-1">
              <span class="">金额</span>
            </li>
            <li class="col-md-1 left40">
              <span class="">时间</span>
            </li>
          </ul>
        </c:if>
      </div>
      <div class="col-md-12 top20">
        <c:set value="0" var="sum" />
        <c:if test="${empty sessionScope.order}">
          <h3>您的购物车是空的!</h3>
        </c:if>
        <c:forEach items="${sessionScope.order}" var="item">
          <c:set value="${sum + item.price}" var="sum" />
          <div id="${item.orderId}" class="cart-box top10 grey5-bg">
            <ul class="col-md-12 list-inline">
              <a href="/shopping/book/index/${item.book.bookId}">
                <li class="col-md-2 top40">
                  <img class="cart-img left10" src="/shopping/assets/images/category/${item.book.bookId}.jpg" />
                </li>
              </a>
              <li class="col-md-3 top40">
                <a class="btn-font" href="/shopping/book/index/${item.book.bookId}">${item.book.bookname}</a>
              </li>
              <li class="col-md-2 top40">
                <span class="btn-font small">
                  ￥
                  <span>
                    <fmt:formatNumber type="number" value="${item.book.price}" pattern="0.0" maxFractionDigits="1"/>
                  </span>
                </span>
              </li>
              <li class="col-md-1 top40">
                <span class="btn-font small">${item.number}</span>
              </li>
              <li class="col-md-1 top40 left80">
                <span class="btn-font small innerleft10 blue2-font">
                  ￥
                  <span class="number">
                    <fmt:formatNumber type="number" value="${item.price}" pattern="0.0" maxFractionDigits="1"/>
                  </span>
                </span>
              </li>
              <li class="col-md-2 top40 left10">
                <span class="btn-font small">
                    ${item.format()}
                </span>
              </li>
            </ul>
          </div>
        </c:forEach>
      </div>
      <c:if test="${not empty sessionScope.order}">
        <div class="col-md-12 footbar left40 top20">
          <ul class="col-md-12 list-inline top20">
            <li class="col-md-2">
            </li>
            <li class="col-md-6">
            </li>
            <li class="col-md-4">
              <span class="small grey6-font">商品总计(不含运费)：</span>
              <span class="big blue2-font">￥<span id="sum">${sum}</span></span>
            </li>
          </ul>
        </div>

      </c:if>
    </div>
  </div>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>