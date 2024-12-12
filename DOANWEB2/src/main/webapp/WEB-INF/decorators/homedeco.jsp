<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<sitemesh:write property='head' />
</head>

<body>
<header>
	<div class = "header-contain">
		<%@ include file="/views/common/header.jsp"%>
	</div>
</header>
	<div class = "body-container">
		<sitemesh:write property='body' />
	</div>
<footer>
	<div>
		<%@ include file="/views/common/footer.jsp"%>
	</div>
</footer>
<script>
	
</script>
</body>

</html>