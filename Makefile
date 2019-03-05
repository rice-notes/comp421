docs-serve:
	docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material

clean:
	sudo rm -rf site 2>/dev/null || true

.PHONY: docs-serve clean
