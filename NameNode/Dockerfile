FROM datanode:latest

RUN mkdir /opt/hdfs/namenode

ADD ./NameNode/hdfs-site.xml $HADOOP_HOME/etc/hadoop/

RUN apt install curl -y
RUN curl -O https://dlcdn.apache.org/pig/pig-0.17.0/pig-0.17.0.tar.gz
RUN tar -xf pig-0.17.0.tar.gz
ENV PIG_HOME=/opt/pig-0.17.0
ENV PIG_CLASSPATH=$HADOOP_HOME/conf
ENV PATH="${PATH}:/opt/pig-0.17.0/bin"

RUN firewall-cmd --zone=public --add-port=9000/tcp --permanent
RUN firewall-cmd --reload

RUN hdfs namenode -format

CMD hdfs namenode
