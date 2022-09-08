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

public class Test {

	public static void main(String[] args) {

		String id="1";
		MongoDBApp M2=new MongoDBApp("TP1");
		String query;
		query="{}" ;

		ArrayList<Document> doc=M2.FindWithFilter("books200", query);
		Document actu_doc;
		String a,b,c;
		
		actu_doc=doc.get(16);
		System.out.print(actu_doc.get("thumbnailUrl"));
		

	}
}
