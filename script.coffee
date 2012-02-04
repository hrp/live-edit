$(document).ready () ->
  
  script=document.createElement('script')
  script.src='http://ejohn.org/files/jsdiff.js'
  document.getElementsByTagName('head')[0].appendChild(script)
  
  container = 'iscream4icecream'
  containerId = '#' + container
  
  grabText = () ->
    $('body *').not($(containerId)).not($(containerId).find('*')).not($('script')).text()
  
  document.designMode = 'on'
  store = grabText()
  
  style = 'position: absolute; top: 4px; right: 4px; width: 300px; background-color: #ddf;'
  $('body').append('<div id="' + container + '" style="' + style + '"><div id="rockyroad" style="text-align: right;">:)</div><div id="icecreamcone" style="width: 300px;"></div></div>')
  $('#rockyroad').on 'click', (e) ->
    $('#icecreamcone').slideToggle()
    
  document.onkeyup = (e) ->
    newBody = grabText()
    diff = diffString store, newBody
    $(containerId + ' #icecreamcone').html diff
    console.log store, newBody, diff
    
addIEPlaceholderText = () ->