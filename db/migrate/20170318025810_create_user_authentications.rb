class CreateUserAuthentications < ActiveRecord::Migration[5.0]
  def change
    create_table :user_authentications do |t|
      t.string :authentication_provider
      t.string :uid
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
