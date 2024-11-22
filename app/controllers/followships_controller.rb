class FollowshipsController < ApplicationController
  def index
    render json: Followship.all
  end

  def create
    existing = Followship.where(follower_id: params[:user][:follower_id], followee_id: params[:user][:followee_id]).first
    
    return render json: Followship.create(following_params) if existing.nil?

    render status: 403, json: { message: "Already followed!" }
  end

  def show
    render json: Followship.followed(params[:id]), include: {user: {only: :name}}
  end

  def destroy
    render json: Followship.where({follower_id: params[:id], followee_id: params[:user][:followee_id]}).delete_all
  end

  def sleep_duration
    # followed user sleep record in a week ago
    ids = Followship.followed_ids(params[:id])

    render json: SleepingTime.week_ago(ids), include: {user: {only: :name}}
  end

  private

  def following_params
    params.require(:user).permit(:follower_id, :followee_id)
  end
end
