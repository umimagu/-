<%-- 
    Document   : session2input
    Created on : 2018/08/15, 12:44:16
    Author     : satonana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            
            <%
                request.setCharacterEncoding("UTF-8");
                
                String name = request.getParameter("name");//formの動作。ユーザーが入力した名前をStringのnameに入れる
                String gender = request.getParameter("gender");
                String hobby = request.getParameter("hobby");
                
                HttpSession hs = request.getSession();//セッションの取得
                
                hs.setAttribute("name", name);//セッションへデータの書込み。
                                              //formから得たString nameを"name"という名前で登録
                hs.setAttribute("gender", gender);
                hs.setAttribute("hobby", hobby);
                
                out.print(name);
                out.print(gender);
                out.print(hobby);
                
            %>
            
            <form action="session2output.jsp">
            <input type= "submit" value = "戻る">
            </form>
            
        </h1>
    </body>
</html>
