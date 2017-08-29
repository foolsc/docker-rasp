FROM gumizy/rasp1.0

MAINTAINER gumizy guozhenyu688@gmail.com

#创建文件夹
RUN mkdir /usr/local/work

#复制文件到容器
COPY rasp-app.jar /usr/local/work
COPY sql-initialize.sql /usr/local/work
COPY rasp.sh /usr/local/work

RUN chmod 755 /usr/local/work/rasp.sh

VOLUME ["/var/lib/mysql"]

EXPOSE 22/tcp 80/tcp 60000/tcp

ENTRYPOINT ["/usr/local/work/rasp.sh"]

