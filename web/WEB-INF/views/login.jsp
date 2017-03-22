<%--
  Copyright 2014-2015 the original BZTWT
  Created by QianLong
  User: QianLong
  Date: 2016/4/6 0006
  Time: 20:11
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
  <link rel='stylesheet' href='/shopping/assets/css/login.css' />

  <script type="text/javascript" src="/shopping/assets/js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="/shopping/assets/js/jquery.form.js"></script>
  <script type="text/javascript" src="/shopping/assets/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/shopping/assets/js/login.js"></script>

  <title>职师书园——登录</title>
</head>
<body class="grey7-bg">
  <div class="container main">
    <div class="row">
      <div class="col-md-6">
        <img class="small-logo col-sm-6 innerleft0 top10" src="/shopping/assets/images/logo.png"/>
      </div>
    </div>
    <div class="row wrap">
      <div class="col-md-7">
        <a href="http://www.jd.com">
          <img src="/shopping/assets/images/loginside.jpg" />
        </a>
      </div>
      <div class="col-md-5">
        <form action="/shopping/user/login" method="post" class="form-horizontal top40" id="form-login">
          <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2" id="phone-panel">
              <input type="text" id="phone" name="phone" required="true" class="form-control" placeholder="手机号">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2" id="password-panel">
              <input type="password" id="passwd" name="password" required="true" class="form-control" placeholder="密码">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <label class="small" id="login-err"></label>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <button type="button" id="btn-login" class="fullwidth btn btn-primary">
                <span class="btn-font white-font">登&nbsp;录</span>
              </button>
              <a type="button" id="btn-register" href="/shopping/user/register" class="fullwidth top10 btn btn-danger">
                <span class="btn-font white-font">立即注册</span>
              </a>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
