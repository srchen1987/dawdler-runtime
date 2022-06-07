#!/bin/bash
DAWDLER_BIN_PATH=$(cd `dirname $0`; pwd)
BOOTSTRAP="dawdler.server/com.anywide.dawdler.server.bootstarp.Bootstrap";
cd ..
DAWDLER_BASE_PATH=$(cd `dirname $0`; pwd)
cd bin
vm_arguments="-Xms2g -Xmx2g -Xmn512m";

java_opts="--add-opens=java.base/java.nio=dawdler.core --add-opens=java.base/java.lang=cglib  --add-opens=java.base/jdk.internal.loader=dawdler.server --add-opens=java.base/jdk.internal.misc=dawdler.core  --add-opens=java.base/jdk.internal.perf=dawdler.server  --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.lang=kryo";

#vm_arguments="-Xms2g -Xmx2g  -Xmn512m -javaagent:/home/srchen/dawdler_server/dawdler_server1/bin/pinpoint-agent-2.2.2/pinpoint-bootstrap-2.2.2.jar -Dpinpoint.config=/home/srchen/dawdler_server/dawdler_server1/bin/pinpoint-agent-2.2.2/pinpoint.config -Dpinpoint.agentId=20210415_server  -Dpinpoint.applicationName=myserver";
vm_arguments="$vm_arguments -DDAWDLER_BASE_PATH=$DAWDLER_BASE_PATH -DDAWDLER_BIN_PATH=$DAWDLER_BIN_PATH";
_RUNJAVA="java $vm_arguments $java_opts -p . -cp . -m  $BOOTSTRAP";
if [ "$1" = "start" ]
then
$_RUNJAVA start >../logs/console.log 2>&1 &
elif [ "$1" = "run" ]
then
$_RUNJAVA run
elif [ "$1" = "stopnow" ]
then
echo "stop server $DAWDLER_BASE_PATH"
$_RUNJAVA stopnow
elif [ "$1" = "stop" ]
then
echo "stop server $DAWDLER_BASE_PATH"
$_RUNJAVA stop
else
echo "commands:"
echo   "run               Start dawdler in the current window"
echo   "start             Start dawdler in a separate window"
echo   "stop              Stop dawdler"
echo   "stopnow           Stop dawdler immediately"
fi

