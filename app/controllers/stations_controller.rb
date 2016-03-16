class StationsController < ApplicationController
	def welcome
		
	end


	def index
		@stations = Station.all
	end

	def show
		
	end

	def new
		@station = Station.new
	end

	def create
		@station = Station.new(station_params)
		if @station.save
			redirect_to station_path(@station)
		else
			render new_station_path
		end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private

	def station_params
		params.require(:station).permit(:name,:number,:nurse_id)
	end

end
