class AddSummaryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :summary_id, :string
    add_index :posts, :summary_id
  end
end
