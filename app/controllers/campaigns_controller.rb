class CampaignsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @campaigns = current_user ? current_user.campaigns.all : []
  end

  def show
    @campaign = current_user.campaigns.find(params[:id])
  end

  def new
    @campaign = current_user.campaigns.new
  end

  def create
    @campaign = current_user.campaigns.new(campaign_params)

    if @campaign.save!
      redirect_to @campaign
    else
      render :new
    end
  end

  def edit
    @campaign = current_user.campaigns.find(params[:id])
 end

  def update
    @campaign = current_user.campaigns.find(params[:id])

    if @campaign.update(campaign_params)
      redirect_to(@campaign)
    else
      render :edit
    end
  end

  def destroy
    @campaign = current_user.campaigns.find(params[:id])
    @campaign.destroy
    flash[:success] = "Campaign successfully deleted."
    redirect_to root_path
  end


  private

  def campaign_params
    params.require(:campaign).permit(:name, :message, user_id: current_user.id)
  end
end
