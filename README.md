* jdk-8u221-windows-x64.exe<br>
* ideaIU-2019.2.3.exe<br>
* Git-2.23.0-64-bit.exe<br>
* mysql-installer-community-5.7.27.0.msi<br>
* redis

## 源码下载
```
git clone https://git.imooc.com/coding-474/jiawawiki.git
会配置ssh的，可以用ssh:
git clone ssh://git@git.imooc.com:80/coding-474/jiawawiki.git
```
* 数据库初始化脚本all.sql


## 项目初始化
* 需要本地安装好idea, nodejs，jdk1.8, mysql8.0/5.7, navicat（数据库可视化工具）
* 将下载好的源码，用idea打开
* 刷新maven依赖
```
cd web
npm install
```
## 项目启动
* 启动服务端：WikiApplication
* 启动前端网站：web\package.json

## 页面访问
* 网站地址: http://localhost:8080<br>
  初始用户名密码：test/test



## 个人记录

1、解压缩文件

2、idea打开文件项目

3、初始化all.sql文件（Mysql脚本，后期改为pgsql脚本）

4、