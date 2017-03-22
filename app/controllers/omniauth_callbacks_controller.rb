class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
     @user = current_user
     omniauth_data = (request.env["omniauth.auth"])

     if !UserAuthentication.where(user_id: current_user.id, authentication_provider: omniauth_data.provider).present? 
       @authentication = @user.user_authentications.build(authentication_provider: omniauth_data.provider, uid: omniauth_data.uid, access_token: omniauth_data.credentials.token, access_secret: omniauth_data.credentials.secret)
       @authentication.save
     end
     redirect_to profile_path
  end
end
