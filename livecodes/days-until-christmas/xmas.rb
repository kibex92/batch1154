require "date"

def days_till_christmas(date = Date.today)
  christmas = Date.new(date.year, 12, 25)
  if date > christmas
    christmas = christmas.next_year
  end

  diff = christmas - date
  diff.to_i
end




puts days_till_christmas == 342 # true
puts days_till_christmas(Date.new(2023,12,23)) == 2
puts days_till_christmas(Date.new(2299,12,24)) == 1
puts days_till_christmas.class == Integer # true