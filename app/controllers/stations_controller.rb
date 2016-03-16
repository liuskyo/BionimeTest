class StationsController < ApplicationController
	def welcome
		
	end


	def index
		@stations = Station.all
	end

	def show
		@station = Station.find(params[:id])
		@nurses = @station.nurses
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
		@station = Station.find(params[:id])
		@station.update(station_params)
		redirect_to station_path(params[:id])
	end

	def destroy
		@station = Station.find(params[:id])
		@station.destroy

		redirect_to stations_path
	end

	private

	def station_params
		params.require(:station).permit(:name,:number,:nurse_id)
	end

end
