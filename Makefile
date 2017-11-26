default: dep fmt vet test install

test:
	go test -v -timeout 60s -race ./...

vet:
	go vet ./...

fmt:
	@if [ -n "$$(go fmt ./...)" ]; then echo 'Please run go fmt on your code.' && exit 1; fi

dep:
	@if which dep > /dev/null; then dep ensure; else echo 'Please install dep: https://github.com/golang/dep' && exit 1; fi

install:
	go install
