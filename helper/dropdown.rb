module Ramaze::Helper::Dropdown
  
  def time_dropdown(key=:timestamp, step=15, selected=nil) # step in minutes
    values = []
    start_time = Time.parse(Date.today.to_s)
    end_time = Time.parse((Date.today+1).to_s)
    
    while start_time < end_time
      value = start_time.strftime("%H:%M")
      
      display = value
      display = "Midnight" if value == "00:00"
      display = "Noon" if value == "12:00"
      
      values << [value, display]
      
      start_time += step * 60
    end
    
    selected = selected.strftime("%H:%M") if selected.class == Time
    
    html = ""
    html << "<select id='#{key}' name='#{key}'>"
    
    values.each do |value, display|
      selected = (value=="12:00") ? " selected='selected' " : ""
      
      html << "<option value='#{value}' #{selected}>#{display}</option>"
    end
    
    html << "</select>"
    
    html
  end
  
end
