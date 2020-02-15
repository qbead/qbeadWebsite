html:
	./build.sh 
server:
	cd build && python3 -m http.server
