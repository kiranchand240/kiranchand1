import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.InputStreamReader;

public class Splitfile {

	public static void main(String[] args) {try{
		  // Open the file
		  FileInputStream fstream = new FileInputStream("C:\\Users\\Administrator\\Desktop\\EFT\\GUC01.PN000119.ITC");
		  // Get the object of DataInputStream
		  DataInputStream in = new DataInputStream(fstream);
		  BufferedReader br = new BufferedReader(new InputStreamReader(in));
		  String strLine;
		  //Read File Line By Line
		  while ((strLine = br.readLine()) != null)   {
		  // split the line on your splitter(s)
		     String[] splitted = strLine.split(",,,,,,"); 
		     System.out.println(splitted[0]);
		  }
		  //Close the input stream
		  in.close();
		    }catch (Exception e){//Catch exception if any
		  System.err.println("Error: " + e.getMessage());
		  }}

}

