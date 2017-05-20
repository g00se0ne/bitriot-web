class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :redirect_subdomain

  def redirect_subdomain
    return unless Rails.env.productioN?
    if request.host == 'www.bitriot.co'
      redirect_to 'https://bitriot.co' + request.fullpath, :status => 301
    end
  end
end
