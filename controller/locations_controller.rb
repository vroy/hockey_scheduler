class LocationsController < Controller
  map '/locations'
  
  def index
    @title = "Locations"
    
    @locations = Location.all
  end
  
  def add
  end
  
  deny_layout :insert # responding json.
  def insert
    p request.params
    location = Location.create(:name => request[:name],
                           :latitude => request[:latitude],
                           :longitude => request[:longitude],
                           :description => request[:description])
    
    %( { "result":true, "message":"Successfully scheduled game." } )
  rescue Sequel::Error => e
    %( { "result":false, "message": "#{DefaultErrorMessage}" } )
  end
end
