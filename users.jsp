<%-- 
    Document   : data
    Created on : 21 de set de 2020, 17:17:26
    Author     : mandi
--%>

<%@page import="br.du.fatecpg.poo.User"%>
<%@page import="br.du.fatecpg.poo.Data"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    ArrayList<User>  userList = (ArrayList)application.getAttribute("userList");
   if(userList == null){
       
       ArrayList<User> list = new ArrayList<>();
        userList.add(new User("", "", ""));
        userList.add(new User("", "", ""));
        userList.add(new User("", "", ""));
        userList.add(new User("", "", ""));
        application.setAttribute("userList", list);
   }
    if (request.getParameter("add") != null){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        userList.add(new User(name, email, telefone));
        
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atividade 05 - POO - Amanda F Caetano</title>
    </head>
    <body>
        <h1>POO - Usuários</h1>
        <h2><a href="index.jsp"></a>Voltar</h2>
        <h2> Classe User </h2>
        <form>
            Nome: <input type="text" name="name" />
            E-mail: <input type="text" name="email" />
            Telefone: <input type="number" name="telefone" />
            <input type="submit" value="Adicionar" name="add" />
        </form>
        <hr/>
        <table border="2">
            <tr>
                <th>Indice</th>
                <th>Nome</th>
                <th>E-mail</th>
                <th>Telefone</th>
            </tr>
            <% for(int i=0 ; i<userList.size(); i++){%>
            <tr>
                <td><%= i %></td>
                <% User  u = userList.get(i); %>
                <td><%=  u.getName()                %></td>
                <td><%=  u.getEmail()                %></td>
                <td><%=  u.getTelefone()                %></td>
                <td>
            <form>
                
                <input type="submit" name="remove"  value="Remover" />
                <input type="hidden" name="i" value="<%=i%>"/>
            </form>
                </td>
            </tr>
            
            <%}%>
        </table>

    </body>
</html>
