package pack_sevlet;

import java.util.ArrayList;

import org.bson.Document;

import com.mongodb.client.MongoCursor;

public class Executeuse {
	
	public String s=null;
	
	public Executeuse() {
		MongoDBApp M2=new MongoDBApp("TP1");
		
		ArrayList<String> mc= M2.GetFieldInCollection("books200","thumbnailUrl");
		String g=mc.get(0);
		
		System.out.println(g);
		this.s=g;
	}
}
