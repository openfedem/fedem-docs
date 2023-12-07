var url;
url = new String(window.location);
url = url.substr(0,7);
if (url == "http://")
	window.top.syncURL();
