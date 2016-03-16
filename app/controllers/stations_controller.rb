class StationsController < ApplicationController
	def welcome
		
	end


	def index
		@stations=Station.all
	end


end
