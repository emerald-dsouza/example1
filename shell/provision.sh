apt-get update
apt-get install -y wget openjdk-8-jdk openjdk-8-jre unzip
apt-get install -y maven
wget http://download.java.net/glassfish/4.1.2/release/glassfish-4.1.2.zip
unzip glassfish-4.1.2.zip
chown -R vagrant:vagrant /home/vagrant/glassfish4
cat <<EOT >> /etc/systemd/system/glassfish.service
[Unit]
Description = GlassFish Server v4.1
After = syslog.target network.target

[Service]
User=vagrant
ExecStart = /usr/bin/java -jar /home/vagrant/glassfish4/glassfish/lib/client/appserver-cli.jar start-domain
ExecStop = /usr/bin/java -jar /home/vagrant/glassfish4/glassfish/lib/client/appserver-cli.jar stop-domain
ExecReload = /usr/bin/java -jar /home/vagrant/glassfish4/glassfish/lib/client/appserver-cli.jar restart-domain
Type = forking

[Install]
WantedBy = multi-user.target
EOT
systemctl enable glassfish.service
systemctl start glassfish.service
cat <<EOT >> /home/vagrant/.bashrc
export PATH=$PATH:/home/vagrant/glassfish4/bin
EOT
