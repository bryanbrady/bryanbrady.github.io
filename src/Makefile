.PHONY: clean build watch

clean:
	stack exec bbrady-io clean

build:
	stack build --fast
	stack build --fast --pedantic --haddock --test --no-run-tests --no-haddock-deps
	stack exec bbrady-io rebuild

watch: build
	stack exec bbrady-io watch
