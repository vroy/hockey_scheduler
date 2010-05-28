class Player < Sequel::Model(:players)
  set_schema do
    primary_key :id
    varchar :status
    varchar :name
    varchar :email
    varchar :phone
    boolean :archived, :default => false
  end
  
  def self.permanents
    self.filter(:archived => false, :status => "permanent")
  end
  
  def self.substitutes
    self.filter(:archived => false, :status => "substitute")
  end
end

Player.create_table!
Player.create(:status => "permanent",
              :name => "Vincent Roy",
              :email => "vincentroy8@gmail.com",
              :phone => "506-850-3267")
