.PHONY: help install

help:
	@cat $(firstword $(MAKEFILE_LIST))

install:
	npx --yes cdktf-cli@latest --version


