class HomeController < ApplicationController
  protect_from_forgery
  def index
  end

  def contact
  end

  def create
    @contact = Contact.new
    @contact.email=params[:email]
    @contact.content=params[:content]
    @contact.save

    redirect_to '/contact/complete'
  end

  def complete
  end

  def admincontact
    @contact = Contact.all
  end

  def admincshow
    @contact = Contact.find(params[:contact_id])
  end

end
