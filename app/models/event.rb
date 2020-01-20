class NoPastDateValidator < ActiveModel::Validator
  def validate(record)
    if record.event_date && record.event_date < Date.today
      record.errors.add(:event_date, 'cannot be from the past')
    end
  end
end

class PriceValidatorMax < ActiveModel::Validator
  def validate(record)
    if record.price_low && record.price_low > record.price_high
      record.errors.add(:price_high, 'can\'t be lower than low price')
    end
  end
end

class Event < ApplicationRecord
  validates_with NoPastDateValidator
  validates_with PriceValidatorMax

  validates :artist, :presence => true
  validates :price_low, :presence => true, numericality: {:greater_than => 0}
  validates :price_high, :presence => true, numericality: {:greater_than => 0}
  validates :event_date, :presence => true

  has_many :tickets
end
