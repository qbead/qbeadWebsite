html:
	./build.sh $(match) 
local_test_server: todos html
	cd build && python3 -m http.server
todos:
	grep -r "<!--TODO:" content/ || true
	grep -r "<!--FIGURE:" content/ || true
	grep -r "<!--IMAGE:" content/ || true
	grep -r "<!--VIDEO:" content/ || true
	grep -r "<!--WIDGET:" content/ || true
