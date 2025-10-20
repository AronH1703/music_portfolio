class AdminUser < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :timeoutable, :lockable, :trackable
end

