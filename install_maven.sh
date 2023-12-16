# Download the latest maven binary from the official website
wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz -O maven.tar.gz

# Extract the maven binary to /usr/local/maven
tar -zxvf maven.tar.gz &&
rm -rf maven.tar.gz

# Set the MAVEN_HOME and PATH environment variables
echo;
echo "export MAVEN_HOME=~/apache-maven-3.9.6" >> ~/.bashrc
echo "export PATH=\$PATH:\$MAVEN_HOME/bin" >> ~/.bashrc

# Reload the .bashrc file
source ~/.bashrc

# Verify the maven installation
mvn -v
