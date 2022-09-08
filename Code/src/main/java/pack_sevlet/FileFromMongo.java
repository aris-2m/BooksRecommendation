package pack_sevlet;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCursor;
import com.mongodb.util.JSON;

//import MongoDBApp;

public class FileFromMongo {

	public static void main(String[] args) {

		String id="1";
		MongoDBApp M2=new MongoDBApp("TP1");
		String query;
		query="{}" ;

		ArrayList<Document> doc=M2.FindWithFilter("ratings", query);
		Document actu_doc;
		String a,b,c;
		//String b;
		//String c;

		int i;

		try {



			   File file = new File("dataset/ratings.txt");

			   // creer le fichier s'il n'existe pas
			   if (!file.exists()) {
			    file.createNewFile();
			   }

			   FileWriter fw = new FileWriter(file.getAbsoluteFile());
			   BufferedWriter bw = new BufferedWriter(fw);

			   for(i=0;i<doc.size();i++) {
					actu_doc=doc.get(i);
					a=(String) actu_doc.get("Id_User");
					b=(String) actu_doc.get("Id_Product");
					c=(String) actu_doc.get("note");

					bw.write(a+","+b+","+c+"\n");
				}



			   bw.close();

			   System.out.println("Modification terminee!");

			  } catch (IOException e) {
			   e.printStackTrace();
			  }



	}
}
