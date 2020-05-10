# frozen_string_literal: true

require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @expense = expenses( :expense_one )
  end

  test 'should get index' do
    get expenses_path
    assert_response :success
    assert_not_nil assigns( :expenses )
  end

  test "should create an expense" do
    post '/expenses', params: { expense: {type: @expense.type, category: @expense.category, expense_date: @expense.expense_date, value: @expense.value, concept: @expense.concept}}, xhr: true
    assert_response :success
  end
end
