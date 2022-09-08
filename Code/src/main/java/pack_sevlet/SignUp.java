package pack_sevlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.Document;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

/**
 * Servlet implementation class Login
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MongoDBApp M3=new MongoDBApp("TP1");
		ArrayList<String> mc= M3.Distinct("books200","categories");
 
		request.setAttribute("Cat_List", mc);
		
		this.getServletContext().getRequestDispatcher("/inscription.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nom=request.getParameter("nom");
		String prenom=request.getParameter("prenom");
		String sexe=request.getParameter("sexe");
		String preferences1=request.getParameter("preferences1");
		String preferences2=request.getParameter("preferences2");
		String preferences3=request.getParameter("preferences3");
		String email=request.getParameter("email");
		String adresse=request.getParameter("adresse");
		String birthday=request.getParameter("birthday");
		String password=request.getParameter("password");
		
		MongoDBApp M2=new MongoDBApp("TP1");
		
		//Pour incrémenter id
		ArrayList<String> ids= M2.GetFieldInCollection("users","_id");
		
		
		Document person = new Document("_id", ids.size()+1).append("nom", nom).append("prenom", prenom).
                append("sexe", sexe).append("email", email).append("adresse", adresse).
                append("birthday", birthday).append("password", password).
                append("preferences1", preferences1).append("preferences2", preferences2).append("preferences3", preferences3)
                ;

		M2.insertDoc(person, "users");
		
		HttpSession maSession=request.getSession();
		maSession.setAttribute("Utilisateur",person);
		
		//------------------------------------------------------------------------------
		/*
		ArrayList<String> Img_List= M2.GetFieldInCollection("books200","thumbnailUrl");
 
		request.setAttribute("Img_List", Img_List);
		
		this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		*/
		this.getServletContext().getRequestDispatcher("/BooksRecommender").include(request, response);
	}

}
