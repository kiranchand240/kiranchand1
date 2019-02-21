import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import org.json.JSONException;
import org.json.JSONObject;

public class B2Bjson {
	 static org.json.JSONArray jsonArray;
	static int i=0;
	public static void main(String[] args) throws  JSONException, IOException {
		
		
		
		String fileName = "D:\\json\\json11.txt";
	    FileReader fileReader = new FileReader(fileName);

	    try (BufferedReader bufferedReader = new BufferedReader(fileReader)) {
	      String line;
	      while((line = bufferedReader.readLine()) != null) {
	        System.out.println(line);
		
//JSONObject obj = new JSONObject(line);
   
   JSONObject inputs111 = new JSONObject(line);
   System.out.println("check"+inputs111.get("SUBJECT"));

  
  
    String message = inputs111.getString("SUBJECT");
    String message1 = inputs111.getString("IMPACT");
    
    System.out.println("final"+message1);
       
	 }}catch (Exception e) {
				// TODO: handle exception
	    	  System.out.println("error"+e);
			}
			
		    


	
}
}
