<%-- 
    Document   : db_insert
    Created on : 2018/08/17, 16:54:34
    Author     : satonana
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>追加しました</title>
    </head>
    <body>
        <h1><%
            request.setCharacterEncoding("UTF-8");
            //フォームから入力された値をもらってくる
            String profilesID1 = request.getParameter("profilesID");
            String name = request.getParameter("name");
            String tel = request.getParameter("tel");
            String age1 = request.getParameter("age");
            String birthday  = request.getParameter("birthday");
            
            //型変換
            int profilesID = Integer.parseInt(profilesID1);
            int age = Integer.parseInt(age1);
            
//~~~~~~~~~~以下データベース~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            
            Connection db_con = null;
            PreparedStatement db_st = null;
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            db_con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Challenge_db", "root", "root");
            
            db_st = db_con.prepareStatement("insert into profiles values(?,?,?,?,?)"); 
            
            db_st.setInt(1,profilesID);
            db_st.setString(2,name);
            db_st.setString(3,tel);
            db_st.setInt(4,age);
            db_st.setString(5,birthday);
            
            int result = db_st.executeUpdate(); 
            out.println(result+ "行が追加されました。"+"<br>");
            
            db_st = db_con.prepareStatement("select * from profiles");
            ResultSet db_data = db_st.executeQuery();//実行
            
            while (db_data.next()) { //データベース上のデータを全て探す
                out.println("ID：" + db_data.getInt("profilesID") + "<br>");
                out.println("名前：" + db_data.getString("name") + "<br>");
                out.println("tel：" + db_data.getString("tel") + "<br>");
                out.println("年齢：" + db_data.getInt("age") + "<br>");
                out.println("誕生日：" + db_data.getString("birthday") + "<br>");
            }
            
            %>
        </h1>
    </body>
</html>
