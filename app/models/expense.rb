# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :type
  belongs_to :category
  by_star_field :expense_date

  scope :select_category, ->( category ) { Expense.where( 'category_id = ?', category )}
  scope :select_type, ->( type ) { Expense.where( 'type_id = ?', type )}
  scope :select_day, ->{ Expense.group_by_day( :expense_date, last: 8, series: true, format: "%e %B" )}
  scope :select_month, ->{ Expense.group_by_month( :expense_date, last: 1, series: true, format: "%B %Y" )}
  scope :select_year, ->{ Expense.group_by_year( :expense_date, last: 1, series: true, format: " %Y" )}
  scope :last_6_months, -> { Expense.group_by_month( :expense_date, last: 6, series: true, format: "%b %Y" )}

  validates :concept, :value, :expense_date, presence: { message: ": por favor llene el campo en blanco" }
  validate :date_cannot_be_in_the_future
  validates :value, numericality: { greater_than_or_equal_to: 0 }, presence: { message: ": por favor llene el valor, mayor que 0" }

  def date_cannot_be_in_the_future
    unless expense_date.nil?
      if expense_date.to_date > Date.today
        errors.add( :expense_date, 'No puede ser un gasto futuro' )
      end
    end
  end

end
