import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/node")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("pageToReturn.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("delete") != null && req.getParameter("delete").equals("true") ||
            req.getParameter("x") == null || req.getParameter("y") == null || req.getParameter("r") == null) {
            req.getRequestDispatcher("pageToReturn.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("areaCheck").forward(req, resp);
        }
    }
}
