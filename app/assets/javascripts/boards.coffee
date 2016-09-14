# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#load").on 'change', ->
    f = @files[0]
    reader = new FileReader
    reader.onload = (e) ->
      window.place_contents = e.target.result
      return
    reader.readAsText f
    return

  insert_data = (name,places) ->
    $.ajax
      type: 'POST'
      url: '/boards/insert_data'
      data: 'board_data[name]='+name+'&board_data[places]=' + places
      success: (msg) ->
        console.log 'Data uploaded: ' + msg
        return
    return

  $("#open_modal_btn").on 'click', ->
    $(".modal").modal('show')
    return

  $('#save_btn').on 'click', ->
    window.board_name = $('#board_name').val()
    insert_data(window.board_name, window.place_contents)
    return

  $('button.up').on 'click', ->
    jogUp()
  $('button.down').on 'click', ->
    jogDown()
  $('button.left').on 'click', ->
    jogLeft()
  $('button.right').on 'click', ->
    jogRight()

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
    e.preventDefault()
    return
  
  get_mode = ->
    mode = $("input[name=modeSelect]:checked").val()
    return mode

  $('input[name=modeSelect]').click ->
    if $('input:radio[name=modeSelect]:checked').val() == 'fixed'
      console.log 'fixed'
    else if $('input:radio[name=modeSelect]:checked').val() == 'flexible'
      console.log 'flexible'
    return

  # $("#fileinput_footprint").on 'change', ->
  #   f = @files[0]
  #   reader = new FileReader
  #   reader.onload = (e) ->
  #     window.place_contents = e.target.result
  #     return
  #   reader.readAsText f
  #   return

  # $('#load_footprint').on 'click', ->
  #   upload_footprint()
  #   return

  # upload_footprint = (footprint_data) ->
  #   $.ajax
  #     type: 'POST'
  #     url: '/boards/load_footprint'
  #     data: 'footprint_data'+ footprint_data
  #     success: (msg) ->
  #       console.log 'Data uploaded: ' + msg
  #       return
  #   return








