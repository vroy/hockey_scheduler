class Game < Sequel::Model(:games)
  set_schema do
    primary_key :id
    time :timestamp
    varchar :location
  end
  
  def self.upcoming
    self.filter(:timestamp > Time.now)
  end
end

Game.create_table!
Game.create(:timestamp => Time.parse("2010-05-28 20:00:00"),
            :location => "Boys and girls club, Moncton")
