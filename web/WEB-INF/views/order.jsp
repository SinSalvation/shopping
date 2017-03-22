<%--
  Copyright 2014-2015 the original BZTWT
  Created by QianLong
  User: QianLong
  Date: 2016/4/8 0008
  Time: 19:25
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
  <script type="text/javascript" src="/shopping/assets/js/addr.js"></script>
  <script type="text/javascript" src="/shopping/assets/js/jquery.cityselect.js"></script>
  <script type="text/javascript" src="/shopping/assets/js/bootstrap-modal.js"></script>
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
        <div class="line2-img row">
          <span class="col-md-3 left60">我的购物车</span>
          <span class="col-md-4 current_step left40">填写订单</span>
          <span class="col-md-2 left10">完成订单</span>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="grey5-bg col-md-12 top40 left150 order-box">
        <h3>地址信息</h3>
        <div class="panel white-bg">
          <div class="row">
            <h4 class="left40 pull-left innertop20">收货地址</h4>
            <div class="pull-right innertop20 right40">
              <button id="addAddress" class="length10 btn btn-primary" role="button">
                <strong class="white-font btn-font">添加新地址</strong>
              </button>
            </div>
          </div>
          <div class="row add-content">
            <c:forEach items="${sessionScope.address}" var="item">
              <div class="col-md-3 bottom20 left40 addr-box my_addr" data="${item.addrId}" >
                <div class="top20">
                  <span class="black-font"><strong>${item.username}（收）</strong></span>
                </div>
                <p class="top10 small">
                  ${item.address}
                </p>
                <span class="small">
                  邮编：${item.postcode}
                </span>
                <div class="row">
                  <div class="col-md-3 top5">
                    <a class="edit small" href="javascript:void(0)" data="${item.addrId}" >
                      编辑
                    </a>
                  </div>
                  <div class="col-md-4 top5">
                    <a class="small" href="/shopping/address/remove?addrId=${item.addrId}">
                      删除
                    </a>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
          <div class="row bottom20 hidden" id="addition-box">
            <h4 class="left40 innertop20">新增收货地址</h4>
            <form action="/shopping/address/add" method="post">
              <div class="row innertop20 left40">
                <div class="bottom10 row col-md-12 form-inline">
                  <span class="small blue1-font letter-space4">收货人：</span>
                  <input type="text" class="form-control" name="username" required/>
                </div>
                <div class="bottom10 row col-md-12 form-inline">
                  <span class="small blue1-font letter-space1">收货地址：</span>
                  <input type="text" size="50" class="form-control" name="addr" required placeholder="请精确填写以便送货"/>
                </div>
                <div class="bottom10 row col-md-12 form-inline">
                  <span class="small blue1-font letter-space1">邮政编码：</span>
                  <input type="text" size="10" class="form-control" name="postcode" required/>
                </div>
                <div class="bottom10 row col-md-12 form-inline">
                  <span class="small blue1-font letter-space10">手机：</span>
                  <input type="text" size="20" class="form-control" name="phone" required placeholder="默认注册时手机号"/>
                </div>
                <div class="bottom10 row col-md-12 form-inline">
                  <button id="complete" class="length10 btn btn-primary" role="button">
                    <strong class="white-font btn-font">添加新地址</strong>
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog"
           aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <form action="/shopping/address/modify" method="post">
            <input type="hidden" name="addrId" id="id" value="" />
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                  &times;
                </button>
                <h3 class="modal-title" id="myModalLabel">
                  修改订单信息
                </h3>
              </div>
              <div class="modal-body">
                <div class="row bottom20">
                  <div class="row innertop20 left40">
                    <div class="bottom10 row col-md-12 form-inline">
                      <span class="small blue1-font letter-space4">收货人：</span>
                      <input type="text" class="form-control" name="username" id="getter"/>
                    </div>
                    <div class="bottom10 row col-md-12 form-inline">
                      <span class="small blue1-font letter-space1">收货地址：</span>
                      <input type="text" size="50" name="addr" class="form-control" id="getter-addr" placeholder="请精确填写以便送货"/>
                    </div>
                    <div class="bottom10 row col-md-12 form-inline" >
                      <span class="small blue1-font letter-space1">邮政编码：</span>
                      <input type="text" size="10" name="postcode" class="form-control" id="postcode"/>
                    </div>
                    <div class="bottom10 row col-md-12 form-inline">
                      <span class="small blue1-font letter-space10">手机：</span>
                      <input type="text" size="20" class="form-control" name="phone" placeholder="默认注册时手机号" id="phone" value="${user.phone}"/>
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="submit" class="btn btn-primary">
                  提交更改
                </button>
              </div>
            </div><!-- /.modal-content -->
          </form>
        </div>
      </div><!-- /.modal -->
      <div class="grey5-bg col-md-12 top40 left150 order-box">
        <h3>订单信息</h3>
        <div class="panel white-bg">
          <table class="table">
            <thead>
              <tr>
                <th>商品名称</th>
                <th>单价</th>
                <th>数量</th>
                <th>小计</th>
              </tr>
            </thead>
            <tbody>
              <c:set value="0" var="sum" />
              <c:forEach items="${sessionScope.carts}" var="item">
                <c:set value="${sum + item.sum}" var="sum" />
                <tr class="tr" data="${item.cartId}">
                  <td>${item.book.bookname}</td>
                  <td>
                    ￥<fmt:formatNumber type="number" value="${item.book.price}" pattern="0.0" maxFractionDigits="1"/>
                  </td>
                  <td>${item.number}</td>
                  <td>￥<fmt:formatNumber type="number" value="${item.sum}" pattern="0.0" maxFractionDigits="1"/>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <div class="row top10">
            <div class="col-md-7 left10">
              <span class="small">买家留言：</span>
              <input type="text" />
            </div>
            <div class="col-md-3">
              <span class="medium">
                总计：<strong class="blue2-font">￥<fmt:formatNumber type="number" value="${sum}" pattern="0.0" maxFractionDigits="1"/></strong>
              </span>
            </div>
            <div class="col-md-1">
              <button id="btn-count" class="length10 btn btn-primary" role="button">
                <strong class="white-font btn-font">结算</strong>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
