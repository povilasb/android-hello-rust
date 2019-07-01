docker_image = povilasb/android-rust

.PHONY: docker-image
docker-image:
	docker build -t $(docker_image) .

.PHONY: run-docker
run-docker:
	docker run \
		-v $(CURDIR):/root/src -w /root/src \
		-v /dev/bus/usb:/dev/bus/usb \
		-it $(docker_image) bash
