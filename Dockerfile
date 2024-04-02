# Используем базовый образ с поддержкой Go
FROM golang:latest

ENV GO111MODULE=on

# Установка рабочей директории внутри контейнера
WORKDIR /app

COPY go.mod ./
COPY go.sum ./

# Выполнение команды go mod download для загрузки зависимостей
RUN go mod download

COPY . .

# Сборка приложения
RUN go build -o main .

EXPOSE 8080

# Команда для запуска приложения при запуске контейнера
CMD ["./main"]
