# dawdler-runtime

dawdler运行环境

## zookeeper

zookeeper直接启动即可,进入bin目录,执行 `sh zkServer.sh start`  启动zookeeper.

## dawdler-server

### dawdler服务器结构说明

        --bin 存放dawdler启动的jar包与脚本.

        --conf dawdler的配置信息,server-conf是服务器配置,datasources数据源配置.

        --deploys 部署dawdler的项目,如写了一个 user模块,admin模块,那下面就是user目录,admin目录,这与tomcat的webapps很像,更像jboss/WildFly的deploy的概念.每个目录的资源是独立使用的,包括类加载器.

        --lib 这里面的jar包是所有deploys下面的模块项目通用的,比如mysql驱动,数据库连接池等等相关的jar包 可以放到这里.

        --logs 存放日志

### 启动dawdler

进入dawdler的bin目录,通过 `sh dawdler.sh run` 启动(win环境`dawdler.bat` linux或mac环境`sh dawdler.sh`).

    运行`sh dawdler.sh`会有以下输出

        commands:
        run               Start dawdler in the current window 在当前窗口启动dawdler

        start             Start dawdler in a separate window 在后台启动dawdler 

        stop              Stop dawdler 停止dawdler(关闭dawdler之前会拒绝所有的请求,同时等待处理完客户端的请求之后停止服务器)

        stopnow           Stop dawdler immediately 立刻停止dawdler,如果客户端有请求为处理完会收到一个强制停止的异常
