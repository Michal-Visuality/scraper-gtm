class WebsitesController < ApplicationController

  def new
  	@website = Website.new
  end

  def create
    @website = Website.new(website_params)
 
    if @website.save
      redirect_to websites_path
      flash[:notice] = "Website has been added"
    else
      redirect_to websites_path
      flash[:notice] = "Website has not been added"
    end
  end

  def index
  	if params[:search].blank?
      @websites  = Website.paginate(:page => params[:page], :per_page=>20)
  	else
  		@parameter = params[:search].downcase 
  		@websites = Website.all.where("lower(url) LIKE :search", search: "%#{@parameter}%") 
  	end
    GtmWorker.perform_async()
  end

  def destroy
    @website = Website.find(params[:id])
    @website.destroy
 
    redirect_to websites_path
  end

  private
    def website_params
      params.require(:website).permit(:url, :has_gtm, :last_checked)
    end

end
