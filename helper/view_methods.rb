module Ramaze::Helper::ViewMethods
  
  def help(key, string, link=nil)
    help_id = "help_#{key.underscored}"
    link = link || "(help)"
    %(
      <a href="##{help_id}" class="help_link" rel="facebox" title="Help - #{key}">#{link}</a>
      <div style="display:none;width:800px;" class="fb help_popup" id="#{help_id}">
        <h3>Help - #{key}</h3>
        #{string}
      </div>
    )
  end
  
  def render_menu(links, submenu=false)
    html = ""
    links.each_with_index do |link, index|
      path, title, text = link
      
      if submenu
        request_sections = [ request.path ]
        request_sections << request.query_string if !request.query_string.empty?
        
        request_path = request_sections.join("?")
        link_path = path
      else
        request_path = request.path.split("/")[1]
        link_path = path.split("/")[1]
      end
      
      if request_path == link_path
        html << %( <a href="#{path}" title="#{title}" class="current_section">#{text}</a> )
      else
        html << %( <a href="#{path}" title="#{title}">#{text}</a> )
      end
      
      html << %( | ) if index != links.size-1
    end
    html
  end
  
  def render_submenu(links)
    render_menu(links, true)
  end
end
