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

  <script type="text/javascript">
    var json = [];
    $(function () {
      $("input[type=checkbox]").on("click", function () {
        var checked = false;
        if($(this).attr('checked') == 'checked'){
          $(this).removeAttr('checked');
        }else{
          $(this).attr('checked','checked');
          checked = true;
        }
        var total = parseFloat(parseFloat($("#sum").html()));
        var sum = parseFloat(parseFloat($("#number"+$(this).val()).html()).toFixed(1));
        if(checked){
          total += sum;
          json.push($(this).val());
        }else{
          total -= sum;
          json.pop($(this).val());
        }
        $("#sum").html(total);
        $("#json").val(json);
      });
      $("#btn-submit").on("click", function () {
        if(json.length == 0){
          alert("请选择要结算的商品");
          return;
        }
        $("#submit").submit();
      })
    });
  </script>
  <title>职师书园——购物车</title>
</head>
<body>
  <jsp:include page="topbar.jsp"></jsp:include>
  <div class="container">
    <div class="row">
      <div class="col-sm-6">
        <img class="small-logo top10" src="/shopping/assets/images/logo.png"/>
      </div>
      <div class="col-sm-6">
        <div class="line-img row">
          <span class="col-md-3 current_step left60">我的购物车</span>
          <span class="col-md-4 left40">填写订单</span>
          <span class="col-md-2 left10">完成订单</span>
        </div>
      </div>
    </div>
  </div>
  <div class="fullwidth grey5-bg seperator top40">
  </div>
  <div class="container top20">
    <div class="row">
      <div class="col-md-12">
        <c:if test="${not empty sessionScope.cart}">
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
            <li class="col-md-2">
              <span class="">金额</span>
            </li>
            <li class="col-md-1">
              <span class="">操作</span>
            </li>
          </ul>
        </c:if>
      </div>
      <div class="col-md-12 top20">
        <c:set value="0" var="sum" />
        <c:if test="${empty sessionScope.cart}">
          <h3>您的购物车是空的!</h3>
        </c:if>
        <c:forEach items="${sessionScope.cart}" var="item">
          <c:set value="${sum + item.sum}" var="sum" />
          <div id="${item.cartId}" class="cart-box top10 grey5-bg">
            <ul class="col-md-12 list-inline">
              <li class="col-md-2">
                <label class="top60">
                  <input type="checkbox" name="check" class="cart_point" value="${item.cartId}"/>
                </label>
                <img class="cart-img left10" src="/shopping/assets/images/category/${item.book.bookId}.jpg" />
              </li>
              <li class="col-md-3 top40">
                <a class="btn-font">${item.book.bookname}</a>
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
              <li class="col-md-2 top40 left80">
                <span class="btn-font small innerleft10 blue2-font">
                  ￥
                  <span class="number" id="number${item.cartId}">
                    <fmt:formatNumber type="number" value="${item.sum}" pattern="0.0" maxFractionDigits="1"/>
                  </span>
                </span>
              </li>
              <li class="col-md-1 top40 left10">
                <form action="/shopping/cart/remove" method="post">
                  <input type="hidden" name="cartId" value="${item.cartId}" />
                  <button class="btn-font text-danger small" type="submit">删除</button>
                </form>
              </li>
            </ul>
          </div>
        </c:forEach>
      </div>
      <c:if test="${not empty sessionScope.cart}">
        <div class="col-md-12 footbar left40 top20">
          <ul class="col-md-12 list-inline top20">
            <li class="col-md-2">
            </li>
            <li class="col-md-5">
            </li>
            <li class="col-md-3">
              <span class="small grey6-font">总计(不含运费)：</span>
              <span class="big blue2-font">￥<span id="sum">0</span></span>
            </li>
            <li class="col-md-2">
              <form action="/shopping/cart/settlement" id="submit" method="post">
                <input type="hidden" name="cartIds" id="json"/>
                <button id="btn-submit" type="button" class="length10 btn btn-primary" role="button">
                  <strong class="white-font btn-font">结算</strong>
                </button>
              </form>
            </li>
          </ul>
        </div>

      </c:if>
    </div>
  </div>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>