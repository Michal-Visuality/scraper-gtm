class ImportsController < ApplicationController
	require 'csv'

	def new

	end

	def create
		items = []
		CSV.foreach(params[:import][:file], headers: true) do |row|
			items << row.to_h
		end
		Website.import items, validate_uniqueness: true
     	flash[:notice] = 'Items were imported successfully'
     	redirect_to websites_path
	end
  
end
