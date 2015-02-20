class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :name
      t.text :description

      t.belongs_to :post, index: true
    end
  end
end
