class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      MessageMailer.new_message(@message).deliver
      redirect_to root_path, notice: "Hey Thanks for your message! I look forward to reading it soon."
    else
      flash[:alert] = "Whoops...something went wrong. Message not sent :("
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end

end
