class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 3}, confirmation: true,
            if: Proc.new { |u| u.new_record? or !u.password.blank? }

  has_many :role_users, dependent: :destroy, inverse_of: :user 
  has_many :roles, through: :role_users
  # добавлено dependent, чтобы можно было удалять пользователей, у которых
  # есть роли
  
  # Разрешаем редактировать и удалять связи ролей и пользователей
  accepts_nested_attributes_for :role_users, allow_destroy: true
end
