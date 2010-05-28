class MainController < Ramaze::Controller
  map '/'
  layout '/layout'
  helper :dropdown
  
  def index
    @title = "Index"
  end
  
end
