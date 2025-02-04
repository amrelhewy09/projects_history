class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.boolean :is_edited, default: false
      t.timestamps
    end
  end
end
