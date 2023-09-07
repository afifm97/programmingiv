package resources;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import resources.User;
import resources.UserDB;

public class Index extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public Index(){
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the index.jsp page
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from the request parameters

        doGet(request, response);

        PrintWriter out = response.getWriter();
        String icnum = request.getParameter("icnum");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String postcode = request.getParameter("postcode");
        String town = request.getParameter("town");

        // Perform any processing or database operations here
        User rb = new User();

        rb.setIcnum(icnum);
        rb.setGender(gender);
        rb.setDob(dob);
        rb.setPostcode(postcode);
        rb.setTown(town);

        UserDB ud = new UserDB();
        String s1 = ud.insertUser(rb);

        System.out.println(s1);


        // Redirect to a confirmation page or another page as needed
        response.sendRedirect("http://localhost:8080/untitled1_war/confirmation.jsp");
    }
}
