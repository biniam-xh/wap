import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.Random;

@WebServlet("/support")
public class Support extends HttpServlet {

    public static final String SOURCES = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String ticket_id = generateString(new Random(), SOURCES, 10);

        PrintWriter out = resp.getWriter();
        out.print("<html><head><head>\n" +
                "    <title>Servlet assignment 1</title>\n" +
                "    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n" +
                "  </head><body>");
        out.print("<div class=\"container\">\n" +
                "    <div class=\"row\">\n" +
                "      <div class=\"offset-md-2 col-md-8\">\n" +
                "        <h1>Servlets 1</h1>" +
                "<h3>Thank you! "+req.getParameter("name")+" for contacting us." +
                " We should receive reply from us with in 24 hrs in your email address " +
                req.getParameter("email")+". Let us know in our support email " +
                req.getServletContext().getInitParameter("support-email")+" if you do not receive reply within 24 hrs. " +
                "Please be sure to attach your reference "+ticket_id+" in your email.</h3>" +
                "</div>" +
                "</div>" +
                "</div>");
        out.print("</body></html>");
    }

    public String generateString(Random random, String characters, int length) {
        char[] text = new char[length];
        for (int i = 0; i < length; i++) {
            text[i] = characters.charAt(random.nextInt(characters.length()));
        }
        return new String(text);
    }


}
