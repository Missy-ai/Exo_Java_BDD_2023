package com.victorina.servlet;

import com.victorina.model.Task;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

public class AjouterTacheServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String titre = request.getParameter("titre");
        String description = request.getParameter("description");
        LocalDate dateEcheance = LocalDate.parse(request.getParameter("dateEcheance"));

        Task tache = new Task(titre, description, dateEcheance);

        HttpSession session = request.getSession();
        ArrayList<Task> listeTaches = (ArrayList<Task>) session.getAttribute("listeTaches");
        if (listeTaches == null) listeTaches = new ArrayList<>();
        listeTaches.add(tache);
        session.setAttribute("listeTaches", listeTaches);

        response.sendRedirect("listeTaches.jsp");
    }
}
