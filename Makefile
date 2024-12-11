BINARY_NAME=foo-lorem
VERSION=$(shell git describe --tags --always)

.PHONY: build
build:
	goreleaser build --snapshot --clean --single-target

.PHONY: test
test:
	go test ./... -v

.PHONY: clean
clean:
	rm -rf bin/ dist/

.PHONY: install
install:
	go install .

.PHONY: release-dry-run
release-dry-run:
	goreleaser release --snapshot --clean

.PHONY: release
release:
	goreleaser release --clean