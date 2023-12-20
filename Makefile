.PHONY: all
all: run

.PHONY: run
run:
	flutter run

.PHONY: get
get:
	flutter pub get

.PHONY: clean
clean:
	flutter clean

.PHONY: build
build:
	flutter build apk

.PHONY: test
test:
	flutter test

.PHONY: analyze
analyze:
	flutter analyze

.PHONY: generate
generate:
	flutter gen-l10n

.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make run       - Run the Flutter app"
	@echo "  make get       - Get packages"
	@echo "  make clean     - Clean the project"
	@echo "  make build     - Build the app for release"
	@echo "  make test      - Run tests"
	@echo "  make analyze   - Analyze the project's Dart code"
	@echo "  make generate  - Generate code"
	@echo "  make watch     - Watch for file changes and generate code automatically"
