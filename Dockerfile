# FROM ghcr.io/graalvm/native-image-community:25 AS builder
# WORKDIR /app
# COPY . .
# COPY .m2 /root/.m2
# RUN microdnf install -y maven && \
#     mvn -Pnative native:compile -DskipTests

# FROM ubuntu:22.04
# COPY --from=builder /app/target/graalvm-sck-app /app
# ENTRYPOINT ["/app"]


FROM ubuntu:22.04
COPY target/graalvm-sck-app /app
ENTRYPOINT ["/app"]