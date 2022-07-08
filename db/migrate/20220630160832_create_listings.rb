class CreateListings < ActiveRecord::Migration[6.1]
  def change
    # setting params to null: false disables any listings being added to database if not filled out; validation.
    create_table :listings do |t|
      t.string :title, null: false
      t.integer :condition, null: false
      t.integer :price, null: false
      t.boolean :sold ,default: false
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
