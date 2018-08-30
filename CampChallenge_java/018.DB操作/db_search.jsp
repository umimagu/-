<%-- 実行を行う側。java
    Document   : db_search
    Created on : 2018/08/17, 13:38:41
    Author     : satonana
--%><%@page import="java.sql.*"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>名前検索</title>
    </head>
    <body>
        <h1>
            <%
            request.setCharacterEncoding("UTF-8");
            //フォームから入力された値をもらってくる
            String profilesID = request.getParameter("profilesID");
            String name = request.getParameter("name");
            String tel = request.getParameter("tel");
            String age = request.getParameter("age");
            String birth  = request.getParameter("birthday");
            
//~~~~~~~~~~以下データベース~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            Connection db_con = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            db_con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Challenge_db", "root", "root");
            PreparedStatement db_st = null;

            //文字列とみなされないように%とnameを+でつなぐ。1番目の?にnameを入れる
            db_st = db_con.prepareStatement("select * from profiles where name like ?");
            db_st.setString(1,"%"+name+"%");
            ResultSet db_data = db_st.executeQuery();
            
            while (db_data.next()) { //データベース上のデータを全て探す処理
                out.println("ID：" + db_data.getInt("profilesID"));
                out.println("名前：" + db_data.getString("name") );
                out.println("tel：" + db_data.getString("tel") );
                out.println("年齢：" + db_data.getInt("age"));
                out.println("誕生日：" + db_data.getString("birthday"));
            }
            %>
            
        </h1>
    </body>
</html>
