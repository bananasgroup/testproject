export project_server_dir=$(pwd)

echo project_server_dir

tar xjvf testproject.tar.bz2 
ps -ef | grep "testproject.jar" | awk '{print $2}' | xargs kill

if [ ! -e 'jdk-11.0.7+10' ]
 then tar xjvf jdk-11.0.7+10.tar.bz2
 else echo 'jdk-11.0.7+10 already existed'
fi

cd ../jdk-11.0.7+10/bin
./java -Xmx4G -Xms4G  -Dstartcrawler=true -jar  -DHAZELCAST_CLUSTER_IPS=localhost  -Dconfig=$project_server_dir/web.properties -Ds3=$project_server_dir/s3.properties -Dwebdir=$project_server_dir/web/hdcapweb/ -Dlogdbconfig=$project_server_dir/logdbconfig.properties -Ddbconfig=$project_server_dir/dbconfig.properties -Ddbshinobimailconfig=$project_server_dir/dbshinobimailconfig.properties -Dcustomconfig=$project_server_dir/config.properties -Dorg.owasp.esapi.resources=$project_server_dir/web -Dloggerlevel=TRACE -DexcelPath=/home/huong/Projects/ -DSTARTWEBSOCKETSERVER=true -DSOCKETSERVERHOST=localhost -DSOCKETSERVERPORT=8090 -DIS_DEV_MODE=true -Ddomain=LOCALHOST ../../testproject.jar &
