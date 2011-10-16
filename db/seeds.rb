# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Produto.create!( [
                    { :nome => 'Battlestar Galactica: The Boardgame', :preco => 39.90, :descricao => 'Um jogo de ação, intriga e política' },
                    { :nome => 'Dominion', :preco => 29.90, :descricao => 'Vencedor do Spiel Der Jarhes como melhor jogo de 2009' },
                    { :nome => 'Settlers of Catan', :preco => 29.90, :descricao => 'Pai dos boardgames modernos' }
                ] )
