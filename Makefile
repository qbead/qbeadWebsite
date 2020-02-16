html:
	./build.sh 
server: html
	cd build && python3 -m http.server
