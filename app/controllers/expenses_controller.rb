# frozen_string_literal: true

class ExpensesController < ApplicationController

  def index
    @categories = Category.all
    @types = Type.all
    @expenses = Expense.order("expense_date DESC")

    type_id = params[ :type_id ] unless params[ :type_id ] == ''
    category_id = params[ :category_id ] unless params[ :category_id ] == ''

    if type_id.present?
      @expenses = Expense.select_type( type_id.to_i )
    end
    if category_id.present?
      @expenses = Expense.select_category( category_id.to_i )
    end

    respond_to do |format|
      format.js
      format.html { render 'index' }
    end

  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expense_params)
    if @expense.save
      redirect_to expenses_path, notice: "Registro creado exitosamente"
    else
      @errors = @expense.errors.full_messages
      render 'new'
    end
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update(expense_params)

    redirect_to expenses_path
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    redirect_to expenses_path
  end

  def expense_params
    params.require( :expense ).permit( :type_id, :expense_date, :concept, :category_id, :amount )
  end
end
