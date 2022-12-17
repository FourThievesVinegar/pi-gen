on_chroot <<EOF
	git clone https://github.com/FourThievesVinegar/solderless-microlab "/home/${FIRST_USER_NAME}/solderless-microlab"
	chown "${FIRST_USER_NAME}" -R "/home/${FIRST_USER_NAME}/solderless-microlab"
	cd "/home/${FIRST_USER_NAME}/solderless-microlab/gui"
	npm install
	npm run build
	cp -r ./build/* /var/www/html
	echo "FallbackResource /index.html" >> /etc/apache2/apache2.conf
	cd "/home/${FIRST_USER_NAME}/solderless-microlab/backend"
	virtualenv -p python3 env
  source env/bin/activate
  pip install -r requirements.txt
EOF
