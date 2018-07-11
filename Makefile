.PHONY: all build clean server

all: clean build

clean:
	rm -rf public

build:
	git log -1 --format='{{ $$.Scratch.Set "commit" "%h" }}' > themes/mainroad/layouts/partials/commit.html
	hugo

server: all
	hugo server --disableFastRender