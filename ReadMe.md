# SDK and Libraries
- openjdk 25.0.2 2026-01-20
  OpenJDK Runtime Environment GraalVM CE 25.0.2+10.1 (build 25.0.2+10-jvmci-b01)
  OpenJDK 64-Bit Server VM GraalVM CE 25.0.2+10.1 (build 25.0.2+10-jvmci-b01, mixed mode, sharing)V
- Spring Boot 4.1.0 (SNAPSHOT)
- Spring Cloud Kubernetes (SCK) 5.0.2-SNAPSHOT


# Installing GraalVM 25
- sdk list java | grep graal
- sdk install java 25-graalce
- sdk default java 25-graalce
- java -version

# Configure VSCode
- Connect to WSL:Ubuntu  by clicking the bottom left corner to install extensions
- Install Java Extension Pack when WSL:Ubuntu is displayed at the bottom left 

# Build Linux Binary
- Create the Docker file
- sudo apt install podman -y
- podman build -t graalvm-sck-app:1.0 .
- podman images
- podman login docker.io (input username and password)
- podman tag localhost/graalvm-sck-app:1.0 docker.io/kamalcis/graalvm-sck-app:1.0
- podman push docker.io/kamalcis/graalvm-sck-app:1.0