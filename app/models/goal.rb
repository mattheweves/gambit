class Goal < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true
  validates :targetdate, presence: true
  validates :finishline, presence: true

end
