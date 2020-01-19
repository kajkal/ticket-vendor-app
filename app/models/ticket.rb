class Ticket < ApplicationRecord
  validates :name, :presence => true, :length => {:minimum => 3, :maximum => 60}
  validates :email_address, :presence => true
  validates :price, :presence => true, :numericality => {:greater_than => 0}
end
