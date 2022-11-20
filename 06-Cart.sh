curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip"
cd /home/roboshop
unzip /tmp/cart.zip
mv cart-main cart
cd cart
npm install
sed -i -e 's,REDIS_ENDPOINT,redis.shaileshdevops6.online,g' -e 's,CATALOGUE_ENDPOINT,catalogue.shaileshdevops6.online,g' /home/roboshop/cart/systemd.service
mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service
systemctl daemon-reload
systemctl start cart
systemctl enable cart