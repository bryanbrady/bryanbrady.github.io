.PHONY: clean build watch

STACK_BUILD_OPTS=

clean:
	stack exec bbrady-io clean

build:
	stack build --fast ${STACK_BUILD_OPTS}
	stack build --fast ${STACK_BUILD_OPTS} --pedantic --haddock --test --no-run-tests --no-haddock-deps
	stack exec bbrady-io rebuild

watch: build
	stack exec bbrady-io watch
