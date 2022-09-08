package pack_sevlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.Document;

/**
 * Servlet implementation class PourVous
 */
@WebServlet("/PourVous")
public class PourVous extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PourVous() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out2 = response.getWriter();
		
		MongoDBApp M2=new MongoDBApp("TP1");
		
		//SESSION--------------------------------------------
		HttpSession maSession=request.getSession();
		Document user=(Document) maSession.getAttribute("Utilisateur");
		String P1= (String) user.get("preferences1");
		String P2= (String) user.get("preferences2");
		String P3= (String) user.get("preferences3");

		
		//CATEGORIES-----------------------------------------
		String query;
		
		query="{categories:'"+P1+"'"+"}" ;
		ArrayList<Document> P1_=M2.FindWithFilter("books200", query);
		request.setAttribute("P1", P1_);
		
		query="{categories:'"+P2+"'"+"}" ;
		ArrayList<Document> P2_=M2.FindWithFilter("books200", query);
		request.setAttribute("P2", P2_);
		
		query="{categories:'"+P3+"'"+"}" ;
		ArrayList<Document> P3_=M2.FindWithFilter("books200", query);
		request.setAttribute("P3", P3_);

		
		//this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
		this.getServletContext().getRequestDispatcher("/PourVous.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
