package unisa;
import java.util.Scanner;
import java.sql.*;
public class ProgettoBasiDati {
	public static void main(String[] arg){
	        Connection con = null ;
	        /**
	         * Connesione effetuata 
	         */
	        try{
	        		Class.forName("com.mysql.cj.jdbc.Driver");
	        		String url = "jdbc:mysql://localhost:3306/gestionespedizione"  
	                            + "?useUnicode=true&useJDBCCompliantTimezoneShift=true"
	                            + "&useLegacyDatetimeCode=false&serverTimezone=UTC";

	        		String username = "root"; String pwd = "carminecitro22";
	        		con = DriverManager.getConnection(url,username,pwd);
	        }
	        catch(Exception e){
	        		e.printStackTrace();
	        		System.out.println("Connessione fallita");}
	        
	            System.out.println("1. Registrazione di un ordine;\r\n"
	            					+ "2. Consegna di un ordine;\r\n"
	            					+ "3. Verifica della possibilità di effettuare un ordine ad un determinato ristorante;\r\n"
	            					+ "4. Visualizzazione dei ristoranti disponibili all’accettazione di un ordine;\r\n"
	            					+ "5. Valutazione di un rider;\r\n"
	            					+ "6. Visualizzazione per ogni cliente del numero di ordini effettuati;\r\n"
	            					+ "7. Abilitazione dell’affidamento ad una società di un servizio di delivery (già presente);\r\n"
	            					+ "8. Assunzione di un nuovo dipendente per la consegna degli ordini;\r\n"
	            					+ "9. Visualizzazione dei nomi dei ristoranti che impiegano dipendenti propri per la consegna o che si\r\n"
	            					+ "affidano ai servizi della società «Food Delivery»;\r\n"
	            					+ "10. Visualizzazione degli ordini consegnati da Raider ancora non valutati;\r\n"
	            					+ "11. Cancellazione di un ordine ancora non consegnato;\r\n"
	            					+ "12. Stampa di tutte le persone (nome, cognome) che abbiano consegnato ordini a «Giuseppe Verdi»\r\n"
	            					+ "nell’ultima settimana;\r\n"
	            					+ "13. Stampa di un report che mostri i dati dei ristoranti, incluso la coda di ordini attuale;\r\n"
	            					+ "14. Stampa settimanale di un report che mostri i dati dei rider, incluso lo score medio ottenuto\r\n"
	            					+ "nelle valutazioni da parte dei clienti;\r\n"
	            					+ "15. Stampa settimanale di tutti i clienti che nell’ultima settimana abbiano effettuato almeno una\r\n"
	            					+ "valutazione inferiore al corrispondente score medio di un raider;\r\n"
	            					+ "16.Chiudi il programma");	        
	            	System.out.println("");
	            	System.out.println("");
	            	System.out.println("Dammi il numero di query ");
	            	Scanner  in = new Scanner (System.in);
	            	int c= in.nextInt();
	            	if (c>16) System.out.println("Errore hai dato un numero superiore al numero di operazini disponibili");
switch(c) {
//query 1
case 1:{  try{
	 				System.out.println("Dammi  lo scontrino e il nome");
	 				String scontrino = in.next();
	 				String nome= in.next();
	            	Statement query = con.createStatement();
	            	query.execute("INSERT INTO Ordine  (Tipo , Data , Scontrino , Descrizione , Nome , Cfraider , CFdipendente) "+"  VALUES('po' ,'2021-01-15', '"+scontrino+"', 'Piatto di oasta' ,'"+nome+"','dvvdvsvdw','dfsfdsfsd')");
	       }
	       catch(Exception e){
	            	System.out.println("Errore nell'interrogazione  della query 1");
	            	e.printStackTrace(); }
break;}
//Query 2 
case 2:{    try{
	            	Statement query = con.createStatement();
	            	ResultSet result= query.executeQuery ("Select * from  Ordine where (Stato <> 'consegnato')");
	            	result.next();
	            	String nome =result.getString("Nome");
        	   		String Scontrino= result.getString("Scontrino");
        	   		String Data= result.getString("Data");
        	   		System.out.println("Dammi orarioStabilito");
        	   		String OrarioStabilito=in.next();
        	   		System.out.println("Dammi orario Effettivo");
        	   		String OrarioEffettivo=in.next();
        	   		System.out.println("Dammi Tracciabilità");
        	   		String Tracciabilità=in.next();
        	   		System.out.println("Dammi nominativo");
        	   		String nominativo=in.next();
	        try{	        	    
	        	   	ResultSet Raid= query.executeQuery("Select CodiceFiscale From Raider where disponibilità = 'disponibile'");
	        	   	String Raider= Raid.getString("codicefiscale") ;
	        	   	query.executeQuery ("Update Raider set  disponibilità = 'non disponibile' where CodiceFiscale  = '"+Raider+"' ");
	        	   	query.execute("insert into ConsegnaRaider (nome,scontrino,data,orariostabilito,orarioeffettivo,tracciabilità,nominativo,codicefiscale"
	        	   					+ "values ('"+nome+"','"+Scontrino+"','"+Data+"','"+OrarioStabilito+"','"+OrarioEffettivo+"','"+Tracciabilità+"'.'"+nominativo+"','"+Raider+"')");
	        	   	query.executeQuery ("Update Raider set  disponibilità=true where codicefiscale= '"+Raider+"' ");
	        	   	query.execute("Update Ordine set Stato='consegnato' where Stato = 'non consegnato'");}
	        	   
	        catch (Exception e){
	        		System.out.println("Raider non disponibili");
	            	ResultSet Dipe= query.executeQuery("Select codicefiscale From Dipendente");
	            	Dipe.next();
	        	   	String Dip= Dipe.getString("codicefiscale") ;
	      
        	   		
	        	   	query.execute("insert into ConsegnaDipendente (nome,scontrino,data,orariostabilito,orarioeffettivo,tracciabilità,nominativo,codicefiscale)"
	        	   					+ "values ('"+nome+"','"+Scontrino+"','"+Data+"','"+OrarioStabilito+"','"+OrarioEffettivo+"','"+Tracciabilità+"','"+nominativo+"','"+Dip+"')"); }
					query.execute("Update Ordine set Stato='consegnato' where Stato= 'non consegnato' ");}
		catch (Exception e){
	                System.out.println("Errore nell'interrogazione della query  2");
	                e.printStackTrace();}
break;}
//query 3
 case 3:{    try{
	            	Statement query = con.createStatement();
	            	ResultSet result = query.executeQuery("SELECT maxcoda, coda from ristorante where telefono = '454343445' ");
	            while (result.next()){
	                int MaxP= result.getInt("maxcoda");
	                int OrCoda= result.getInt("coda");
	                if(MaxP>OrCoda) System.out.println("E' possibile ordinare a questo ristorante");
	                else System.out.println("Non è possibile ordinare a questo ristorante");}}

	        catch (Exception e){
	            	System.out.println("Errore nell'interrogazione 3");}
break;}
//query 4 
case 4:{	   try{
	            	Statement query = con.createStatement();
	            	ResultSet result = query.executeQuery("select Nome from ristorante");
	            while (result.next()){
	                String nome= result.getString("nome");
	                System.out.println(nome);}}

	        catch(Exception e){
	            	System.out.println("Errore nell'interrogazione 4");}
break;}
//query 5
case 5: {	        try {
	                 System.out.println("Dammi lo score, la data,  il codicefiscale del raider  e il codicefiscale del  cliente ");
	                 Double  score= in.nextDouble();
	                String data = in.next();
	                 String codraider= in.next();
	                 String codcliente= in.next();
	            	Statement query = con.createStatement();
	            	query.execute("INSERT INTO valutazione(  score, data, codicefiscal , codicefisc) "+"VALUES( '"+score+"' ,'"+data+"', '"+codraider+"', '"+codcliente+"')"); }

	        catch(Exception e){
	            	System.out.println("Errore nell'interrogazione  della query 5");
	            	e.printStackTrace();}
break;}
//query 6
case 6: {         try {
	        		Statement query = con.createStatement();
	        		ResultSet result = query.executeQuery("select Nordini from cliente");
	            while (result.next()){
	                String nome= result.getString("nordini");
	                System.out.println(nome);}}

	        catch(Exception e){
	            	System.out.println("Errore nell'interrogazione  della query 6");}
break;}
//query 7 
	    
case 7:{           try{Statement query = con.createStatement();


                    System.out.println("Dammi codice");
                    String codice = in.next();
            		System.out.println("Dammi partita IVA");
            		String pIva= in.next();
            		query.executeQuery("select * from delivery, società where Codice = '"+codice+"' and  Iva = '"+pIva+"'");
            		query.execute("INSERT INTO affidamento(Iva, Codice)"+"VALUES( '"+pIva+"'  , '"+codice+"')");}

            catch(Exception e){
                	System.out.println("Errore nell'interrogazione della query 7");
                	e.printStackTrace();}
break;}

// query 8    
case 8:{	        try {
					System.out.println("Dammi Nome, Cognome, Annidiesperienza, CodiceFiscale");
	                String nome= in.next();
	                String nom= in.next();
	                String no= in.next();
	                String n= in.next();
	                
	            	Statement query = con.createStatement();
	            	query.execute("INSERT INTO Dipendente (Nome, Cognome, Annidiesperienza, CodiceFiscale, Curriculum)  "+"VALUES('"+nome+"','"+nom+"','"+no+"','"+n+"','crf.doc')");}

	        catch(Exception e){
	        		System.out.println("Errore nell'interrogazione  della query 8 ");
	        		e.printStackTrace();}
break;}
//query 9
case 9:{	    try {
	            	Statement query = con.createStatement();
	            	ResultSet result = query.executeQuery("SELECT Nome from ristorante where Servizi= 'Food Delivery' OR Servizi= 'Dipendenti' ");
	            while (result.next()){
	                String nome= result.getString("nome"); System.out.println(nome);}}
	        catch(Exception e){
	        		System.out.println("Errore nell'interrogazione della query  9"); 
	        		e.printStackTrace();}	
break;}
//query 10
case 10: {      try {
	            	Statement query = con.createStatement();
	            	ResultSet result = query.executeQuery("SELECT Nome, Scontrino from ConsegnaRaider where OrarioEffettivo  IS NULL");
	              while (result.next()){
                	
	                String nome= result.getString("nome");
	                System.out.println(nome);
	                String scontrino= result.getString("scontrino");
	                System.out.println(scontrino);}
	        }

	           catch (Exception e){
	        		System.out.println("Errore nell'interrogazione della query 10 ");
	        		e.printStackTrace();}
break;}
//query 11 
case 11:{	          try {
	        	  	Statement query = con.createStatement();
	        	  	ResultSet result = query.executeQuery("SELECT * from ordine");
	        	  	 result.next();
	        	    query.execute("delete  from ordine where  Stato <> 'consegnato'");
	        	  	 }
	             
	           catch (Exception e){
	                System.out.println("Errore nell'interrogazione  della query 11"); 
	                e.printStackTrace();}
break;}	          
// query12
case 12:{	    try{
	        		Statement query = con.createStatement();
	        		ResultSet result = query.executeQuery("SELECT Nome from Consegnaraider where nominativo = 'Giuseppe Verdi'");
	              while (result.next()) {
	        		String nome=result.getString("Nome");
	        		System.out.println(nome);
}

}
               catch(Exception e) {
	        		System.out.println("Raider non disponibile");
	        		e.printStackTrace();}
	        
	           try {
	        		Statement query = con.createStatement();
        	        ResultSet result = query.executeQuery("SELECT Nome from Consegnadipendente where nominativo ='Giuseppe Verdi' ");
        	        while (result.next()) {
        	        	String nome=result.getString("Nome");
        	        	System.out.println(nome);
        	        }        
	        
	        }
	      
	        catch (Exception e) {
	        	    System.out.println("errore nell'interrogazione  della query 12");
	                e.printStackTrace();}
break;}
//Query 13
case 13:{	 try {
	              	Statement query = con.createStatement();
	              	ResultSet result = query.executeQuery("Select * from Ristorante");
				while (result.next()){
	                  
	                String nome = result.getString("Nome");
	                System.out.println(nome);
	                String t= result.getString("Telefono");
	                System.out.println(t);
	                int o= result.getInt("MaxCoda");
	                System.out.println(o);
	                String m= result.getString("Servizi");
	                System.out.println(m);
	                String e= result.getString("Via");
	                System.out.println(e);
	                String ne= result.getString("N.Civico");
	                System.out.println(ne); 
	                int nom= result.getInt("coda");
	                System.out.println(nom);  }}
	                        

		      catch (Exception e) {
		        	System.out.println("errore nell'interrogazione della query 13");
		        	e.printStackTrace();}
 break;}     
//Query 14
 case 14:{          try {
	              		Statement query = con.createStatement();
	              		ResultSet result = query.executeQuery("Select * from Raider");

	              while (result.next()){
	            	  	String nome = result.getString("Nome");
	            	  	System.out.println(nome);
	            	  	String t= result.getString("Cognome");
	            	  	System.out.println(t);
	            	  	String o= result.getString("Datainizio");
	            	  	System.out.println(o);
	            	  	String m= result.getString("CodiceFiscale");
	            	  	System.out.println(m);
	            	  	int e= result.getInt("Nsocietà");
	            	  	System.out.println(e);
	            	  	Double ne= result.getDouble("MediaVoti");
	            	  	System.out.println(ne); }}
                      
	          catch (Exception e) {
		        		System.out.println("errore nell'interrogazione della query 14");
		        		e.printStackTrace();}   
 break;}
//Query 15
 case 15:{	  try {
	        	  		Statement query = con.createStatement();
	        	  		ResultSet result1 = query.executeQuery("select * from Cliente JOIN Valutazione on "
	        	  												+ "Cliente.Codicefiscale=Valutazione.Codicefisc JOIN Raider on Valutazione.Codicefiscal=Raider.Codicefiscale "
	                        									+ "where Valutazione.Data>current_date-interval 7 day AND Valutazione.Score<Raider.MediaVoti");	        
	        	  while (result1.next()){
	               		String nome = result1.getString("Nome");
	               		System.out.println(nome);
	               		String t= result1.getString("Cognome");
	               		System.out.println(t);
	               		String o= result1.getString("Telefono");
	               		System.out.println(o);
	               		int m= result1.getInt("Nordini");
	               		System.out.println(m);
	               		String e= result1.getString("Via");
	               		System.out.println(e);
	               		String ne= result1.getString("NOcivico");
	               		System.out.println(ne); 
	               		String nom= result1.getString("CodiceFiscale");
	               		System.out.println(nom);}}
	      

	      catch (Exception e){
	          			System.out.println("Errore nell'interrogazione nella query 15");
	          			e.printStackTrace();}
break;}	          	
case 16:  { System.out.println("Programma chiuso arrivederci è grazie"); 
break;}
     }
   }     
 }

	
	          
	          
	          
	
       
		

	        

