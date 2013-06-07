<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%!
public static void writeScript(JspWriter out, String path) 
		throws java.io.IOException {
	out.print("<script type=\"text/javascript\" src=\"" + path + "?135786439\"></script>");
}
%>
<div class="footer">
	<div class="container">
		<p>
			&copy;2009-2012 Smile Tomato, Inc. - All Rights Reserved. <a href="/aboutus"> <fmt:message key="aboutus"/> </a>
			<br/>
			粤ICP备12056275号-2
		</p>
	</div>
</div>
<%
writeScript(out, "/js/thirdparty/jquery.js");
writeScript(out, "/js/thirdparty/date-picker.js");
writeScript(out, "/js/thirdparty/jquery.json-2.2.min.js");
writeScript(out, "/js/thirdparty/jquery.lightbox_me.js");
writeScript(out, "/js/global.js");
writeScript(out, "/js/js_versioning.js");
String loader = request.getParameter("loader");
boolean isReportUri = request.getRequestURI().indexOf("/reports") > 0;
%>
<%if (isReportUri) { %>
<!--[if IE]><%writeScript(out, "/js/thirdparty/excanvas.min.js");%><![endif]-->
<%writeScript(out, "/js/highcharts/highcharts.js");%>
<%writeScript(out, "/js/highcharts/exporting.js");%>
<%} %>
<script type="text/javascript">
    var require = {
        urlArgs: js_version
      , baseUrl:'/js'
      , paths:{'plugins':'/js/plugins'}
      /*
      , deps: [
          "behaviors/search",
          "behaviors/csrf",
          "behaviors/jquery.stream",
          "behaviors/stream",
          "behaviors/help"]
      */
    }
</script>
<script type="text/javascript" src="/js/thirdparty/es5-shim.min.js"></script>
<script type="text/javascript" src="/js/thirdparty/json2.min.js"></script>
<script type="text/javascript" src="/js/thirdparty/plate.min.js"></script>
<script type="text/javascript" src="/js/thirdparty/require.min.js"<%=loader!=null?" data-main=\""+loader+"\"":"" %>></script>