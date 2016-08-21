class CreatePageTags < ActiveRecord::Migration
  def change
    create_table :page_tags do |t|
      t.references :page, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
