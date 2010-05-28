module Ramaze::Helper::Dropdown
  
  def time_dropdown(step=15, key=:timestamp, selected=nil) # step in minutes
    values = []
    start_time = Time.parse(Date.today.to_s)
    end_time = Time.parse((Date.today+1).to_s)
    
    while start_time < end_time
      display = start_time.strftime("%H:%M")
      values << display
      start_time += step * 60
    end
    
    selected = selected.strftime("%H:%M") if selected.class == Time
    
    html = ""
    html << "<select id='#{key}' name='#{key}'>"
    
    values.each do |value|
      html << "<option value='#{value}'>#{value}</option>"
    end
    
    html << "</select>"
    
    html
  end
  
end
