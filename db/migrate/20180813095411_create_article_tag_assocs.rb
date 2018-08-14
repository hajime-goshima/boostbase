class CreateArticleTagAssocs < ActiveRecord::Migration[5.2]
  def change
    create_table :article_tag_assocs do |t|
      t.references :article, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
