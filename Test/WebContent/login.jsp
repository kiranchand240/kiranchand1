
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page language="java"%>
<%@ page import="java.util.*,java.io.*" %>
<%@page import="java.util.Properties" %>



<%
Integer randVal = random.nextInt();
Encrypt encrypt = new Encrypt();
// convert password to encrypted password
String encyppassword = encrypt.encryptText(
Integer.toString(randVal) + "",
your_password);}


%>


  
         </script>

  </form>
 </body>
</html>

