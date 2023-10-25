class CreateFosters < ActiveRecord::Migration[6.0]
  def change
    create_table :fosters do |t|
      t.references :user,       null: false, foreign_kye: true
      t.references :protection, null: false, foreign_kye: true
      t.timestamps
    end
  end
end
