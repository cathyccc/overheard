class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
     @user = current_user
     omniauth_data = (request.env["omniauth.auth"])

     if !UserAuthentication.where(user_id: current_user.id, authentication_provider: omniauth_data.provider).persisted?
       @authentication = @user.user_authentications.build(authentication_provider: omniauth_data.provider, uid: omniauth_data.uid)
       @authentication.save
     end
     redirect_to profile_path
  end
end
