# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GORUN=$(GOCMD) run
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
GOMOD=$(GOCMD) mod
BINARY_NAME=templ-gin-app

# repopack
REPOPACK=repopack

# templ
TEMPL=templ
TEMPL_GENERATE=$(TEMPL) generate

# air
AIR=air

BIN=./tmp/main

.PHONY: build run clean dev deps repopack

help:
	@echo "  --------------------------------------------------------------------------------"
	@echo "  Basic Air / Temple Live Reload Example"
	@echo "  --------------------------------------------------------------------------------"
	@echo "  This is an extremely barebones working example of an air / templ setup."
	@echo "  I had problems with a few peoples examples getting it working just right"
	@echo "  so I created my own. I found that as long as the templ files generate"
	@echo "  before air builds everything and you ignore the _templ.go files, it works"
	@echo "  properly. Basically it sees that the .templ file has been edited, generates"
	@echo "  the go file on the air pre cmd, then proceeds to re-build the go files." 
	@echo "  There is a small delay but it's better than nothing"
	@echo ""
	@echo "  --------------------------------------------------------------------------------"
	@echo "  Makefile Commands"
	@echo "  --------------------------------------------------------------------------------"
	@echo "  build			This will resolve dependencies andbuild the application"
	@echo "  run			This will resolve dependencies, build, and run the app"
	@echo "  clean			Cleans up the ./tmp folder"
	@echo "  dev			Handles running the live-reload. Requires air."
	@echo "  deps			This will resolve the projects dependencies"
	@echo "  repopack		This generates an ai friendly file for consumption"

build: deps
	$(GOBUILD) -o $(BIN) .

run: build
	$(GORUN) .

clean:
	rm -rf ./tmp/*

dev:
	$(AIR)

deps:
	$(GOMOD) tidy

repopack:
	$(REPOPACK)
