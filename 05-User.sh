curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y

curl -s -L -o /tmp/user.zip "https://github.com/roboshop-devops-project/user/archive/main.zip"
cd /home/roboshop
unzip /tmp/user.zip
mv user-main user
cd /home/roboshop/user
npm install

sed -i -e 's,REDIS_ENDPOINT,user.shaileshdevopa6.online,g' -e 's,MONGO_ENDPOINT,mango.shaileshdevops6.online,g' /home/roboshop/user/systemd.service

mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service
systemctl daemon-reload
systemctl restart user
systemctl enable user