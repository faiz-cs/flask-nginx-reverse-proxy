# Project 2 — Reverse Proxy with Nginx + Flask + MinIO

## 📌 Overview
This project demonstrates how to set up **Nginx as a reverse proxy** to route traffic to different backend applications:  
- **Flask App** (Python, port 5000)  
- **Node.js API** (port 3000)  
- **MinIO Object Storage** (port 9000)  

This setup simulates a real-world deployment where multiple services are hosted behind a single domain.

## 🛠️ Prerequisites
- Ubuntu/Debian-based system  
- Python 3.x installed  
- Basic knowledge of Linux commands  

## ⚙️ Setup Instructions

### 1. Install Nginx and Git
```bash
sudo apt update
sudo apt install -y nginx git
```

### 2. Start and Check Nginx
```bash
sudo systemctl start nginx
systemctl status nginx
```

### 3. Set Up Python Virtual Environment
```bash
sudo apt install -y python3-venv
python3 -m venv venv
source venv/bin/activate
```

### 4. Install Flask
```bash
pip install flask
```

### 5. Create and Run Flask App
```bash
mkdir ~/myapp && cd ~/myapp
nano app.py
```
Paste this:
```python
from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from my Cloud App running on Flask via Nginx Reverse Proxy!"

if __name__ == "__main__":
    app.run(host="192.168.43.173", port=5000)
```
Run the app:
```bash
python app.py
```

### 6. Configure Nginx Reverse Proxy
Open default config:
```bash
sudo nano /etc/nginx/sites-available/default
```
Example config:
```nginx
server {
    listen 80;

    server_name mysite.com;

    location / {
        proxy_pass http://127.0.0.1:5000;   # Flask
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    location /api {
        proxy_pass http://127.0.0.1:3000;   # Node.js
    }

    location /files {
        proxy_pass http://127.0.0.1:9000;   # MinIO
    }
}
```
Restart Nginx:
```bash
sudo systemctl restart nginx
```

### 7. Test with Local Domain (Optional)
Edit hosts file:
```bash
sudo nano /etc/hosts
```
Add:
```
127.0.0.1 mysite.com
```
Now visit:
- `http://mysite.com/` → Flask app  
- `http://mysite.com/api` → Node.js app  
- `http://mysite.com/files` → MinIO  

## ✅ Outcome
You now have a working **reverse proxy setup** where Nginx routes traffic to multiple backend services (Flask, Node.js, MinIO).
