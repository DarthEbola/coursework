module SideBarHelper
  def side_bar_items(ru)
    result = []
    if @current_user.blank?
      result << {
        :name => 'Войти',
        :icon => 'sign-in',
        :controller => :welcome, 
        :action => :new
      }
    else
      result << {
        :name => @current_user.email,
        :icon => 'sign-out',
        :controller => :welcome, 
        :action => :destroy
      }
    end
    result << {
      :name => 'Экскурсии',
      :icon => 'map-marker',
      :controller => :excursions, 
      :action => :index
    }
    result << {
      :name => 'Туры',
      :icon => 'road',
      :controller => :tours, 
      :action => :index
    }
    result << {
      :name => 'Поиск туров',
      :icon => 'search',
      :controller => :tours, 
      :action => :search
    }
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'users',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Роли',
       :controller => :roles, :action => :index,
       :icon => 'align-center',
       :class => 'long'},
    ]} 
    result << {
      :name => 'Заголовок ссылок',
      :icon => 'search-plus',
      :children => [
      {:name => 'Ссылка ребёнок',
       :controller => :welcome, :action => :index,
       :icon => 'binoculars'},
      {:name => 'Ссылка ребёнок',
       :controller => :welcome, :action => :index,
       :icon => 'search',
       :class => 'long'}
    ]} 
    result
  end
  
  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles'
      ctr.to_s == controller_name.to_s  
    else
      false
    end
  end
end
