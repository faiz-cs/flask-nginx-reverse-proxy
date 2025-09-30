# Project 2 — Flask App with Nginx Reverse Proxy

![Python](https://img.shields.io/badge/Python-3.11-blue)
![Flask](https://img.shields.io/badge/Flask-2.3-green)
![Nginx](https://img.shields.io/badge/Nginx-latest-orange)

## Overview
This project demonstrates deploying a Flask application via Nginx reverse proxy. It also shows routing multiple services (Flask, Node.js, MinIO) through different endpoints using Nginx.

## Tech Stack & Tools
- Python 3.x
- Flask
- Nginx
- Git
- MinIO (optional)
- Node.js (optional)

## Features
- Reverse proxy Flask app through Nginx
- Multi-port routing example
- Local domain testing using /etc/hosts
- Professional server configuration with headers

## Setup Instructions
Refer to setup_commands.sh for automated setup or follow README instructions.


**Flask App in Browser**
![Flask App](docs/flask_app.png)

**Nginx Config**
![Nginx Config](docs/nginx_config.png)

## Notes
- Ensure Flask app is running before accessing via Nginx.
- You can extend multi-port routing to other services like Node.js or MinIO.
