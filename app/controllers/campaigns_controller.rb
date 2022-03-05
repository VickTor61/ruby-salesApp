class CampaignsController < ApplicationController
  # before_action :authenticate_user!

 def index
    @campaigns = Campaign.all
 end

 def show
 @campaign = Campaign.find(params[:id])
 end

  def new
    @campaign = Campaign.new
  end

  def create
    user_signed_in?
    @campaign = Campaign.new(campaign_params)

    if @campaign.save!
      redirect_to @campaign
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
   @campaign = Campaign.find(params[:id])
 end

 def update
   @campaign = Campaign.find(params[:id])

   if @campaign.update(campaign_params)
     redirect_to(@campaign)
   else
     render :edit
   end
 end

 def destroy
   @campaign = Campaign.find(params[:id])
   @campaign.destroy
   flash[:success] = "Campaign successfully deleted."
   redirect_to root_path
 end


  private

 def campaign_params
   params.require(:campaign).permit(:name, :message)
 end
end
