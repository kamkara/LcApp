class AddAvatarProfilToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avatar_profil, :string
  end
end
