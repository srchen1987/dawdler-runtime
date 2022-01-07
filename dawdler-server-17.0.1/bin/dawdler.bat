@echo off
set vm_arguments=-Xms1g -Xmx1g -Xmn512m 
set java_opts=--add-opens=java.base/java.nio=dawdler.core --add-opens=java.base/java.lang=cglib  --add-opens=java.base/jdk.internal.loader=dawdler.server --add-opens=java.base/jdk.internal.misc=dawdler.core  --add-opens=java.base/jdk.internal.perf=dawdler.server  --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.lang=kryo

BOOTSTRAP="dawdler.server/com.anywide.dawdler.server.bootstarp.Bootstrap";
set "DAWDLER_BIN_PATH=%cd%"
cd ..
set "DAWDLER_BASE_PATH=%cd%"
set vm_arguments="%vm_arguments% -DDAWDLER_BASE_PATH=%DAWDLER_BASE_PATH% -DDAWDLER_BIN_PATH=%DAWDLER_BIN_PATH%"
set _RUNJAVA="java %vm_arguments% %java_opts% -p . -cp . -m  %BOOTSTRAP%"

cd bin
if ""%1"" == """" goto doHelp
if ""%1"" == ""run"" goto doRun
if ""%1"" == ""start"" goto doStart
if ""%1"" == ""stop"" goto doStop
if ""%1"" == ""stopnow"" goto doStopNow
:doStart
if "%TITLE%" == "" set TITLE=dawdler
set _EXECJAVA=start "%TITLE%" %_RUNJAVA% start
goto execCmd
:doRun
set _EXECJAVA= %_RUNJAVA% run
goto execCmd
:doStop
set _EXECJAVA= %_RUNJAVA% stop
goto execCmd
:doStopNow
set _EXECJAVA= %_RUNJAVA% stopnow
goto execCmd
:execCmd
%_EXECJAVA%
goto end
:doHelp
echo Usage:  dawdler ( commands ... )
echo commands:
echo   run               Start dawdler in the current window
echo   start             Start dawdler in a separate window
echo   stop              Stop dawdler
echo   stopnow           Stop dawdler immediately
goto end
:end
