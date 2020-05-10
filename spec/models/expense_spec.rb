require 'rails_helper'

RSpec.describe Expense, type: :model do
  context 'validation tests' do
  	it 'ensures concept presence' do
      expense = Expense.new(expense_date: Date.today, value:1, category_id:1, type_id:1)
      expect( expense ).to_not be_valid
  	end
  end
end
