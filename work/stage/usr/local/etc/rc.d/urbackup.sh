#!/bin/sh

# $FreeBSD$
#
# PROVIDE: urbackup
# REQUIRE: DAEMON
# KEYWORD: shutdown

# add the following line to /etc/rc.conf to enable the kms:
# kms_enable="YES"
. /etc/rc.subr

name=urbackup
rcvar=urbackup_enable
load_rc_config $name

: ${urbackup_enable:="YES"}

pidfile="/var/run/urbackup.pid"
command="/usr/local/sbin/urbackupclientbackend"

command_args="--daemon --config /usr/local/etc/urbackup/urbackup.conf --pidfile ${pidfile}"

PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin


run_rc_command "$1"
