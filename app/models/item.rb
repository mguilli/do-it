class Item < ActiveRecord::Base
  belongs_to :list

  def days_left
    days = (7 - (Time.now - self.created_at)/(60*60*24))
    days.round(2)
  end
end
