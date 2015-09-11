class AddFlagarticleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :flagarticle, :boolean , :default => false
  end
end
