<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@page import="java.util.*" %>
  <html >
  <head>
<% response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server   
            response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance   
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"   
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility  
%>


  
  <title>Home</title>
   <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
      <link type="text/css" rel="stylesheet" href="css/style.css"></link>
   <link type="text/css" rel="stylesheet" href="css/dialog_box.css"></link>
  <script  type="text/javascript" src="js/login.js">
  </script>
 <script type="text/javascript" src="js/dialog_box.js">
 </script>
  </head>
  <body>

    <div id="content">
      <jsp:include page="/common/home_header.jsp"/>
     <div id="body">
     <table cellPadding="0" cellSpacing="0" border="0" 
                       width="100%" height="10">
	  <tr>
			<td valign="center" style="padding-right:10px; padding-left:10px;" height="100"></td>
		</tr>
	 <tr>
	    <td valign="bottom" Style="padding-right:10px; padding-left:10px;  "><table cellPadding="0" cellSpacing="0"  width="100%">
		  
		  <tr>
	       <td align="center" width="50%" colspan="4"><a href="#" onclick="javascript:openWindowCMS()"><img src="images/Contact Management.jpg"  style="border:0px" alt="Contact Management System" height="250" width="250" /></a></td>
				
	        <td align="center" width="50%"><a href="#" onclick="javascript:openWindowAC()"><img src="images/Access Contol.jpg" style="border:0px" alt="Access Control" height="250" width="250" /></a></td>
	        </tr> 	
		<tr>
	        <td align="center" colspan="4"><a href="#" class="textlink" onclick="javascript:openWindowCMS()"> <font size="4">Contact Management</font></a></td>
	 
	 <td align="center" ><a href="#" class="textlink" onclick="javascript:openWindowAC()"><font size="4">Access Control</font></a></td>
              </tr> 
	      </table></td>
	    </tr>
            <tr>
            <td height="30"></td>
            </tr>
            <tr>
            <td style="padding-left:10px;">
            </td>
            </tr>
		</table>
            
     </div>
     
      <jsp:include page="common/footer.jsp" />
      
     
     </div>
     
    </body>
  </html>
