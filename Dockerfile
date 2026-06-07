FROM ghcr.io/graalvm/native-image-community:25 AS builder
WORKDIR /app
COPY . .
RUN microdnf install -y maven && \
    mvn -Pnative native:compile -DskipTests

FROM ubuntu:22.04
COPY --from=builder /app/target/graalvm-sck-app /app
ENTRYPOINT ["/app"]