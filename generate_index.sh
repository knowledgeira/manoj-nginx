#!/bin/bash

private_ip=$(hostname -i | awk '{print $1}')

cat <<EOF > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Knowledgeira</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
        }

        h1 {
            color: #007BFF;
        }

        .footer {
            position: fixed;
            width: 100%;
            background-color: #333333;
            color: #fff;
            font-size: 0.7em;
            text-align: center;
            bottom: 0;
            padding: 10px 0;
        }
    </style>
</head>
<body>
    <h1>Welcome</h1>
    <p>This is a simple HTML page created and maintained by Manoj Jagdale (knowledgeira).</p>
    <p>Your Private IP Address: $private_ip</p>

    <div class="footer">
        &copy; <span id="currentYear"></span> Created and maintained by Manoj Jagdale: knowledgeira
    </div>

    <script>
        // Get the current year using JavaScript
        const currentYear = new Date().getFullYear();
        // Update the content of the span element with the current year
        document.getElementById('currentYear').textContent = currentYear;
    </script>
</body>
</html>
EOF


# Start the Nginx server
echo "Starting Nginx server..."
nginx -g "daemon off;"

