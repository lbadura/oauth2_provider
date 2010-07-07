class CreateOAuthTokens < ActiveRecord::Migration
  def self.up
    create_table :o_auth_tokens do |t|
      t.string :user_id
      t.integer :o_auth_client_id
      t.string :authorization_code
      
      t.string :access_token
      t.string :refresh_token
      t.timestamp :authorization_code_expires_at
      t.timestamp :access_token_expires_at
      
      t.timestamps
    end
    
  end

  def self.down
    drop_table :o_auth_tokens
  end

end