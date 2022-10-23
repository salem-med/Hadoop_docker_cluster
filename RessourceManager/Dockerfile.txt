FROM namenode:latest

RUN mkdir /opt/app
RUN mkdir /opt/yarn/local
RUN /opt/yarn/log

ADD ./RessourceManager/mapred-site.xml $HADOOP_HOME/etc/hadoop/
ADD ./RessourceManager/yarn-site.xml $HADOOP_HOME/etc/hadoop/

