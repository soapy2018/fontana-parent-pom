## Fontana框架后端Maven父pom管理工程

# 1.1.2 update
1.1.2 版本更新：调整三大版本，由于测试中发现版本问题导致feign client循环依赖问题
```
        <!-- 三大版本 -->
        <!-- 三大版本适配说明：https://github.com/alibaba/spring-cloud-alibaba/wiki/%E7%89%88%E6%9C%AC%E8%AF%B4%E6%98%8E-->
        <spring.boot.version>2.3.12.RELEASE</spring.boot.version>
        <spring.cloud.version>Hoxton.SR12</spring.cloud.version>
        <spring.cloud.alibaba.version>2.2.7.RELEASE</spring.cloud.alibaba.version>
```