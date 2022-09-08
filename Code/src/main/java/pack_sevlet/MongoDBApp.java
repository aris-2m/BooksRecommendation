package pack_sevlet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoException;
import com.mongodb.client.DistinctIterable;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoIterable;

public class MongoDBApp {
	
	MongoClient mongoClient=null;
	MongoDatabase mydatabase=null;
	
	//Constructeur par d�faut
	public void MongoDBApp() {
		//Creer une instance client Mongo
		this.mongoClient =MongoClients.create();
	}
	
	//Constructeur pour directement cr�er une instance de base de donn�es
	public MongoDBApp(String nom_db) {
		//Creer une instance client Mongo
		this.mongoClient =MongoClients.create();
				
		//R�cup�rer la base de donn�es
		this.mydatabase = mongoClient.getDatabase(nom_db);
	}

	//M�thodes pour lister les DataBases
	public void ListDatabases() {
		//Lister les DataBases
		MongoIterable<String> dbNames = null;
		try {
			dbNames = this.mongoClient.listDatabaseNames();
		} catch (Exception e) {
			e.printStackTrace();
		}
							
		for (String dbName : dbNames) {
			System.out.println(dbName);
		}
	}
	
	public void ListCollection(String nom_collection) {
		
		//R�cup�rer la collection et l'ins�rer dans un Iterable par find()
        FindIterable<Document> mydatabaserecords = mydatabase.getCollection(nom_collection).find();
        
        //Cr�er un it�rateur ou curseur le pour parcourir
        MongoCursor<Document> iterator = mydatabaserecords.iterator();
        
        //Parcours de l'it�rateur pour r�cup�rer les donn�es
        while (iterator.hasNext()) {
            Document doc = iterator.next();
            // do something with document
            System.out.println(""+doc);
            System.out.println(""+doc.get("thumbnailUrl"));
        }
	}
	
	public ArrayList<String> GetFieldInCollection(String nom_collection, String nom_champ) {
		
		//R�cup�rer la collection et l'ins�rer dans un Iterable par find()	
        FindIterable<Document> mydatabaserecords = mydatabase.getCollection(nom_collection).find();
        
        //Cr�er un it�rateur ou curseur le pour parcourir
        MongoCursor<Document> iterator = mydatabaserecords.iterator();
        
        //Parcours de l'it�rateur pour r�cup�rer les donn�es
        List <String> l= new ArrayList<String>();
        while (iterator.hasNext()) {
            Document doc = iterator.next();
            //String aa=doc.getString(nom_champ);
            String aa=""+doc.get(nom_champ);
            l.add(aa);
        }
        
        return (ArrayList<String>) l;
	}
	
	public ArrayList<String> Distinct(String nom_collection, String nom_champ) {
		//R�cup�rer la collection       
        MongoCollection<Document> collection = mydatabase.getCollection(nom_collection);
        
        //Cr�ation d'une liste pour y stocker les resulats finaux
        List <String> l= new ArrayList<String>();
        try {
        	//Appliquer une commande distinct et recup�rer les donn�es en Iterable
            DistinctIterable<String> docs = collection.distinct(nom_champ, String.class);
            
            //Cr�er un it�rateur ou curseur le pour parcourir
            MongoCursor<String> results = docs.iterator();
            while(results.hasNext()) { 
            	//Ajouter cette case � notre liste de r�sulatats
                l.add(results.next());
            }
        } catch (MongoException me) {
            System.err.println("An error occurred: " + me);
        }
        
        return (ArrayList<String>) l;
	}
	
	public void insertDoc(Document doc2, String nom_collection) {
        
		//Mettre le document Bson sous forme String au format Json
        String jsonString = doc2.toJson();
        //Convertir en Document Json
        Document doc21 = Document.parse(jsonString);
        
        //R�cup�rer la collection
        MongoCollection collection = mydatabase.getCollection(nom_collection);
        //Y ins�rer le document
        collection.insertOne(doc21);
	}
	
	public ArrayList<Document> FindWithFilter(String collection, String filtre) {
		
		//Recup�rer la collection
		MongoCollection<Document> coll = mydatabase.getCollection(collection);
		
		//Convertir le filtre en Objet Bson
		BasicDBObject query = BasicDBObject.parse(filtre);
		
		//Avoir le resultat dans un Iterable
        FindIterable<Document> iterable =coll.find(query);
        
        //Cr�er l'it�rateur
        MongoCursor<Document> iterator = iterable.iterator();
        
        //Cr�er une Liste pour y stocker les enregistrements sous forme documents
        ArrayList<Document> results= new ArrayList<Document>();
        
        while(iterator.hasNext()) { 
      	  Document doc = iterator.next();
      	  results.add(doc);
      	  //System.out.println(doc);
        } 
        
		return results;		
	}
	
	
	public void closeClient() {
		//Fermer le client
		this.mongoClient.close();
	}
	


}
