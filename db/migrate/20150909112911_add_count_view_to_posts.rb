class AddCountViewToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :count_view, :integer , default:0
  end
end
