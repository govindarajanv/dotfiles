#!/bin/bash

# ------------------------------------------------------------
# Get the aliases and functions
# ------------------------------------------------------------
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# ------------------------------------------------------------
# User specific environment and startup programs
# ------------------------------------------------------------

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

# ------------------------------------------------------------
# Language specific settings
# ------------------------------------------------------------
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.10.0.9-0.el7_9.x86_64

# ------------------------------------------------------------
# Set default editor
# ------------------------------------------------------------
EDITOR=vim

# Load our dotfiles like ~/.bash_prompt, etc…
#   ~/.extra can be used for settings you don’t want to commit,
   
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file
