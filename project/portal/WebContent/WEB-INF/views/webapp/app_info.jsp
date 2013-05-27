<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<body class="ui-mobile-viewport" style="background: #f3f3f3;">
  <header>
    <a href="/applist"><img src="/images/wa_logo.png" class="logo"/></a>
    <a href="/applist" class="action back">back</a>
  </header>
  <section class="ui-content app-info">
    <div class="carousel">
      <img src="/images/uploads/${app.id }/pv_1.jpg" class="fantasy"/>
      <div class="indicator-wrap">
        <ul class="indicator">
          <li class="active">1</li>
        </ul>
      </div>
    </div>
    <div class="intro">
      <img class="appicon" src="/images/uploads/${app.id }/icon.png"/>
      <h3 class="name">${app.name }</h3>
      <p class="versions">版本:${app.version } 大小:${app.size } 下载:${app.downloadCounts }</p>
      <p class="desc">${app.description }</p>
    </div>
  </section>
  <footer>
    <a href="${app.downloadUrl }">
      <img src="/images/wa_download_gray.png"/>
      <span>免费下载</span>
    </a>
  </footer>
</body>
</html>