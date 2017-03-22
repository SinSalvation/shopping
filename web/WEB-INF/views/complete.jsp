<%--
  Copyright 2014-2015 the original BZTWT
  Created by QianLong
  User: QianLong
  Date: 2016/4/10 0010
  Time: 11:15
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
  <script type="text/javascript" src="/shopping/assets/js/jquery.cityselect.js"></script>
  <script type="text/javascript" src="/shopping/assets/js/bootstrap-modal.js"></script>
  <script type="text/javascript">
  </script>
  <title>职师书园——订单</title>
</head>
<body>
<jsp:include page="topbar.jsp"></jsp:include>
<div class="container">
  <div class="row">
    <div class="col-sm-6">
      <img class="small-logo top10" src="/shopping/assets/images/logo.png"/>
    </div>
    <div class="col-sm-6">
      <div class="line3-img row">
        <span class="col-md-3 left60">我的购物车</span>
        <span class="col-md-4 left40">填写订单</span>
        <span class="col-md-2 current_step left10">完成订单</span>
      </div>
    </div>
  </div>
</div>
<div class="fullwidth seperator top40">
</div>
<div class="container">
  <div class="row">
    <div class="col-sm-4 col-lg-offset-4">
      <h3>订单已提交完成！</h3>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
