class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = "Thanks for your email. I look forward to reading it."
      redirect_to(:back)
    else
      flash.now[:error] = "Cannot send message for some reason..."
      redirect_to root_url
    end
  end

end
