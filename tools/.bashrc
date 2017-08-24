# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias f='cd ..'
alias ff='cd ..'
alias l='ls'
alias grpe='grep'
alias sl='ls'
alias xpwd='pwd | xclip'
alias sktcm='cd /home/shyun/ssd/skt/cm50g/skt_cm50g'


########## GO DIRECTORY #############
alias atlas='cd /home/shyun/ssd/skt/atlas'

######### TOOLCHAIN PATH ###############
export TOOLCHAIN_PATH_ARMV7=/opt/armv7/codesourcery/bin
export TOOLCHAIN_PATH_ARM_2014_05_29=/opt/arm-2014.05-29/bin
export TOOLCHAIN_PATH_LINARO_4_9=/opt/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin
export TOOLCHAIN_PATH_LINARO_5_3=/opt/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin
export TOOLCHAIN_PATH_LINARO_6_2_1=/opt/gcc-linaro-6.2.1-2016.11-x86_64_arm-linux-gnueabihf/bin
export TOOLCHAIN_ARM_ALTERA=/home/shyun/ssd/altera/15.0/embedded/host_tools/mentor/gnu/arm/baremetal/bin
export TOOLCHAIN_ARM_ALTERA_INCLUDE=/home/shyun/ssd/altera/15.0/embedded/embeddedsw/socfpga/prebuilt_images/kernel_headers

######### PROJECT TOOLCHAIN ############
export PROJECT_SKT_CC=$TOOLCHAIN_PATH_LINARO_4_9/arm-linux-gnueabihf-
export PROJECT_TOP_CC=$TOOLCHAIN_PATH_ARMV7/arm-none-linux-gnueabi-

export CROSS_COMPILE=$PROJECT_SKT_CC

######### EXPORTS ######################
export ARCH=arm

######### EXPORTS ######################
export USB_DEV=/dev/sdc1
export ALTERAOCLSDKROOT="/home/shyun/altera/16.1/hld"
export ALTERA_16_1=/home/shyun/altera/16.1/embedded
export QSYS_ROOTDIR="/home/shyun/altera/16.1/quartus/sopc_builder/bin"
export PATH=$ALTERA_16_1:$TOOLCHAIN_ARM_ALTERA_INCLUDE:$TOOLCHAIN_PATH_LINARO_4_9:$PATH
