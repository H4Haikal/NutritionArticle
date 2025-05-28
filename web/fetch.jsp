<%-- 
    Document   : fetch
    Created on : 28 May 2025, 7:13:29 am
    Author     : Haikal
--%>

<%@ page import="java.net.*, java.io.*, javax.servlet.*, javax.servlet.http.*, org.json.*" %>
<%
    String apiKey = "4817e6901386184b09de09c2ab51e459"; // GNews or other API
    String apiUrl = "https://gnews.io/api/v4/search?q=nutrition&lang=en&max=10&token=" + apiKey;

    URL url = new URL(apiUrl);
    HttpURLConnection con = (HttpURLConnection) url.openConnection();
    con.setRequestMethod("GET");

   
    
    BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
    String inputLine;
    StringBuilder apiResponse = new StringBuilder();

    while ((inputLine = in.readLine()) != null) {
        apiResponse.append(inputLine);
    }
    in.close();

    JSONObject json = new JSONObject(apiResponse.toString());
    JSONArray articles = json.getJSONArray("articles");

    request.setAttribute("articlesData", articles.toString());
    RequestDispatcher rd = request.getRequestDispatcher("NutritionArticle.jsp");
    rd.forward(request, response);
%>
