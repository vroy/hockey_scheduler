class Location < Sequel::Model(:locations)
  set_schema do
    primary_key :id
    varchar :name
    float :latitude
    float :longitude
    text :description
  end
  
end

Location.create_table!
Location.create(:name => "Boys and girls club, Moncton")
