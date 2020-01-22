<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<form method="POST" action="scripts/waliduj.jsp?log" enctype="text/html;charset=UTF-8">
    <h3>Zaloguj</h3>
    <input type="text" name="login" placeholder="Login" required /><br />
    <input type="password" name="password" placeholder="Hasło" required /><br />
    <input type="submit" value="Zaloguj" id="Zaloguj" class="button">
</form>