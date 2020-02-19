# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Question.destroy_all

3.times do |level|
  200.times do |i|
    q = Question.create(question: Faker::Quote.famous_last_words, level: level)
    a = []
    4.times do |j|
       a << Answer.create(content: Faker::TvShows::GameOfThrones.quote, question: q)
    end
    q.correct_answer = a.sample
    q.save
  end
end

40.times do |i|
  q = Question.create(question: Faker::Quote.famous_last_words, level: 3)
  a = []
  4.times do |j|
     a << Answer.create(content: Faker::TvShows::GameOfThrones.quote, question: q)
  end
  q.correct_answer = a.sample
  q.save
end