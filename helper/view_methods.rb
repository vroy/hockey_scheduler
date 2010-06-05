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
  
end
