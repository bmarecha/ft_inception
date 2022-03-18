if [[ $indexon = 1 ]]
then
	echo "Supp index auto"
	cp /root/nginx-host-conf-no-index /etc/nginx/sites-available/localhost
	indexon=0
else
	echo "Activate index auto"
	cp /root/nginx-host-conf /etc/nginx/sites-available/localhost
	indexon=1
fi

service nginx restart
