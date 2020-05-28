html:
	./build.sh 
local_test_server: todos html
	cd build && python3 -m http.server
todos:
	grep -r "<!--TODO:" -a1 content/
