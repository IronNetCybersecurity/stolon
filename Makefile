THIS := $(realpath $(lastword $(MAKEFILE_LIST)))
THIS_DIR := $(shell dirname $(THIS))
ROOT_DIR := $(realpath $(THIS_DIR)/../..)

DOCKER ?= docker

REGISTRY ?= 217386048230.dkr.ecr.us-east-1.amazonaws.com/

IMAGE_REPO ?= $(REGISTRY)stolon
IMAGE_TAG ?= ironnet-1.0.3

GOLANG_VERSION ?= 1.11.5

.PHONY: all build push

all: build

build:
	$(DOCKER) build \
		--build-arg GOLANG_VERSION=$(GOLANG_VERSION) \
		-f $(THIS_DIR)/Dockerfile \
		-t $(IMAGE_REPO):$(IMAGE_TAG) \
		$(ROOT_DIR)/deps/stolon

pull:
	$(DOCKER) pull $(IMAGE_REPO):$(IMAGE_TAG)

push:
	$(DOCKER) push $(IMAGE_REPO):$(IMAGE_TAG)