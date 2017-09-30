class Die < ActiveRecord::Base
  validates :age, presence: true
end
