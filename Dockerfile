FROM golang:1.20 as builder

WORKDIR /usr/src/app

COPY ./src .
RUN go build app.go 

FROM scratch
WORKDIR /app
COPY --from=builder  /usr/src/app .

CMD [ "./app" ]

