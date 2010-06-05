class GamesController < Controller
  map '/games'
  
  def index
    @title = "Upcoming games"
    
    @games = Game.upcoming.all
  end
  
  def add
    @title = "Schedule game"
    
    @remaining_players = Player.substitutes.all
    @permanent_players = Player.permanents.all
  end
  
  def insert
    timestamp = Time.parse("#{request[:datestamp]} #{request[:timestamp]}")
    
    game = Game.create(:timestamp => timestamp,
                       :location => request[:location])
                        
    flash[:message] = "Successfully scheduled game."
    redirect Rs()
    
  rescue Sequel::Error => e
    flash[:error] = DefaultErrorMessage
    redirect_referer
  end
end
