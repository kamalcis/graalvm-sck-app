# FROM ghcr.io/graalvm/native-image-community:25 AS builder
# WORKDIR /app
# COPY . .
# COPY .m2 /root/.m2
# RUN microdnf install -y maven && \
#     mvn -Pnative native:compile -DskipTests

# FROM ubuntu:22.04
# COPY --from=builder /app/target/graalvm-sck-app /app
# ENTRYPOINT ["/app"]



#---------For GraalVM Image building without using builder stage-----------------
FROM ubuntu:22.04
COPY target/graalvm-sck-app /app
ENTRYPOINT ["/app"]

#---------For running the application using JRE image-----------------
#FROM docker.io/library/eclipse-temurin:25-jre
#WORKDIR /app
#COPY target/graalvm-sck-app-0.0.1-SNAPSHOT.jar /app/app.jar
#ENTRYPOINT ["java", "-jar", "/app/app.jar"]