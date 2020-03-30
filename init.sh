# !bin/bash

# pre_init
sudo apt update;
sudo apt install python3.5;
sudo rm /usr/bin/python3;
sudo ln -s /usr/bin/python3.5 /usr/bin/python3; 
sudo pip3 install gunicorn;
sudo pip3 install django==2.1;

# init
sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
sudo gunicorn -c /home/box/web/etc/hello.py hello:wsgi_application &
sudo gunicorn -c /home/box/web/etc/django_conf.py ask.wsgi:application
