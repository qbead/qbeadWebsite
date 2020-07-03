html:
	./build.sh $(match) 
local_test_server: todos html
	cd build && python3 -m http.server
todos:
	grep -r "<!--TODO:" content/
	grep -r "<!--FIGURE:" content/
	grep -r "<!--IMAGE:" content/
	grep -r "<!--VIDEO:" content/
	grep -r "<!--WIDGET:" content/
