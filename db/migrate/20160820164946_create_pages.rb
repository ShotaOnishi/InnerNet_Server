class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :image
      t.boolean :is_favorite
      t.string :memo
      t.string :url

      t.timestamps null: false
    end
  end
end
