class SummonersController < ApplicationController

	def new
		@summoner = Summoner.new
		@summoners = Summoner.all
		@exception = nil
	end

	def create
		
		@summoner = Summoner.new(summoner_params)

		if(Summoner.grabInfo(@summoner.name) == nil)
			@exception = 1
		end
		#if @summoner.save
		redirect_to new_summoner_path
		#end
	end

	def destroy
		@summoner.destroy
	end


	private

	def summoner_params
		params.require(:summoner).permit(:name)
	end
end
