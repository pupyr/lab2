package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Map<String, String[]> map = req.getParameterMap();
        try {
            if (!map.containsKey("r") || !map.containsKey("x") || !map.containsKey("y")) {
                getServletContext().getRequestDispatcher("view/form.jsp").forward(req, resp);
            }else getServletContext().getRequestDispatcher("/view/history.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
}
