# 1. Java 21 JDK 기반 이미지
FROM eclipse-temurin:21-jdk-alpine

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. 프로젝트 소스 전체 복사
COPY . .

# 4. Gradle 빌드 수행 (캐시 문제 줄이기 위해 wrapper 사용)
RUN ./gradlew build -x test --no-daemon

# 5. JAR 복사
RUN cp build/libs/*SNAPSHOT.jar app.jar

# 6. 포트 오픈
EXPOSE 8080

# 7. 앱 실행
ENTRYPOINT ["java", "-jar", "app.jar"]
