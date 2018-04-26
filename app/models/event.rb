class Event < ApplicationRecord

  validates_presence_of :name

  def durate
    self.duration = end_time.strftime("%H").to_i - start_time.strftime("%H").to_i
  end
end
