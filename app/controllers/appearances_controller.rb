class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if @appearance.valid?
      @appearance.save
      redirect_to episode_path(@appearance.episode)
    else
      redirect_to new_appearance_path
    end
  end

  def edit
    @appearance = Appearance.find(params[:id])
  end

  def update
    @appearance = Appearance.find(params[:id])
    @appearance.update(rating: params[:rating], guest_id: @appearance.guest_id, episode_id: @appearance.episode_id, user_id: @appearance.user_id)
    redirect_to guest_path(@appearance.guest)
  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating, :user_id)
  end

end
