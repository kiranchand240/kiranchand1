import java.io.UnsupportedEncodingException;


import org.apache.commons.codec.binary.Base64;
import weblogic.apache.xerces.utils.Base64;


public class Decrypt {

	public static void main(String[] args) throws UnsupportedEncodingException {
		String source = "jaideep1"; 
		byte[] byteArray = source.getBytes("UTF-8"); 
		Base64 bs = new Base64(); 
		
		
		byte[] s2=Base64.encodeBase64(byteArray);
		
		String value2 = new String(s2, "UTF-8");
		
		
	byte[] s1=bs.decode(Base64.encodeBase64(byteArray));
	String value1 = new String(s1, "UTF-8");
		
	System.out.println(value1);
		
}


	}


