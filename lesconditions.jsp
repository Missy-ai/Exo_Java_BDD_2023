<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur" name="valeur1">
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur" name="valeur2">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String valeur1 = request.getParameter("valeur1"); %>
    <% String valeur2 = request.getParameter("valeur2"); %>

    <%-- Vérification de la condition entre les deux valeurs --%>
    <% if (valeur1 != null && valeur2 != null) { %>
        <%-- Conversion des valeurs en entiers pour la comparaison --%>
        <% int intValeur1 = Integer.parseInt(valeur1); %>
        <% int intValeur2 = Integer.parseInt(valeur2); %>
        
        <%-- Condition if pour comparer les valeurs --%>
        <% if (intValeur1 > intValeur2) { %>
            <p>Valeur 1 est supérieure à Valeur 2.</p>
        <% } else if (intValeur1 < intValeur2) { %>
            <p>Valeur 1 est inférieure à Valeur 2.</p>
        <% } else { %>
            <p>Valeur 1 est égale à Valeur 2.</p>
        <% } %>
   
    
<h2>Exercice 1 : Comparaison 1</h2>
<p>Ecrire un programme qui demande à l'utilisateur de saisir 3 valeurs (des chiffres),</br>
A, B et C et dites nous si la valeur de C est comprise entre A et B.</br>
Exemple :</br>
A = 10</br>
B = 20</br>
C = 15</br>
Oui C est compris entre A et B</p>


<form action="#" method="post">
    <p>A : <input type="text" name="val1"></p>
    <p>B : <input type="text" name="val2"></p>
    <p>C : <input type="text" name="val3"></p>
    <input type="submit" value="Vérifier">
</form>
<p>

    <%-- Récupération des valeurs --%>
    <% String val1 = request.getParameter("val1"); %>
    <% String val2 = request.getParameter("val2"); %>
    <% String val3 = request.getParameter("val3"); %>

    <%-- Vérification de la condition entre les trois valeurs --%>
    <% if (val1 != null && val2 != null && val3 != null &&  !valeur1.isEmpty() && !valeur2.isEmpty() && !valeur3.isEmpty()) { %>
        <%-- Conversion des valeurs en entiers pour la comparaison --%>
        <% int intValeurA = Integer.parseInt(val1); %>
        <% int intValeurB = Integer.parseInt(val2); %>
        <% int intValeurC = Integer.parseInt(val3); %>

        <% int min = Math.min (intValeurA, intValeurB); %>
        <% int max = Math.max (intValeurA, intValeurB); %>

        <%-- Condition if pour comparer les valeurs --%>
        <% if (intValeurC >= min && intValeurC <= max) { %>
            Oui, <%= intValeurC %> est compris entre <%= min %> et <%= max %>
       <% } else { %>
             Non, <%= intValeurC %> n'est pas compris entre <%= min %> et <%= max %>
         <% }
       }
  %>
</p>

<h2>Exercice 2 : Pair ou Impair ?</h2>
<p>Écrivez un programme pour vérifier si un nombre est pair ou impair en utilisant une structure if</p>

<form action="#" method="post">
    <p>Saisir le nombre : <input type="text" name="valeur3"></p>
    <input type="submit" value="Vérifier">
</form>

<%
String valeur3 = request.getParameter("valeur3");
if (valeur3 != null && !valeur3.isEmpty()) {
    int intValeur3 = Integer.parseInt(valeur3);
    if (intValeur3 % 2 == 0) {
%>
<p>Valeur <%= intValeur3 %> est paire.</p>
<%  } else { %>
<p>Valeur <%= intValeur3 %> est impaire.</p>
<%  } 
} %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
