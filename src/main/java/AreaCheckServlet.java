import history.Note;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/areaCheck")
public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("hh:mm:ss");
        long curTime = System.currentTimeMillis();

        String xPost = req.getParameter("x");
        String yPost = req.getParameter("y");
        String rPost = req.getParameter("r");

        System.out.println("1");
        if (xPost.matches("-?\\d+") && yPost.matches("-?\\d+(\\.\\d+)?") &&
                rPost.matches("\\d+(\\.\\d+)?")) {
            System.out.println("2");
            int x = Integer.parseInt(xPost);
            double y = Double.parseDouble(yPost);
            double r = Double.parseDouble(rPost);

            String answer;

            if ((x <= 0 && y <= 0 && x*x + y*y <= r*r/4) || (x >= 0 && y <= 0 && x <= r/2 && y >= -r) ||
                    (y <= x + r && x <= 0 && y >= 0)) {
                answer = " Yes ";
            } else {
                answer = " No ";
            }

            long time = System.currentTimeMillis() - curTime;
            Note note = new Note(x, y, r, answer, format.format(date), time);
            String serverAnswer = x + " " + y + " " + r + answer + format.format(date) + " " + time;

            ArrayList<Note> h = (ArrayList<Note>) session.getAttribute("history");
            h.add(note);
            session.setAttribute("history", h);

            //req.getRequestDispatcher("pageToReturn.jsp").forward(req, resp);
            System.out.println("3");
            resp.getWriter().write(serverAnswer);
        }
    }
}
