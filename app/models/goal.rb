class Goal < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true
  validates :targetdate, presence: true
  validates :finishline, presence: true


  CATEGORIES = {
    'Personal Development'       => 'PD',
    'Family/Community'           => 'FC',
    'Professional & Financial'   => 'PF'
  }

  def humanized_category
    CATEGORIES.invert[self.category]
  end

end
