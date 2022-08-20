class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user,              null: false, foreign_key: true
      t.text :content,                 null: false
      t.string :washing_frequency,     null: false
      t.string :wearing_years,         null: false
      t.integer :brand_id,             null: false
      

      t.timestamps
    end
  end
end
