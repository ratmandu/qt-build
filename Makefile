# This should match the FROM line in Dockerfile:
UBUNTU := trusty

# These override the ARG lines in Dockerfile:
QT:= 5.8.0
QTM := 5.8
QTSHA := a11e42faa2e456eb89a31670a8860afa1325f0a8472e40931b419e0dc167649c
VCS_REF := $(shell git rev-parse --short HEAD)
BUILD_DATE := $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")

# If you need to change anything below, please raise an issue:
TAG := qt-build:$(UBUNTU)-$(QT)

.PHONY: image

image: $(QTF)
	docker build --build-arg "QT=$(QT)" --build-arg "QTM=$(QTM)" --build-arg "QTSHA=$(QTSHA)" --build-arg "VCS_REF=$(VCS_REF)" --build-arg "BUILD_DATE=$(BUILD_DATE)" --tag "$(TAG)" .
