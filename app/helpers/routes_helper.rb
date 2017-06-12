module RoutesHelper
  def link_to_edit_route()
    link_to(?#, class: 'show-edit-link', 
        id: 'edit_route_link', "data-content" => "#{link_to_cancel_edit()}") do 
      fa_icon('edit', title: 'Редактировать маршрут') + ' Изменить'
    end 
  end

  def link_to_new_route()
    link_to(?#, class: 'show-new-link', 
        id: 'new_route_link', "data-content" => "#{link_to_cancel_edit()}") do 
      fa_icon('plus', title: 'Создать маршрут') + ' Новый'
    end 
  end

  def link_to_cancel_edit()
    link_to(?#, class: 'cancel_edit',
        id: 'cancel_edit_link') do 
      fa_icon('ban', title: 'Отменить') + ' Отменить'
    end 
  end
end
