class CreateAdminBasicSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_basic_settings do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end
