class Website < ApplicationRecord

  validates :url, presence: true, :uniqueness => true
  
end
