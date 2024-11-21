class FollowshipsController < ApplicationController
  def index
    render json: Followship.all
  end

  def create
    render json: Followship.create(following_params)
  end

  def show
    render json: Followship.followed(params[:id])
  end

  def destroy
    render json: Followship.where({follower_id: params[:id], followee_id: params[:user][:follower_id]}).delete_all
  end

  def sleep_duration
    # followed user sleep record in a week ago
    ids = Followship.followed_ids(params[:id])

    render json: SleepingTime.week_ago(ids)
  end

  private

  def following_params
    params.require(:user).permit(:followee_id, :follower_id)
  end
end
