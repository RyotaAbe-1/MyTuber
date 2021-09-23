# frozen_string_literal: true

class Public::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  def after_sign_in_path_for(resource)
    youtubers_path(sort: "timeline")
  end

  def google_oauth2
    authorization("Google")
  end
  
  def twitter
    authorization("Twitter")
  end
  
  def authorization(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      flash[:notice] = "#{provider}アカウントによる認証に成功しました。"
    else
      session["devise.google_data"] = request.env["omniauth.auth"][:info]
      flash[:error] = "会員登録をしてください"
      render "public/registrations/new"
    end
  end

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
