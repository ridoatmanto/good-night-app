class UserClocksController < ApplicationController
  def index
    render json: SleepingTime.all
  end

  def clock_in
    SleepingTime.create({user_id: params[:user][:user_id], clock_in: DateTime.now} )

    render json: SleepingTime.clock_in_list(params[:user][:user_id])
  end

  def clock_out
    # search last record which not clocked_out(its mean empty).
    check = SleepingTime.where(user_id: params[:user][:user_id], clock_out: nil, duration_in_minutes: nil)
    
    if check.present?
      current_clock = check.last
      clock_in_time = current_clock.clock_in.in_time_zone("Asia/Jakarta")
      clock_out_time = DateTime.now.in_time_zone("Asia/Jakarta") + 1.days
      
      duration = (clock_out_time.to_time - clock_in_time.to_time)
      duration_in_minutes = duration / 1.minutes

      current_clock.update({clock_out: clock_out_time, duration_in_minutes: duration_in_minutes})
      return render json: SleepingTime.clock_out_list(params[:user][:user_id])
    end

    render status: 404, json: { message: "Please clock in first!" }
  end
end
