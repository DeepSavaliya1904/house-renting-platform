<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .error-container {
            text-align: center;
            padding: 40px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
        }

        .error-image {
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
        }

        h1 {
            margin: 0;
            font-size: 28px;
            color: #333;
        }

        p {
            margin: 10px 0;
            color: #666;
            font-size: 16px;
            line-height: 1.5;
        }

        .icon {
            color: #f44336;
            font-size: 36px;
        }

        a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s;
        }

        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <img class="error-image" src="img/error.webp" alt="Error Image">
        <h1>Error <i class="fas fa-exclamation-triangle icon"></i></h1>
        <p>Oops! you are not authorized to view this page</p>
        <p>Please <a href="../home.jsp">return to the homepage</a> and try again.</p>
    </div>
</body>
</html>
