<%@page import="java.util.ArrayList"%>
<%@page import="jums.JumsHelper"
        import="jums.UserDataDTO" %>
<%
    JumsHelper jh = JumsHelper.getInstance();
    HttpSession hs = request.getSession();
    ArrayList<UserDataDTO> resultData = (ArrayList<UserDataDTO>)hs.getAttribute("resultData");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS検索結果画面</title>
    </head>
    <body>
        <h1>検索結果</h1>
        <table border=1>
            <!--ここは固定-->
            <tr>
                <th>名前</th>
                <th>生年</th>
                <th>種別</th>
                <th>登録日時</th>
            </tr>
            
            <!--ここはテーブル表示したい-->
            <% for(int i = 0; i < resultData.size(); i++){ %>
            <!--<aはリンクで、idをおくる(=キー値)、なまえがくりっくできるとこ-->
            <tr>
                <td><a href="ResultDetail?id=<%= resultData.get(i).getUserID()%>"><%= resultData.get(i).getName()%></a></td>
                <td><%= resultData.get(i).getBirthday()%></td>
                <td><%= resultData.get(i).getType()%></td>
                <td><%= resultData.get(i).getNewDate()%></td>
            </tr>
            <% } %>
        </table>
        <button type="button" onclick="history.back()">戻る</button>
    </body>
    <%=jh.home()%>
</html>
