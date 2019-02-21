import org.json.JSONException;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class json {
	 static org.json.JSONArray jsonArray;
	static int i=0;
	public static void main(String[] args) throws  JSONException, IOException {
		
		
		
		String fileName = "D:\\json\\json1.txt";
	    FileReader fileReader = new FileReader(fileName);

	    try (BufferedReader bufferedReader = new BufferedReader(fileReader)) {
	      String line;
	      while((line = bufferedReader.readLine()) != null) {
	        System.out.println(line);
		
    org.json.JSONObject obj = new JSONObject(line);
    System.out.println("sss");
  jsonArray = obj.getJSONArray("worklog");
	      }
    for( i=0;i<jsonArray.length();i++){
        System.out.println("array is " + jsonArray.get(i));

    }
     String sss= jsonArray.get(i-2).toString();
    JSONObject inputs111 = new JSONObject(sss);
    System.out.println("check"+inputs111.get("request"));

    JSONObject operation= (JSONObject) inputs111.get("end_time");
   
     String message = operation.getString("display_value");
     System.out.println("final"+message);
        
	 }catch (Exception e) {
				// TODO: handle exception
	    	  System.out.println("error"+e);
			}
			
		    


	
}
}
