FROM golang:latest

WORKDIR /src/myproject

COPY ./ /src/myproject

RUN go mod download

RUN go get github.com/githubnemo/CompileDaemon

RUN apt-get update && \
    apt-get install -y nano && \
    rm -fr /var/lib/apt/lists/*

CMD ["bash"]
 
ENTRYPOINT CompileDaemon --build="go build /src/myproject/runserver.go" --command=./runserver