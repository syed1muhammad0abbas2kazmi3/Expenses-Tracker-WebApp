FROM maven:3.8.3-openjdk-17 AS builder

WORKDIR /app

COPY . .

RUN mvn clean install -DskipTests=true

FROM openjdk:17-alpine

WORKDIR /app

COPY --from=builder /app/target/*.jar /app/expenseapp.jar

CMD ["java", "-jar", "expenseapp.jar"]


