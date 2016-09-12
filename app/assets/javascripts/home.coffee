$ ->
  $("#load").on 'change', ->
    f = @files[0]
    reader = new FileReader
    reader.onload = (e) ->
      contents = e.target.result
      # insert_data(contents)
      return

    reader.readAsText f
    return

  insert_data = (text) ->
  	$.ajax
      type: 'POST'
      url: '/home/insert_data'
      data: 'board_data[name]=Hoge&board_data[components]=' + text
      success: (msg) ->
        console.log 'Data uploaded: ' + msg
        return
  	return

