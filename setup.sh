#!/bin/bash

setup_git() {
echo "setting up git"
echo "Enter your name:"
read name
echo "Enter your email:"
read email

git config --global user.name $name
git config --global user.email $email
git config --global init.defaultBranch main
git config --global credential.helper 'cache --timeout=36000'

}


setup_git()
