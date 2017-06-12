module CitiesHelper
  def link_to_edit_city()
    link_to(?#, class: 'show-edit-link', 
        id: 'edit_city_link', "data-content" => "#{link_to_cancel_edit()}") do 
      fa_icon('edit', title: 'Редактировать город') + ' Изменить'
    end 
  end

  def link_to_new_city()
    link_to(?#, class: 'show-new-link', 
        id: 'new_city_link', "data-content" => "#{link_to_cancel_edit()}") do 
      fa_icon('plus', title: 'Создать город') + ' Новый'
    end 
  end

  def link_to_cancel_edit()
    link_to(?#, class: 'cancel_edit_city',
        id: 'cancel_edit_link') do 
      fa_icon('ban', title: 'Отменить') + ' Отменить'
    end 
  end
end
