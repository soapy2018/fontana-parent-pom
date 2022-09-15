## Fontana框架后端Maven父pom管理工程
# 1.1.0 update
1.1.0 针对spring boot 版本做了一次大升级，并且各个依赖小版本也相应做了升级

版本升级如下，不建议直接从1.0.5 升级到1.1.0 ，需要测试一个周期

```
<!-- 三大版本 -->
        <spring.boot.version>2.3.12.RELEASE</spring.boot.version>
        <spring.cloud.version>Hoxton.SR11</spring.cloud.version>
        <spring.cloud.alibaba.version>2.2.5.RELEASE</spring.cloud.alibaba.version>
        
        
        <!-- 1.0.26 -> 1.2.5 -->
        <druid.version>1.2.5</druid.version>

        <!-- 8.0.13 -> 8.0.23 -->
        <mysql.version>8.0.23</mysql.version>

        <commons-lang.version>2.6</commons-lang.version>
        <!-- 3.9 -> 3.12.0 -->
        <commons-lang3.version>3.12.0</commons-lang3.version>
        <!-- 2.6 -> 2.8.0 -->
        <commons-io.version>2.8.0</commons-io.version>
        <!-- add 1.15 -->
        <commons-codec.version>1.15</commons-codec.version>

        <!-- 1.9.0.RELEASE -> 1.9.1.RELEASE -->
        <swagger.version>1.9.1.RELEASE</swagger.version>

        <!-- 1.2.61 -> 1.2.75 -->
        <fastjson.version>1.2.75</fastjson.version>

        <!-- commons-collections 替换为 commons-collections4 -->
        <commons-collections4.version>4.4</commons-collections4.version>

        <!-- 3.3.0 -> 3.15.0 -->
        <java-jwt.version>3.15.0</java-jwt.version>

        <!-- 1.2.4 -> 1.3.0 -->
        <pagehelper.version>1.3.0</pagehelper.version>

        <mail.version>1.4.7</mail.version>

        <!-- 6.4.3 -> 6.16.0 -->
        <jasperreports.version>6.16.0</jasperreports.version>
        <jasperreports-fonts.version>1.0.0</jasperreports-fonts.version>

        <!-- 3.2.0 -> 3.4.1 -->
        <mybatis-plus-boot-starter.version>3.4.1</mybatis-plus-boot-starter.version>

        <!-- 1.12 -> 1.26 -->
        <tika-core.version>1.26</tika-core.version>

        <!-- 10.2.3 -> 10.12 -->
        <feign-core.version>10.12</feign-core.version>
        <feign-jackson.version>10.12</feign-jackson.version>

        <!-- 1.18.8 -> 1.18.20 -->
        <lombok.version>1.18.20</lombok.version>

        <!-- 4.2.2 -> 4.9.1 -->
        <!-- 防止冲突，写死对应 kotlin-stdlib 版本 -->
        <okhttp.version>4.9.1</okhttp.version>
        <kotlin-stdlib.version>1.4.10</kotlin-stdlib.version>
        
        <!-- 以下 supLink没有用到 ，没有测试兼容性 -->
        
        <feign-form-spring.version>3.8.0</feign-form-spring.version>
        <feign-form.version>3.8.0</feign-form.version>
        
        <!-- 7.4.2 -> 7.12.0 -->
        <elasticsearch-rest-high-level-client.version>7.12.0</elasticsearch-rest-high-level-client.version>
        <elasticsearch.version>7.12.0</elasticsearch.version>
        <!-- 4.1.2 -> 5.1.4 -->
        <aviator.version>5.1.4</aviator.version>
        <!--  2.1.6 -> 2.2.8 -->
        <easyexcel.version>2.2.8</easyexcel.version>
        
        <logstash-logback-encoder.version>5.3</logstash-logback-encoder.version>
        <spring-cloud-starter-kubernetes-all.version>1.1.6.RELEASE</spring-cloud-starter-kubernetes-all.version>
```
# 1.1.1 update

1.1.1 版本升级如下,新增依赖如下
```
        <!--老的毕竟还有在用的，先放着吧-->
        <dependency>
            <groupId>commons-collections</groupId>
            <artifactId>commons-collections</artifactId>
            <version>${commons-collections.version}</version>
        </dependency>
        <!--增加阿里threadLocal-->
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>transmittable-thread-local</artifactId>
            <version>${ali-transmittable-thread-local.version}</version>
        </dependency>
        <!--hutool工具类-->
        <dependency>
            <groupId>cn.hutool</groupId>
            <artifactId>hutool-all</artifactId>
            <version>${hutool.version}</version>
        </dependency>
        <dependency>
            <groupId>commons-httpclient</groupId>
            <artifactId>commons-httpclient</artifactId>
            <version>${commons-httpclient.version}</version>
		</dependency>
        <!-- 在Redis基础上的一个Java实用工具包 -->
        <dependency>
            <groupId>org.redisson</groupId>
            <artifactId>redisson-spring-boot-starter</artifactId>
            <version>${redisson-starter.version}</version>
        </dependency>
```
远程仓库从bluetron-release改成bluetron-releases，感觉这样跟bluetron-snapshots对称点

# 1.1.2 update

1.1.2 版本更新：调整三大版本，由于测试中发现版本问题导致feign client循环依赖问题
```
        <!-- 三大版本 -->
        <!-- 三大版本适配说明：https://github.com/alibaba/spring-cloud-alibaba/wiki/%E7%89%88%E6%9C%AC%E8%AF%B4%E6%98%8E-->
        <spring.boot.version>2.3.12.RELEASE</spring.boot.version>
        <spring.cloud.version>Hoxton.SR12</spring.cloud.version>
        <spring.cloud.alibaba.version>2.2.7.RELEASE</spring.cloud.alibaba.version>
```