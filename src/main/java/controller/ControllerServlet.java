package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class ControllerServlet  extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Map<String, String[]> map=req.getParameterMap();
        try {
            if (map.containsKey("R") && map.containsKey("x") && map.containsKey("y")) {
                getServletContext().getRequestDispatcher("/table").forward(req,resp);
            }
            getServletContext().getRequestDispatcher("/view/form.jsp").forward(req,resp);
        }catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
}
