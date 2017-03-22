<%@ page import="org.tute.shopping.user.pojo.User" %>
<%--
  Copyright 2014-2015 the original BZTWT
  Created by QianLong
  User: QianLong
  Date: 2016/4/4 0004
  Time: 11:19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
  User user = (User) request.getSession().getAttribute("user");
  user = user == null?new User():user;
  Integer orderCount = (Integer) request.getSession().getAttribute("orderCount");
  Integer cartCount = (Integer) request.getSession().getAttribute("cartCount");
  orderCount = orderCount == null?0:orderCount;
  cartCount = cartCount == null?0:cartCount;
%>
<div class="nav top-nav">
  <ul class="pull-left list-inline col-md-offset-1">
    <li>
        <span>
          Hi !
          <a class="topbar-font blue1-font">
            <strong>${sessionScope.user.username}</strong>
          </a>
        </span>
    </li>
    <li>
      <a class="topbar-font" href="/shopping/user/logout">[退出]</a>
    </li>
    <span class="small">|</span>
    <li>
      <a class="topbar-font" href="/shopping/cart/all">
        <i class="glyphicon glyphicon-shopping-cart medium blue1-font"></i>
        <span class="left10">购物车</span>
        <strong class="blue1-font"><%=cartCount%></strong>
      </a>
    </li>
    <span class="small">|</span>
    <li>
      <a class="topbar-font" href="/shopping/order/all">
        <i class="glyphicon glyphicon-file medium blue1-font"></i>
        <span class="left5">我的订单</span>
        <strong class="blue1-font"><%=orderCount%></strong>
      </a>
    </li>
  </ul>
  <ul class="pull-right list-inline">
    <li>
      <a class="topbar-font" href="/shopping/user/index">
        <span class="left5">书园首页</span>
      </a>
    </li>
    <span class="small">|</span>
    <li>
      <a class="topbar-font">
        <span class="left5">客户服务</span>
      </a>
    </li>
    <span class="small">|</span>
    <li>
      <a class="topbar-font">
        <span class="left5">批量采购</span>
      </a>
    </li>
    <span class="small">|</span>
    <li>
      <a class="topbar-font" href="http://lib.tute.edu.cn/">
        <span class="left5">天职师大图书馆</span>
      </a>
    </li>
  </ul>
</div>
