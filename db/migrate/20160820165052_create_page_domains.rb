class CreatePageDomains < ActiveRecord::Migration
  def change
    create_table :page_domains do |t|
      t.references :page, index: true, foreign_key: true
      t.references :domain, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
