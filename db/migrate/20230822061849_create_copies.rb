class CreateCopies < ActiveRecord::Migration[7.0]
  def change
    create_table :copies do |t|
      t.string :business_name
      t.string :industry
      t.string :target_market
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
