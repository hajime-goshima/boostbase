class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content
      t.text :description
      t.string :slug
      t.text :stylesheet_code
      t.text :javascript_code
      t.boolean :published

      t.timestamps
    end
  end
end
