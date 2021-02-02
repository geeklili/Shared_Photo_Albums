#!/bin/bash
. venv/bin/activate

daemon_start(){
	nohup python3 run.py &
	echo"Server started."
}

daemon_stop(){
	pid=`ps -ef | grep 'python3 run.py' | awk 'BEGIN{ ORS="," }{ print $2 }'`
	arr=(`echo ${pid} | tr ',' ' '`)
	for((i=0;i<=2;i++));
  do
  	echo ${arr[i]}
    kill -9 ${arr[i]}
    echo "Server killed."
  done

}

case "$1" in
	--start)
		daemon_start
		;;
	--stop)
		daemon_stop
		;;
	--restart)
		daemon_stop
		daemon_start
		;;
	*)
		echo"Usage: ./run.sh {start|stop|restart}"
		exit 1
esac
exit 0
