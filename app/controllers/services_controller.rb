class ServicesController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  
  def index
    # get all authentication services assigned to the current user
    @services = current_user.services.all
  end
  
  def create
    # get the full hash from omniauth
    omniauth = request.env['omniauth.auth']
    authentication = Service.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication.present?
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user,authentication.user)
    elsif omniauth.present?
      if user_signed_in?
        current_user.connect_service(omniauth)
        if current_user.save
          redirect_to services_url, notice: "Authentication successful."
        else
          redirect_to root_path, alert: "Error while saving Authentication information."
        end
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    else
      redirect_to root_path, alert: "Error while authenticating."
    end
  end
  
  def destroy
    # remove an authentication service linked to the current user
    @service = current_user.services.find_by_id(params[:id])

    if @service.present?
      @service.destroy      
      redirect_to services_path, notice: 'Service was successfully deleted.'
    else
      redirect_to services_path, alert: 'Service was not found.'
    end
  end
end
