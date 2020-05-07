# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :acumulado
  def index

    @tab = :dashboard
    @today = Expense.where( expense_date: Date.today )
    @yesterday = Expense.where( expense_date: Date.today - 1)
    @this_month = Expense.by_month( Date.today )
    @last_month = Expense.by_month( Date.today - 1.month )

    @last_6_months = [
    	{ name: "Transporte", data: Expense.where( category_id: 1 ).last_6_months.sum( :value )},
    	{ name: "Servicios públicos",	data: Expense.where( category_id: 2 ).last_6_months.sum( :value )},
    	{ name: "Hipoteca",	data: Expense.where( category_id: 3 ).last_6_months.sum( :value )},
    	{ name: "Teléfono",	data: Expense.where( category_id: 4 ).last_6_months.sum( :value )},
      { name: "Familia", data: Expense.where( category_id: 5 ).last_6_months.sum( :value )},
      { name: "Mercado", data: Expense.where( category_id: 6 ).last_6_months.sum( :value )},
      { name: "Banda", data: Expense.where( category_id: 7 ).last_6_months.sum( :value )}
    ]

    @each_day = [
    	{ name: "Transporte", data: Expense.where( category_id: 1 ).select_day.sum( :value )},
    	{ name: "Servicios públicos",	data: Expense.where( category_id: 2 ).select_day.sum( :value )},
    	{ name: "Hipoteca",	data: Expense.where( category_id: 3 ).select_day.sum( :value )},
    	{ name: "Teléfono",	data: Expense.where( category_id: 4 ).select_day.sum( :value )},
      { name: "Familia", data: Expense.where( category_id: 5 ).select_day.sum( :value )},
      { name: "Mercado", data: Expense.where( category_id: 6 ).select_day.sum( :value )},
      { name: "Banda", data: Expense.where( category_id: 7 ).select_day.sum( :value )}
    ]

    @each_type = [
    	[ "Tarjeta de ahorros", @this_month.where( type_id: 1 ).sum( :value )],
    	[ "Tarjeta de crédito",	@this_month.where( type_id: 2 ).sum( :value )],
    	[ "Crediágil",	@this_month.where( type_id: 3 ).sum( :value )],
    	[ "Fiducia",	@this_month.where( type_id: 4 ).sum( :value )]
    ]

  end

  def acumulado
   @saved = []
   @saved_last = []
   cum_sum_last = 0
   cum_sum = 0

   @data_acumulated = Expense.by_month( Date.today ).order( 'expense_date ASC' )
   @data_acumulated_last = Expense.by_month( Date.today-1.month ).order( 'expense_date ASC' )

   @data_acumulated.map do |expense|
     cum_sum += expense.value
     @saved << [ expense.expense_date.strftime(" %d" ), cum_sum ]
   end

   @data_acumulated_last.map do |expense_last|
     cum_sum_last += expense_last.value
     @saved_last << [ expense_last.expense_date.strftime( "%d" ), cum_sum_last ]
   end

   @data = [
     { name: "Mes actual", data: @saved },
     { name: "Mes pasado", data: @saved_last }
   ]
 end
end
