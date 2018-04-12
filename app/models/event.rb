class Event < ApplicationRecord
  validates_presence_of :title, :time, :date
end
