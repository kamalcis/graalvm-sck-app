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
- ./mvnw -Pnative native:compile -DskipTests
- Create the Docker file
- sudo apt install podman -y
- podman build -t graalvm-sck-app:1.0 .
- podman images
- podman login docker.io (input username and password)
- podman tag localhost/graalvm-sck-app:1.0 docker.io/kamalcis/graalvm-sck-app:1.0
- podman push docker.io/kamalcis/graalvm-sck-app:1.0


# Findings
- After Running on Kubernetes Kubeadm Cluster, GraalVM 25 + Spring Boot 4.1.0 +
  SCK 5.0.2, I found the following error
- Application run Failed
  Caused by: java.lang.ClassNotFoundException: io.fabric8.kubernetes.client.impl.KubernetesClientImpl
        at java.base@25.0.2/jdk.internal.loader.BuiltinClassLoader.loadClass(BuiltinClassLoader.java:63)
        at java.base@25.0.2/java.lang.ClassLoader.loadClass(ClassLoader.java:490)
        at io.fabric8.kubernetes.client.KubernetesClientBuilder.<init>(KubernetesClientBuilder.java:60)




# Reproduce
Cloned the sck library from https://github.com/spring-cloud/spring-cloud-kubernetes
Installed the sck library to local repo.
cd spring-cloud-kubernetes> ./mvnw clean install -DskipTests -Dspring-boot.build-image.skip=true
The link of app repo I used to test: https://github.com/kamalcis/graalvm-sck-app
Build the app. cd graalvm-sck-app> ./mvnw -Pnative native:compile -DskipTests
Now the Aot Binary is ready in the target folder. (Build outside because container does not refer local repo)
Used Podman to build the docker image. ( Docker just copied the aot binary file into working directory)
Deployed the image to kubernetes.
Expect to see no error if PR is merged. Before merge ClassNotFoundException should be thrown in kubernetes