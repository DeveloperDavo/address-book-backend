class Api::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render json: @contacts
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact
    else
      render error: {error: 'Unable to create contact'}
    end
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
      render json: @contact
    else
      render error: {error: 'Unable to update contact'}
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:first_name)
  end


end
