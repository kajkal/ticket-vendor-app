class MinPriceValidatorMax < ActiveModel::Validator
  def validate(record)
    if record.price && record.price > record.event.price_high
      record.errors.add(:price, '- no such expensive tickets at this event')
    end
  end
end

class MaxPriceValidatorMin < ActiveModel::Validator
  def validate(record)
    if record.price && record.price < record.event.price_low
      record.errors.add(:price, '- no such cheap tickets at this event')
    end
  end
end

class Ticket < ApplicationRecord
  validates_with MinPriceValidatorMax
  validates_with MaxPriceValidatorMin

  validates :name, :presence => true, :length => {:minimum => 3, :maximum => 60}
  validates :email_address, :presence => true
  validates :price, :presence => true, :numericality => {:greater_than => 0}

  belongs_to :event
end
