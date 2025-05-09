# 1. Java 21 JDK 기반 이미지
FROM eclipse-temurin:21-jdk-alpine

# 2. 작업 디렉토리 생성 (이름 자유롭게 설정 가능)
WORKDIR /sonsation-server

# 3. 빌드된 JAR 파일 복사 (Render는 이미 build된 상태에서 실행만 하도록 구성됨)
COPY build/libs/sonsation-server-0.0.1-SNAPSHOT.jar app.jar

# 4. 포트 오픈 (Render는 이 포트를 기준으로 라우팅)
EXPOSE 8080

# 5. Spring Boot 실행 명령
ENTRYPOINT ["java", "-jar", "app.jar"]
