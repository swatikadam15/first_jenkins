#####################################
# STAGE 1: BUILD
#####################################
FROM eclipse-temurin:17-jdk-jammy AS build

WORKDIR /app

COPY HelloWorld.java .

# Compile and create JAR
RUN javac HelloWorld.java \
 && jar cfe hello.jar HelloWorld HelloWorld.class

#####################################
# STAGE 2: RUNTIME (DISTROLESS)
#####################################
FROM gcr.io/distroless/java17-debian12

WORKDIR /app

COPY --from=build /app/hello.jar .

# IMPORTANT: only JAR name, no "java"
CMD ["hello.jar"]

