FROM rremizov/golang.i386:1.2.2

MAINTAINER rremizov

ADD . /app/
WORKDIR /app/
RUN go build dockerui.go
EXPOSE 9000
ENTRYPOINT ["./dockerui"]

