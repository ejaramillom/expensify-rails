class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @categories = Category.all
    @types = Type.all
  end

  respond_to do |format|
    format.js
    format.html {render 'index'}
  end
end
