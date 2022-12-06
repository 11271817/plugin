curl '54.161.224.184:8080/jnlpJars/jenkins-cli.jar' > jenkins-cli.jar
UPDATE_LIST=$( java -jar jenkins-cli.jar -s http://54.161.224.184:8080/ list-plugins | grep -e '$' | awk '{ print $1 }' ); 
if [ ! -z "${UPDATE_LIST}" ]; then 
    echo Updating Jenkins Plugins: ${UPDATE_LIST}; 
    java -jar jenkins-cli.jar -s http://54.161.224.184:8080/ install-plugin ${UPDATE_LIST};
    java -jar jenkins-cli.jar -s http://54.161.224.184:8080/ safe-restart;
fi
