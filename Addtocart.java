/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author amitkabra59
 */
public class Addtocart extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
             
        HttpSession session=request.getSession(false);
        String session1=(String)session.getAttribute("email");
        String pid=(String)session.getAttribute("pid");
        Cart shoppingCart;
        shoppingCart = (Cart) session.getAttribute("cart");
        if(shoppingCart == null){
          shoppingCart = new Cart();
          session.setAttribute("cart", shoppingCart);
        }
        String name = (String) session.getAttribute("name");
        Integer price = (int)session.getAttribute("price");
        shoppingCart.addToCart(name, price);
        session.setAttribute("cart", shoppingCart);
           
             out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>result</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Pizza successfully added to cart </h1>");
            out.println("<form action='imgviewcode.jsp'>Add more pizza item<input type='submit' value='go'></form>");
            out.println("<hr>");
            out.println("<h2>Cart</h2>");
            HashMap<String, Integer> items = shoppingCart.getCartItems();
            out.println("<table border='1px'>");
             
            for(String key: items.keySet()){
                out.println("<tr><td>"+key+" - </td><td>"+"$"+items.get(key)+"</td></tr>");
            }
            out.println("<table>");
            out.println("</body>");
            out.println("</html>");
             
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
