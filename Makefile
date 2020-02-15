publish:
	./build.sh 
	rm -rf /var/www/spinwearables/*
	cp -r build/* /var/www/spinwearables/
	chown :www-data -R /var/www/spinwearables/*
	chmod 751 -R /var/www/spinwearables/*
#	rm -rf 
#	curl "http://www.google.com/webmasters/sitemaps/ping?sitemap=https://www.engineeringday.com/sitemap.xml"
