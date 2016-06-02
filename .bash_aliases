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

alias dsconf='cd /home/y/libexec/ygrid_gdm_*_server/datasetconf'
alias staging='gsdaqstgcon300.tan.ygrid.yahoo.com'

export mydevbox=warquickwhole.champ.corp.yahoo.com
export myconsole=opengdm3blue-n1.blue.ygrid.yahoo.com
export myreplication=opengdm3blue-n4.blue.ygrid.yahoo.com
export myacquisition=opengdm3blue-n3.blue.ygrid.yahoo.com
export myretention=opengdm3blue-n5.blue.ygrid.yahoo.com
export myfdiserver=openqe1blue-n2.blue.ygrid.yahoo.com
export myloadproxy=openqe1blue-n1.blue.ygrid.yahoo.com
export hadoopdocs=wiredrequired.corp.ne1.yahoo.com
export starlingproc=gsstar102.blue.ygrid.yahoo.com
export starlingdev=crunchedhunched.corp.ne1.yahoo.com

alias godevbox='ssh -A $mydevbox'
alias goconsole='ssh -A $myconsole'
alias goacquisition='ssh -A $myacquisition'
alias goreplication='ssh -A $myreplication'
alias goretention='ssh -A $myretention'
alias gofdiserver='ssh -A $myfdiserver'
alias goloadproxy='ssh -A $myloadproxy'
alias gohadoopdocs='ssh -A $myhadoopdocs'
alias gostarling='ssh -A $mystarlingproc'
alias gostarlingproc='ssh -A $mystarlingproc'
alias gostarlingdev='ssh -A $starlingdev'

alias dfsdo='sudo -u dfsload'

if [ -x ~/bin/gdmsetup ] ; then
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

PATH=$HOME/pear/bin:/bin/pear:$HOME/bin:/bin:/sbin:/home/y/bin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/share:$PATH
export PATH

export HADOOP_HOME=/home/gs/hadoop/current
export JAVA_HOME=/home/gs/java/jdk64/current
export HADOOP_CONF_DIR=/home/gs/conf/current

PATH=$PATH:$HADOOP_HOME/bin

if [ "$HOSTHEAD" != "measureking-lm" ] ; then
    if [ -x /usr/bin/kinit ] ; then
        if [ -x /homes/dfsload/dfsload.dev.headless.keytab ] ; then
            kinit -k -t /homes/dfsload/dfsload.dev.headless.keytab dfsload@DEV.YGRID.YAHOO.COM
        fi
    fi
    if [ -x ~dfsload ] ; then
        if [ -x ~dfsload/dfsloadkinit.sh ] ; then
            sudo -u dfsload ~dfsload/dfsloadkinit.sh
        fi
    fi
fi

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

