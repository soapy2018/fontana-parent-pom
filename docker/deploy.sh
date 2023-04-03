#!/bin/bash
set -x
harbor_addr=$1
harbor_repo=$2
project=$3
version=$4
container_port=$5
host_port=$6

imageName=$harbor_addr/$harbor_repo/$project:$version

echo $imageName

containerId=`docker ps -a | grep ${project} | awk '{print $1}'`

echo $containerId

if [ "$containerId" != "" ] ; then
    docker stop $containerId
    docker rm $containerId
    echo "Delete Container Success"
fi

tag=`docker images | grep ${project} | awk '{print $2}'`

echo $tag

if [[ "$tag" = "$version" ]] ; then
    docker rmi -f $imageName
    echo "Delete Image Success"
fi

docker login -u admin -p Harbor12345 $harbor_addr

docker pull $imageName

docker run -d -p $host_port:$container_port --name $project $imageName

echo "Start Container Success"
echo $project_name
