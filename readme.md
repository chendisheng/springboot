1. 执行数据脚本数据库脚本 cds.sql

2. 部分配置信息在  application.yml 文件中
   
     profiles:
       active: test  // 指定采用不同配置文件   如 test 采用 application-test.yml
       
3. 数据库配置信息在 application-test.yml 和  application-dev.yml  
   中 只会采用一个 
   
4.  页面采用freemaker作为模板 ， 语法和html类似   ，也可以用html

5. 服务健康检查地址为 http://127.0.0.1:8080/cdstest/info

6. 数据表信息页面 
   地址为:  http://localhost:8081/html/user/list
   
7. 用到bootstrap3 前端框架  

8. resource 目录下         
   application 为开头的文件以外的配置文件暂时用不到
   
   resource/static 子目录放静态资源文件 js，css等 
   resource/templates 子目录放前端页面文件 html，ftl等

   
       
