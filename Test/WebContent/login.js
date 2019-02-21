/*
 Filename:		login
 Purpose:		For validation
 Created by:	OAM
 Date:			
*/

window.history.forward(1);
var cms_window = -1;
var ac_window = -1;
	
  function openWindowCMS(url) {
   cms_window = window.open('/QSystem/faces/contactManagement.jsp',"cms_window","status=1,toolbar=0,menubar=1,resizable=1,scrollbars=1");
  }

  function openWindowAC() {
   ac_window = window.open('/xlWebApp',"ac_window","status=1,toolbar=0,,menubar=1,resizable=1,scrollbars=1");
  }

  function closeWindowCMS() {
	  
      if(cms_window != -1) {
		  cms_window.close();
	  }
	  if(ac_window != -1) {
		  ac_window.close();
	  }
      logout();
  }

function clr() {
    document.login.userid.value = "";
    document.login.password.value = "";
}

function secureBrowser() {
    
    document.login.password.value = "";
}

function trim(stringToTrim) {
    return stringToTrim.replace(/^\s+|\s+$/g, "");
}

function validate() {
    var uid = document.login.userid.value.toLowerCase();
    var adminid = trim(uid);
    var reg = "^[a-zA-Z0-9._-]{3,25}$";
   
   
    //var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    var address = document.login.password.value;
    if(reg.test(address) == false) {
       alert('Invalid password');
       //return false;
    }
    


    if ((adminid == "") && (document.login.password.value == "")) {
        document.getElementById('error').innerHTML = 'Please Enter Your User ID and Password';
    }
    else if (adminid == "") {
        document.getElementById('error').innerHTML = "Please Enter Your User ID";
    }

    else if (document.login.password.value == "") {
        document.getElementById('error').innerHTML = "Please Enter Your Password";
    }else if(!document.login.Checkbox1.checked) {
        
        document.getElementById('error').innerHTML = "Please Accept The Terms Of Use";
    }
    else {
        //document.login.action="loginresult.jsp";
        document.login.submit();
    }
}

function delCookie(name, path, domain) {
    
    var date = new Date();
    date.setTime(date.getTime()+(-1*24*60*60*1000));
    var expires = "; expires="+date.toGMTString();
    document.cookie = name+"="+""+expires+"; path="+path; 
}

function delOblixCookie() {
    // set focus to ok button
    var isNetscape = (document.layers);
    if (isNetscape == false || navigator.appVersion.charAt(0) >= 5) {
        for (var i = 0;i < document.links.length;i++) {
            if (document.links[i].href == "javascript:top.close()") {
                document.links[i].focus();
                break;
            }
        }
    }
    delCookie('ObTEMC', '/');
    delCookie('ObSSOCookie', '/');
    delCookie('JSESSIONID', '/');

    // in case cookieDomain is configured
    // delete same cookie to all of subdomain
    var subdomain;
    var domain = new String(document.domain);
    var index = domain.indexOf(".");
    while (index > 0) {
        subdomain = domain.substring(index, domain.length);
        if (subdomain.indexOf(".", 1) > 0) {
            delCookie('ObTEMC', '/', subdomain);
            delCookie('ObSSOCookie', '/', subdomain);
            delCookie('JSESSIONID', '/', subdomain);
            delCookie('UserAuthdOnce', '/', subdomain);
        }
        domain = subdomain;
        index = domain.indexOf(".", 1);
    }
}

function logout() {
    
    delOblixCookie();
    
    document.logout.submit();
}