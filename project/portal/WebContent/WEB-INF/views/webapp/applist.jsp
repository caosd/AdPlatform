<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="webapp-provider" content="stomato" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <meta content="telephone=no" name="format-detection" />
  <meta charset="utf8" />
  <link rel="stylesheet" type="text/css" href="/css/sm-webkit.css">
  <link rel="stylesheet" type="text/css" href="/css/webapp.css">
</head>
<body class="ui-mobile-viewport">
  <header>
    <a href="/applist"><img src="/images/wa_logo.png" class="logo"/></a>
    <a href="javascript:void(0);" class="action close">close</a>
  </header>
  <section class="ui-content">
    <ul class="ui-listview ui-listview-inset">
      <c:forEach items="${applist}" var="app">
      <li class="ui-li ui-corner-top ui-corner-bottom ui-btn-up-c">
        <div class="ui-btn-inner ui-li">
          <div class="ui-btn-text">
            <a class="ui-link-inherit" href="/app/${app.id }">
                <div class="ui-li-photo">
                  <img src="/images/uploads/${app.id }/icon.png"/>
                </div>
                <h3 class="ui-li-heading">${app.name }</h3>
                <p class="ui-li-desc">
                  <span>${app.size }</span><br/>
                  <span>下载量:${app.downloadCounts }</span>
                </p>
            </a>
          </div>
          <a class="ui-li-action" href="${app.downloadUrl }">
            <div>
              <span></span>
              <span>下载</span>
            </div>
          </a>
        </div>
      </li>
      </c:forEach>
    </ul>
  </section>
</body>
</html>