pipeline {
  agent any
  tools {
      jdk "JAVA_HOME"
      maven "Maven"
  }
  stages {
    stage('Run functional test cases') {
      steps {
       sh "mvn -Dmaven.repo.local=/Users/bnt/.m2/repository clean install -DjenkinsBrowser=${params.device} -Dcucumber.options=\"--tags ${params.tagName}\""
      }
    }
  }
}