class AddCommentReviewTocomments < ActiveRecord::Migration
  def change
    add_column :comments, :comment_review, :boolean , :default => false , :null => false
  end
end
