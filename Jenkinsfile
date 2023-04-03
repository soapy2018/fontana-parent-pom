pipeline {
    agent any
    environment {
    //声明全局变量
        harborUser = 'admin'
        harborPasswd = 'Harbor12345'
        harbor_addr = '192.168.2.33:80'
        harbor_repo = 'repo'
    }
    stages {
        stage('拉取代码') {
           steps{
               checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: '3689b056-1c11-4a3d-89b9-fe3661f605a3', url: 'http://192.168.2.40:8929/gitlab-instance-9651917a/test.git']])
                echo '拉取成功'
           }
        }
        stage('通过maven构建项目') {
           steps{
               sh '/var/jenkins_home/maven/bin/mvn clean package -DskipTests'
                echo '构建成功'
           }
        }
        stage('通过Docker制作自定义镜像') {
           steps{
               sh '''mv ./target/*.jar ./docker/
docker build -t ${JOB_NAME}:${tag} ./docker/'''
                echo '镜像制造成功'
           }
        }
        stage('将自定义镜像推送到Harbor') {
           steps{
               sh '''docker login -u ${harborUser} -p ${harborPasswd} ${harbor_addr}
docker tag ${JOB_NAME}:${tag} ${harbor_addr}/${harbor_repo}/${JOB_NAME}:${tag}
docker push ${harbor_addr}/${harbor_repo}/${JOB_NAME}:${tag}'''
                echo '镜像推送成功'
           }
        }
        stage('Publish Over SSH通知目标服务器拉取镜像') {
           steps{
               sshPublisher(publishers: [sshPublisherDesc(configName: 'grab-test', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: "deploy.sh $harbor_addr $harbor_repo $JOB_NAME $tag $container_port $host_port", execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
                echo '镜像拉取成功'
           }
        }
    }
}