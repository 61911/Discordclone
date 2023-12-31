class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :rooms
  has_many :posts

  broadcasts_to ->(_room) { :users }

  def username
    email.split('@').first
  end
end
