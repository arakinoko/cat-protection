class CreateProtections < ActiveRecord::Migration[6.0]
  def change
    create_table :protections do |t|
      t.text       :title,          null: false
      t.integer    :prefecture_id,  null: false
      t.integer    :age,            null: false
      t.integer    :gender_id,      null: false
      t.integer    :cat_species_id, null: false
      t.text       :character,      null: false
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
