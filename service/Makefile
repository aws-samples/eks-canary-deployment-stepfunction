GOOSDEV	?= $(shell uname -s)
GOARCH  ?= amd64
GOOS ?= $(shell uname -s |  tr '[:upper:]' '[:lower:]')
S3TMPBUCKET ?= tmp.pahud.net
APPNAME = myapp

.PHONY: build
build:
ifeq ($(GOOS),darwin)
	@docker run -ti --rm -v $(shell pwd):/go/src/myapp.github.com -w /go/src/myapp.github.com  golang:1.12 /bin/sh -c "make build-darwin"
else
	@docker run -ti --rm -v $(shell pwd):/go/src/myapp.github.com -w /go/src/myapp.github.com  golang:1.12 /bin/sh -c "make build-linux"
endif
	

.PHONY: stop	
stop:
	@docker rm -f $(APPNAME) || exit 0
	
.PHONY: reload
reload:
	@docker kill -s HUP $(APPNAME)
	
.PHONY: exec
exec:
	@docker run --rm \
	-v $(shell pwd):/go/src/myapp.github.com \
	-p 8080:8080 \
	-e serviceName=foo \
	-e versionNum=1.0 \
	--name $(APPNAME) \
	-w /go/src/myapp.github.com  golang:1.12 \
	/bin/sh -c "./myapp"	
	
.PHONY: run	
run:
	@docker run --rm \
	-v $(shell pwd):/go/src/myapp.github.com \
	-p 8080:8080 \
	-e serviceName=foo \
	-e versionNum=1.0 \
	--name $(APPNAME) \
	-w /go/src/myapp.github.com  golang:1.12 \
	/bin/sh -c "go run main.go"
	
.PHONY: build-linux	
build-linux:
	@go get -u github.com/golang/dep/cmd/dep
	@[ ! -f ./Gopkg.toml ] && dep init || true
	@dep ensure
	@GOOS=linux GOARCH=amd64 go build -o $(APPNAME) main.go

.PHONY: build-darwin
build-darwin:
	@go get -u github.com/golang/dep/cmd/dep
	@[ ! -f ./Gopkg.toml ] && dep init || true
	@dep ensure
	@GOOS=darwin GOARCH=amd64 go build -o $(APPNAME) main.go
	
	
.PHONY: docker-build
docker-build:
	@docker build -t pahud/aws-appmesh-refarch-service:latest .

.PHONY: docker-push
docker-push:
	@docker push pahud/aws-appmesh-refarch-service:latest	
	
.PHONY: clean
clean:
	rm -rf Gopkg.* vendor $(APPNAME)
	

