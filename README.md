第一步：
在项目目录下运行下面命令（与Dokerfile、jar、sql都在同一目录下）
sudo docker build -t rasp1.1 /usr/local/rasp/
会创建出新镜像rasp1.1
第二步：
运行下面命令来启动容器
sudo docker run -d -p 8082:80 -p 60001:60000 -p 8088:8888 --name rasp1.1 rasp1.1:latest
可通过宿主机的8082端口来访问程序"# docker-rasp" 
