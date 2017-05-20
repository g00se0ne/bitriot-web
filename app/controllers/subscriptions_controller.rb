class SubscriptionsController < ApplicationController
  def create
    aweber_service = AweberService.new
    begin
      if aweber_service.subscribe(email: params[:email])
        flash[:notice] = 'Thanks! Please check your e-mail for a confirmation.'
        redirect_to :back
      else
        flash[:alert] = 'There was an error saving your form'
        redirect_to :back
      end
    rescue Exception => e
      flash[:alert] = e
      redirect_to :back
    end
  end

  def thanks

  end
end
