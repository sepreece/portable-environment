
#=== start of automatically maintained lines (do not delete)===
# .bashrc, sourced by interactive non-login shells (also called by .bash_profile)
export PATH=/pear/bin:$PATH
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

# Load GDM-specific shell variables

if [ -x ~/gdmsetup ] ; then
	. ~/gdmsetup
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

SAFEPLACE=~/SafePlace
export SAFEPLACE

CDPATH=:~:; export CPDATH

#set -o trackall
set -o monitor
#set +o bgnice

/bin/stty susp ^z

EDITOR=/usr/bin/emacs
export EDITOR

set -o emacs
alias e="/usr/bin/emacs"

t ()
{
	MORE $*
}
typeset -fx t


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
{
	if [ ${PWD%*preece*} = $PWD ] ;
		then umask 2;
		else umask 22; fi
	/bin/echo PWD=$PWD\ 
}
typeset -fx um

alias logs='cd /home/y/libexec/yjava_tomcat/webapps/logs'
alias dsconf='cd /home/y/libexec/ygrid_gdm_*_server/datasetconf'

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

PATH=$HOME/pear/bin:$HOME/bin:/bin:/sbin:/home/y/bin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin
export PATH

alias phpunit='php -d include_path=.:~/pear/share/pear ~/pear/bin/phpunit'

#ulimit -s 262144

if [ -s $HOME/.env.local ] ; then
	. $HOME/.env.local
fi

#
#	This has to happen after .env.local has possibly changed SAFEPLACE...
#
if [ -d $SAFEPLACE ] ; then
   /usr/bin/find $SAFEPLACE \( -name '[pv].*' \) -mtime +14 -exec RM -f {} \;
fi

