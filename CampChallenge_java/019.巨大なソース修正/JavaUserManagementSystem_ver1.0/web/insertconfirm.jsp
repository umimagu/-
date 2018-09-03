<%@page import="jums.UserDataBeans"%>
<%@page import="jums.JumsHelper"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession hs = request.getSession();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
        UserDataBeans udb = (UserDataBeans)session.getAttribute("UDB");
        //userdatabeansのデータを取り出す
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録確認画面</title>
    </head>
    <body>
       
    <% if(!udb.getName().equals("") && !udb.getYear().equals("") && !udb.getMonth().equals("")
            && !udb.getDay().equals("")&& udb.getType()!=0 && !udb.getTell().equals("") && !udb.getComment().equals(""))
    {        
    %>
        <h1>登録確認</h1>
        名前:<%= udb.getName()%><br>
        生年月日:<%= udb.getYear()+"年"+udb.getMonth()+"月"+udb.getDay()+"日"%><br>
        種別:<%= udb.getType()%><br>
        電話番号:<%= udb.getTell()%><br>
        自己紹介:<%= udb.getComment()%><br>
        上記の内容で登録します。よろしいですか？
        <form action="insertresult" method="POST">
            <input type="submit" name="yes" value="はい">
            <%//getAttributeでacの読み出し。hiddenを使うことで隠して渡す%>
            <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
        </form>
            
    <% }else{ %>
    <h1>入力が不完全です</h1><br>
    <% } %>
        <form action="insert" method="POST">
            <input type="submit" name="no" value="登録画面に戻る">
        </form>
        <%=JumsHelper.getInstance().home()%>
    </body>
</html>
