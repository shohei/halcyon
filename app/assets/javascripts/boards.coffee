# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#load").on 'change', ->
    f = @files[0]
    reader = new FileReader
    reader.onload = (e) ->
      window.component_contents = e.target.result
      return
    reader.readAsText f
    return

  insert_data = (name,components) ->
    $.ajax
      type: 'POST'
      url: '/boards/insert_data'
      data: 'board_data[name]='+name+'&board_data[components]=' + components
      success: (msg) ->
        console.log 'Data uploaded: ' + msg
        return
    return

  $("#open_modal_btn").on 'click', ->
    $(".modal").modal('show')
    return

  $('#save_btn').on 'click', ->
    window.board_name = $('#board_name').val()
    insert_data(window.board_name, window.component_contents)
    return

  $('button.up').on 'click', ->
    jogUp()
    return
  $('button.down').on 'click', ->
    jogDown()
    return
  $('button.left').on 'click', ->
    jogLeft()
    return
  $('button.right').on 'click', ->
    jogRight()
    return

  get_jog_width = ->
    width = $("input[name=jogWidth]:checked").val()
    return width
  jogUp = ->
    width = get_jog_width()
    newText = $('#monitor').val() + 'G1 Y'+width+'\n'
    $('#monitor').text(newText) 
    $('#monitor').scrollTop($('#monitor')[0].scrollHeight)
    return
  jogDown = ->
    width = get_jog_width()
    newText = $('#monitor').val() + 'G1 Y-'+width+'\n'
    $('#monitor').text(newText) 
    $('#monitor').scrollTop($('#monitor')[0].scrollHeight)
    return
  jogLeft = ->
    width = get_jog_width()
    newText = $('#monitor').val() + 'G1 X-'+width+'\n'
    $('#monitor').text(newText) 
    $('#monitor').scrollTop($('#monitor')[0].scrollHeight)
    return
  jogRight = ->
    width = get_jog_width()
    newText = $('#monitor').val() + 'G1 X'+width+'\n'
    $('#monitor').text(newText) 
    $('#monitor').scrollTop($('#monitor')[0].scrollHeight)
    return

  $(document).keydown (e) ->
    switch e.which
      when 37
        # left
        jogLeft();
      when 38
        # up
        jogUp();
      when 39
        # right
        jogRight();
      when 40
        # down
        jogDown();
      else
        return
      # exit this handler for other keys
    e.preventDefault()
    # prevent the default action (scroll / move caret)
    return
  
