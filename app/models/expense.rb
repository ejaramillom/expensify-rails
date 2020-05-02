class Expense < ApplicationRecord
  belongs_to :type
  belongs_to :category

  validates_presence_of :concept, :value, :created_at
  validate :date_cannot_be_in_the_future
  validates :value, numericality: {greater_than_or_equal_to: 0}

  def date_cannot_be_in_the_future
    if created_at != nil
      errors.add(:created_at, "No puede ser un gasto futuro") if created_at.to_date > Date.today
    end
  end
end
