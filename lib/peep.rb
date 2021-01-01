require 'pg'

class Peep

  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    query = con.exec "SELECT * FROM peeps"
    query.map do |row|
      "#{row['peep']} from: #{row['maker']}"
    end
  end

  def self.add_peep(peep, maker)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    query = con.exec "INSERT INTO peeps (peep, maker) VALUES('#{peep}', '#{maker}')"
    p query
  end 
end 