class CreateWebsites < ActiveRecord::Migration[6.0]
  def change
    create_table :websites do |t|
      t.string :url
      t.date :last_checked
      t.boolean :has_gtm

      t.timestamps
    end
  end
end
