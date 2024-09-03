SHELL = bash
.SILENT:
.PHONY:leetcode-js-report gen generate-report
.DEFAULT_GOAL := list

list:
	@grep '^[^#[:space:]].*:' Makefile

leetcode-js-report:
	./src/run-js-tests.sh LeetCode
	./src/compile-readme.sh LeetCode JavaScript

gen generate-reports: leetcode-js-report
