class AddAccessTokenDetailsToUserAuthentication < ActiveRecord::Migration[5.0]
  def change
    add_column :user_authentications, :access_token, :string
    add_column :user_authentications, :access_secret, :string
  end
end
