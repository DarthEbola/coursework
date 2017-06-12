@update_fields = (t) ->
  r_id = $(t).val()
  #alert(rID)
  rdiv = $(document).find('.for_update_fields')
  r_name = rdiv.find('.name-' + r_id).attr("data-content")
  r_description = rdiv.find('.description-' + r_id).attr("data-content")
  r_price = rdiv.find('.price-' + r_id).attr("data-content")
  r_city = rdiv.find('.city_name-' + r_id).attr("data-content")

  panel_body = $(t).parent().parent().parent().parent()
  panel_body.find('i.upd-rname').text(r_name)
  panel_body.find('i.upd-rdescription').text(r_description)
  panel_body.find('i.upd-rprice').text(r_price)
  panel_body.find('i.upd-rcity').text(r_city)
  false


@edit_city = (link) ->
  form = link.parent().parent().parent().parent()
  e = form.find(".edit_form_city")
  f = e.attr("data-content")
  #alert(f)
  e.html(f)
  #создаем кнопку отмены формы
  cancel_link = link.attr("data-content")
  link.after(cancel_link)
  link.hide()
  form.find('a#new_city_link').hide()
  form.find('a#edit_city_link').hide()
  cID = form.find('.select-city').val()
  cname = form.find('.select-city option:selected').text()
  #alert(cname)
  form.find('.city-select').hide()
  form.find("input[type=hidden].city-id").val(cID)
  form.find("input[type=text].city-name").val(cname)
  form.find('a.cancel_edit').on 'click', ->
    form = link.parent().parent()
    form.find('a#edit_city_link').show()
    form.find('a#new_city_link').show()
    form.find('.city-select').show()
    form.find('.city-edit').remove()
    $(this).remove()
    false
  false



@new_city = (link) ->
  form = link.parent().parent().parent().parent()
  #создаем кнопку отмены формы
  cancel_link = link.attr("data-content")
  link.after(cancel_link)
  link.hide()
  form.find('a#new_city_link').hide()
  form.find('a#edit_city_link').hide()
  e = form.find(".new_form_city")
  f = e.attr("data-content")
  e.html(f)
  form.find('.city-select').remove()
  form.find('a.cancel_edit').on 'click', ->
    form = link.parent().parent()
    form.find('a#edit_city_link').show()
    form.find('a#new_city_link').show()
    form.find('.city-select').show()
    form.find('.city-edit').remove()
    e = form.find(".select_form_city")
    f = e.attr("data-content")
    e.html(f)
    $(this).remove()
    false
  false

@edit_route = ->
  $('a#edit_route_link').on 'click', ->
    form = $(this).parent().parent()
    #создаем кнопку отмены формы
    cancel_link = $(this).attr("data-content")
    $(this).after(cancel_link)
    $(this).hide()
    $('a#new_route_link').hide()
    form.find('h3').text('Редактирование маршрута')
    r_id = form.find('.select-route').val()
    e = form.find(".edit_form")
    f = e.attr("data-content")
    e.html(f)
    rdiv = $(document).find('.for_update_fields')
    r_name = rdiv.find('.name-' + r_id).attr("data-content")
    r_description = rdiv.find('.description-' + r_id).attr("data-content")
    r_price = rdiv.find('.price-' + r_id).attr("data-content")
    r_city_id = rdiv.find('.city_id-' + r_id).attr("data-content")
    form.find("input[type=hidden].route_id").val(r_id)
    form.find("input[type=text].route_name").val(r_name)
    form.find("input[type=text].route_description").val(r_description)
    form.find("input[type=number].route_price").val(r_price)
    form.find('.select-city').val(r_city_id)
    #alert(r_price)
    #alert(form.find("input[type=text].route_description").val())
    form.find('a#edit_city_link').on 'click', ->
      window.edit_city($(this))
      false
    form.find('a#new_city_link').on 'click', ->
      window.new_city($(this))
      false
    form.find('.route-select').hide()
    form.find('a.cancel_edit').on 'click', ->
      form = $(this).parent().parent()
      form.find('a#edit_route_link').show()
      form.find('a#new_route_link').show()
      form.find('h3').text('Выберите маршрут')
      form.find('.route-select').show()
      form.find('.route-edit').remove()
      $(this).remove()
      false
    false


@new_route =  ->
  $('a#new_route_link').on 'click', ->
    form = $(this).parent().parent()
    #создаем кнопку отмены формы
    cancel_link = $(this).attr("data-content")
    $(this).after(cancel_link)
    $(this).hide()
    $('a#edit_route_link').hide()
    form.find('h3').text('Создание маршрута')
    # вставляем форму
    e = form.find(".new_form")
    f = e.attr("data-content")
    e.html(f)
    form.find('a#edit_city_link').on 'click', ->
      window.edit_city($(this))
      false
    form.find('a#new_city_link').on 'click', ->
      window.new_city($(this))
      false
    form.find('.route-select').remove()
    form.find('a.cancel_edit').on 'click', ->
      form = $(this).parent().parent()
      form.find('a#edit_route_link').show()
      form.find('a#new_route_link').show()
      form.find('h3').text('Выберите маршрут')
      #form.find('.route-select').show()
      form.find('.route-new').remove()
      e = form.find(".select_form")
      f = e.attr("data-content")
      e.html(f)
      $(this).remove()
      false
    false


route_ready = ->
  window.edit_route()
  window.new_route()
$(document).on 'page:load', route_ready # Включаем при ajax обновлении страницы
$(document).ready route_ready # Включаем при обычном обновлении страницы