<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Préparation du format de la date pour l'entrée et l'affichage
    SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd"); 
    SimpleDateFormat sdfOutput = new SimpleDateFormat("dd/MM/yyyy");

    // Création d'une classe simple pour les tâches
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

    // Liste des tâches stockée en session
    ArrayList<Task> taches = (ArrayList<Task>) session.getAttribute("taches");
    if (taches == null) {
        taches = new ArrayList<>();
        session.setAttribute("taches", taches);
    }

    // Gestion des actions : ajouter, supprimer, terminer
    String action = request.getParameter("action");

    // Ajouter une tâche
    if ("ajouter".equals(action)) {
        String titre = request.getParameter("titre");
        String desc = request.getParameter("description");
        String date = request.getParameter("date");

        // Conversion de la date en format dd/MM/yyyy
        if (date != null && !date.isEmpty()) {
            Date parsedDate = sdfInput.parse(date);
            date = sdfOutput.format(parsedDate);
        }

        if (titre != null && !titre.isEmpty()) {
            taches.add(new Task(titre, desc, date));
        }
    }

    // Supprimer une tâche
    if ("supprimer".equals(action)) {
        int index = Integer.parseInt(request.getParameter("index"));
        if (index >= 0 && index < taches.size()) taches.remove(index);
    }

    // Marquer une tâche comme terminée
    if ("terminer".equals(action)) {
        int index = Integer.parseInt(request.getParameter("index"));
        if (index >= 0 && index < taches.size()) taches.get(index).setTerminee(true);
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Mini Gestionnaire de Tâches</title>
    <style>
        /* Style général de la page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }

        /* Conteneur central */
        .container {
            max-width: 900px;
            margin: auto;
            background-color: #fff;
            padding: 25px 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
        }

        h1, h2 {
            text-align: center;
        }

        /* Formulaire d'ajout */
        form p {
            margin: 10px 0;
        }
        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 6px 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        /* Bouton Ajouter */
        input[type="submit"] {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: #2196F3;
            color: white;
            font-weight: bold;
        }
        input[type="submit"]:hover {
            background-color: #1976D2;
        }

        /* Boutons d'action dans le tableau */
        a.button {
            padding: 5px 10px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            font-weight: bold;
            margin-right: 5px;
        }
        a.terminer { background-color: #4CAF50; }
        a.terminer:hover { background-color: #388E3C; }
        a.supprimer { background-color: #f44336; }
        a.supprimer:hover { background-color: #d32f2f; }

        /* Tableau des tâches */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        table th {
            background-color: #ddd;
        }

        /* Message quand aucune tâche n'existe */
        .no-tasks {
            text-align: center;
            font-style: italic;
            margin-top: 20px;
            color: #555;
        }

        /* Couleur des lignes selon l'état */
        .task-row { background-color: #e3f2fd; }
        .task-row.completed { background-color: #c8e6c9; text-decoration: line-through; }
    </style>
</head>
<body>
<div class="container">
    <h1>Mini gestionnaire de tâches</h1>

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

    <!-- Vérification si la liste est vide -->
    <% if (taches.isEmpty()) { %>
        <div class="no-tasks">Vous n'avez aucune tâche</div>
    <% } else { %>
        <table>
            <tr>
                <th>Titre</th>
                <th>Description</th>
                <th>Date</th>
                <th>État</th>
                <th>Actions</th>
            </tr>

            <!-- Boucle sur les tâches -->
            <% for (int i = 0; i < taches.size(); i++) {
                   Task t = taches.get(i);
                   String rowClass = t.isTerminee() ? "task-row completed" : "task-row";
            %>
            <tr class="<%=rowClass%>">
                <td><%= t.getTitre() %></td>
                <td><%= t.getDescription() %></td>
                <td><%= t.getDate() %></td>
                <td><%= t.isTerminee() ? "Terminée" : "En cours" %></td>
                <td>
                    <% if (!t.isTerminee()) { %>
                        <a class="button terminer" href="?action=terminer&index=<%=i%>">Terminer</a>
                    <% } %>
                    <a class="button supprimer" href="?action=supprimer&index=<%=i%>">Supprimer</a>
                </td>
            </tr>
            <% } %>
        </table>
    <% } %>
</div>
</body>
</html>
