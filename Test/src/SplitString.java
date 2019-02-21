
public class SplitString {

	public static void main(String[] args) {
		
		
		
		/* String SD_status="1.ddd";
		 String extensionRemoved = SD_status.split("\\.")[1];*/
		 
		 
		 
		String Shipper="CO-OPERATIVE ENERGY LTD:COO";
		       
	        String[] parts = Shipper.split(":");// Split shipper and organisation name

		      System.out.println("orgnization name"+  "  "+parts[0]);
		 	 
		      System.out.println("shipperShort Code"+  "  "+parts[1]);
		      //System.out.println("shipperShort Code"+  "  "+parts[2]);
		 
		 
		 
		 
		 
	    // System.out.println(extensionRemoved);
		// TODO Auto-generated method stub

	}

}
