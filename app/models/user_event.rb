class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_many :users

  validates_presence_of :name, :description, :date, :duration, :location
end
