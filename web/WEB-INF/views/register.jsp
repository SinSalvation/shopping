<%--
  Copyright 2014-2015 the original BZTWT
  Created by QianLong
  User: QianLong
  Date: 2016/4/6 0006
  Time: 21:24
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
  <script type="text/javascript" src="/shopping/assets/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/shopping/assets/js/register.js"></script>

  <title>职师书园——登录</title>
</head>
<body class="grey7-bg">
  <jsp:include page="topbar.jsp"></jsp:include>
  <div class="container main">
    <div class="row">
      <div class="col-md-6">
        <img class="small-logo col-sm-6 innerleft0 top10" src="/shopping/assets/images/logo.png"/>
      </div>
    </div>
    <div class="shadow-box top20">
      <div class="register-box">
        <div class="row">
          <div class="col-md-12 top20">
            <label class="col-md-4 big btn-font">新用户注册</label>
          </div>
          <form class="form-horizontal top20">
            <div class="form-group">
              <div class="col-sm-4 col-sm-offset-4" id="phone-panel">
                <input type="text" id="phone" class="form-control" required="true" placeholder="手机号">
              </div>
            </div>
            <div class="form-group">
              <p id="phone-notice" class="text-danger col-sm-4 col-sm-offset-4"></p>
            </div>
            <div class="form-group">
              <div class="col-sm-4 col-sm-offset-4" id="username-panel">
                <input type="text" id="username" class="form-control" required="true" placeholder="昵称">
              </div>
            </div>
            <div class="form-group">
              <p id="name-notice" class="text-danger col-sm-4 col-sm-offset-4"></p>
            </div>
            <div class="form-group">
              <div class="col-sm-4 col-sm-offset-4" id="password-panel">
                <input type="password" maxlength="16" id="passwd" class="form-control"
                       required="true" placeholder="登录密码">
              </div>
            </div>
            <div class="form-group">
              <p id="pwd-notice" class="text-danger col-sm-4 col-sm-offset-4"></p>
            </div>
            <div class="form-group">
              <div class="col-sm-4 col-sm-offset-4" id="repasswd-panel">
                <input type="password" maxlength="16" id="repasswd" class="form-control"
                       required="true" placeholder="确认密码">
              </div>
            </div>
            <div class="form-group">
              <p id="repwd-notice" class="text-danger col-sm-4 col-sm-offset-4"></p>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-4 col-sm-4">
                <button type="button" id="reg-btn" class="fullwidth btn btn-primary">
                  <span class="btn-font white-font big">立即注册</span>
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
