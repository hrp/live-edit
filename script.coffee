$(document).ready () ->
	
	script=document.createElement('script')
	script.src='http://ejohn.org/files/jsdiff.js'
	document.getElementsByTagName('head')[0].appendChild(script)
	
	style = document.createElement('style')
	rules = document.createTextNode 'ins {background-color: #ced;} del {background-color: #ecd;}'
	style.type = 'text/css'
	style.appendChild(rules)
	document.getElementsByTagName('head')[0].appendChild(style)
	
	container= 'iscream4icecream'
	containerId = '#' + container

	grabText = (obj=$('body')) ->
		clonedTree = obj.clone().find('script').remove().end()
		clonedTree.find(containerId).remove().end().text()

	document.designMode = 'on'
	store = grabText()

	bling = 'position: absolute; top: 4px; right: 4px; width: 300px; background-color: #ddf; ins { color: green; }'
	$('body').append('<div id="' + container + '" style="' + bling + '"><div id="rockyroad" style="text-align: right;">It\'s alive! :)</div><div id="icecreamcone" style="width: 300px;"></div></div>')
	
	$('#rockyroad').on 'click', (e) ->
		$('#icecreamcone').slideToggle()
	 
	document.onkeyup = (e) ->
		$('#icecreamcone').slideUp()
		newBody = grabText()
		diff = diffString store, newBody
		$(containerId + ' #icecreamcone').html diff
		if $('#icecreamcone').find('ins, del').length > 0
			$('#rockyroad').css('backgroundColor', '#fdd')
