class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  broadcasts_to ->(_room) { :message_list }
end
