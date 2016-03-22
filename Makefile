shellcheck:
ifeq ($(shell shellcheck > /dev/null 2>&1 ; echo $$?),127)
ifeq ($(shell uname),Darwin)
	brew install shellcheck
else
	sudo add-apt-repository 'deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse'
	sudo apt-get update -qq && sudo apt-get install -qq -y shellcheck
endif
endif

bats:
ifeq ($(shell bats > /dev/null 2>&1 ; echo $$?),127)
ifeq ($(shell uname),Darwin)
	brew install shellcheck
else
	sudo add-apt-repository ppa:duggan/bats --yes
	sudo apt-get update -qq && sudo apt-get install -qq -y bats
endif
endif

ci-dependencies: shellcheck bats

lint:
	@echo linting...
	@$(QUIET) find . -not -path '*/\.*' -type f | xargs file | grep text | awk -F ':' '{ print $$1 }' | xargs head -n1 | egrep -B1 "bash" | grep "==>" | awk '{ print $$2 }' | xargs shellcheck -e SC2034

setup:
	$(MAKE) ci-dependencies

test: setup lint
