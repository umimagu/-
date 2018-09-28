/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kagoyume;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author satonana
 */
@WebServlet(name = "LoginCheck", urlPatterns = {"/LoginCheck"})
public class LoginCheck extends HttpServlet {

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
        HttpSession hs = request.getSession();
        
        
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            
            ArrayList<ItemData> cart = (ArrayList<ItemData>)hs.getAttribute("Cart");
            
            UserDataDTO udd = new UserDataDTO();
                udd.setName(request.getParameter("name"));
                udd.setPassword(request.getParameter("password"));
            //DB接続。戻り値として、ID、名前、パスワード、住所、メアド、5つのユーザー情報が返る
            UserDataDTO dto = UserDataDAO.getInstance().login(udd);
            //dtoに中身が入っている時、booはtrue
            if(dto != null){
                boolean login_boo = true;
                //ゲストのカート情報があれば、取得する
                if(hs.getAttribute("Cart") != null){
                    for(int i = 0; i < cart.size();i++){
                        dto.setCart(cart.get(i));}
                //ログインしたので、ゲストユーザーのセッションを削除
                    hs.removeAttribute("guest");
                    hs.removeAttribute("Cart");
                }
                //sessionにtrue入れる
                hs.setAttribute("login_boo", login_boo);
                //login_dtoはUserIDが入っていて、各ユーザの判別に使用する
                hs.setAttribute("login_dto", dto);
                
                //refを取得し、正規表現で不要部分をカット
                String ref = (String) hs.getAttribute("ref");
                int index = ref.lastIndexOf("/");
                String str = ref.substring(index);
                String url = "/"+str;
                //urlが"/Login"のとき、top.jspに遷移するようにする。
                System.out.print("#####: " + url);
                if(url.equals("//Login")){
                    url = "/top.jsp";
                }
                //リクエストにurlを格納
                request.getRequestDispatcher(url).forward(request, response);
            }else{
                request.getRequestDispatcher("/loginerror.jsp").forward(request, response);
                
            }
        }catch(Exception e){
            System.out.print(e);
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
