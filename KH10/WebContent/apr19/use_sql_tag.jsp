<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<html>
<head>

<title>JSTL SQL 예제</title>
</head>
<body>

<sql:query var = "rs" dataSource="jdbc:apache:commons:dbcp:/pool">
	select * from board_sm
	</sql:query>
	
	<table border = "1">
	<tr><%-- 필드명 출력 --%>
	<c:forEach var = "columnName" items = "${rs.columnNames}">
	</c:forEach>
	</tr>
	<c:forEach var = "row" items = "${rs.rowsByIndex}">
	<tr>
	<c:forEach var = "column" items = "${row}" varStatus = "i">
	<td>
		<c:if test = "${column != null}">
		<c:out value = "${column}" />
		</c:if>
		<c:if test = "${column == null}">
		&nbsp;
		</c:if>
	</c:forEach>
	</tr>
	</c:forEach>
	</table>

</body>
</html>