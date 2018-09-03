<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="jums.JumsHelper" %>
<%@page import="jums.UserDataBeans" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession hs = request.getSession();
    
    //↓ほかのudbとはちがう。このファイル内で有効。udbの中から値を取り出したいからudbのセッション
    //Attributeに格納するとObject型になるので、取り出し時にはキャストが必要
    UserDataBeans udb = (UserDataBeans) session.getAttribute("UDB");
    
    String name = "";//初期化
    String year = "";
    String month = "";
    String day = "";
    int type = 0;
    String tell = "";
    String comment = "";
%>
<!--ここより上に書くこと-->
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録画面</title>
    </head>
    <body>

        <% if (udb != null) {

                name = udb.getName();
                year = udb.getYear();
                month = udb.getMonth();
                day = udb.getDay();
                type = udb.getType();
                tell = udb.getTell();
                comment = udb.getComment();
            }
        %>

        <form action="insertconfirm" method="POST">
            名前:
            <input type="text" name="name" value="<%= name%>">
            <br><br>

            生年月日:
            <select name="year">
                <option value="">----</option>
                <% for (int i = 1950; i <= 2010; i++) {%>
                <option value="<%=i%>"
                        <%
                            if(!year.equals("")){
                                int year_a = Integer.parseInt(year);
                                if (i == year_a) {
                                    out.print("selected");
                                }
                            }
                        %>>
                    <%=i%> </option>
                    <%} %>
            </select>年

            <select name="month">
                <option value="">--</option>
                <% for (int i = 1; i <= 12; i++) {%>
                <option value="<%=i%>"
                        <%
                            if(!month.equals("")){
                            int month_a = Integer.parseInt(month);
                            if (i == month_a) {
                                out.print("selected");
                            }
                            }
                        %>>
                    <%=i%></option>
                    <% } %>
            </select>月

            <select name="day">
                <option value="">--</option>
                <% for (int i = 1; i <= 31; i++) {%>
                <option value="<%=i%>"
                        <%
                            if(!day.equals("")){
                            int day_a = Integer.parseInt(day);
                            if (i == day_a) {
                                out.print("selected");
                            }
                            }
                        %>>
                    <%=i%></option>
                    <% }%>
            </select>日
            <br><br>

            種別:
            <br>
            <input type="radio" name="type" value="1" checked="checked"
                   <% if (type == 1) {
                           out.print("checked");//checkedをつけると最初から選択された状態になる
                       }
                   %>
                   >エンジニア<br>

            <input type="radio" name="type" value="2"
                   <% if (type == 2) {
                           out.print("checked");//checkedをつけると最初から選択された状態になる
                       }
                   %>
                   >営業<br>

            <input type="radio" name="type" value="3"
                   <% if (type == 3) {
                           out.print("checked");//checkedをつけると最初から選択された状態になる
                       }
                   %>
                   >その他<br>
            <br>

            電話番号:
            <input type="text" name="tell" value="<%= tell%>">
            <br><br>

            自己紹介文
            <br>
            <textarea name="comment" rows=10 cols=50 style="resize:none" wrap="hard"><%
                if (comment != null) {
                    out.print(comment);
                }
                %></textarea>
            <br><br>
            <%//getAttributeでacの読み出し。hiddenを使うことで隠して渡す%>
            <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
            <input type="submit" name="btnSubmit" value="確認画面へ">
        </form>
        <br>
        <%=JumsHelper.getInstance().home()%>
    </body>
</html>
