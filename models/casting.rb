require_relative('../db/sql_runner')
require_relative('./performer')
require_relative('./movie')

class Casting
attr_reader :id, :movie_id, :performer_id
attr_accessor :fee

  def initialize( options )
    @fee = options['fee'].to_i
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i if options['movie_id']
    @performer_id = options['performer_id'].to_i if options['performer_id']
  end

  def save
    sql = 'INSERT INTO castings (fee, movie_id, performer_id) VALUES ($1, $2, $3) RETURNING id'
    values = [@fee, @movie_id, @performer_id]
    casting = SqlRunner.run(sql, values).first
    @id = casting['id'].to_i
  end


  def delete
    sql = "DELETE FROM castings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE castings SET (fee, performer_id, movie_id) = ($1, $2, $3) WHERE id = $4"
    values = [@fee, @performer_id, @movie_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM castings"
    values = SqlRunner(sql)
    return values.map {|value| Casting.new(value)}
  end

  def self.find(id)
    sql = 'SELECT * FROM castings WHERE id = $1'
    values = [id]
    castings = SqlRunner.run(sql, values).first
    result = Casting.new(castings)
    return result if result != nil
  end

  def self.delete_all
    sql = 'DELETE FROM castings'
    SqlRunner.run(sql)
  end
end
