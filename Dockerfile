FROM rremizov/wheezy32


MAINTAINER rremizov


ENV DEBIAN_FRONTEND noninteractive

RUN aptitude -y update && \
	aptitude -y install \
		ca-certificates \
		wget


RUN wget https://golang.org/dl/go1.2.2.linux-386.tar.gz && \
	tar -C /usr/local -xvzf go1.2.2.linux-386.tar.gz && \
	rm go1.2.2.linux-386.tar.gz


ENV PATH $PATH:/usr/local/go/bin
ADD . /app/
WORKDIR /app/
RUN go build dockerui.go
EXPOSE 9000
ENTRYPOINT ["./dockerui"]

