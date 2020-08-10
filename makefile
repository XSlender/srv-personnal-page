###################################################
#
# Makefile to ease the stack managment
#
###################################################

-include .env
include ./make.d/colors.make
include ./make.d/strings.make

.DEFAULT_GOAL := help

THIS_FILE := $(lastword $(MAKEFILE_LIST))
WHOAMI := $$(whoami)

help:
	@printf "\n${YELLOW}Go to https://github.com/XSlender/srv-personnal-page for documentation.${RESET}\n\n"
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)
	@printf "\n"

up:		## starts up the container
	@printf "${GREEN}Waking ${PROJECT_NAME}...${RESET}\n"
	@printf "${GREEN}${DOTTED_LINE}${RESET}\n"
	@docker-compose --compatibility up -d
	@printf "\n"

down:		## shuts down the container.
	@printf "${YELLOW}shutting down ${PROJECT_NAME}...${RESET}\n"
	@printf "${YELLOW}${DOTTED_LINE}${RESET}\n"
	@docker-compose --compatibility down

build:		## builds the docker container
	@printf "${GREEN}Building ${PROJECT_NAME}...${RESET}\n"
	@printf "${GREEN}${DOTTED_LINE}${RESET}\n"
	@docker-compose --compatibility build

launch:		## launches the application
	@printf "${GREEN}Launching ${PROJECT_NAME}...${RESET}\n"
	@printf "${GREEN}${DOTTED_LINE}${RESET}\n"
	@docker-compose --compatibility up --build -d

update: 	## updating the full container.
	@printf "${GREEN}Updating ${PROJECT_NAME}...${RESET}\n"
	@printf "${GREEN}${DOTTED_LINE}${RESET}\n"
	@docker-compose --compatibility down
	@docker-compose --compatibility build --pull
	@docker-compose --compatibility up -d