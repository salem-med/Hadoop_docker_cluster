FROM datanode:latest

RUN mkdir /opt/hdfs/namenode

ADD ./NameNode/hdfs-site.xml $HADOOP_HOME/etc/hadoop/

RUN hdfs namenode -format

CMD hdfs namenode
