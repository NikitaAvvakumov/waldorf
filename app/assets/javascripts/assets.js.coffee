$(->
  $('a#add_another_asset').click(->
    url = '/assets/new?file_number=' + $('#assets input').length
    $.get(url,
      (data)->
        $('#assets').append(data)
    )
  )
)