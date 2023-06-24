.PHONY: help build bash clean

IMAGE := tamakiii-sandbox/hello-terraform-cdk
TAG := latest

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(IMAGE):$(TAG) .

bash:
	docker run -it --rm $(IMAGE):$(TAG) $@

clean:
	docker image rm $(IMAGE):$(TAG)
