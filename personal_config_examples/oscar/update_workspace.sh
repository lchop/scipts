#! /bin/bash

# personal config update workspace bash script
# add here all missing repos in ../main update_workspace.sh (your custom repos to update)

printf "\n\n::::::::::: custom repos:::::::::::\n\n"

# notice that the function "update_repo" is defined in ../update_workspace.sh
update_repo mbot_simulation origin kinetic
update_repo mbot_simulation_environments origin kinetic
update_repo isr_planning origin kinetic
update_repo mbot_natural_language_processing origin kinetic true
