<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �޼��� ���� Ȯ��</title>
</head>
<body>

<form action = "deleteMessage.jsp" method = "post">
<inpurt type = "hidden" name = "messageId"
value = "<%= request.getParameter("messageId") %>"/>
�޼����� �����Ͻ÷��� ��ȣ�� �Է��ϼ��� :<br/>
��ȣ : <input type = "password" name = "password" /> <br />
<input type = "submit" value = "�޼��� �����ϱ�" />
 </form>

</body>
</html>