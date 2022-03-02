class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
  end
  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    @campaign.sent_at = DateTime.now

    if @campaign.update(campaign_params)
      redirect_to(@campaign)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    flash[:success] = "Campaign successfully deleted."
    redirect_to root_path, status: :see_other
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.sent_at = DateTime.now

    if @campaign.save
      redirect_to @campaign
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def campaign_params
    params.require(:campaign).permit(:name, :message, :sent_at)
  end
end
