


import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.json.JSONObject;





public class NewAPI {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Xml();

	}

	private static void Xml() {

		
		

	    JSONObject inputData = new JSONObject();
	    try
	    {
	            JSONObject details = new JSONObject();
	            details.put("subject","Final check for new API ");
	            details.put("description","test desc");
	            
	            JSONObject requesterDetails = new JSONObject();
	            requesterDetails.put("email_id", "kiranchand.k@tcs.com");
	            details.put("requester",requesterDetails);
	            
	            
	  
	            JSONObject udfObject = new JSONObject();
	            udfObject.put("udf_pick_28203","ASM"); 
	   		    udfObject.put("udf_pick_28204","AES SMART METERING LIMITED");
	   		
	   		    
	   		   details.put("udf_fields", udfObject);
	            
	   		    
	   		    JSONObject categoryObject = new JSONObject();
	   		    categoryObject.put("name", "Archival");
	   		    details.put("category",categoryObject);
	   		    
	   		    
	   		    
	   		 JSONObject subcategoryObject = new JSONObject();
	   		subcategoryObject.put("name", "ILM1");
	   		    details.put("subcategory",subcategoryObject);
	   		    
	          
	   		/* JSONObject templateObject  = new JSONObject();
	            templateObject.put("name", "Default Request");
	             details.put("template", templateObject);*/
	           // details.put("requesttemplate","Default Request");
	   		    
	   		    
	   		 JSONObject itemObject = new JSONObject();
	   		itemObject.put("name", "I -Others");
	   		    details.put("item",itemObject);
	   		    
	   		    
	            
	           // JSONObject operation = new JSONObject();
	           // operation.put("details", details);
	            
	            inputData.put("request", details);
	            
	           System.out.println("json ..!!"+inputData.toString());
	            
	            RequestAPI(inputData.toString());
	         
	    }
	    catch (Exception e)
	    {
	            e.printStackTrace();
	    }
	 
			}

	private static void RequestAPI(String XML) {//Add and CI API
		try 
		{	
	    String message = null;
	   
	      
	       
		int workerId = 0;
		
		String sdp_url = "http://localhost:8080/api/v3/requests?TECHNICIAN_KEY=9AE93F5F-89DC-408C-9DAB-5CEB6B387247";
		
   
    String jsonStr = XML;
    String sdpResponse = null;
  
    PostMethod post = new PostMethod(sdp_url);
   /* post.setParameter("OPERATION_NAME","ADD_REQUEST");	
    post.setParameter("TECHNICIAN_KEY",apiKey);*/
     post.setParameter("INPUT_DATA",jsonStr);// No I18N
    post.setParameter("format", "json");// No I18N
    post.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");// No I18N
    HttpClient httpclient = new HttpClient();

int result = httpclient.executeMethod(post);
System.out.println("after result.."+result);

/*HttpPost posts = new HttpPost(sdp_url);
HttpResponse response ;
response = httpclient.execute(post);*/



    sdpResponse = post.getResponseBodyAsString();




    System.out.println("sdpResponse:::::::::::"+ sdpResponse);
  
    
    
    JSONObject inputs111 = new JSONObject(sdpResponse.toString());
    System.out.println("check"+inputs111.get("response_status"));

    JSONObject operation= (JSONObject) inputs111.get("response_status");
   
      message = operation.getString("status");
     System.out.println("final res for  REQUEST API..."+message);
     
     
     if(!message.equals("failed")) {
     
     org.json.JSONObject obj = new JSONObject(sdpResponse.toString());
	    System.out.println("sss");
	    JSONObject obj1= (JSONObject) obj.get("response_status");
	    
	    org.json.JSONArray  jsonArray = obj1.getJSONArray("messages");
		     int i=0; 
	   /* for(  i=0;i<jsonArray.length();i++){
	        System.out.println("array is " + jsonArray.get(i));

	    }*/
	     String sss= jsonArray.get(0).toString();
	    JSONObject inputs = new JSONObject(sss);
	    System.out.println("check   final response statsu..!!!!!!"+inputs.get("message"));

	  
	    
	    
	    
     
     
     
	    JSONObject inputs1 = new JSONObject(sdpResponse);

	   // JSONObject operation1= (JSONObject) inputs1.get("operation");
	    JSONObject result2= (JSONObject) inputs1.get("request");
	    
	   
	    /* String addResult = result2.getString("id");
	     System.out.println("addResult message..."+addResult);*/
	   
	     
	     
	    	 String addResult = result2.getString("id");
		     System.out.println("addResult message..."+addResult);
	     System.out.println("Ticket ID....."+message);
		
	     }else {
	    	 message=null;
	     }

    
	   
	   
	


  
    
    
	
	System.out.println("Last");
	}
	catch(Exception e)
	{
	
	System.out.println("EERR>!!!!!!"+e.getMessage());
	

	}	
	/*finally 
	{
	post.releaseConnection();
	}*/
	
	

	}
}


