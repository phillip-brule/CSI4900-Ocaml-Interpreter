build:
	dune build

utop:
	dune utop src

.PHONY: test
test:
	dune exec test/main.exe

.PHONY: console
console:
	dune exec console/main.exe

.PHONY: web_run
web_run:
	dune exec web_run/main.exe

clean:
	dune clean