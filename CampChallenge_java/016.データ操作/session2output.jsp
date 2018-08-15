<%-- 
    Document   : session2
    Created on : 2018/08/14, 19:23:35
    Author     : satonana
--%>
<%
    HttpSession hs = request.getSession();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <form action = "session2input.jsp" method = "get">
                
                名前：<input type = "text" name = "name" value="<%
                            if(hs.getAttribute("name") != null){//nameに値が入ってるか確認
                                String name = (String)hs.getAttribute("name");//入ってたら、valueにnameの値を返す
                                out.print(name);//戻った時に前回入力したものが表示されるように
                            }//1回目はif文の条件に当てはまらないため、通常通りになる。
                        %>"
                     >
                性別：<input type = "radio" name = "gender" value="man" <%//nameが同じだと同じグループとして認識される
                            if(hs.getAttribute("gender")!= null){
                                String gender = (String)hs.getAttribute("gender");
                                if(gender.equals("man")){//文字列の比較は.equalsに注意
                                    out.print("checked");//戻った時にチェックがされるように
                                }
                            }
                          %>>男
                
                     <input type = "radio" name = "gender" value="woman"
                          <%
                            if(hs.getAttribute("gender")!= null){
                              String gender = (String)hs.getAttribute("gender");
                                if(gender.equals("woman")){
                                    out.print("checked");//checkedをつけると最初から選択された状態になる
                                }
                            }
                          %>
                     >女
                
                趣味：<input type = "text" name = "hobby" value="<%
                            if(hs.getAttribute("hobby") != null){
                                String hobby = (String)hs.getAttribute("hobby");
                                out.print(hobby);   
                                }
                          %>"
                     >
                
                <input type= "submit" value = "送信">
                
            </form>
            
        </h1>
    </body>
</html>