.PHONY: all
all: run

.PHONY: run
run:
	flutter run

.PHONY: get
get:
	@echo "Getting dependencies for main project"
	@flutter pub get
	@echo "Getting dependencies for packages"
	@for dir in packages/*; do \
		if [ -d $$dir ]; then \
			echo "Getting dependencies in $$dir"; \
			(cd $$dir && flutter pub get || dart pub get); \
		fi \
	done


.PHONY: clean
clean:
	flutter clean

.PHONY: build
build:
	flutter build apk

.PHONY: test
test: test-app test-packages

.PHONY: test-app
test-app:
	@echo "Running Flutter tests"
	@flutter test

.PHONY: test-packages
test-packages:
	@echo "Running Dart tests in packages"
	@for dir in packages/*; do \
		if [ -d $$dir ]; then \
			echo "Running tests in $$dir"; \
			(cd $$dir && dart test); \
		fi \
	done

.PHONY: analyze
analyze:
	@flutter analyze
	@for dir in packages/*; do \
		if [ -d $$dir ]; then \
			(cd $$dir && dart analyze); \
		fi \
	done	

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
