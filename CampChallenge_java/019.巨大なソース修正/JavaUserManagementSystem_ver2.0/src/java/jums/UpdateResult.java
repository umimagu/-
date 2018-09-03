package jums;

import base.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hayashi-s
 */
public class UpdateResult extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        
        HttpSession hs = request.getSession();
        
        try {
            //フォームからの入力を取得して、JavaBeansに格納
            UserDataBeans udb = new UserDataBeans();
            udb.setName(request.getParameter("name"));
            udb.setYear(request.getParameter("year"));
            udb.setMonth(request.getParameter("month"));
            udb.setDay(request.getParameter("day"));
            udb.setType(request.getParameter("type"));
            udb.setTell(request.getParameter("tell"));
            udb.setComment(request.getParameter("comment"));
            
            //DTOオブジェクトにマッピング。DB専用のパラメータに変換
            UserDataDTO updateData = new UserDataDTO();
            udb.UD2DTOMapping(updateData);
            updateData.setUserID(Integer.parseInt(request.getParameter("userID")));
            //update 実行
            UserDataDAO.getInstance().update(updateData);
            updateData = UserDataDAO.getInstance().searchByID(updateData);
            
            //resultdataをセッションから受け取る
            ArrayList<UserDataDTO> resultData = (ArrayList<UserDataDTO>)hs.getAttribute("resultData");
            //for文でlistのi番目の要素を順に取っていきたい、listの中のDTOの中のidを取得したい、
            //if文中　その取得したidがurlから取得したidと一致していた場合==、
            //dtoにi番目の要素のlistに入ってるDTOインスタンスを代入する
            for(int i = 0; i < resultData.size(); i++){
                if(resultData.get(i).getUserID() == updateData.getUserID() ){
                    resultData.set(i,updateData);
                    hs.setAttribute("data",resultData.get(i));
                    break;
                }
            }  
            String str = updateData.getBirthday().toString();
            String[] s = str.split("-");
            
            udb.setName(updateData.getName());
            udb.setYear(s[0]);
            udb.setMonth(s[1]);
            udb.setDay(s[2]);
            udb.setTell(updateData.getTell());
            udb.setType(String.valueOf(updateData.getType()));
            udb.setComment(updateData.getComment());
            //セッションで送ってあげる
            hs.setAttribute("udb",udb);
            
            //ユーザー情報群をセッションに格納
            hs.setAttribute("data", updateData);
            System.out.println("Session updated!!");
            
            request.getRequestDispatcher("/updateresult.jsp").forward(request, response);
        }catch(SQLException e){
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
