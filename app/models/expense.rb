# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :type
  belongs_to :category

  scope :select_category, ->(category) {Expense.where("category_id = ?", category)}
  scope :select_type, ->(type) {Expense.where("type_id = ?", type)}
  scope :select_month, ->(month) {Expense.where('extract(month from date) = ?', month)}
  scope :select_year, ->(year) {Expense.where('extract(year from date) = ?', year)}
  scope :last_6_months, -> {Expense.where("date >= :start_date AND date <= :end_date",{start_date: DateTime.now.months_ago(6).at_beginning_of_month, end_date: DateTime.now.at_end_of_month})}

  validates_presence_of :concept, :value, :created_at
  validate :date_cannot_be_in_the_future
  validates :value, numericality: { greater_than_or_equal_to: 0 }

  def date_cannot_be_in_the_future
    unless expense_date.nil?
      if expense_date.to_date > Date.today
        errors.add(:expense_date, 'No puede ser un gasto futuro')
      end
    end
  end
end
