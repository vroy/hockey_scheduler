test :underscores_all do
  "?Players - Selection Box?".underscored == "Players_Selection_Box" 
end

test :underscores_simple do
  "_Test_".underscored == "Test"
end

test :underscores_special_chars do
  "Test-Test".underscored == "Test_Test"
end

test :underscores_multiple_chars do
  "Test - Test".underscored == "Test_Test"
end
