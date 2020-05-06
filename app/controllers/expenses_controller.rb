# frozen_string_literal: true
class ExpensesController < ApplicationController
  before_action :months_list
  require 'active_support/time'

  def index
    @tab = :expenses
    @categories = Category.all
    @types = Type.all
    @months_list = months_list()
    @expense_date = params[ :month ] ? @expense_date = params[ :month ] : Date.today.strftime("%B %Y")
    @expenses = Expense.by_month( @expense_date ).order("expense_date DESC")

    type_id = params[ :type_id ] unless params[ :type_id ] == ''
    category_id = params[ :category_id ] unless params[ :category_id ] == ''

    if type_id.present?
      @expenses = Expense.by_month( @expense_date ).select_type( type_id.to_i ).order("expense_date DESC")
    end
    if category_id.present?
      @expenses = Expense.by_month( @expense_date ).select_category( category_id.to_i ).order("expense_date DESC")
    end

    respond_to do |format|
      format.js
      format.html { render 'index' }
    end

  end

  def new
    @expense = Expense.new

    respond_to do |format|
      format.js
      format.html
    end

  end

  def create
    @expense = Expense.create(expense_params)
    if @expense.save
      redirect_to expenses_path, notice: "Registro creado exitosamente"
    end

    respond_to do |format|
      format.js
      format.html
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
    params.require( :expense ).permit( :value, :concept, :expense_date, :type_id,  :category_id )
  end

  def months_list
    (1..12).map do |m|
      m.months.ago
    end
  end
end
