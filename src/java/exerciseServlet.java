
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.net.*;
import org.json.*;

public class exerciseServlet extends HttpServlet {

    private static final String API_URL = "https://api.api-ninjas.com/v1/caloriesburned?activity=";
    private static final String API_KEY = "ih60TJEskhQeLzhqei/wYA==84xJ83fBQwbzA5E2"; // Replace with your actual key

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String exercise = request.getParameter("exerciseName");

        try {
            URL url = new URL(API_URL + URLEncoder.encode(exercise, "UTF-8"));
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestProperty("X-Api-Key", API_KEY);
            conn.setRequestMethod("GET");

            System.out.println("Connecting to URL: " + url);
            System.out.println("Using API Key: " + API_KEY);
            System.out.println("Response Code: " + conn.getResponseCode());
            System.out.println("Response Message: " + conn.getResponseMessage());

            if (conn.getResponseCode() != 200) {
                throw new IOException("API returned status: " + conn.getResponseCode());
            }

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder json = new StringBuilder();
            String line;
            while ((line = in.readLine()) != null) {
                json.append(line);
            }
            in.close();

            JSONObject obj = new JSONObject(json.toString());
            JSONArray items = obj.getJSONArray("items");

            StringBuilder result = new StringBuilder();
            if (items.length() > 0) {
                result.append("<ul>");
                for (int i = 0; i < items.length(); i++) {
                    JSONObject ex = items.getJSONObject(i);
                    result.append("<li>")
                            .append("Exercise: ").append(ex.getString("name"))
                            .append(" — Calories Burned: ").append(ex.getDouble("total_calories"))
                            .append(" (").append(ex.getInt("duration_minutes")).append(" min)")
                            .append("</li>");
                }
                result.append("</ul>");
            } else {
                result.append("No data found.");
            }

            request.setAttribute("result", result.toString());
            RequestDispatcher dispatcher = request.getRequestDispatcher("exercise.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(); // optional: log to server console
            request.setAttribute("result", "Error: " + e.getMessage());
            request.getRequestDispatcher("exercise.jsp").forward(request, response);
        }
    }
}
