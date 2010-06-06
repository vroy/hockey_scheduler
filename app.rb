require "rubygems"

begin
  gem "ramaze", "2009.03"
  require "ramaze"
rescue LoadError => e
  puts "Could not load ramaze.\n\nTry: sudo gem install ramaze -v 2009.03"
  exit!(1)
end

begin
  gem "sequel", "3.11.0"
  require "sequel"
rescue LoadError => e
  puts "Could not load sequel.\n\nTry: sudo gem install sequel -v 3.11.0"
  exit!(1)
end

APP_ROOT = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(APP_ROOT)
Ramaze::Global.root = APP_ROOT # Used so ramaze/helper.rb#require_helper

DB = Sequel.sqlite("#{APP_ROOT}/hockey_scheduler.db")

require "#{APP_ROOT}/controller/controller" # required first so other controllers load up fine.
Ramaze::acquire("#{APP_ROOT}/snippets/*")
Ramaze::acquire("#{APP_ROOT}/helper/*")
Ramaze::acquire("#{APP_ROOT}/controller/*")
Ramaze::acquire("#{APP_ROOT}/model/*")

DefaultErrorMessage = "Something went wrong, we're looking into it."

AdministratorEmail = "vincentroy8@gmail.com"

AppName = "Hockey Scheduler"
