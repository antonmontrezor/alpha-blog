class AddPasswordDigestToUsers < ActiveRecord::Migration[6.1]
  def change
    # users -> table, password_digest -> field we add to users table
    add_column :users, :password_digest, :string
  end
end
