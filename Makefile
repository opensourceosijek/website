.PHONY: all build clean

all: clean build

build:
	hugo

clean:
	rm -rf public

server:
	hugo server --disableFastRender