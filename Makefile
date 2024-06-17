SHELL = bash
.SILENT:
.PHONY:js-report
.DEFAULT_GOAL := list

list:
	@grep '^[^#[:space:]].*:' Makefile

js-report:
	./src/run-js-tests.sh
	./src/compile-readme.sh "JavaScript/REPORT.md" "README.md"
