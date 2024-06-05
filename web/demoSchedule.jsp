<%-- 
    Document   : demoSchedule
    Created on : Jun 3, 2024, 9:12:36 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lập lịch khóa học</title>
        <link rel="stylesheet" href="styles.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 500px;
                margin: 50px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            label {
                margin-bottom: 10px;
            }

            input[type="date"],
            input[type="time"],
            select {
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            button {
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Lập lịch khóa học</h1>
            <form action="#" method="post">
                <label for="course">Khóa học:</label>
                <select name="course" id="course">
                    <option value="math">Toán</option>
                    <option value="science">Khoa học</option>
                    <option value="language">Ngôn ngữ</option>
                    <!-- Thêm các tùy chọn khác tại đây -->
                </select>

                <label for="date">Chọn ngày:</label>
                <input type="date" id="date" name="date" required>

                <label for="time">Chọn giờ:</label>
                <input type="time" id="time" name="time" required>

                <button type="submit">Lập lịch</button>
            </form>
        </div>
    </body>
</html>



