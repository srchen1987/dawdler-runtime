export DAWDLER_BIN_PATH=$(cd `dirname $0`; pwd)
export MainClass=com.anywide.dawdler.server.bootstarp.Bootstrap
cd ..
export DAWDLER_BASE_PATH=$(cd `dirname $0`; pwd)
cd bin
vm_arguments="";
vm_arguments="-Xms2g -Xmx2g  -Xmn512m";
#vm_arguments="-Xms2g -Xmx2g  -Xmn512m -javaagent:/home/srchen/dawdler_server/dawdler_server1/bin/pinpoint-agent-2.2.2/pinpoint-bootstrap-2.2.2.jar -Dpinpoint.config=/home/srchen/dawdler_server/dawdler_server1/bin/pinpoint-agent-2.2.2/pinpoint.config -Dpinpoint.agentId=20210415_server  -Dpinpoint.applicationName=myserver";
if [ "$1" = "start" ]
then
#echo "start server\t$vm_arguments\t$DAWDLER_BASE_PATH"
java $vm_arguments -cp .:./*  com.anywide.dawdler.server.bootstarp.Bootstrap start >../logs/console.log 2>&1 &
elif [ "$1" = "run" ]
then
java $vm_arguments -cp .:./*  com.anywide.dawdler.server.bootstarp.Bootstrap run
elif [ "$1" = "stopnow" ]
then
echo "stop server\t$DAWDLER_BASE_PATH"
java $vm_arguments -cp .:./*  com.anywide.dawdler.server.bootstarp.Bootstrap stopnow
elif [ "$1" = "stop" ]
then
echo "stop server\t$DAWDLER_BASE_PATH"
java $vm_arguments -cp .:./*  com.anywide.dawdler.server.bootstarp.Bootstrap stop
else
echo "commands:"
echo   "run               Start dawdler in the current window"
echo   "start             Start dawdler in a separate window"
echo   "stop              Stop dawdler"
echo   "stopnow           Stop dawdler immediately"
fi

