## init.pp for java + tomcat

class { 'java': }

tomcat::install { '/opt/tomcat':
  source_url => 'https://www.apache.org/dist/tomcat/tomcat-8/v8.0.39/bin/apache-tomcat-8.0.39.tar.gz'
}

tomcat::instance { 'default':
  catalina_home => '/opt/tomcat',
}

tomcat::war { 'sample.war':
  catalina_base => '/opt/tomcat',
  war_source    => 'http://localhost:8081/repository/releases/clases/Captcha/1.3/Captcha-1.3.war',
}
