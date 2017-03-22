<%--
  Copyright 2014-2015 the original BZTWT
  Created by QianLong
  User: QianLong
  Date: 2016/4/9 0009
  Time: 15:05
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <title>职师书园——完成订单</title>
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
    <div class="row">
      <h2 class="col-md-12">感谢提交订单，我们会尽快为您处理...</h2>
      <span class="col-md-6"><a href="#">返回购物车</a></span>
    </div>
    <div class="row advertise-box top80">
      <div class="grey5-bg col-md-12">
        <h4>推荐产品</h4>
        <div class="row top20 innerbox left20 white-bg">
          <div class="col-xs-6 top10 col-md-3">
            <a href="#" class="thumbnail">
              <img src="/shopping/assets/images/category/JS5136.jpg">
            </a>
          </div>
          <div class="col-xs-6 top10 col-md-3">
            <a href="#" class="thumbnail">
              <img src="/shopping/assets/images/category/JS5136.jpg">
            </a>
          </div>
          <div class="col-xs-6 top10 col-md-3">
            <a href="#" class="thumbnail">
              <img src="/shopping/assets/images/category/JS5136.jpg">
            </a>
          </div>
          <div class="col-xs-6 top10 col-md-3">
            <a href="#" class="thumbnail">
              <img src="/shopping/assets/images/category/JS5136.jpg">
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
