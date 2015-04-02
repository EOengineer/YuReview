class AddNullFalseReviews < ActiveRecord::Migration
  def change
    change_column :reviews, :title, :string, null: false
    change_column :reviews, :body, :text, null: false
    change_column :reviews, :user_id, :integer, null: false
    change_column :reviews, :movie_id, :integer, null: false
  end
end
