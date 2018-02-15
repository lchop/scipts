#! /bin/bash

# personal config update workspace bash script
# add here all missing repos in ../main update_workspace.sh (your custom repos to update)

printf "\n\n --- updating custom repos ---\n\n"

printf "\n\n --- mbot_simulation ---\n\n"
update_repo mbot_simulation origin kinetic # notice that the function "update_repo" is defined in ../update_workspace.sh

printf "\n\n --- mbot_simulation_environments ---\n\n"
update_repo mbot_simulation_environments origin kinetic

printf "\n\n --- isr_planning ---\n\n"
update_repo isr_planning origin kinetic
