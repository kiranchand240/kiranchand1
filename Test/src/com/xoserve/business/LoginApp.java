package com.xoserve.business;

 import java.io.FileInputStream;
/*     */ import java.io.IOException;
/*     */ import java.sql.Connection;
/*     */ import java.sql.DriverManager;
/*     */ import java.sql.PreparedStatement;
/*     */ import java.sql.ResultSet;
/*     */ import java.sql.SQLException;
/*     */ import java.text.SimpleDateFormat;
/*     */ import java.util.Calendar;
/*     */ import java.util.Properties;
/*     */
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.naming.InitialContext;

import javax.sql.DataSource;

//import org.apache.log4j.Logger;
/*     */ //import org.apache.log4j.PropertyConfigurator;

 public class LoginApp
 {
  static String dbURL = null;
  static String dbUsername = null;
   static String dbPassword = null;
 
  // static Logger logger = Logger.getLogger(LoginApp.class);
   public Properties props = new Properties();
   public static final String DATE_FORMAT_NOW = "yyyy-MM-dd HH:mm:ss";
 
   public static String now()
   {
     Calendar cal = Calendar.getInstance();
     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     return sdf.format(cal.getTime());
   }
 
   public LoginApp()
   {
     try
     {
       FileInputStream fis = null;
 
       fis = new FileInputStream("OIMAPI.properties");
       this.props.load(fis);
 
       dbURL = this.props.getProperty("dbURL");
       dbUsername = this.props.getProperty("dbUsername");
       dbPassword = this.props.getProperty("dbPassword");
 
       fis.close();
     }
     catch (IOException ex)
     {
       //logger.error("Error: " + now() + ",\t" + "\t" + "Description: Unable to to read OIM properties file\n" + ex);
     }
   }
     public static boolean validateUserPassword(String userID, String password)
     {
		 boolean blValidCred = true;
		 // BPMS00001267 Defect fix
         String regexpChars = "^[a-zA-Z0-9._-]{3,25}$";

         Pattern pattern = Pattern.compile(regexpChars);
         Matcher matcherUid;
         Matcher matcherPwd;
      
         matcherUid = pattern.matcher (userID);
        // matcherPwd = pattern.matcher (password);
          
           
         if(!matcherUid.matches())
             
         {
             blValidCred = false;
         }
       
       
       return blValidCred;
     }
 
   public static String convertDateToString()
   {
     String todayDate = null;
     Calendar calendar = Calendar.getInstance();
     SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
     try
     {
       todayDate = dateFormat.format(calendar.getTime());
     }
     catch (Exception e)
     {
       e.printStackTrace();
     }
     return todayDate;
   }
 
   public static String getUserStatus(String userid)
   {
     String disableStatus = null;
     String expireDate = null;
     String userStatus = "Failure";
	 String chngPwd = "0";
     String now = null;
     Connection connection = null;
     PreparedStatement stmt = null;
     ResultSet rs = null;
   //  PropertyConfigurator.configure("log4j.properties");
     String dataSource = "jdbc/xlDS";
     try
     {
         
         InitialContext dsContext = null;
         DataSource dsQApp = null;
                                      
                             if(connection == null)
                             {
                             dsContext = new InitialContext();
                             dsQApp = (DataSource)dsContext.lookup(dataSource);
                             connection = dsQApp.getConnection();                            }
             
 
       stmt = connection.prepareStatement("SELECT USR_STATUS,USR_CHANGE_PWD_AT_NEXT_LOGON, USR_PWD_EXPIRE_DATE FROM usr WHERE usr_login=?");
 
       stmt.setString(1, userid);
 
       rs = stmt.executeQuery();
 
       if (rs.next())
       {
         disableStatus = rs.getString("USR_STATUS");
         expireDate = rs.getString("USR_PWD_EXPIRE_DATE");
		 chngPwd = rs.getString("USR_CHANGE_PWD_AT_NEXT_LOGON");
       }
 
       if ((disableStatus != null) && (disableStatus != ""))
       {
         now = convertDateToString();
         if ((expireDate == null) || (expireDate == "")) {
           expireDate = "9999-12-30";
         }
         if (disableStatus.equals("Disabled"))
           userStatus = "Disabled";
         else if (disableStatus.equals("Deleted"))
           userStatus = "Deleted";
		 else if ("1".equals(chngPwd))
			userStatus = "ForceChangePassword";
         else if (expireDate.compareTo(now) < 0)
           userStatus = "Expired";
         else {
          userStatus = "Success";
         }
       }
     }
     catch (SQLException ex)
     {
      // logger.error("Error: " + now() + ", User ID: " + userid + ", Description: SQLException Error\n" + ex);
       userStatus = "Error";
     }
     catch (Exception ex)
     {
       //logger.error("Error: " + now() + ", User ID: " + userid + ", Description: Exception Error\n" + ex);
       userStatus = "Error";
     }
     finally
     {
       if (connection != null)
       {
         try
         {
           connection.close();
           if (stmt != null)
           {
             stmt.close();
           }
           if (rs != null)
           {
             rs.close();
           }
         }
         catch (Exception ex)
         {
           //logger.error("Error: " + now() + "\t" + ", Description: Error occured in closing DB connection\n" + ex);
         }
       }
     }
     return userStatus;
  }
   
  /* public static void main(String[] args) {
       LoginApp laObj = new LoginApp();
       System.out.println(laObj.validateUserPassword("XELSYS ADM", "welcome1"));
   }*/
   
 }
