class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :name
      t.text :text
      t.integer :story_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
