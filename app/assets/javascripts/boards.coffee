$ ->
# ------------------------------------------------------------------------
# event handler
# ------------------------------------------------------------------------

  $("#load").on 'change', ->
    f = @files[0]
    reader = new FileReader
    reader.onload = (e) ->
      window.place_contents = e.target.result
      return
    reader.readAsText f
    return

  $("#open_modal_btn").on 'click', ->
    $(".modal").modal('show')
    return

  $('#save_btn').on 'click', ->
    $(".modal").modal('toggle')
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

  $('input[name=modeSelect]').click ->
    if $('input:radio[name=modeSelect]:checked').val() == 'fixed'
      console.log 'fixed'
    else if $('input:radio[name=modeSelect]:checked').val() == 'flexible'
      console.log 'flexible'
    return

  $('#download_svg').click 'on', ->
    encode_as_img_and_link()
    return

  $(".import_footprint_btn").on "click", ->
    ajaxStart()
    return
  $(".update_picks_btn").on "click", ->
    ajaxStart()
    return

  $('#connect_device').on "click", (e) ->
    e.preventDefault()
    $.ajax 
      method: 'GET'
      url: 'http://localhost:8005/echeck/'
      success: (msg) ->
        console.log 'Connection tried' + msg
        return
    return

  $('#connect_emulator').on "click", (e) ->
    e.preventDefault()
    $.ajax 
      method: 'GET'
      url: 'http://localhost:8005/start/'
      success: (msg) ->
        console.log 'Connected to emulator'
        return
    return

  $('#reset_connection').on "click", (e) ->
    e.preventDefault()
    $.ajax 
      method: 'GET'
      url: 'http://localhost:8005/reset/'
      success: (msg) ->
        console.log 'Reset device '
        return
    return
# ------------------------------------------------------------------------
# function definition
# ------------------------------------------------------------------------
  ajaxStart = ->
    $("body").addClass("loading")
    return
  ajaxStop = ->
    $("body").removeClass("loading")
    return

  insert_data = (name,places) ->
    ajaxStart()
    $.ajax
      type: 'POST'
      url: '/boards/insert_data'
      data: 'board_data[name]='+name+'&board_data[places]=' + places
      success: (msg) ->
        console.log 'Data uploaded: ' + msg
        ajaxStop()
        return
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
  
  get_mode = ->
    mode = $("input[name=modeSelect]:checked").val()
    return mode

  drawTest = ->
    svgns = "http://www.w3.org/2000/svg"
    for x in [0..400] by 50 
      for y in [0..350] by 50
        rect = document.createElementNS(svgns, 'rect')
        rect.setAttributeNS(null, 'x', x)
        rect.setAttributeNS(null, 'y', y)
        rect.setAttributeNS(null, 'height', '50')
        rect.setAttributeNS(null, 'width', '50')
        rect.setAttributeNS(null, 'fill', '#'+Math.round(0xffffff * Math.random()).toString(16))
        document.getElementById('svgOne').appendChild(rect)
    return

  encode_as_img_and_link = ->
    $("svg").attr({ version: '1.1' , xmlns:"http://www.w3.org/2000/svg"});
    svg = $("#chart-canvas").html()
    b64 = Base64.encode(svg) # / or use btoa if supported
    $("#download_area").append($("<a style='display:none' id='download_link' href='data:image/svg+xml;base64,\n"+b64+"' alt='file.svg' download='file.svg'>Download</a>"));
    # // Works in Firefox 3.6 and Webit and possibly any browser which supports the data-uri
    # $("body").append($("<a href-lang='image/svg+xml' href='data:image/svg+xml;base64,\n"+b64+"' title='file.svg'>Download</a>"));
    document.getElementById("download_link").click()
    return

# ------------------------------------------------------------------------
# fire function
# ------------------------------------------------------------------------

  drawTest()