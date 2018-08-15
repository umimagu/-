<%-- 
    Document   : query_string_input
    Created on : 2018/08/14, 11:34:29
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
                int total = Integer.parseInt(request.getParameter("total"));
                int count = Integer.parseInt(request.getParameter("count"));
                int type = Integer.parseInt(request.getParameter("type"));

                out.println("総額："+total+"<br>");
                out.println("個数："+count+"<br>");
                out.println("種別："+type+"<br>");

                int tanka = total / count;
                out.println("単価"+ tanka + "<br>");

                double point = 0;
                if (total < 3000) {
                } else if (3000 <= total && total < 5000) {
                    point = total * 0.04;
                } else if(total > 5000){
                    point = total * 0.05;
                }
                int point2 = (int)point;
                out.println("ポイント"+point2+"<br>");
            %>    
        </h1>
    </body>
</html>
