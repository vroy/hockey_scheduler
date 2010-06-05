class PlayersController < Controller
  map '/players'
  
  def index
    @title = "Players"
    
    if request[:show_archived]
      @players = Player.filter(:archived => true).all
    else
      @players = Player.filter(:archived => false).all
    end
  end
  
  def edit(id)
    @player = Player[id]
    @title = "Edit"
    @title << " '#{@player.name}'" if @player
  end
  
  def update
    player = Player[request[:player_id]]
    
    if player
      player.update(:status => request[:status],
                    :name => request[:player_name],
                    :phone => request[:phone],
                    :email => request[:email])
      flash[:message] = "Successfully saved player '#{player.name}'"
    else
      flash[:error] = "Sorry, we couldn't find player id '#{request[:player_id]}'."
    end
    
    redirect_referer
  rescue Sequel::Error => e
    flash[:error] = DefaultErrorMessage
    redirect_referer
  end
  
  def add
    @title = "Add player"
  end
  
  def insert
    player = Player.create(:status => request[:status],
                        :name => request[:player_name],
                        :phone => request[:phone],
                        :email => request[:email])
                        
    flash[:message] = "Successfully created player '#{request[:player_name]}'"
    redirect Rs()
    
  rescue Sequel::Error => e
    flash[:error] = DefaultErrorMessage
    redirect_referer
  end
  
  def archive
    player = Player[request[:player_id]]
    
    if player
      player.update(:archived => true)
      flash[:message] = "Successfully archived player '#{player.name}'"
    else
      flash[:error] = "Sorry, we couldn't find player id '#{request[:player_id]}'."
    end
    
    redirect_referer
  rescue Sequel::Error => e
    flash[:error] = DefaultErrorMessage
    redirect_referer
  end
  
  def unarchive
    player = Player[request[:player_id]]
    
    if player
      player.update(:archived => false)
      flash[:message] = "Successfully un-archived player '#{player.name}'"
    else
      flash[:error] = "Sorry, we couldn't find player id '#{request[:player_id]}'."
    end
    
    redirect_referer
  rescue Sequel::Error => e
    flash[:error] = DefaultErrorMessage
    redirect_referer
  end
  
end
