class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.string :name
      t.decimal :amount, default: 0
      t.references :author, foreign_key: { to_table: :users }
      t.references :group, foreign_key: { to_table: :groups }

      t.timestamps
    end
  end
end
