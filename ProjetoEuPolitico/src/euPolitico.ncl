<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="nclApplicationMoonDo" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<region id="rgAplicacao" height="100%" width="100%" />
		</regionBase>	
		<descriptorBase>
			<descriptor id="dsAplicacao" focusIndex="0" region="rgAplicacao"/>
		</descriptorBase>
	</head>
	<body>
		<port id="pAplicacao" component="application"/>
		<media id="settings" type="application/x-ginga-settings">
			<property name="channel.keyCapture" value="true"/>
		</media>
		<media id="application" type="application/x-ginga-NCLua" src="EuPolitico.lua" descriptor="dsAplicacao"/>
		

	</body>
</ncl>
