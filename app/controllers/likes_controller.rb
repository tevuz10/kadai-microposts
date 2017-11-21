class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:favorite_id])
    current_user.favorite(micropost)
    flash[:success] = '投稿をLikeしました。'
    redirect_to current_user
  end

  def destroy
    micropost = Micropost.find(params[:favorite_id])
    current_user.unfavorite(micropost)
    flash[:success] = '投稿のLikeを削除しました。'
    redirect_to current_user
  end
end
