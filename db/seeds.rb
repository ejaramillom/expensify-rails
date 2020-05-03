# frozen_string_literal: true

require 'faker'

c1 = Category.create(name: 'Transporte')
c2 = Category.create(name: 'Servicios públicos')
c3 = Category.create(name: 'Hipoteca')
c4 = Category.create(name: 'Teléfono')
c5 = Category.create(name: 'Familia')
c6 = Category.create(name: 'Mercado')
c7 = Category.create(name: 'Banda')

c1.save
c2.save
c3.save
c4.save
c5.save
c6.save
c7.save

t1 = Type.create(name: 'Tarjeta de ahorros')
t2 = Type.create(name: 'Tarjeta de crédito')
t3 = Type.create(name: 'Crediágil')
t4 = Type.create(name: 'Fiducia')

t1.save
t2.save
t3.save
t4.save

50.times do
  a = Expense.create(
    type_id: rand(1..Type.count),
    category_id: rand(1..Category.count),
    concept: Faker::TvShows::RickAndMorty.quote,
    expense_date: Faker::Time.between(from: Date.today - 240, to: Date.today),
    created_at: Faker::Time.between(from: Date.today - 20, to: Date.today),
    value: Faker::Number.between(from: 1, to: 5000000)
  )
  a.save
end
