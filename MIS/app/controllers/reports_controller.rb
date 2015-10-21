class ReportsController < ApplicationController

def ages
	@main_route = main_route()
	@counts = Array.new()
	@total = Patient.all.length
	@counter = 0
	@oldest = Patient.minimum("dob")
	while Date.today.years_ago(@counter*10) >= @oldest  do#keep looping while the age range where the oldest patient is has not been checked
		@result = Patient.where("dob >= ? AND dob < ?", Date.today.years_ago((10 * @counter)+10), Date.today.years_ago(@counter * 10) ).all
		@counts.push(@result.length)
		@counter += 1
	end
end

def genders
	@main_route = main_route()
	@counts = Array.new(2)
	@total = Patient.all.length
	@counts[0] = Patient.where(:gender => "Male").all.count
	@counts[1] = Patient.where(:gender => "Female").all.count
end

def ethnicities

end

def select
	
end

end