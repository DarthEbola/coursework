RoleUser.delete_all
Role.delete_all
User.delete_all
if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

Tour.delete_all
# params.require(:tour).permit(:route_id, :date_start, :count_days, :add_pay, :add_description,
Excursion.delete_all
# params.require(:excursion).permit(:city_id, :name, :description, :price)
Route.delete_all
# params.require(:route).permit(:name, :city_id, :description, :price,
City.delete_all

dscr_e = "Очень увлекательная экскурсия в "
dscr_r = "Маршрут начинается где-то там"
5.times do |i|
  c = City.create(name: "Город \##{i}")
  e = Excursion.create(city: c, name: "Экскурсия в #{c.name}", description: dscr_e + c.name, price: i*2+1)
  e = Excursion.create(city: c, name: "Экскурсия в #{c.name}", description: dscr_e + c.name, price: i*2+1)
  r = Route.create(city: c, name: "Маршрут в #{c.name}", description: dscr_r, price: i*2+1)
  t = Tour.create(route: r, date_start: "#{i+1}-#{i+1}-#{2000+i}", count_days: i+2, add_pay: i**3, add_description: "add_description")
end
