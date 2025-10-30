<%@ page import="java.util.*, com.app.Task" %>
<%
    ArrayList<Task> tasks = (ArrayList<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
        session.setAttribute("tasks", tasks);
    }
%>

<html>
<head>
    <title>Mini Gestionnaire de Tâches</title>
    <style>
        body { font-family: Arial; margin: 40px; }
        h1 { color: #4CAF50; }
        form { margin-bottom: 20px; }
        table { border-collapse: collapse; width: 80%; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .completee { text-decoration: line-through; color: gray; }
    </style>
</head>
<body>
    <h1>Mini Gestionnaire de Tâches</h1>

    <form action="tasks" method="post">
        <input type="hidden" name="action" value="add">
        <label>Titre :</label>
        <input type="text" name="titre" required><br><br>

        <label>Description :</label>
        <input type="text" name="description" required><br><br>

        <label>Date d’échéance :</label>
        <input type="date" name="dateEcheance" required><br><br>

        <button type="submit">Ajouter la tâche</button>
    </form>

    <h2>Liste des Tâches</h2>
    <table>
        <tr>
            <th>#</th>
            <th>Titre</th>
            <th>Description</th>
            <th>Échéance</th>
            <th>Statut</th>
            <th>Actions</th>
        </tr>
        <%
            for (int i = 0; i < tasks.size(); i++) {
                Task t = tasks.get(i);
        %>
        <tr class="<%= t.isCompletee() ? "completee" : "" %>">
            <td><%= i + 1 %></td>
            <td><%= t.getTitre() %></td>
            <td><%= t.getDescription() %></td>
            <td><%= t.getDateEcheance() %></td>
            <td><%= t.isCompletee() ? "Terminée" : "En cours" %></td>
            <td>
                <% if (!t.isCompletee()) { %>
                <form action="tasks" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="complete">
                    <input type="hidden" name="index" value="<%= i %>">
                    <button type="submit">Terminer</button>
                </form>
                <% } %>
                <form action="tasks" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="index" value="<%= i %>">
                    <button type="submit">Supprimer</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>

