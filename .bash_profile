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

# ------------------------------------------------------------
# Set color variables
# ------------------------------------------------------------
RED="\[\033[0;31m\]"
YELLOW="\[\033[1;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[1;34m\]"
PURPLE="\[\033[0;35m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"

# ------------------------------------------------------------
# Git branch in prompt.
# ------------------------------------------------------------
parse_git_branch() {
 while read -r branch; do
     [[ $branch = \** ]] && current_branch=${branch#* }
 done < <(git branch 2>/dev/null)

 [[ $current_branch ]] && printf ' [%s]' "$current_branch"
}

# ------------------------------------------------------------
# Set virtualenv
# ------------------------------------------------------------
function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV="${BLUE}[`basename \"$VIRTUAL_ENV\"`]${COLOR_NONE} "
  fi
}

# ------------------------------------------------------------
# Set Git branch
# ------------------------------------------------------------
function set_git_branch() {
  # Get the name of the branch.
  branch=$(parse_git_branch)
  # if not git then maybe mercurial
  if [ "$branch" == "" ]
  then
    branch=$(parse_hg_branch)
  fi

  # Set the final branch string.
  BRANCH="${PURPLE}${branch}${COLOR_NONE} "
}

# ------------------------------------------------------------
# Set Prompt Symbol
# ------------------------------------------------------------
function set_prompt_symbol () {
  if test $1 -eq 0 ; then
      PROMPT_SYMBOL="\$"
  else
      PROMPT_SYMBOL="${LIGHT_RED}\$${COLOR_NONE}"
  fi
}

# ------------------------------------------------------------
# Determine active Python virtualenv details.
# ------------------------------------------------------------
function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV="${BLUE}[`basename \"$VIRTUAL_ENV\"`]${COLOR_NONE} "
  fi
}

# ------------------------------------------------------------
# Set the full bash prompt.
# ------------------------------------------------------------
function set_bash_prompt () {
  # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
  # return value of the last command.
  set_prompt_symbol $?

  # Set the PYTHON_VIRTUALENV variable.
  set_virtualenv

  # Set the BRANCH variable.
  set_git_branch

  # Set the bash prompt variable.
  PS1="
${PYTHON_VIRTUALENV}${GREEN}\u@\h${COLOR_NONE}:${YELLOW}\w${COLOR_NONE}${BRANCH}
${PROMPT_SYMBOL} "
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=set_bash_prompt
