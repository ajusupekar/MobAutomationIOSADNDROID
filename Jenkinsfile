pipeline {
  agent any
  tools {
      jdk "JAVA_HOME"
  }
  stages {
    stage('Run functional test cases') {
      steps {
       bat "mvn -f MobAutomation-Project/pom.xml clean install -DjenkinsBrowser=${params.device} -Dcucumber.options=\"--tags ${params.tagName}\""
      }
    }
    stage('Generate Cucmber Reports') {
                steps {
                    cucumber buildStatus:"SUCCESS",
                            fileIncludePattern:"**/cucumber.json",
                            jsonReportDirectory:'Menta-MobAutomation-Project/target'
                }
            }
  }
}