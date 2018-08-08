class CreateImageResources < ActiveRecord::Migration[5.2]
  def change
    create_table :image_resources do |t|

      t.timestamps
    end
  end
end
