class OmniauthController < ApplicationController
  def github
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash[:error] = 'Problem'
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:error] = 'Problem2'
    redirect_to new_user_registration_url
  end
end
