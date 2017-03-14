class Gallery < ApplicationRecord
  has_many :paintings
  
  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, length: { is: 5 }

end
