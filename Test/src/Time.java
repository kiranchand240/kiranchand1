import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
//import java.util.TimeZone;

public class Time {

	public static void main(String[] args) throws ParseException {
		
		/* String due="1528182668053";
		 
		 
		 
		    
	     long dt = Long.valueOf(due);
			//System.out.println("" + dt);
			long unixSeconds = dt;
			Date date1 = new Date(unixSeconds); //
			SimpleDateFormat sdf = new SimpleDateFormat(
					"dd/MM/yyyy h:mm:ss a");
			sdf.setTimeZone(TimeZone.getTimeZone("GMT+1"));
			String dueTime = sdf.format(date1);
			System.out.println(dueTime);*/
		
		
		 String worklogdate="Sep 6, 2018 02:08 PM";
		 SimpleDateFormat parser = new SimpleDateFormat("MMMM d,yyyy hh:mm a" ,Locale.UK);
     Date date2=parser.parse(worklogdate);
    
     SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a");
    
     String lastupdate=formatter.format(date2);
     System.out.println(lastupdate);
	      
	     
		
	     
		// TODO Auto-generated method stub

	}

}
