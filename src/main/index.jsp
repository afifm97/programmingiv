<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Form with Default Values</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        form {
            display: flex;
            flex-direction: column;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        label, input {
            margin: 5px 0;
        }

        /* Center the submit button */
        input[type="submit"] {
            margin-top: 10px;
            align-items: center;
        }

    </style>
</head>
<body>
<h2>Screen</h2>

<%
    // Database connection configuration
    String jdbcUrl = "jdbc:mysql://localhost:3306/mydatabase2";
    String dbUsername = "root";
    String dbPassword = "15disember";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int userId = 0; // Initialize userId to 0 or any default value
    String defaultDob = ""; // Declare and initialize defaultDob
    String defaultTown = ""; // Declare and initialize defaultTown

    try {
        // Establish a database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

        // Fetch user data from the database (replace '1' with the actual user ID or a suitable identifier)
        int userRequestedId = 2; // Change this to the user ID you want to fetch data for

        String sql = "SELECT id, dob, town FROM userdata2 WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, userRequestedId); // Set the user ID parameter in the SQL query
        rs = pstmt.executeQuery();

        if (rs.next()) {
            userId = rs.getInt("id"); // Retrieve the user's ID from the result
            defaultDob = rs.getString("dob");
            defaultTown = rs.getString("town");
        }

        // Close database resources
        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<form action="classes/Index" method="post">
    <div>
        <label for="icnum">New IC Number   :</label>
        <input type="text" id="icnum" name="icnum" maxlength="6" required value="<%= defaultDob %>">
    </div>
    <div>
        <label for="gender">Gender         :</label>
        <select id="gender" name="gender">
            <option value="male">M</option>
            <option value="female">F</option>
        </select>
        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" value="<%= defaultDob %>">
    </div>
    <div>
        <label for="postcode">Postcode     :</label>
        <input type="text" id="postcode" name="postcode" placeholder="68000" maxlength="5" required>
        <label for="town">Town:</label>
        <input type="text" id="town" name="town" value="<%= defaultTown %>">
    </div>
    <button type="submit" id="index" value="Save">Save</button>
</form>
</body>
</html>
