<%--
  Copyright 2014-2015 the original BZTWT
  Created by QianLong
  User: QianLong
  Date: 2016/4/9 0009
  Time: 16:00
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <title>您走丢了。。。</title>
</head>
<body>
  <jsp:include page="topbar.jsp"></jsp:include>
  <jsp:include page="nav.jsp"></jsp:include>
  <div class="container">
    <jsp:include page="tab.jsp"></jsp:include>
    <div class="jumbotron row top60">
      <h2>真糟糕！您走丢了</h2>
      <p>有可能是您对浏览器地址栏误操作了，选择下方按钮回到你想去的页面</p>
      <p class="col-md-12"><a class="btn btn-primary" href="#" role="button">返回之前的页面</a></p>
      <p class="col-md-12"><a class="btn btn-primary" href="#" role="button">返回到首页</a></p>
    </div>
  </div>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
