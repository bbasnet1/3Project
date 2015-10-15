class Doctor < ActiveRecord::Base

def fullname_specialty
	"#{name_first} #{name_last} (#{specialty})"
end
end
