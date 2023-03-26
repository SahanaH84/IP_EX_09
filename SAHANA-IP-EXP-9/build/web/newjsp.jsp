<% Class.forName("org.apache.derby.jdbc.ClientDriver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="2" style="border-collapse: collapse ; text-align: center">
            <tr>
            <th>TOTAL NO. OF BOOKS</th>
            <th>AVERAGE PRICE</th>
            <th>HIGHEST PRICED BOOK</th>
            </tr>
        <%
            Connection c= DriverManager.getConnection("jdbc:derby://localhost:1527/books","books","books");
            Statement s1=c.createStatement();
            int count =0;
            ResultSet rs1=s1.executeQuery("select count(*) from books");
            while(rs1.next())
            {
                count = rs1.getInt(1);
            }
            Statement s2=c.createStatement();
            ResultSet rs2=s2.executeQuery("select avg(price) from books");
            double tot_books=0;
            while(rs2.next())
            {
                tot_books = rs2.getDouble(1);
            }
            Statement s3=c.createStatement();
            ResultSet rs3=s3.executeQuery("select title from books where price = ( select max(price) from books)");
            String max_book="";
            while(rs3.next())
            {
                max_book = rs3.getString(1);
            }
            out.println("<tr>"+"<td>"+count+"</td>"+"<td>"+tot_books+"</td>"+"<td>"+max_book+"</td>"+"</tr>");
        %>

        </table>
    </body>
</html>
