# Environment includes
-include .env

# Required includes
include ./makefile-utils/make.d/colors.make
include ./makefile-utils/make.d/strings.make
include ./makefile-utils/make.d/helper.make

# Optional includes - comment them as you see fit
include ./makefile-utils/make.d/makefile_tester.make
include ./makefile-utils/make.d/docker.make

# Makefile configuration
.DEFAULT_GOAL := help
SHELL := /bin/bash

# Your own targets starts here
