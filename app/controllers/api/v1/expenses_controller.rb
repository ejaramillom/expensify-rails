class Api::V1::ExpensesController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def index
    expenses = Expense.order( "expense_date DESC" )

    if params[ :category ].present?
      expenses = Expense.where( "category LIKE ?", "%#{ params[ :category ] }%" )
    end
    if params[:type].present?
      expenses = Expense.where( "type LIKE ?", "%#{ params[ :type ] }%")
    end

    categories = Category.all
    types = Type.all

    render json: expenses
  end

  def create
    expense = Expense.new( safe_params )
    if expense.save
      render json: expense, status: 201
    else
      render json: { errors: expense.errors }, status: 422
    end
  end

  def update
    expense = Expense.find( params[ :id ] )
    if expense.update( safe_params )
      render json: expense, status: 200
    else
      render json: {errors: expense.errors}, status: 422
    end
  end

  def destroy
    expense = Expense.find( params[ :id ] )
    expense.destroy
    head :no_content
  end

  private
  def safe_params
    params.require(:expense).permit(:type_id, :expense_date, :category_id, :concept, :amount)
  end
end
