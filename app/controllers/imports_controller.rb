class ImportsController < ApplicationController
	require 'csv'

	def new

	end

	def create
		items = []
		CSV.foreach(params[:import][:file], headers: true) do |row|
			items << row.to_h
		end
		import_info = Website.import items, validate_uniqueness: true
     	flash[:notice] = "#{import_info.num_inserts} items were imported successfully, #{import_info.failed_instances.count} failed"
     	redirect_to websites_path
	end
  
end
