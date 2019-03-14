require('pry-byebug')
require_relative('models/movie')
require_relative('models/performer')
require_relative('models/casting')

Performer.delete_all
Movie.delete_all
Casting.delete_all

performer1 = Performer.new({
  'first_name' => 'Jodie',
  'last_name' => 'Foster'
})
performer1.save

performer2 = Performer.new({
  'first_name' => 'Anthony',
  'last_name' => 'Hopkins'
})
performer2.save

movie1 = Movie.new({
  'title' => 'Silence of the lambs',
  'genre' => 'thriller'
  })
movie1.save

movie2 = Movie.new({
  'title' => 'King Lear',
  'genre' => 'history'
  })
movie2.save

movie3 = Movie.new({
  'title' => 'The Lego movie',
  'genre' => 'cartoon'
  })
movie3.save

casting1 = Casting.new({
  'fee' => '500',
  'movie_id' => movie1.id,
  'performer_id' => performer1.id
  })
casting1.save

casting2 = Casting.new({
  'fee' => '800',
  'movie_id' => movie1.id,
  'performer_id' => performer2.id
  })
casting2.save

casting3 = Casting.new({
  'fee' => '1000',
  'movie_id' => movie2.id,
  'performer_id' => performer2.id
  })
casting3.save

binding.pry
nil
