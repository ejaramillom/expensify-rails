# frozen_string_literal: true

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase

  test "Expense concept can't be blank " do
    @expense = Expense.create()
    assert_not @expense.save
  end

  test "Expense value can't be blank " do
    @expense = Expense.create(
      type_id: rand(1..Type.count),
      category_id: rand(1..Category.count),
      concept: Faker::TvShows::RickAndMorty.quote,
      expense_date: Faker::Time.between(from: Date.today - 240, to: Date.today),
      created_at: Faker::Time.between(from: Date.today - 20, to: Date.today),
    )
    assert_not @expense.save
  end

  test "Expense date can't be blank " do
    @expense =  Expense.create(
      type_id: rand(1..Type.count),
      category_id: rand(1..Category.count),
      concept: Faker::TvShows::RickAndMorty.quote,
      value: Faker::Number.between(from: 1, to: 5000000)
    )
    assert_not @expense.save
  end

  test "Expense type can't be blank " do
    @expense = Expense.create(
      category_id: rand(1..Category.count),
      concept: Faker::TvShows::RickAndMorty.quote,
      expense_date: Faker::Time.between(from: Date.today - 240, to: Date.today),
      created_at: Faker::Time.between(from: Date.today - 20, to: Date.today),
      value: Faker::Number.between(from: 1, to: 5000000)
    )
    assert_not @expense.save
  end

  test "Date_cannot_be_in_the_future should avoid wrong date info " do
    @expense = Expense.create(
      type_id: rand(1..Type.count),
      category_id: rand(1..Category.count),
      concept: Faker::TvShows::RickAndMorty.quote,
      expense_date: Date.today + 1,
      created_at: Faker::Time.between(from: Date.today - 20, to: Date.today),
      value: Faker::Number.between(from: 1, to: 5000000)
    )
    @expense.date_cannot_be_in_the_future
    assert_not @expense.save
  end

end
