require "date"
REG = /^(?<gender>[12])(?<year>\d{2})(?<month>\d{2})(?<dept>\d{2})\d{6}(?<key>\d{2})/
DEPARTEMENT = {
  "75" => "Paris",
  "76" => "Seine maritime"
}

def ssn_info(ssn)
  # TO DO => "a man, born in march, 1986 in Paris."

result = ssn.match(REG)

if result[:gender] == "1"
  gender = "a man"
else
  gender = "a woman"
end
year = "19#{result[:year]}"
month = Date::MONTHNAMES[result[:month].to_i]
dept = DEPARTEMENT[result[:dept]]


p number = ssn[0..12].to_i
p key = result[:key].to_i
p expected_key = 97 - (number % 97)

if expected_key == key
"You are #{gender}, born in #{month}, #{year}, in #{dept}"
else
"Not a valid number"
end


  # Gender / Birth Years / month / Department / 6 non exploités/clé
end

puts ssn_info("186037510803191")
# puts ssn_info(286037510803191)
