class Dashing.Prtg extends Dashing.Widget

  ready: ->
    @animate()

  onData: (data) ->
    @animate()

  animate: ->
    node = $(@node)
    down = $(".down")
    acknowledged = $(".acknowledged")
    warning = $(".warning")
    unusual = $(".unusual")
    alerts = false
    if alerts == true
      alert = document.createElement('audio')
      alert.setAttribute 'src', 'http://soundbible.com/grab.php?id=1577&type=mp3'
      alert.load()    

    node.removeClass('prtg_down').removeClass('prtg_acknowledged').removeClass('prtg_warning')

    if down.length > 0
      node.addClass('prtg_down')
      if alerts == true 
        alert.play(); 
    if down.length == 0 && acknowledged.length > 0
      node.addClass('prtg_acknowledged') 
      if alerts == true 
        alert.pause();      
    if down.length == 0 && acknowledged.length == 0 && warning.length > 0
      node.addClass('prtg_warning')   
      if alerts == true 
        alert.pause(); 
    if down.length == 0 && acknowledged.length == 0 && warning.length > 0 && unusual.length > 0
      node.addClass('prtg_unusual')  
      if alerts == true 
        alert.pause();  