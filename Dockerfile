# OpenJDK 17 이미지를 베이스로 사용
FROM openjdk:17-jdk-slim

# 작업 디렉토리 설정
WORKDIR /app

# 현재 디렉토리의 모든 파일을 컨테이너의 /app 디렉토리로 복사
COPY . .

# Gradle을 사용하여 프로젝트 빌드
RUN ./gradlew build

# 실행 가능한 JAR 파일 경로
ARG JAR_FILE=build/libs/*.jar

# 컨테이너에서 실행할 JAR 파일 설정
COPY ${JAR_FILE} app.jar

# 애플리케이션을 실행할 명령어
ENTRYPOINT ["java","-jar","/app/app.jar"]
