<%--
  Copyright 2014-2015 the original BZTWT
  Created by QianLong
  User: QianLong
  Date: 2016/4/5 0005
  Time: 09:09
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
  <link rel='stylesheet' href='/shopping/assets/css/book.css' />

  <script type="text/javascript" src="/shopping/assets/js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="/shopping/assets/js/jquery.spinner.min.js"></script>
  <script type="text/javascript" src="/shopping/assets/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/shopping/assets/js/showinfo.js"></script>
  <script type="text/javascript">
    $(function () {
      $("input[name=number]").on("input propertychange", function () {
        if(parseInt($(this).val())>parseInt($(this).attr("max"))){
          $(this).val($(this).attr("max"));
        }
      })
    });
  </script>
  <title>职师书园——Java编程思想</title>
</head>
<body>
<jsp:include page="topbar.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<div class="container">
  <jsp:include page="tab.jsp"></jsp:include>
  <img src="/shopping/assets/images/tab.jpg" class="top20 tab-img" />
  <p class="top10 small grey3-font">${book.type}>${book.bookname}</p>
</div>
<div class="container">
  <div class="row">
    <!--左侧物品信息-->
    <div class="col-md-9">
      <div class="col-md-4">
        <img class="top20" src="/shopping/assets/images/category/${requestScope.book.bookId}.jpg" />
      </div>
      <div class="col-md-5 left80">
        <h3>
          <strong>${requestScope.book.bookname}</strong>
        </h3>
        <span class="medium"><strong>站长推荐！！</strong></span>
        <a href="http://dwz.cn/32pIh2">四月书香布满天，专题内图书每满100减30>></a>
        <a href="http://dwz.cn/2VsLrF">击败AlphaGo的武林秘籍>></a>
        <hr class="fullwidth"/>
        <p class="small">作者：${requestScope.book.author}</p>
        <p class="small">出版时间：${requestScope.book.publishdate}</p>
        <div class="row slide grey4-bg">
          <ul class="left inner-tab">
            <li>
              <span class="letter-space24 small grey3-font ">定价</span>
            </li>
            <li class="top5">
              <span class="letter-space5 small grey3-font ">折扣价</span>
            </li>
          </ul>
          <ul class="left inner-tab">
            <li>
              <del>
                ￥<fmt:formatNumber type="number" value="${requestScope.book.price * 1.2}" pattern="0.0" maxFractionDigits="1"/>
              </del>
            </li>
            <li>
              <strong class="big blue2-font">
                ￥<fmt:formatNumber type="number" value="${requestScope.book.price}" pattern="0.0" maxFractionDigits="1"/>
              </strong>
            </li>
          </ul>
        </div>
        <div class="row">
          <p class="inner-tab">
            <span class="left letter-space24 small grey3-font">活动</span>
            <span class="left left-40 stamp">包邮</span>
            <span class="left left-40 decline">降价</span>
          </p>
        </div>
        <form class="form-inline" action="/shopping/cart/add" method="post">
          <div class="row">
            <p class="inner-tab">
            <div class="form-group">
              <label class="small grey3-font">购买数量</label>
              <input type="number" name="number" class="txt-height2 spinner" value="1"
                   size="20px" min="0" max="${requestScope.book.remain}">
              <span class="small"><strong>有货，剩余<span id="remain">${requestScope.book.remain}</span>件，下单后立即发货</strong></span>
            </div>
            </p>
          </div>
          <div class="row">
            <p class="inner-tab">
              <input type="hidden" name="bookId" value="${requestScope.book.bookId}" />
              <button type="submit" class="btn btn-primary" role="button">
                <strong class="white-font btn-font">加入购物车</strong>
              </button>
            </p>
          </div>
        </form>
      </div>
      <div class="col-md-12">
        <div class="info-tab left60">
          <div class="grey1-bg tab-lab">
            <span class="btn-font innerleft20">商品信息</span>
          </div>
          <!--书本介绍信息-->
        </div>
        <div class="row left40 top20">
          <div class="col-md-6">
            <ul>
              <li class="info-item">图书编号：${requestScope.book.bookId}</li>
              <li class="info-item">出版时间：${requestScope.book.publishdate}</li>
              <li class="info-item">
                所属类型：
                <a class="small" href="#">${book.type}>${book.bookname}</a>
              </li>
            </ul>
          </div>
          <div class="col-md-6">
            <ul>
              <li class="info-item">
                <span class="letter-space14">作者：</span>${requestScope.book.author}
              </li>
              <li class="info-item">
                <span class="letter-space14">页数：</span>${requestScope.book.page}
              </li>
              <li class="info-item "><span class="letter-space14">字数：</span>${requestScope.book.page*185}</li>
            </ul>
          </div>
        </div>
        <div class="info-tab top20 left60">
          <div class="grey1-bg tab-lab">
            <span class="btn-font innerleft20">内容简介</span>
          </div>
          <!--书本介绍信息-->
        </div>
        <div class="left40 top20">
          <p class="grey6-font left40">
            ${requestScope.book.description}
          </p>
        </div>
        <div class="info-tab top40 left60">
          <div class="grey1-bg tab-lab">
            <span class="btn-font innerleft20">内容试读</span>
          </div>
          <!--书本介绍信息-->
        </div>
        <div class="left40 top20">
          <p class="left40">
            <button id="btn-switch" class="btn btn-default">
              <span class="btn-font">显示全部信息</span>
            </button>
          </p>
          <pre id="context" class="grey6-font half-show left40">
            ${requestScope.book.content}
          </pre>
        </div>
      </div>
    </div>
    <!--右侧广告信息-->
    <div class="col-md-3">
      <div class="panel-header grey5-bg">
        <h3 class="text-header">推广商品</h3>
      </div>
      <div class="panel-body">
        <c:forEach items="${requestScope.books}" begin="1" end="3" step="1"  var="item">
          <div class="package top10">
            <a href="/shopping/book/index/${item.bookId}">
              <img class="top10 recommend-book" src="/shopping/assets/images/category/${item.bookId}.jpg" />
            </a>
            <p class="ad-font small innerleft30 innertop10">
              <a href="/shopping/book/index/${item.bookId}">${item.bookname}</a>
            </p>
            <p class="innerleft20">
              <span class="medium blue2-font">￥<fmt:formatNumber type="number" value="${item.price}" pattern="0.0" maxFractionDigits="1"/></span>
              <span class="small left10 grey1-font">
              原价：<del><fmt:formatNumber type="number" value="${item.price * 1.2}" pattern="0.0" maxFractionDigits="1"/>￥</del>
              </span>
            </p>
          </div>
        </c:forEach>
        </div>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
