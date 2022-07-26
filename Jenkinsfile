pipeline {
  agent any
  tools {
      jdk "JAVA_HOME"
  }
  stages {
    stage('Run functional test cases') {
      steps {
       sh "mvn -f /pom.xml clean install -DjenkinsBrowser=${params.device} -Dcucumber.options=\"--tags ${params.tagName}\""
      }
    }
  }
}