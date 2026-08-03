# Eclipse Temurin JDK 17 JRE on Alpine（v1.1 决策文档：项目已统一 JDK 17）
FROM eclipse-temurin:17-jre-alpine

LABEL maintainer="wms-ruoyi"

RUN mkdir -p /ruoyi/server/logs \
    /ruoyi/server/temp \
    /ruoyi/skywalking/agent

WORKDIR /ruoyi/server

ENV SERVER_PORT=8080 \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    JAVA_OPTS=""

EXPOSE ${SERVER_PORT}

ADD ./target/ruoyi-admin.jar ./app.jar

ENTRYPOINT ["sh", "-c", \
    "exec java $JAVA_OPTS \
        -Djava.security.egd=file:/dev/./urandom \
        -Dserver.port=${SERVER_PORT} \
        -Dfile.encoding=UTF-8 \
        -Duser.timezone=Asia/Shanghai \
        -jar app.jar"]
