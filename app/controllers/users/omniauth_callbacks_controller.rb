class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
      puts "_______________________________PASS___________________________________"
    else
      session["devise.twitter.data"] = request.env["omniauth.auth"].except("extra")

      redirect_to new_user_registration_url

      puts "_______________________________ELSE___________________________________"
    end
  end

  def failure
    puts "_______________________________FAIL___________________________________"
    redirect_to root_path
  end
end
