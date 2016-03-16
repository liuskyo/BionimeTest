class Nurse < ActiveRecord::Base
	validates_presence_of :name,:number
	has_many :station_nurseships
	has_many :stations,:through=>:station_nurseships
end
