package pack_sevlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.Document;


@WebServlet("/SignIn")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SignIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/connexion.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		MongoDBApp M2=new MongoDBApp("TP1");
		
		ArrayList<Document> Recherche=null;
		
		try {
		String query="{email:'"+email+"'"+"password:"+"'"+password+"'"+"}" ;
		Recherche=M2.FindWithFilter("users", query);
		
			if(Recherche.get(0)!=null) {
				Document r=Recherche.get(0);
				 
				System.out.println(r);
				
				HttpSession maSession=request.getSession();
				maSession.setAttribute("Utilisateur",r);
			}
		
		}
		catch(IndexOutOfBoundsException e) {
			//this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			this.getServletContext().getRequestDispatcher("/BooksRecommender").include(request, response);
		}
		finally {
			
		}

		//this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		this.getServletContext().getRequestDispatcher("/BooksRecommender").include(request, response);
		
		}
		

}

