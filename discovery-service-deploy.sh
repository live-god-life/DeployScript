#!/bin/sh


#실행중 도커 컨테이너가 있는경우 STOP
service_name='discovery-service'
docker_container=`docker ps -aq -f name=${service_name} | wc -l`

echo "==="${service_name}" docker container count:"${docker_container}"==="

if [ $docker_container != 0 ]; then
        echo "===docker container stop==="
        docker stop ${service_name}
        echo "===docker container remove==="
        docker rm ${service_name}
fi

echo "===docker new container run==="
docker run -d \
	-e TZ=Asia/Seoul \
        -p 8761:8761 \
        --name ${service_name} onezo/god-life-${service_name}
