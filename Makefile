.PHONY: all build clean server

all: clean build

clean:
	rm -rf public

build:
	git log -1 --format='{{ $$.Scratch.Set "commit" "%H" }}' > themes/mainroad/layouts/partials/commit.html
	hugo

server: all
	hugo server