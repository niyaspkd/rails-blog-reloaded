class AddCountViewToComments < ActiveRecord::Migration
  def change
    add_column :comments, :count_view, :integer , default:0
  end
end
