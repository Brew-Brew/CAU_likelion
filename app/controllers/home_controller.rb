class HomeController < ApplicationController
  protect_from_forgery
  prepend: true
  def index
  end

  def contact
    @users=User.all
    respond_to do |format|
    format.html
    format.json {
        render :json => @users
    }
  end
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

  def notyet

  end

  def admincontact
    @contact = Contact.all
  end

  def admincshow
    @contact = Contact.find(params[:contact_id])
  end

end
