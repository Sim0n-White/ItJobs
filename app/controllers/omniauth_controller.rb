class OmniauthController < ApplicationController
  skip_before_action :authenticate_user!

  def github
    provider_data = request.env['omniauth.auth']
    @user = User.create_from_provider_data(provider_data)
    if @user.persisted?
      update_from_provider_date(@user, provider_data)
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

  private

  def update_from_provider_date(user, provider_data)
    user.update(git_home_page: provider_data.extra.raw_info.html_url, public_repos: provider_data.extra.raw_info.public_repos,
                private_repos: provider_data.extra.raw_info.total_private_repos)
  end
end
