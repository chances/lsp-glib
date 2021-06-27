CWD := $(shell pwd)
SOURCES := $(shell find src -name '*.vala')
TARGET_OS := $(shell uname -s)
LIBS_PATH := lib
PACKAGE_VERSION := 0.1.0

.DEFAULT_GOAL := build/llc.snow.lsp
all: build/llc.snow.lsp

build/build.ninja: meson.build
	meson build

build/llc.snow.lsp: $(SOURCES) build/build.ninja
	ninja -C build

install: build/llc.snow.lsp
	ninja -C build install
.PHONY: install

test: build/build.ninja
	meson test -C build
.PHONY: test

lint: $(SOURCES)
	io.elementary.vala-lint -d src/
.PHONY: lint

cover:
	meson coverage --reconfigure
	meson test -C coverage
.PHONY: cover

docs:
	#TODO: Write documentation
.PHONY: docs

clean: clean-docs
	rm -rf build/
.PHONY: clean

clean-docs:
.PHONY: clean-docs
