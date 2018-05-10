<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "color.jspf" %>

<html>
<head>
<title>회원가입</title>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<script  language = "JavaScript">
	function checkIt() {
		var userinput = eval("document.userinput");
		if(!userinput.id.value) {
			alert("id를 입력하세요");
			return false;
		}
		
		if(!userinput.passwd.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		
		if(userinput.passwd.value != userinput.passwd2.value) {
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}
		
		if(!userinput.username.value) {
			alert("사용자 이름을 입력하세요");
			return false;
		}
		
		if(!userinput.jumin1.value || !userinput.jumin2.value)  {
			alert("주민등록번호를 입력하세요");
			return false;
		}
	}
	
	function openConfirmid(userinput) {
		if(userinput.id.value == "") {
			alert("아이디를 입력하세요");
			return;
		}
		url = "/KH10/mvc_logon/confirmId.do?id="+ userinput.id.value;
		open(url,"confirm",
		"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=550, height=200");
			
	}

</script>
</head>
<body>

</body>
</html>