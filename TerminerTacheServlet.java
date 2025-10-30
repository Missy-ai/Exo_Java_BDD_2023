package com.victorina.servlet;

import com.victorina.model.Task;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

public class TerminerTacheServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int index = Integer.parseInt(request.getParameter("index"));
        HttpSession session = request.getSession();
        ArrayList<Task> listeTaches = (ArrayList<Task>) session.getAttribute("listeTaches");

        if (listeTaches != null && index >= 0 && index < listeTaches.size()) {
            Task tache = listeTaches.get(index);
            tache.setCompletee(true);
            session.setAttribute("listeTaches", listeTaches);
        }
        response.sendRedirect("listeTaches.jsp");
    }
}
