#=== start of automatically maintained lines (do not delete)===
# .bashrc, sourced by interactive non-login shells (also called by .bash_profile)

umask 022
#if [ "$PS1" != "" ]
#then
#	PS1="\h \t \w \$ "
#	  setenv ()  { export $1="$2"; }
#	unsetenv ()  { unset $*; }
#fi

#===   end of automatically maintained lines (do not delete)===

# per-user custom comands go here...
if shopt -q login_shell ; then
    stty stop undef
    stty start undef
fi
if [ -x ~/.dircolorsc ]; then
   eval "`dircolors -b ~/.dircolorsrc`"
fi

# Load GDM-specific aliases and variables

alias oldlogs='cd /home/y/libexec/yjava_tomcat/webapps/logs'
if [ -x /home/y/logs ]
then
    alias logs='cd /home/y/logs/ygrid*'
    if [ -d /home/y/logs/ygrid*server ]
    then
        alias logs='cd /home/y/logs/ygrid*server'
    fi
fi

alias godevbox='ssh -A $mydevbox'
alias goconsole='ssh -A $myconsole'
alias goacquisition='ssh -A $myacquisition'
alias goreplication='ssh -A $myreplication'
alias goretention='ssh -A $myretention'
alias gofdiserver='ssh -A $myfdiserver'
alias goloadproxy='ssh -A $myloadproxy'
alias gohadoopdocs='ssh -A $myhadoopdocs'
alias gostarling='ssh -A $starlingproc'
alias gostarlingproc='ssh -A $starlingproc'
alias gostarlingdev='ssh -A $starlingdev'
alias goprodconsole='ssh -A $prodconsole'

alias dfsdo='sudo -u dfsload'

if [ -x ~/bin/gdmsetup -a -d ~/gdm/src ] ; then
	. ~/bin/gdmsetup
	echo "Loaded gdmsetup"
fi


if [ -x "/bin/which" ]; then
   alias WHICH='/bin/which'
else
   alias WHICH='/usr/bin/which'
fi
alias GREP=`which grep`
alias SED=`WHICH sed`
alias HEAD=`WHICH head`
alias UNAME=`WHICH uname`
alias RM=`WHICH rm`
alias MORE=`WHICH more`

#	it's going to be a while before this is adequate...
#	basic path and prompt setup -- assumes PROMPTHEAD has been set

HOSTHEAD=`UNAME -n|SED 's/\..*$//'`; export HOSTHEAD
PROMPTHEAD=$HOSTHEAD; export PROMPTHEAD
if [ -n "$YROOT_NAME" ]; then
    PROMPTHEAD="$PROMPTHEAD[$YROOT_NAME]"; export PROMPTHEAD
fi

OS_NAME=`uname -s`
export OS_NAME

if [ $TERM != dumb ] ; then
	PROMPTHEAD="[7m$PROMPTHEAD [m"
else
	PROMPTHEAD="$PROMPTHEAD-> "
	/bin/stty -echo
	/bin/stty -onlcr
fi

export PROMPTHEAD

#	DO NOT set up full path until end, in case NFS outage makes
#	part of it unavailable (causing unbounded hang)

CDPATH=:~:; export CPDATH

#set -o trackall
set -o monitor
#set +o bgnice

/bin/stty susp ^z

if [ "$OS_NAME" == "Darwin" ]; then

    # On MacOS, use the local emacs
    EDITOR=/Applications/Emacs.app/Contents/MacOS/Emacs
    export EDITOR
    alias e='/Applications/Emacs.app/Contents/MacOS/Emacs "$@"'

    set -o emacs
else
    EDITOR=/usr/bin/emacs
    export EDITOR

    set -o emacs

    # Don't try to use X11 emacs when sudo-ed to somebody else - won't work
    # and don't try to use X11 emacs on a grid host - it takes way too long

    checkstring=`uname -a|grep "ygrid.yahoo.com"`
    if [ "$SUDO_USER" == "" ] ; then
        if [ -z "${checkstring}" ]; then
            alias e="/usr/bin/emacs"
        else
            alias e="/usr/bin/emacs -nw"
        fi
    else
        alias e="/usr/bin/emacs -nw -l ~preece/.emacs"
    fi
fi

t ()
{
	MORE $*
}
typeset -fx t

# copy environment to remote host
setup ()
{
	scp ~/.ba* ~/.emacs ~/.ackrc ~/.git* ~/.font* $1:
}
typeset -fx setup

rm ()
{
	RM -i $*
}
typeset -fx rm

clean ()
{
	RM -f .BAK* .CKP* \#* *~ .[a-zA-Z0-9]*~ nsform* jzip*
}
typeset -fx clean


um ()
{	if [ ${PWD%*preece*} = $PWD ] ;
		then umask 2;
		else umask 22; fi
	/bin/echo PWD=$PWD\ 
}
typeset -fx um


C ()
{
    shopt -u expand_aliases;
    cd $*; um; XX=`pwd`; PS1="$PROMPTHEAD`basename $XX`: "; export PS1
    shopt -s expand_aliases;
}
typeset -fx C

alias cd="C"

back ()
{
    C $OLDPWD
}
typeset -fx back

gobranch ()
{
    C ~/gdm/src/$*/GDM
    export WORKSPACE=`pwd`
}
typeset -fx gobranch
	
clear ()
{
	/usr/bin/tput clear
}
typeset -fx clear

late ()
{
	/bin/ls -lt $* | GREP "^[^d]" | HEAD -20
}
typeset -fx late

#		Now make our prompt happen
C $HOME

PATH=$HOME/devbin:$HOME/bin:/bin:/sbin:/home/y/bin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/share:$PATH
export PATH

export HADOOP_HOME=
export JAVA_HOME=/home/gs/java/jdk
export HADOOP_CONF_DIR=

PATH=$PATH:$HADOOP_HOME/bin



if [ -s $HOME/.env.local ] ; then
	. $HOME/.env.local
fi

