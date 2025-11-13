# TP DevOps

This is a DevOps practical work project demonstrating containerization and web deployment.

## Files
- `index.html`: Simple web page
- `Dockerfile`: Docker configuration for containerizing the application

## How to run
1. Build the Docker image: `docker build -t tp-devops .`
2. Run the container: `docker run -p 8080:80 tp-devops`
3. Open http://localhost:8080 in your browser