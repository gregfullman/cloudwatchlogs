install:
	go get -u github.com/jessevdk/go-assets-builder

build:
	go-assets-builder static -o assets.go
	go build

docker: build
	docker build -t greg7fullman/cloudwatchlogs .

docker-release: docker
	docker push greg7fullman/cloudwatchlogs

release:
	mkdir -p ./dist
	GOOS=linux GOARCH=amd64 go build -o ./dist/cloudwatchlogs-linux-amd64