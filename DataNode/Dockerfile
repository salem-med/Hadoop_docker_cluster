FROM ubuntu:latest

# ENV JDK_VER=16.0.1
ENV HADOOP_VER=3.3.4
# ENV JDK_TAR_NAME=jdk.tar.gz
ENV HADOOP_TAR_NAME=hadoop-3.3.4.tar.gz

RUN apt update
RUN apt install -y arp-scan python3

WORKDIR /opt

RUN apt install openjdk-8-jdk -y
ADD ./assets/${HADOOP_TAR_NAME} .

#ADD automatically untars
#to add java to the path

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
# ENV PATH=$PATH:$JAVA_HOME:$JAVA_HOME/bin

#to add Hadoop to the path
ENV HADOOP_HOME=/opt/hadoop-${HADOOP_VER}
ENV HADOOP_STREAMING_JAR=$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.3.4.jar
ENV PATH=$PATH:$HADOOP_HOME
ENV PATH=$PATH:$HADOOP_HOME/bin

RUN mkdir /opt/hdfs
RUN mkdir /opt/hdfs/datanode

ADD ./DataNode/hdfs-site.xml $HADOOP_HOME/etc/hadoop/
ADD ./config-files-base/hadoop-env.sh $HADOOP_HOME/etc/hadoop/
ADD ./config-files-base/core-site.xml $HADOOP_HOME/etc/hadoop/

CMD hdfs datanode

