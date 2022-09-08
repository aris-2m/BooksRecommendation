package pack_sevlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Importations de Mongo

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.bson.Document;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoIterable;


/**
 * Servlet implementation class MainSevlet
 */
@WebServlet("/BooksRecommender")
public class BooksRecommender extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BooksRecommender() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.setContentType("text/html");
		//response.setCharacterEncoding("UTF-8");
		
		PrintWriter out2 = response.getWriter();
		
		MongoDBApp M2=new MongoDBApp("TP1");
		
		//TOUT---------------------
		ArrayList<String> Img_List= M2.GetFieldInCollection("books200","thumbnailUrl");
		ArrayList<String> Img_Id= M2.GetFieldInCollection("books200","_id");
		
		request.setAttribute("Img_List", Img_List);
		request.setAttribute("Img_Id", Img_Id);
		
		//CATEGORIES-----------------------------------------
		String query;
		
		query="{categories:'"+"Java"+"'"+"}" ;
		ArrayList<Document> Java=M2.FindWithFilter("books200", query);
		request.setAttribute("Java", Java);
		
		query="{categories:'"+"Business"+"'"+"}" ;
		ArrayList<Document> Business=M2.FindWithFilter("books200", query);
		request.setAttribute("Business", Business);
		
		query="{categories:'"+"Microsoft"+"'"+"}" ;
		ArrayList<Document> Microsoft=M2.FindWithFilter("books200", query);
		request.setAttribute("Microsoft", Microsoft);
		
		query="{categories:'"+"Mobile"+"'"+"}" ;
		ArrayList<Document> Mobile=M2.FindWithFilter("books200", query);
		request.setAttribute("Mobile", Mobile);
		
		query="{categories:'"+"Python"+"'"+"}" ;
		ArrayList<Document> Python=M2.FindWithFilter("books200", query);
		request.setAttribute("Python", Python);
		
		query="{categories:'"+"Perl"+"'"+"}" ;
		ArrayList<Document> Perl=M2.FindWithFilter("books200", query);
		request.setAttribute("Perl", Perl);
		
		
		//this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		this.getServletContext().getRequestDispatcher("/index1.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
}
