#!/bin/bash
DAWDLER_BIN_PATH=$(cd `dirname $0`; pwd)
BOOTSTRAP="com.anywide.dawdler.server.bootstarp.Bootstrap";
cd ..
DAWDLER_BASE_PATH=$(cd `dirname $0`; pwd)
cd bin
vm_arguments="-Xms2g -Xmx2g -Xmn512m";

#vm_arguments="-Xms2g -Xmx2g  -Xmn512m -javaagent:/home/srchen/dawdler_server/dawdler_server1/bin/pinpoint-agent-2.2.2/pinpoint-bootstrap-2.2.2.jar -Dpinpoint.config=/home/srchen/dawdler_server/dawdler_server1/bin/pinpoint-agent-2.2.2/pinpoint.config -Dpinpoint.agentId=20210415_server  -Dpinpoint.applicationName=myserver";
vm_arguments="$vm_arguments -DDAWDLER_BASE_PATH=$DAWDLER_BASE_PATH -DDAWDLER_BIN_PATH=$DAWDLER_BIN_PATH";
_RUNJAVA="java $vm_arguments  -cp .:./*  $BOOTSTRAP";
if [ "$1" = "start" ]
then
$_RUNJAVA start >../logs/console.log 2>&1 &
elif [ "$1" = "run" ]
then
$_RUNJAVA run
elif [ "$1" = "stopnow" ]
then
echo "stop server\t$DAWDLER_BASE_PATH"
$_RUNJAVA stopnow
elif [ "$1" = "stop" ]
then
echo "stop server\t$DAWDLER_BASE_PATH"
$_RUNJAVA stop
else
echo "commands:"
echo   "run               Start dawdler in the current window"
echo   "start             Start dawdler in a separate window"
echo   "stop              Stop dawdler"
echo   "stopnow           Stop dawdler immediately"
fi

