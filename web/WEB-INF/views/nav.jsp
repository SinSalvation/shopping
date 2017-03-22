<%--
  Copyright 2014-2015 the original BZTWT
  Created by QianLong
  User: QianLong
  Date: 2016/4/4 0004
  Time: 14:07
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
</script>
<div class="container">
  <div class="row">
    <img class="logo col-md-5 top10" src="/shopping/assets/images/logo.png"/>
    <div class="row col-md-5">
      <div class="col-md-12">
        <form class="form-inline top20" action="/shopping/book/search" method="get" id="form-search">
          <div class="form-group">
            <div class="input-group">
              <input type="text" size="50" class="form-control txt-search-height txt-border"
                     id="txt-search" name="value" placeholder="搜索热门书籍有机会抽大奖！">
              <span class="input-group-btn">
                <button class="btn blue1-bg txt-search-height btn-search" id="btn-search" type="submit">
                  <i class="glyphicon glyphicon-search big btn-search"></i>
                </button>
              </span>
            </div>
          </div>
        </form>
      </div>
      <div class="col-md-12 hint">
        <span class="small col-sm-2">热搜:</span>
        <span class="small col-sm-2"><a href="/shopping/book/search?value=小说">小说</a></span>
        <span class="small col-sm-2"><a href="/shopping/book/search?value=经济">经济</a></span>
        <span class="small col-sm-2"><a href="/shopping/book/search?value=中医">中医</a></span>
      </div>
    </div>
    <div class="col-md-1">
      <img src="/shopping/assets/images/biscuit.jpg">
    </div>
  </div>
</div>