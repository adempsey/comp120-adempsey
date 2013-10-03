class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
    @messagelist = Message.all.order('created_at DESC')
    if request.format == "application/json"
      render json: @messagelist
    end
  end

  def create
  	message = Message.new(params[:message].permit(:username, :content, :app_id))
  	message.active = true
  	message.save
  end

  def show
    @message = Message.find(params[:id])
  end
end
