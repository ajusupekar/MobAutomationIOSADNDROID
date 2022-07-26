pipeline {
  agent any
  tools {
      jdk "JAVA_HOME"
  }
  stages {
    stage('Run functional test cases') {
      steps {
       sh "mvn clean install -DjenkinsBrowser=${params.device} -Dcucumber.options=\"--tags ${params.tagName}\""
      }
    }
  }
}