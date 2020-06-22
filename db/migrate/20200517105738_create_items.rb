class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :desc
      t.string :image
      t.integer :price
      t.integer :status

      t.timestamps
    end
  end
end
