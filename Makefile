html:
	./build.sh 
local_test_server: html
	cd build && python3 -m http.server
