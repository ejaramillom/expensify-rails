require 'rails_helper'

RSpec.describe ExpensesController, type: :controller  do
	context 'destroy expense' do
		let!( :expense ) { Expense.create(
			type_id: rand(1..Type.count),
			category_id: rand(1..Category.count),
			concept: Faker::TvShows::RickAndMorty.quote,
			expense_date: Faker::Time.between(from: Date.today - 240, to: Date.today),
			created_at: Faker::Time.between(from: Date.today - 20, to: Date.today),
			value: Faker::Number.between(from: 1, to: 5000000)
		) }

		it 'returns a succes response' do
			# before( :each ) do
			# 	visit destroy_path( :expense )
			# end
			visit expenses_path
			expect {click_link 'Delete'}.to change(Expense, :count ).by(-1)
		end
	end
end
