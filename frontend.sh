
#*****************   Installing Nginx    *********************
echo "Installing Nginx"
dnf install nginx -y


#**********     Enable and start service       ***************
echo "Enable and start service "
systemctl enable nginx
systemctl start nginx

#******Copy expense config file to the right place....
echo "Copy expense config file to the right place...."
cp expense.conf /etc/nginx/default.d/expense.conf

 #Remove the old content
rm -rf /usr/share/nginx/html/*

#Download the frontend content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

#copy the content to the correct folder
cd /usr/share/nginx/html

#Unzipping the content in that folder
unzip /tmp/frontend.zip


systemctl restart nginx