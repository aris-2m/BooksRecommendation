package pack_sevlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

/**
 * Servlet implementation class Avis
 */
@WebServlet("/Avis")
public class Avis extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Avis() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out2 = response.getWriter();
		out2.print("Rien à afficher");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String note=request.getParameter("note");
		String Id_User=request.getParameter("Id_User");
		String Id_Product=request.getParameter("Id_Product");


		MongoDBApp M2=new MongoDBApp("TP1");
		ArrayList<String> ids= M2.GetFieldInCollection("ratings","_id");


		Document ins = new Document("_id", ids.size()+1).append("Id_User", Id_User).append("Id_Product", Id_Product).append("note", note);

		M2.insertDoc(ins, "ratings");

		this.getServletContext().getRequestDispatcher("/BooksRecommender").include(request, response);

	}

}
