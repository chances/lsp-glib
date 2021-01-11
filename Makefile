CWD := $(shell pwd)
SOURCES := $(shell find src -name '*.vala')
TARGET_OS := $(shell uname -s)
LIBS_PATH := lib
PACKAGE_VERSION := 0.1.0

.DEFAULT_GOAL := build/llc.snow.lsp
all: build/llc.snow.lsp

build/llc.snow.lsp: $(SOURCES)
	meson build
	@cd build && ninja

install: build/llc.snow.lsp
	@cd build && ninja install
.PHONY: install

test:
	@echo "TODO: Write tests"
.PHONY: test

cover: $(SOURCES)
	@echo "TODO: Write tests"

docs:
	#TODO: Write documentation
.PHONY: docs

clean: clean-docs
	rm -rf build/
.PHONY: clean

clean-docs:
.PHONY: clean-docs
