/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.camp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author satonana
 */
public class Method6 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    ArrayList<String> userProfile(int num){
        
        ArrayList<String>pr1=new ArrayList<String>();
        pr1.add("1");
        pr1.add("技育太郎");
        pr1.add("東京");
        pr1.add("男");
        pr1.add("プログラマー");
        
        ArrayList<String>pr2=new ArrayList<String>();
        pr2.add("2");
        pr2.add("技育花子");
        pr2.add("北海道");
        pr2.add("女");
        pr2.add("システムエンジニア");
        
        ArrayList<String>pr3=new ArrayList<String>();
        pr3.add("3");
        pr3.add("技育三郎");
        pr3.add("大阪");
        pr3.add("男");
        pr3.add("Webエンジニア");
        
        
        
        if(num == Integer.parseInt(pr1.get(0))){
            return pr1;
        }else if(num == Integer.parseInt(pr2.get(0))){
            return pr2;
        }else if(num == Integer.parseInt(pr3.get(0))){
            return pr3;
        }else{
            return null;
        }
    
        }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
     
         ArrayList<String> a = userProfile(3);

        if(a==null){
            out.print("null");
        }
        
        for(int i = 1 ; i < a.size() ; i++){
        out.print(a.get(i));
        out.print("<br>");
        }
            
    
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
    } // </editor-fold>
}



