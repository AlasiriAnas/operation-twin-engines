#!/bin/bash

apt update -y
apt install -y nginx

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Frontend VM</title>
</head>
<body>
  <h1>Frontend is Running</h1>

  <button onclick="callBackend()">Call Backend API</button>

  <pre id="output"></pre>

  <script>
    async function callBackend() {
      try {
        const response = await fetch("http://${backend_ip}:5000/");
        const data = await response.json();

        document.getElementById("output").innerText =
          JSON.stringify(data, null, 2);

      } catch (err) {
        document.getElementById("output").innerText = err;
      }
    }
  </script>
</body>
</html>
EOF

systemctl enable nginx
systemctl restart nginx