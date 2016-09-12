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