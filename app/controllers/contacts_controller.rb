class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path, notice: 'Someone will reach out to you as soon as possible'
    else
      flash.now[:alert] = 'Please correct the errors below'
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(
      :company,
      :name,
      :email,
      :phone,
      :business_type,
      :project_type,
      :platforms,
      :budget,
      :referral_source,
      :body
    )
  end
end
