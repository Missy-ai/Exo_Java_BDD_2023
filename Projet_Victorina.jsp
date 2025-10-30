<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
            //Création d'une classe simple pour les tâches
    class Task {
        private String titre;
        private String description;
        private String date;
        private boolean terminee;

        public Task(String titre, String description, String date) {
            this.titre = titre;
            this.description = description;
            this.date = date;
            this.terminee = false;
        }

        public String getTitre() { return titre; }
        public String getDescription() { return description; }
        public String getDate() { return date; }
        public boolean isTerminee() { return terminee; }
        public void setTerminee(boolean t) { terminee = t; }
    }

            //Liste des tâches stockée en session
    ArrayList<Task> taches = (ArrayList<Task>) session.getAttribute("taches");
    if (taches == null) {
        taches = new ArrayList<>();
        session.setAttribute("taches", taches);
    }

             //Ajout d'une tâche
    String action = request.getParameter("action");
    if ("ajouter".equals(action)) {
        String titre = request.getParameter("titre");
        String desc = request.getParameter("description");
        String date = request.getParameter("date");
        if (titre != null && !titre.isEmpty()) {
            taches.add(new Task(titre, desc, date));
        }
    }

               //Suppression d'une tâche
    if ("supprimer".equals(action)) {
        int index = Integer.parseInt(request.getParameter("index"));
        if (index >= 0 && index < taches.size()) taches.remove(index);
    }

                //Marquer comme terminée
    if ("terminer".equals(action)) {
        int index = Integer.parseInt(request.getParameter("index"));
        if (index >= 0 && index < taches.size()) taches.get(index).setTerminee(true);
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Mini Gestionnaire de Tâches - Victorina</title>
</head>
<body style="font-family: Arial; background-color: #f0f0f0; padding: 20px;">

    <h1>Mini Gestionnaire de Tâches</h1>

    <!-- Formulaire d’ajout -->
    <form method="post">
        <input type="hidden" name="action" value="ajouter">
        <p><b>Titre :</b> <input type="text" name="titre" required></p>
        <p><b>Description :</b> <input type="text" name="description"></p>
        <p><b>Date d’échéance :</b> <input type="date" name="date"></p>
        <p><input type="submit" value="Ajouter la tâche"></p>
    </form>

    <hr>

    <h2>Liste des tâches</h2>
    <table border="1" cellpadding="8" cellspacing="0">
        <tr style="background-color:#ddd;">
            <th>Titre</th>
            <th>Description</th>
            <th>Date</th>
            <th>État</th>
            <th>Actions</th>
        </tr>

        <% for (int i = 0; i < taches.size(); i++) {
               Task t = taches.get(i);
        %>
        <tr>
            <td><%= t.getTitre() %></td>
            <td><%= t.getDescription() %></td>
            <td><%= t.getDate() %></td>
            <td><%= t.isTerminee() ? "Terminée" : "En cours" %></td>
            <td>
                <% if (!t.isTerminee()) { %>
                    <a href="?action=terminer&index=<%=i%>">Terminer</a>
                <% } %>
                <a href="?action=supprimer&index=<%=i%>">Supprimer</a>
            </td>
        </tr>
        <% } %>
    </table>

</body>
</html>
