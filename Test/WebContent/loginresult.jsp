<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" import="java.io.*,java.util.*" errorPage="errorPage.jsp" %>
<%@ page import="com.xoserve.business.LoginApp" %>
<%@ page import="com.xoserve.business.trimMultipleSpace" %>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
   <link type="text/css" rel="stylesheet"
         href="css/style.css"/>
   
 
   <script language="JavaScript" type="text/javascript"
           src="js/login.js"> 
   </script>
   <script type="text/javascript">
         applicationURL="login.jsp";
   </script>
   
<% response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server   
            response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance   
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"   
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility  
%>


  
  <title>Login</title>
  
</head>


<%! boolean retry ; %>
<%! boolean expired ; %>
<%! String message; %>
<%! String strTerms; %>
<%! String userID; %>
<%! String password; %>
<%! String strURL; %>
	    <%	
		retry= true;
		expired = false;
		strURL = "/am_login/LandingPage.jsp";
		String userID1		= request.getParameter("userid").toUpperCase();
		String password1		= request.getParameter("password");
                strTerms = request.getParameter("Checkbox1");
		userID= trimMultipleSpace.lrtrim(userID1);
		password= trimMultipleSpace.lrtrim(password1);
                 message= "Loading......";
		
		LoginApp login		= new LoginApp();
   		String passStatus	= login.getUserStatus(userID);
                boolean blStrCred       = login.validateUserPassword(userID, password1);
		if(!request.getMethod().equalsIgnoreCase("POST"))
                {
                retry = true;
                message = "Invalid Authentication method. This Issue would be reported.";
            
                }else if(!blStrCred)
         {       retry = true;
                 message = "Invalid Credentials.  The User ID provided does not exist.  Please 'Retry'.  If the problem persists please contact your Local Security Officer (LSO).";
                        
         }else if (passStatus.equals("Disabled"))
         { 
			retry = true;
            message = "This account is not currently active.  Please contact your Local Security Officer (LSO) for assistance.";
		}
		else if (passStatus.equals("Deleted"))
		{
			retry = true;
                        message = "Invalid credentials.  The User ID provided has been deleted.  Please contact your Local Security Officer (LSO).";
		} 
		else if (passStatus.equals("ForceChangePassword"))
		{
			retry = false;
			expired = true;
            message = "Please reset the Password.";
			strURL = "/xlWebApp";
		    request.setAttribute("userid", userID);
			request.setAttribute("password", password);

		}
		else if (passStatus.equals("Expired"))
		{
			retry = false;
			expired = true;
            message = "User Password has expired. Please reset the Password.";
			strURL = "/xlWebApp/changePassword.do?method=display";
		    request.setAttribute("userid", userID);
			request.setAttribute("password", password);

		}  
		else if (passStatus.equals("Failure"))
		{
			retry = true;
            message = "Invalid Credentials.  The User ID provided does not exist.  Please 'Retry'.  If the problem persists please contact your Local Security Officer (LSO).";
			
		}  
		else if (passStatus.equals("Error"))
		{
			retry = true;
                        message = "We apologise for the disruption to the service.  The problem is being investigated and service will be restored as soon as possible.";
		}  
		 else if(!strTerms.equals("on"))
		{
			retry = true;
			message = "Kindly, accept terms of usage in the Login form.";
		}
		else
		{
			retry = false;
		    request.setAttribute("userid", userID);
			request.setAttribute("password", password);
				
		}
  %>
	 

<body id="b1" >
  
   <div id="content">
    
     <div id="header">
     <%@ include file="common/login_header.jsp"%>
    </div>
    <div id="body">
     <br/>
     <table cellpadding="0" cellspacing="0" border="0" width="100%">
     
       
      <tr>
       
       <td valign="top" ><center>
        <table cellpadding="0" cellspacing="0" border="0"
               style="background:url(images/portalservice_bg.png); background-repeat:no-repeat;  " width="556">
         <tr>
          <td height="30">
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           <strong style="color:#fff"> 
           <% if(!message.contains("Loading")) {%>Warning <% }else {%> Message <%}%> </strong>
          </td>
         </tr>
          
         <tr>
          <td height="150" valign="top" style="padding:10px">
          <form name="homeRedirect" action="<%=strURL%>" method="post">
          
           <p>
         <%= message %>
        </p><input type="hidden" name="userid" value="" size="22" >
            <input type="hidden" name="password" value="" size="22" >
       <center><p>
				<%
							if (retry)
                                                        {
						   %>
							  <input type="Button" id="Action" value="Retry" onClick="location.href=applicationURL" align="middle">
							 <%
							 } else	
								{ 
							   if(!expired) {
							 %>
								<script type="text/javascript">
								document.homeRedirect.submit();
								</script>
							 <%	} else { %>

								 <input type="Button" id="Redirect" value="Change Password" onClick="javascript:document.homeRedirect.submit()" align="middle">
								 <%	}
								}
						 %> 
       
        </p>
       </center>
       </form>
       </td></tr>
     </table></center>
          </td>
         </tr>
        </table>
          </div>
    <%@ include file="common/footer.jsp"%>
   </div>
  
</body>
 </html>
