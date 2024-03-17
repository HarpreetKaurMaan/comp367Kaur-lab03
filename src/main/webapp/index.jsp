<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
    <%
        String name = "Harpreet Kaur";
        Calendar cal = Calendar.getInstance();
        int hour = cal.get(Calendar.HOUR_OF_DAY);
        String greeting;
        
        if (hour < 12) {
            greeting = "Good morning, " + name + "! Welcome to COMP367.";
        } else if (hour < 18) {
            greeting = "Good afternoon, " + name + "! Welcome to COMP367.";
        } else {
            greeting = "Good evening, " + name + "! Welcome to COMP367.";
        }
    %>
    <h1><%= greeting %></h1>
</body>
</html>
