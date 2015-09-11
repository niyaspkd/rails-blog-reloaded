class AddCountViewsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :count_views, :integer , default:0
  end
end
