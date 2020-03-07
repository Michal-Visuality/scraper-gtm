class ImportsController < ApplicationController
	require 'csv'

	def new

	end

	def create
		items = []
		CSV.foreach(params[:import][:file], headers: true) do |row|
			items << row
		end
		Website.import(items)
     	flash[:notice] = items
     	redirect_to websites_path #=> or where you want
	end
  
end
