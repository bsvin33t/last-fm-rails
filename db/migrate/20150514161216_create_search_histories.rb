class CreateSearchHistories < ActiveRecord::Migration
  def change
    create_table :search_histories do |t|
      t.string :search_string
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
