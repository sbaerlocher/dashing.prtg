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
  
    node.removeClass('prtg_down').removeClass('prtg_acknowledged').removeClass('prtg_warning')

    if down.length > 0
      node.addClass('prtg_down')
    if down.length == 0 && acknowledged.length > 0 
      node.addClass('prtg_acknowledged')
    if down.length == 0 && acknowledged.length == 0 && warning.length > 0
      node.addClass('prtg_warning')   