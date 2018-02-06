#!/bin/bash

# installs some useful config files for git and vim
#----------------------------------------------------

CONFDIR=${HOME}/scripts/fresh_installation_useful_scripts

function overwrite_git {
    cp ${CONFDIR}/gitconfig.txt ~/.gitconfig
    sed -i -e "s/my_user_name/${name}/g" ${HOME}/.gitconfig
    sed -i -e "s/my_mail@my_domain.com/${email}/g" ${HOME}/.gitconfig
}

echo 'ctrl+C at any time to exit the script'

input_ok=0
while
    [[ $input_ok != 1 ]]
do
    read -p "Insert your name and surname: " name
    read -p "Insert your e-mail: " email
    read -p "You inserted '$name' and '$email'. Is this correct? <y/N> " prompt
    if [[ $prompt =~ [yY](es)* ]]; then
        input_ok=1
    fi
done

printf "\nWriting name.txt and email.txt in personal_config directory\n"
read -n 1 -s -r -p "Press any key to continue (ctrl+C to cancel)"; printf "\n"

echo $name > ${HOME}/scripts/personal_config/name.txt
echo $email > ${HOME}/scripts/personal_config/email.txt

#######

printf "\n"
if [ -f "${HOME}/.gitconfig" ]; then
    read -p "You already have a .gitconfig file. Do you want the socrob config file instead? <y/N>" prompt; printf "\n"
    if [[ $prompt =~ [yY](es)* ]]; then
        overwrite_git
    fi
else
    printf "\nOverwriting ~/.gitconfig\n"
    read -n 1 -s -r -p "Press any key to continue (ctrl+C to cancel)"
    overwrite_git
fi

#######

read -p "Do you want an awesome vim config file? <y/N>" prompt;
if [[ $prompt =~ [yY](es)* ]]; then
    mkdir ${HOME}/.cache/vim -p
    mkdir ${HOME}/.vim/colors -p
    cp ${CONFDIR}/wombat256mod.vim ${HOME}/.vim/colors/
    cp ${CONFDIR}/vimconfig.txt ${HOME}/.vimrc
fi

#######
printf "\n\nAll done! Sourcing bashrc... \n\n"
source ${HOME}/.bashrc
