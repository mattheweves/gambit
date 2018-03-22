class Goal < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true
  validates :targetdate, presence: true
  validates :finishline, presence: true


  CATEGORIES = {
    'Spiritual'       => 'SP',
    'Intellectual'    => 'IN',
    'Emotional'       => 'EM',
    'Physical'        => 'PH',
    'Marital'         => 'MA',
    'Parental'        => 'PA',
    'Social'          => 'SO',
    'Vocational'      => 'VO',
    'Avocational'     => 'AV',
    'Financial'       => 'FI'
  }

  def humanized_category
    CATEGORIES.invert[self.category]
  end

end
