class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    user = User.find_by(uid: current_user.uid)
    @tweet = Tweet.new(message: params[:tweet][:message], user_id: user.id)
    if @tweet.save
       flash[:notice] = 'ツイートしました'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end
end
