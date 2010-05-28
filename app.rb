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

DB = Sequel.sqlite('hockey_scheduler.db')

Ramaze::acquire("controller/*")
Ramaze::acquire("model/*")

DefaultErrorMessage = "Something went wrong, we're looking into it."

AdministratorEmail = "vincentroy8@gmail.com"
